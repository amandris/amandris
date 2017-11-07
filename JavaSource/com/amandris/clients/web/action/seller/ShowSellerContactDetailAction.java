package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.ContactFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.SellerContactView;
import com.amandris.clients.web.action.common.AbstractAction;

public class ShowSellerContactDetailAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		ContactFacade 			contactFacade 			= new ContactFacade();
		Locale					locale					= null;
		SellerContactView		sellerContactView		= null;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		sellerContactView = contactFacade.getSellerContactById( DBUtils.parseInteger( request.getParameter( "id"), 0), sellerSession, locale);
		
		if( sellerContactView == null)
			return super.error( "error.contactNotExist", request, mapping);
		
		request.setAttribute( Constant.SELLER_CONTACT_DETAIL_OBJECT_NAME, sellerContactView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
