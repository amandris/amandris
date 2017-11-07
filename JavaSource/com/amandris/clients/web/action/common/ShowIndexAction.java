package com.amandris.clients.web.action.common;

import java.util.Collection;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.PromotionFacade;
import com.amandris.clients.service.facade.UtilFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.util.CountryState;

public class ShowIndexAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HttpSession 	session 		= request.getSession();
		PromotionFacade	promotionFacade = new PromotionFacade();
		UtilFacade		utilFacade		= UtilFacade.getInstance();
		Locale			locale			= request.getLocale();
		CountryState 	countryState	= new CountryState();
		Collection		collection		= null;
		
		collection = promotionFacade.getShowInIndexSellerRandomSellection( locale);
		
		countryState = ( CountryState) session.getAttribute( Constant.COUNTRY_STATE_OBJECT_NAME);
		
		if( countryState == null) {
			countryState = utilFacade.getCountryState( false, locale);
			countryState.setLocale( locale);
			if( locale != null) {
				countryState.setSelectedCountry	( new Integer( 70));
				countryState.setSelectedState( new Integer( 0));
			}
		}
		
		session.setAttribute( Constant.COUNTRY_STATE_OBJECT_NAME, countryState);
		session.setAttribute( Constant.SHOW_IN_INDEX_SELLER_OBJECT_NAME, collection);
		
		saveToken(request);

		return (mapping.findForward( Constant.SUCCESS));
	  }
}		
