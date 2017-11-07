package com.amandris.clients.web.action.seller;

import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.SellerAccountForm;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetSellerAccountAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 		session 			= request.getSession();
		Locale				locale				= getRequestLocale( request);
		SellerFacade		sellerFacade		= new SellerFacade();
		SellerAccountForm	sellerAccountForm	= null;
		Date				date				= null;
		ActionErrors 		errors				= new ActionErrors();
		int					age					= 0;
		
		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ( form == null) || ( form.getClass() != SellerAccountForm.class))
			return error( "error.couldNotSetSellerAccount", request, mapping);
		
		sellerAccountForm = ( SellerAccountForm) form;

		date = DBUtils.parseDate( sellerAccountForm.getBirthDate());		
		
		if( date == null) {
			errors.add( "date", new ActionError( "errors.date", ConfigurationParameterManager.getMessages().getMessage( locale, "showSellerAccount.birthDate")));
		} else {
			age = DBUtils.getAge( date, locale);
			if( ( age < 18) || ( age > 99)){
				errors.add( "buyerAgeError",new ActionError( "error.sellerAgeError"));
			}
		}
		
		if( errors.isEmpty() == false) {
			saveErrors	( request, errors);
			saveToken	( request);
			return 		( mapping.findForward( Constant.FAIL));
		}
		
		if( sellerFacade.setSellerAccount( sellerAccountForm, sellerSession, locale) == false)
			return error( "error.couldNotSetSellerAccount", request, mapping);
		
		sellerSession = sellerFacade.getSellerSessionByLoginAndPassword( sellerSession.getLogin(), sellerSession.getPassword(), true, locale);
		
		if( sellerSession == null)
			return error( "error.couldNotSetSellerAccount", request, mapping);
		
		session.setAttribute( Constant.SELLER_SESSION_OBJECT_NAME, sellerSession);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
	
}		
