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
import com.amandris.clients.web.view.MessageDataView;
import com.amandris.clients.web.action.common.AbstractAction;

public class MarkSellerMessageAsNewAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		MessageFacade 			messageFacade 			= new MessageFacade();
		Locale					locale					= null;
		MessageDataView			messageDataView			= null;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ! messageFacade.markSellerMessageAsNewById( DBUtils.parseInteger( request.getParameter( "id"), 0), sellerSession.getId()))
			return error( "error.couldNotMarkMessageAsNew", request, mapping);
		
		messageDataView = messageFacade.getSellerMessageDataBySellerId( sellerSession.getId(), null, Boolean.TRUE, "date", false, 0, Integer.MAX_VALUE, locale);
		
		session.setAttribute( Constant.SELLER_MESSAGE_DATA_OBJECT_NAME, messageDataView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
