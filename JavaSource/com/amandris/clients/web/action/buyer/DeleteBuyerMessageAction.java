package com.amandris.clients.web.action.buyer;

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
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.view.MessageDataView;
import com.amandris.clients.web.action.common.AbstractAction;

public class DeleteBuyerMessageAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		MessageFacade 			messageFacade 			= new MessageFacade();
		Locale					locale					= null;
		MessageDataView			messageDataView			= null;

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ! messageFacade.deleteBuyerMessageById( DBUtils.parseInteger( request.getParameter( "id"), 0), buyerSession.getId()))
			return error( "error.couldNotDeleteMessage", request, mapping);
		
		messageDataView = messageFacade.getBuyerMessageDataByBuyerId( buyerSession.getId(), null, Boolean.TRUE, "date", false, 0, Integer.MAX_VALUE, locale);
		
		session.setAttribute( Constant.BUYER_MESSAGE_DATA_OBJECT_NAME, messageDataView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
