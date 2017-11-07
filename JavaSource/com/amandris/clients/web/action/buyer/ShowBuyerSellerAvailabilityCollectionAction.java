package com.amandris.clients.web.action.buyer;

import java.util.Collection;
import java.util.Iterator;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.CalendarFacade;
import com.amandris.clients.service.facade.PromotionFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.BuyerSellerAvailabilitySearchForm;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.util.PagerForm;
import com.amandris.clients.web.view.SellerView;
import com.amandris.clients.web.view.SellerViewList;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowBuyerSellerAvailabilityCollectionAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HttpSession 						session 							= request.getSession();
		CalendarFacade 						calendarFacade						= new CalendarFacade();
		PromotionFacade						promotionFacade						= new PromotionFacade();
		BuyerSellerAvailabilitySearchForm 	buyerSellerAvailabilitySearchForm	= null;
		Locale								locale								= getRequestLocale( request);
		Collection							sellerCollection					= null;
		Collection							firstPlaceSellerCollection			= null;
		PagerForm 							pagerForm 							= new PagerForm();	
		String 								order								= null;
		String 								page								= null;
		SellerViewList						sellerViewList						= null;
		String								previousOrderType					= "";
		int									pageInt								= 1;
		int									itemsPerPageInt						= 8;
		int 								count								= 0;
		int 								maxPages							= 0;
		int 								index								= 0;
		
		locale = getRequestLocale( request);

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		if( form == null) {
			buyerSellerAvailabilitySearchForm 	= ( BuyerSellerAvailabilitySearchForm) session.getAttribute( Constant.BUYER_SELLER_AVAILABILITY_SEARCH_OBJECT_NAME);
			
			pagerForm = ( PagerForm) session.getAttribute( Constant.PAGER_OBJECT_NAME);
			
			if( pagerForm != null)
				count = pagerForm.getSize();
			else
				count = calendarFacade.getSellerCount( buyerSellerAvailabilitySearchForm, false, locale);
		} else {			
			buyerSellerAvailabilitySearchForm 	= ( BuyerSellerAvailabilitySearchForm)form;
			count 					= calendarFacade.getSellerCount( buyerSellerAvailabilitySearchForm, false, locale);
		}		
		
		if( buyerSellerAvailabilitySearchForm == null) {
			return error( "error.searchFormNotExist", request, mapping);
		}
		
		page = request.getParameter( "page");

		pageInt 		= DBUtils.parseInteger( page, 1).intValue();
		itemsPerPageInt = DBUtils.parseInteger( buyerSellerAvailabilitySearchForm.getItemsPerPage(), 8).intValue();
		
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
		
		sellerCollection = calendarFacade.getSeller( buyerSellerAvailabilitySearchForm, false, index, itemsPerPageInt , locale);
		
		Iterator iterator = sellerCollection.iterator();
		
		while( iterator.hasNext()) {
			sellerViewList = ( SellerViewList) iterator.next();
			
			sellerViewList.setHighlighted( Integer.toString( promotionFacade.getHighlightedPromotionBySellerId ( DBUtils.parseInteger( sellerViewList.getId(), 0), locale)));
		}

		if( pageInt == 1) {
			Random random = new Random();
			int orderType = random.nextInt( 9);
			
			previousOrderType = buyerSellerAvailabilitySearchForm.getOrderedBy();
			
			switch( orderType){
				case 1: buyerSellerAvailabilitySearchForm.setOrderedBy( "seller.lastLogin"); break;
				case 2: buyerSellerAvailabilitySearchForm.setOrderedBy( "seller.positiveVotes"); break;
				case 3: buyerSellerAvailabilitySearchForm.setOrderedBy( "seller.contactsReceived"); break;
				case 4: buyerSellerAvailabilitySearchForm.setOrderedBy( "seller.contactsAccepted"); break;
				case 5: buyerSellerAvailabilitySearchForm.setOrderedBy( "seller.birthDate"); break;
				case 6: buyerSellerAvailabilitySearchForm.setOrderedBy( "seller.login"); break;
				case 7: buyerSellerAvailabilitySearchForm.setOrderedBy( "seller.password"); break;
				case 8: buyerSellerAvailabilitySearchForm.setOrderedBy( "seller.intro"); break;
				case 9: buyerSellerAvailabilitySearchForm.setOrderedBy( "seller.email"); break;
			}
			firstPlaceSellerCollection = calendarFacade.getSeller( buyerSellerAvailabilitySearchForm, true, 1, 5 , locale);
			session.setAttribute( Constant.FIRST_PLACE_SELLER_COLLECTION_OBJECT_NAME, firstPlaceSellerCollection);
			
			buyerSellerAvailabilitySearchForm.setOrderedBy( previousOrderType);
		} else {
			session.removeAttribute( Constant.FIRST_PLACE_SELLER_COLLECTION_OBJECT_NAME);
		}
		
		pagerForm.setPage			( pageInt);
		pagerForm.setSize			( count);
		pagerForm.setItemsPerPage	( itemsPerPageInt);
		
		session.setAttribute( Constant.PAGER_OBJECT_NAME, pagerForm);		
		request.setAttribute( Constant.SELLER_COLLECTION_OBJECT_NAME, sellerCollection);
		session.setAttribute( Constant.BUYER_SELLER_AVAILABILITY_SEARCH_OBJECT_NAME, buyerSellerAvailabilitySearchForm);
		
		saveToken(request);
		
		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
