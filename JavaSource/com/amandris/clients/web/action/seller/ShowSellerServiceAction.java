package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.SellerServiceFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.SellerServiceView;
import com.amandris.clients.web.action.common.AbstractAction;

public class ShowSellerServiceAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		SellerServiceFacade 	sellerServiceFacade 	= new SellerServiceFacade();
		Locale					locale					= null;
		SellerServiceView		sellerServiceView		= null;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		request.removeAttribute( Constant.SELLER_SERVICE_OBJECT_NAME);
		
		sellerServiceView = sellerServiceFacade.getSellerServiceBySellerId( sellerSession.getId(), locale);
		
		request.setAttribute( Constant.SELLER_SERVICE_OBJECT_NAME, sellerServiceView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
