package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.SavedSearchFacade;
import com.amandris.clients.service.facade.UtilFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.util.CountryState;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.web.form.SellerBuyerSearchForm;


public class ShowSellerBuyerSearchAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
 		  
		HttpSession 		session 				= request.getSession();
		UtilFacade 			utilFacade				= UtilFacade.getInstance();
		SavedSearchFacade 	savedSearchFacade		= new SavedSearchFacade();
		Locale				locale					= getRequestLocale( request);
		CountryState 		countryState			= new CountryState();
		SellerSession 		sellerSession			= null;
		
		sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		SellerBuyerSearchForm sellerBuyerSearchForm = new SellerBuyerSearchForm();
		
		if( sellerSession != null) {
			countryState.setSelectedCountry	( sellerSession.getCountryId());
			countryState.setSelectedState	( sellerSession.getStateId());
		}
		
		countryState = ( CountryState) session.getAttribute( Constant.COUNTRY_STATE_OBJECT_NAME); 
		if( countryState == null) {
			countryState = utilFacade.getCountryState( false, locale);
		}
		countryState.setLocale	( locale);
				
		session.setAttribute( Constant.COUNTRY_STATE_OBJECT_NAME, countryState);
		session.setAttribute( Constant.SELLER_BUYER_SEARCH_OBJECT_NAME, sellerBuyerSearchForm);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
