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
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.PagerForm;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowAllMainSellerAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HttpSession 			session 					= request.getSession();
		PromotionFacade			promotionFacade				= new PromotionFacade();
		Locale					locale						= getRequestLocale( request);
		Collection				sellerCollection			= null;
		PagerForm 				pagerForm 					= new PagerForm();	
		int						pageInt						= 1;
		int						itemsPerPageInt				= 8;
		int 					count						= 0;
		int 					maxPages					= 0;
		int 					index						= 0;
		
		locale 	= getRequestLocale( request);
		count 	= promotionFacade.getMainSellerCount( locale);
		pageInt = DBUtils.parseInteger( request.getParameter( "page"), 1).intValue();
		
		if (pageInt < 1) 
			pageInt = 1;

		if (( count % itemsPerPageInt) == 0)
			maxPages = ( count / itemsPerPageInt);
		else
			maxPages = ( count / itemsPerPageInt) + 1;
		
		if ( pageInt >  maxPages)
			pageInt = maxPages;
		
		index = (( pageInt - 1) * itemsPerPageInt) + 1;
		
		sellerCollection = promotionFacade.getMainSeller( index, itemsPerPageInt , locale);
		
		pagerForm.setPage			( pageInt);
		pagerForm.setSize			( count);
		pagerForm.setItemsPerPage	( itemsPerPageInt);
		
		session.setAttribute( Constant.PAGER_OBJECT_NAME, pagerForm);		
		request.setAttribute( Constant.MAIN_SELLER_COLLECTION_OBJECT_NAME, sellerCollection);
		
		saveToken(request);
		
		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
