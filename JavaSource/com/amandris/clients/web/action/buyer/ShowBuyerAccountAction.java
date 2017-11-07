package com.amandris.clients.web.action.buyer;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.UtilFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.BuyerAccountForm;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.util.CountryState;
import com.amandris.clients.web.action.common.AbstractAction;

public class ShowBuyerAccountAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 		session 			= request.getSession();
		Locale				locale				= null;
		CountryState 		countryState		= new CountryState();
		UtilFacade 			utilFacade			= UtilFacade.getInstance();
		BuyerAccountForm	buyerAccountForm	= new BuyerAccountForm();

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		countryState = ( CountryState) session.getAttribute( Constant.COUNTRY_STATE_OBJECT_NAME); 
		if( countryState == null) {
			countryState = utilFacade.getCountryState( false, locale);
		}
		countryState.setLocale			( locale);
		countryState.setSelectedState	( buyerSession.getStateId());
		countryState.setSelectedCountry	( buyerSession.getCountryId());

		buyerAccountForm.setAddress1	( buyerSession.getAddress1());
		buyerAccountForm.setAddress2	( buyerSession.getAddress2());
		buyerAccountForm.setBirthDate	( DBUtils.getDate( buyerSession.getBirthdate() , 1));
		buyerAccountForm.setCity		( buyerSession.getCity());
		buyerAccountForm.setCountry		( buyerSession.getCountryId());
		buyerAccountForm.setIsPublic	( Boolean.valueOf( DBUtils.integer2Boolean( buyerSession.getIsPublic())));
		buyerAccountForm.setName		( buyerSession.getName());
		buyerAccountForm.setPostalCode	( buyerSession.getPostalCode());
		buyerAccountForm.setSendBulletin( Boolean.valueOf( DBUtils.integer2Boolean( buyerSession.getSendBulletin())));
		buyerAccountForm.setSendNews	( Boolean.valueOf( DBUtils.integer2Boolean( buyerSession.getSendNews())));
		buyerAccountForm.setSex			( buyerSession.getSexConst());
		buyerAccountForm.setState		( buyerSession.getStateId());
		buyerAccountForm.setSurname		( buyerSession.getSurname());
		
		session.setAttribute( Constant.BUYER_ACCOUNT_FORM_OBJECT_NAME, buyerAccountForm);
		
		session.setAttribute( Constant.COUNTRY_STATE_OBJECT_NAME, countryState);
				
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
