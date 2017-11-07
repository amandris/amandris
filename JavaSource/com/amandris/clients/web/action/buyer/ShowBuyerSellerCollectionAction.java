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

import com.amandris.clients.service.facade.PromotionFacade;
import com.amandris.clients.service.facade.SavedSearchFacade;
import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.BuyerSellerSearchForm;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.util.PagerForm;
import com.amandris.clients.web.view.SellerViewList;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowBuyerSellerCollectionAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HttpSession 			session 					= request.getSession();
		SellerFacade 			sellerFacade				= new SellerFacade();
		SavedSearchFacade		savedSearchFacade			= new SavedSearchFacade();
		PromotionFacade			promotionFacade				= new PromotionFacade();
		BuyerSellerSearchForm 	buyerSellerSearchForm 		= null;
		Locale					locale						= getRequestLocale( request);
		Collection				sellerCollection			= null;
		Collection				firstPlaceSellerCollection	= null;
		PagerForm 				pagerForm 					= new PagerForm();	
		String 					order						= null;
		String 					page						= null;
		SellerViewList			sellerViewList				= null;
		String					previousOrderType			= "";
		int						pageInt						= 1;
		int						itemsPerPageInt				= 8;
		int 					count						= 0;
		int 					maxPages					= 0;
		int 					index						= 0;
		
		locale = getRequestLocale( request);

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);

		if( form == null) {
			buyerSellerSearchForm 	= ( BuyerSellerSearchForm) session.getAttribute( Constant.BUYER_SELLER_SEARCH_OBJECT_NAME);
			pagerForm = ( PagerForm) session.getAttribute( Constant.PAGER_OBJECT_NAME);
			
			if( pagerForm != null){
				count = pagerForm.getSize();
			} else{
				count = sellerFacade.getSellerCount( buyerSellerSearchForm, false, locale);
			}
		} else {
			buyerSellerSearchForm 	= ( BuyerSellerSearchForm)form;
			String mySex 	= request.getParameter( "mySex");
			String sex 		= request.getParameter( "sex");
			String country 	= request.getParameter( "country");
			String state 	= request.getParameter( "state");
			String ageLow 	= request.getParameter( "ageLow");
			String ageHigh 	= request.getParameter( "ageHigh");
			
			if( mySex != null) {
				buyerSellerSearchForm.setMySex( DBUtils.parseInteger( mySex, 2));
			}
			
			if( sex != null) {
				buyerSellerSearchForm.setSex_girl				( Boolean.FALSE);
				buyerSellerSearchForm.setSex_boy				( Boolean.FALSE);
				buyerSellerSearchForm.setSex_shemale			( Boolean.FALSE);
				buyerSellerSearchForm.setSex_boysCouple			( Boolean.FALSE);
				buyerSellerSearchForm.setSex_girlsCouple		( Boolean.FALSE);
				buyerSellerSearchForm.setSex_boyAndGirlCouple	( Boolean.FALSE);
				buyerSellerSearchForm.setSex_group				( Boolean.FALSE);
				
				if( sex.equals( "1"))
					buyerSellerSearchForm.setSex_girl( Boolean.TRUE);
				if( sex.equals( "2"))
					buyerSellerSearchForm.setSex_boy( Boolean.TRUE);
				if( sex.equals( "4"))
					buyerSellerSearchForm.setSex_shemale( Boolean.TRUE);
				if( sex.equals( "8"))
					buyerSellerSearchForm.setSex_boysCouple( Boolean.TRUE);
				if( sex.equals( "16"))
					buyerSellerSearchForm.setSex_girlsCouple( Boolean.TRUE);
				if( sex.equals( "32"))
					buyerSellerSearchForm.setSex_boyAndGirlCouple( Boolean.TRUE);
				if( sex.equals( "64"))
					buyerSellerSearchForm.setSex_group( Boolean.TRUE);
			}

			if( country != null)
				buyerSellerSearchForm.setCountry( DBUtils.parseInteger( country, 1));
			
			if( state != null)
				buyerSellerSearchForm.setState( DBUtils.parseInteger( state, 1));
			
			if( ageLow != null) {
				if( DBUtils.parseInteger( ageLow, 18).intValue() < 18)
					ageLow = "18";
				buyerSellerSearchForm.setAgeLow( DBUtils.parseInteger( ageLow, 18).toString());
			}
			
			if( ageHigh != null) {
				if( DBUtils.parseInteger( ageHigh, 18).intValue() > 99)
					ageHigh = "99";
				buyerSellerSearchForm.setAgeHigh( DBUtils.parseInteger( ageHigh, 99).toString());
			}
			count 					= sellerFacade.getSellerCount( buyerSellerSearchForm, false, locale);
		}		

		if( buyerSellerSearchForm == null) {
			return error( "error.searchFormNotExist", request, mapping);
		}

		if( ( buyerSellerSearchForm.getSaveSearch().booleanValue() == true) && ( buyerSession != null) && ( ! buyerSellerSearchForm.getSaveSearchName().trim().equals( "")))
			savedSearchFacade.setSavedSearch( buyerSession.getId(), buyerSellerSearchForm, locale);
		
		page = request.getParameter( "page");
		
		pageInt 		= DBUtils.parseInteger( page, 1).intValue();
		itemsPerPageInt = DBUtils.parseInteger( buyerSellerSearchForm.getItemsPerPage(), 8).intValue();

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

		if( buyerSellerSearchForm.getOrderedBy().equals( ""))
			buyerSellerSearchForm.setOrderedBy( "seller.lastLogin");
		
		sellerCollection = sellerFacade.getSeller( buyerSellerSearchForm, false, index, itemsPerPageInt , locale);
		
		Iterator iterator = sellerCollection.iterator();
		
		while( iterator.hasNext()) {
			sellerViewList = ( SellerViewList) iterator.next();
			
			sellerViewList.setHighlighted( Integer.toString( promotionFacade.getHighlightedPromotionBySellerId ( DBUtils.parseInteger( sellerViewList.getId(), 0), locale)));
		}

		if( pageInt == 1) {
			Random random = new Random();
			int orderType = random.nextInt( 9);
			
			previousOrderType = buyerSellerSearchForm.getOrderedBy();
			
			switch( orderType){
				case 1: buyerSellerSearchForm.setOrderedBy( "seller.lastLogin"); break;
				case 2: buyerSellerSearchForm.setOrderedBy( "seller.positiveVotes"); break;
				case 3: buyerSellerSearchForm.setOrderedBy( "seller.contactsReceived"); break;
				case 4: buyerSellerSearchForm.setOrderedBy( "seller.contactsAccepted"); break;
				case 5: buyerSellerSearchForm.setOrderedBy( "seller.birthDate"); break;
				case 6: buyerSellerSearchForm.setOrderedBy( "seller.login"); break;
				case 7: buyerSellerSearchForm.setOrderedBy( "seller.password"); break;
				case 8: buyerSellerSearchForm.setOrderedBy( "seller.intro"); break;
				case 9: buyerSellerSearchForm.setOrderedBy( "seller.email"); break;
			}
			firstPlaceSellerCollection = sellerFacade.getSeller( buyerSellerSearchForm, true, 1, 5 , locale);
			session.setAttribute( Constant.FIRST_PLACE_SELLER_COLLECTION_OBJECT_NAME, firstPlaceSellerCollection);
			
			buyerSellerSearchForm.setOrderedBy( previousOrderType);
		} else {
			session.removeAttribute( Constant.FIRST_PLACE_SELLER_COLLECTION_OBJECT_NAME);
		}
		
		pagerForm.setPage			( pageInt);
		pagerForm.setSize			( count);
		pagerForm.setItemsPerPage	( itemsPerPageInt);
		
		session.setAttribute( Constant.PAGER_OBJECT_NAME, pagerForm);		
		request.setAttribute( Constant.SELLER_COLLECTION_OBJECT_NAME, sellerCollection);
		session.setAttribute( Constant.BUYER_SELLER_SEARCH_OBJECT_NAME, buyerSellerSearchForm);
		
		saveToken(request);
		
		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
