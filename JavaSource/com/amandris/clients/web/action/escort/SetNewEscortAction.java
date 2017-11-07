package com.amandris.clients.web.action.escort;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.dao.SellerDAO;
import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.service.vo.Seller;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.mail.Mail;
import com.amandris.clients.util.mail.RegisterSellerMailObject;
import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.web.form.NewSellerForm;

public class SetNewEscortAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 				session 					= request.getSession();
		Locale						locale						= getRequestLocale( request);
		SellerFacade				sellerFacade				= new SellerFacade();
		ActionErrors 				errors						= new ActionErrors();
		SellerDAO					sellerDAO					= new SellerDAO();
		NewSellerForm				newSellerForm				= null;
		Seller						seller						= null;
		String						serverName					= ConfigurationParameterManager.getParameterString( "serverName");
		RegisterSellerMailObject	registerSellerMailObject	= new RegisterSellerMailObject( locale);
		String						text						= "";
		
		System.out.println("---1");
		
		if( ( form == null) || ( form.getClass() != NewSellerForm.class)){
			System.out.println("---2");
			return error( "error.couldNotSetNewSeller", request, mapping);
		}
		
		newSellerForm = ( NewSellerForm) form;
		
		if( newSellerForm.getAcceptTerms().booleanValue() == false)
			errors.add( "acceptTermsError",new ActionError( "error.acceptTermsError"));

		if( errors.isEmpty() == false) {
			saveErrors	( request, errors);
			saveToken	( request);
			return 		( mapping.findForward( Constant.FAIL));
		}
		
		newSellerForm.setActivationCode( generateCode());
		
		if( sellerFacade.setSeller( newSellerForm, locale) == false)
			return error( "error.couldNotSetNewSeller", request, mapping);
		
		seller = sellerDAO.getSellerByLogin( newSellerForm.getLogin());
		
		
		System.out.println("---2");
		sellerFacade.setSubscription( seller.getId(), new Integer (15), Constant.SUBSCRIPTION_ACTION_3_MONTHS, locale);
		
		
		if (seller == null)
			return error( "error.couldNotSetNewSeller", request, mapping);
		
		registerSellerMailObject.setLogin			( newSellerForm.getLogin());
		registerSellerMailObject.setActivationCode	( newSellerForm.getActivationCode());
		registerSellerMailObject.setId				( seller.getId());

		text = ConfigurationParameterManager.getMessages().getMessage( locale, "registerSellerMailObject.subject", newSellerForm.getLogin());
		
		if( Mail.sendMail( newSellerForm.getEmail(), text, registerSellerMailObject) == false){
			return error( "error.couldNotSendEmail", newSellerForm.getEmail(), request, mapping);
		}
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	}
	
	
	private String generateCode() 
	{
		String 	chars 	= "123456789abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ";
		String 	code	= "";
		long 	size	= Math.round( ( Math.random() * 6) + 10);
		
		while( code.length() < size){
	      code = code + chars.charAt( ( int) Math.round( Math.random() * ( chars.length() - 1)));
		}
		
		return code;
	}
}		
