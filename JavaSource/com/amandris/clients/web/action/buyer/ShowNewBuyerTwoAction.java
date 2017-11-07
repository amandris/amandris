package com.amandris.clients.web.action.buyer;

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

import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.NewBuyerForm;
import com.amandris.clients.web.view.BuyerView;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowNewBuyerTwoAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 		session 		= request.getSession();
		Locale				locale			= getRequestLocale( request);
		BuyerFacade			buyerFacade		= new BuyerFacade();
		ActionErrors 		errors			= new ActionErrors();
		NewBuyerForm		newBuyerForm	= null;
		BuyerView			buyerView		= null;	
		Date				date			= null;
		int					age				= 0;
		
		if( ( form == null) || ( form.getClass() != NewBuyerForm.class))
			return error( "error.couldNotSetNewBuyer", request, mapping);
		
		newBuyerForm = ( NewBuyerForm) form;
		
		buyerView = buyerFacade.getBuyerByLogin( newBuyerForm.getLogin(), locale);
		
		if( newBuyerForm.getLogin().equals( ConfigurationParameterManager.getParameterString( "adminUserName")))
			errors.add( "buyerLoginError",new ActionError( "error.buyerLoginError"));
		
		if( buyerView != null) {
			errors.add( "buyerLoginError",new ActionError( "error.buyerLoginError"));
		}
		
		date = DBUtils.parseDate( newBuyerForm.getBirthDate());
		
		if( date == null) {
			errors.add( "date", new ActionError( "errors.date", ConfigurationParameterManager.getMessages().getMessage( locale, "showNewBuyerOne.birthDate")));
		} else {
			age = DBUtils.getAge( date, locale);
			if( ( age < 18) || ( age > 99)){
				errors.add( "buyerAgeError",new ActionError( "error.buyerAgeError"));
			}
		}
		
		if( buyerFacade.getBuyerByEmail( newBuyerForm.getEmail().trim(), locale) != null) {
			errors.add( "email", new ActionError( "errors.emailNotUnique", newBuyerForm.getEmail().trim()));
		}
		
		if( newBuyerForm.getState().intValue() == -1) {
			errors.add( "state", new ActionError( "errors.requiredState"));
		}
		
		if( newBuyerForm.getSex().intValue() == -1) {
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
