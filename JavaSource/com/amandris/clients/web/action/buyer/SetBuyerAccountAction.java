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
import com.amandris.clients.web.form.BuyerAccountForm;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetBuyerAccountAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 		session 			= request.getSession();
		Locale				locale				= getRequestLocale( request);
		BuyerFacade			buyerFacade			= new BuyerFacade();
		BuyerAccountForm	buyerAccountForm	= null;
		Date				date				= null;
		ActionErrors 		errors				= new ActionErrors();
		int					age					= 0;
		
		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ( form == null) || ( form.getClass() != BuyerAccountForm.class))
			return error( "error.couldNotSetBuyerAccount", request, mapping);
		
		buyerAccountForm = ( BuyerAccountForm) form;

		date = DBUtils.parseDate( buyerAccountForm.getBirthDate());		
		
		if( date == null) {
			errors.add( "date", new ActionError( "errors.date", ConfigurationParameterManager.getMessages().getMessage( locale, "showBuyerAccount.birthDate")));
		} else {
			age = DBUtils.getAge( date, locale);
			if( ( age < 18) || ( age > 99)){
				errors.add( "buyerAgeError",new ActionError( "error.buyerAgeError"));
			}
		}
		
		if( errors.isEmpty() == false) {
			saveErrors	( request, errors);
			saveToken	( request);
			return 		( mapping.findForward( Constant.FAIL));
		}
				
		if( buyerFacade.setBuyerAccount( buyerAccountForm, buyerSession, locale) == false)
			return error( "error.couldNotSetBuyerAccount", request, mapping);
		
		buyerSession = buyerFacade.getBuyerSessionByLoginAndPassword( buyerSession.getLogin(), buyerSession.getPassword(), true, locale);
		
		if( buyerSession == null)
			return error( "error.couldNotSetBuyerAccount", request, mapping);
		
		session.setAttribute( Constant.BUYER_SESSION_OBJECT_NAME, buyerSession);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
	
}		
