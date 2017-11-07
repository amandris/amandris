package com.amandris.clients.web.action.seller;

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
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.InvitationDataView;
import com.amandris.clients.web.action.common.AbstractAction;

public class DeleteSellerInvitationAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		InvitationFacade 		invitationFacade 		= new InvitationFacade();
		Locale					locale					= null;
		InvitationDataView		invitationDataView		= null;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ! invitationFacade.setSellerInvitationVisibilityById( DBUtils.parseInteger( request.getParameter( "id"), 0), sellerSession.getId(), false))
			return error( "error.couldNotDeleteInvitation", request, mapping);
		
		invitationDataView = invitationFacade.getInvitationDataBySellerId( sellerSession.getId(), Boolean.TRUE, "date", false, 0, Integer.MAX_VALUE, locale);
		
		session.setAttribute( Constant.SELLER_INVITATION_DATA_OBJECT_NAME, invitationDataView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
