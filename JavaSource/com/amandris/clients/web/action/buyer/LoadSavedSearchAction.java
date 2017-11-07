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
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.BuyerSellerSearchForm;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.util.CountryState;
import com.amandris.clients.web.action.common.AbstractAction;

public class LoadSavedSearchAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
 		  
		HttpSession 			session 				= request.getSession();
		SavedSearchFacade 		savedSearchFacade		= new SavedSearchFacade();
		CountryState 			countryState			= new CountryState();
		UtilFacade 				utilFacade				= UtilFacade.getInstance();
		Locale					locale					= null;
		BuyerSession 			buyerSession			= null;
		BuyerSellerSearchForm 	buyerSellerSearchForm	= null;
		Collection				savedSearchCollection	= null;

		locale = getLocale( request);
		
		buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);

		if( buyerSession == null)
			return mapping.findForward( Constant.SESSION);
		
		buyerSellerSearchForm = savedSearchFacade.getSavedSearchById( DBUtils.parseInteger( request.getParameter( "id"), 0), locale);		
		
		if( buyerSellerSearchForm == null)
			return error( "error.savedSearchNotExist", request, mapping);
		
		if( buyerSession.getId().intValue() != buyerSellerSearchForm.getBuyerId().intValue()) 
			return error( "error.savedSearchNotExist", request, mapping);
		
		savedSearchCollection = savedSearchFacade.getSavedSearch( buyerSession.getId());		
		
		countryState = ( CountryState) session.getAttribute( Constant.COUNTRY_STATE_OBJECT_NAME); 
		if( countryState == null) {
			countryState = utilFacade.getCountryState( false, locale);
		}
		
		countryState.setLocale			( locale);
		countryState.setSelectedCountry	( buyerSellerSearchForm.getCountry());
		countryState.setSelectedState	( buyerSellerSearchForm.getState());
		
		session.setAttribute( Constant.COUNTRY_STATE_OBJECT_NAME, countryState);
		session.setAttribute( Constant.SAVED_SEARCH_COLLECTION_OBJECT_NAME, savedSearchCollection);
		session.setAttribute( Constant.BUYER_SELLER_SEARCH_OBJECT_NAME, buyerSellerSearchForm);
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
