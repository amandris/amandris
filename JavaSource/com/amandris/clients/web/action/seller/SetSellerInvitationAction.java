package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.service.facade.InvitationFacade;
import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.BuyerView;
import com.amandris.clients.web.action.common.AbstractAction;


public class SetSellerInvitationAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 		session 			= request.getSession();
		BuyerView			buyerView			= null;
		BuyerFacade			buyerFacade			= new BuyerFacade();
		SellerFacade		sellerFacade		= new SellerFacade();
		InvitationFacade 	invitationFacade 	= new InvitationFacade();
		Locale				locale				= getLocale( request);
		int					invitationType		= 0;
		
		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		invitationType 	= DBUtils.parseInteger( request.getParameter( "type"), 0).intValue();
		
		buyerView = buyerFacade.getBuyerById( DBUtils.parseInteger( request.getParameter( "id"), 0), Boolean.TRUE, locale);
		
		if( ( buyerView == null) || ( ! buyerView.getIsPublic().equals( "1")))
			return error( "error.couldNotStartInvitation", request, mapping);
		
		if( ConfigurationParameterManager.getParameterInt( "creditsPerContact") > sellerSession.getCredits().intValue())
			return error( "error.couldNotStartInvitation", request, mapping);
		
		switch( invitationType){
			case 1: 
				if( invitationFacade.setInvitation( sellerSession.getId(), DBUtils.parseInteger( request.getParameter( "id"), 0), false, true, locale) == false){
					return error( "error.couldNotSendInvitation", request, mapping); 
				}
				break;
			
			default: {return error( "error.couldNotStartInvitation", request, mapping);} 
		}

		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
