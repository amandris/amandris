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
import com.amandris.clients.web.form.NewSellerForm;
import com.amandris.clients.web.view.SellerView;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowNewSellerTwoAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 		session 		= request.getSession();
		Locale				locale			= getRequestLocale( request);
		SellerFacade		sellerFacade	= new SellerFacade();
		ActionErrors 		errors			= new ActionErrors();
		NewSellerForm		newSellerForm	= null;
		SellerView			sellerView		= null;	
		Date				date			= null;
		int					age				= 0;
		
		if( ( form == null) || ( form.getClass() != NewSellerForm.class))
			return error( "error.couldNotSetNewSeller", request, mapping);
		
		newSellerForm = ( NewSellerForm) form;
		
		sellerView = sellerFacade.getSellerByLogin( newSellerForm.getLogin(), locale);
		
		if( newSellerForm.getLogin().equals( ConfigurationParameterManager.getParameterString( "adminUserName")))
			errors.add( "sellerLoginError",new ActionError( "error.sellerLoginError"));
		
		if( sellerView != null) {
			errors.add( "sellerLoginError",new ActionError( "error.sellerLoginError"));
		}
		
		date = DBUtils.parseDate( newSellerForm.getBirthDate());
		
		if( date == null) {
			errors.add( "date", new ActionError( "errors.date", ConfigurationParameterManager.getMessages().getMessage( locale, "showNewSellerOne.birthDate")));
		} else {
			age = DBUtils.getAge( date, locale);
			if( ( age < 18) || ( age > 99)){
				errors.add( "sellerAgeError",new ActionError( "error.sellerAgeError"));
			}
		}
		
		if( !newSellerForm.getEmail().toLowerCase().trim().equals( "patricia@amandris.com")){
			if( sellerFacade.getSellerByEmail( newSellerForm.getEmail().trim(), locale) != null) {
				errors.add( "email", new ActionError( "errors.emailNotUnique", newSellerForm.getEmail().trim()));
			}
		}
		
		if( newSellerForm.getState().intValue() == -1) {
			errors.add( "state", new ActionError( "errors.requiredState"));
		}
		
		if( newSellerForm.getSex().intValue() == -1) {
			errors.add( "sex", new ActionError( "errors.requiredSex"));
		}
		
		if( errors.isEmpty() == false) {
			saveErrors	( request, errors);
			saveToken	( request);
			return 		( mapping.findForward( Constant.FAIL));
		}
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
