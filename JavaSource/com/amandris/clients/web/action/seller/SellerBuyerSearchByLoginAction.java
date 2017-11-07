package com.amandris.clients.web.action.seller;

import java.util.Collection;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.form.SearchByLoginForm;
import com.amandris.clients.web.form.SellerBuyerSearchForm;
import com.amandris.clients.web.util.PagerForm;
import com.amandris.clients.web.action.common.AbstractAction;


public class SellerBuyerSearchByLoginAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		BuyerFacade 			buyerFacade				= new BuyerFacade();
		SellerBuyerSearchForm 	sellerBuyerSearchForm 	= null;
		Locale					locale					= getRequestLocale( request);
		Collection				buyerCollection			= null;
		PagerForm 				pagerForm 				= new PagerForm();	
		String					login					= "";
		int 					count					= 0;
		int 					maxPages				= 0;

		
		getRequestLocale( request);
		
		login = (( SearchByLoginForm) form).getLogin(); 

		sellerBuyerSearchForm 	= new SellerBuyerSearchForm();

		sellerBuyerSearchForm.setLogin( login);
		sellerBuyerSearchForm.setOrderedBy( "login");
		
		count = buyerFacade.getBuyerCount( sellerBuyerSearchForm, locale);
		
		buyerCollection = buyerFacade.getBuyer( sellerBuyerSearchForm, 1, 4, locale);
		
		pagerForm.setPage			( 1);
		pagerForm.setSize			( count);
		pagerForm.setItemsPerPage	( 4);
		
		session.setAttribute( Constant.PAGER_OBJECT_NAME, pagerForm);		
		session.setAttribute( Constant.BUYER_COLLECTION_OBJECT_NAME, buyerCollection);
		session.setAttribute( Constant.SELLER_BUYER_SEARCH_OBJECT_NAME, sellerBuyerSearchForm);
		
		saveToken(request);
		
		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
