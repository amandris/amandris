package com.amandris.clients.web.action.buyer;

import java.util.Collection;
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
import com.amandris.clients.web.form.BuyerSellerSearchForm;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.util.CountryState;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowBuyerSellerSearchAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
 		  
		HttpSession 		session 				= request.getSession();
		UtilFacade 			utilFacade				= UtilFacade.getInstance();
		SavedSearchFacade 	savedSearchFacade		= new SavedSearchFacade();
		Locale				locale					= getRequestLocale( request);
		CountryState 		countryState			= new CountryState();
		Collection			savedSearchCollection	= null;
		BuyerSession 		buyerSession			= null;
		
		buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		BuyerSellerSearchForm buyerSellerSearchForm = new BuyerSellerSearchForm();
		
		if( buyerSession != null) {
			buyerSellerSearchForm.setMySex	( buyerSession.getSexConst());
			countryState.setSelectedCountry	( buyerSession.getCountryId());
			countryState.setSelectedState	( buyerSession.getStateId());
		}
		
		countryState = ( CountryState) session.getAttribute( Constant.COUNTRY_STATE_OBJECT_NAME); 
		if( countryState == null) {
			countryState = utilFacade.getCountryState( false, locale);
		}
		countryState.setLocale	( locale);
		
		if( buyerSession != null)
			savedSearchCollection = savedSearchFacade.getSavedSearch( buyerSession.getId());
		
		session.setAttribute( Constant.COUNTRY_STATE_OBJECT_NAME, countryState);
		session.setAttribute( Constant.BUYER_SELLER_SEARCH_OBJECT_NAME, buyerSellerSearchForm);
		session.setAttribute( Constant.SAVED_SEARCH_COLLECTION_OBJECT_NAME, savedSearchCollection);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
