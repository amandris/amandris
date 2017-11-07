package com.amandris.clients.web.action.buyer;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.InvitationFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.view.InvitationDataView;
import com.amandris.clients.web.action.common.AbstractAction;

public class DeleteBuyerInvitationAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		InvitationFacade 		invitationFacade 		= new InvitationFacade();
		Locale					locale					= null;
		InvitationDataView		invitationDataView		= null;

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ! invitationFacade.setBuyerInvitationVisibilityById( DBUtils.parseInteger( request.getParameter( "id"), 0), buyerSession.getId(), false))
			return error( "error.couldNotDeleteInvitation", request, mapping);
		
		invitationDataView = invitationFacade.getInvitationDataByBuyerId( buyerSession.getId(), Boolean.TRUE, "date", false, 0, Integer.MAX_VALUE, locale);
		
		session.setAttribute( Constant.BUYER_INVITATION_DATA_OBJECT_NAME, invitationDataView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
