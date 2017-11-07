package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.MessageFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.MessageView;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowSellerMessageDetailAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 	session 		= request.getSession();
		MessageFacade 	messageFacade 	= new MessageFacade();
		Locale			locale			= null;
		MessageView		messageView		= null;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		messageView = messageFacade.getSellerMessageById( DBUtils.parseInteger( request.getParameter( "id"), 0), locale, true);
		
		if( messageView == null)
			return error( "error.messageNotExist", request, mapping);

		if( DBUtils.parseInteger( messageView.getSellerId(), 0).intValue() != sellerSession.getId().intValue()) 
			return error( "error.messageNotExist", request, mapping);
		
		request.setAttribute( Constant.SELLER_MESSAGE_OBJECT_NAME, messageView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
