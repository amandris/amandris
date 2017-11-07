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
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.SellerBuyerSearchForm;
import com.amandris.clients.web.util.PagerForm;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowSellerBuyerCollectionAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		BuyerFacade 			buyerFacade				= new BuyerFacade();
		SellerBuyerSearchForm 	sellerBuyerSearchForm 	= null;
		Locale					locale					= getRequestLocale( request);
		Collection				buyerCollection			= null;
		PagerForm 				pagerForm 				= new PagerForm();	
		String 					order					= null;
		String 					page					= null;
		int						pageInt					= 1;
		int						itemsPerPageInt			= 4;
		int 					count					= 0;
		int 					maxPages				= 0;
		int 					index					= 0;
		
		locale = getRequestLocale( request);

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		if( form == null) {
			sellerBuyerSearchForm 	= ( SellerBuyerSearchForm) session.getAttribute( Constant.SELLER_BUYER_SEARCH_OBJECT_NAME);
			pagerForm 				= ( PagerForm) session.getAttribute( Constant.PAGER_OBJECT_NAME);
			
			if( pagerForm != null)
				count = pagerForm.getSize();
			else
				count = buyerFacade.getBuyerCount( sellerBuyerSearchForm, locale);
		} else {
			sellerBuyerSearchForm 	= ( SellerBuyerSearchForm)form;
			count 					= buyerFacade.getBuyerCount( sellerBuyerSearchForm, locale);
		}
		
		if( sellerBuyerSearchForm == null) {
			return error( "error.searchFormNotExist", request, mapping);
		}
		
		page = request.getParameter( "page");

		pageInt 		= DBUtils.parseInteger( page, 1).intValue();
		itemsPerPageInt = DBUtils.parseInteger( sellerBuyerSearchForm.getItemsPerPage(), 4).intValue();
		
		if (pageInt < 1) 
			pageInt = 1
		;

		if (( count % itemsPerPageInt) == 0)
			maxPages = ( count / itemsPerPageInt)
		; else
			maxPages = ( count / itemsPerPageInt) + 1
		;
		
		if ( pageInt >  maxPages)
			pageInt = maxPages;
		;
		
		index = (( pageInt - 1) * itemsPerPageInt) + 1;
		
		buyerCollection = buyerFacade.getBuyer( sellerBuyerSearchForm, index, itemsPerPageInt , locale);
		
		pagerForm.setPage			( pageInt);
		pagerForm.setSize			( count);
		pagerForm.setItemsPerPage	( itemsPerPageInt);
		
		session.setAttribute( Constant.PAGER_OBJECT_NAME, pagerForm);		
		request.setAttribute( Constant.BUYER_COLLECTION_OBJECT_NAME, buyerCollection);
		session.setAttribute( Constant.SELLER_BUYER_SEARCH_OBJECT_NAME, sellerBuyerSearchForm);
		
		saveToken(request);
		
		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
