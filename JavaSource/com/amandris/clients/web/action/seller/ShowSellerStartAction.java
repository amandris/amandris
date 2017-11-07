package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.ContactFacade;
import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.ContactDataView;
import com.amandris.clients.web.view.SellerStartView;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowSellerStartAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		SellerFacade 			sellerFacade 			= new SellerFacade();
		ContactFacade			contactFacade			= new ContactFacade();
		SellerStartView 		sellerStartView			= null;
		ContactDataView			sellerContactDataView	= null;
		Locale					locale					= null;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		sellerStartView 		= sellerFacade.getSellerStartById( sellerSession.getId(), locale);
		sellerContactDataView	= contactFacade.getSellerContactDataBySellerId( sellerSession.getId(), 0, 4, locale);
		
		sellerSession = sellerFacade.getSellerSessionByLoginAndPassword( sellerSession.getLogin(), sellerSession.getPassword(), true, locale);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		session.setAttribute( Constant.SELLER_SESSION_OBJECT_NAME, sellerSession);
		request.setAttribute( Constant.SELLER_CONTACT_DATA_OBJECT_NAME, sellerContactDataView);
		request.setAttribute( Constant.SELLER_START_DATA_OBJECT_NAME, sellerStartView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
