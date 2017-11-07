package com.amandris.clients.web.action.buyer;

import java.util.Collection;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.form.BuyerSellerSearchForm;
import com.amandris.clients.web.form.SearchByLoginForm;
import com.amandris.clients.web.util.PagerForm;
import com.amandris.clients.web.action.common.AbstractAction;


public class BuyerSellerSearchByLoginAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		SellerFacade 			sellerFacade			= new SellerFacade();
		BuyerSellerSearchForm 	buyerSellerSearchForm 	= null;
		Locale					locale					= getRequestLocale( request);
		Collection				sellerCollection		= null;
		PagerForm 				pagerForm 				= new PagerForm();	
		String					login					= "";
		int 					count					= 0;
		int 					maxPages				= 0;

		
		getRequestLocale( request);
		
		login = (( SearchByLoginForm) form).getLogin(); 

		buyerSellerSearchForm 	= new BuyerSellerSearchForm();

		buyerSellerSearchForm.setLogin( login);
		buyerSellerSearchForm.setOrderedBy( "seller.login");
		buyerSellerSearchForm.setMySex( new Integer( 0));
		
		count = sellerFacade.getSellerCount( buyerSellerSearchForm, false, locale);
		
		sellerCollection = sellerFacade.getSeller( buyerSellerSearchForm, false, 1, 4, locale);
		
		pagerForm.setPage			( 1);
		pagerForm.setSize			( count);
		pagerForm.setItemsPerPage	( 4);
		
		session.setAttribute( Constant.PAGER_OBJECT_NAME, pagerForm);		
		request.setAttribute( Constant.SELLER_COLLECTION_OBJECT_NAME, sellerCollection);
		session.setAttribute( Constant.BUYER_SELLER_SEARCH_OBJECT_NAME, buyerSellerSearchForm);
		
		saveToken(request);
		
		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
