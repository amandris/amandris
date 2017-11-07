package com.amandris.clients.web.action.buyer;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.mail.Mail;
import com.amandris.clients.util.mail.RegisterBuyerMailObject;
import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.web.form.NewBuyerForm;

public class SetNewBuyerAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		Locale					locale					= getRequestLocale( request);
		BuyerFacade				buyerFacade				= new BuyerFacade();
		ActionErrors 			errors					= new ActionErrors();
		NewBuyerForm			newBuyerForm			= null;
		String					serverName				= ConfigurationParameterManager.getParameterString( "serverName");
		RegisterBuyerMailObject registerBuyerMailObject = new RegisterBuyerMailObject( locale);
		String					text					= "";
		
		if( ( form == null) || ( form.getClass() != NewBuyerForm.class))
			return error( "error.couldNotSetNewBuyer", request, mapping);
		
		newBuyerForm = ( NewBuyerForm) form;
		
		if( newBuyerForm.getAcceptTerms().booleanValue() == false)
			errors.add( "acceptTermsError",new ActionError( "error.acceptTermsError"));
			
		if( errors.isEmpty() == false) {
			saveErrors	( request, errors);
			saveToken	( request);
			return 		( mapping.findForward( Constant.FAIL));
		}
		
		newBuyerForm.setActivationCode( generateCode());
		
		if( buyerFacade.setBuyer( newBuyerForm, locale) == false)
			return error( "error.couldNotSetNewBuyer", request, mapping);
		
		
		registerBuyerMailObject.setLogin			( newBuyerForm.getLogin());
		registerBuyerMailObject.setActivationCode	( newBuyerForm.getActivationCode());

		text = ConfigurationParameterManager.getMessages().getMessage( locale, "registerBuyerMailObject.subject", newBuyerForm.getLogin());
		
		if (Mail.sendMail( newBuyerForm.getEmail(), text, registerBuyerMailObject) == false)
			return error( "error.couldNotSendEmail", newBuyerForm.getEmail(), request, mapping);
		
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
