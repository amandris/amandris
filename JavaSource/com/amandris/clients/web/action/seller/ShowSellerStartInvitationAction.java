package com.amandris.clients.web.action.seller;

import java.util.Calendar;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.BuyerView;
import com.amandris.clients.web.view.StartInvitationView;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowSellerStartInvitationAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 			= request.getSession();
		BuyerFacade 			buyerFacade 		= new BuyerFacade();
		StartInvitationView		startInvitationView = new StartInvitationView();
		BuyerView				buyerView			= null;
		Locale					locale				= getLocale( request);
		Calendar 				today 				= Calendar.getInstance( locale);
		
		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		buyerView = buyerFacade.getBuyerById( DBUtils.parseInteger( request.getParameter( "id"), 0), Boolean.TRUE, locale);
		
		if( ( buyerView == null) || ( ! buyerView.getIsPublic().equals( "1")))
			return error( "error.couldNotStartInvitation", request, mapping);
		
		startInvitationView.setBuyerId			( buyerView.getId());
		startInvitationView.setSellerId			( sellerSession.getId().toString());
		startInvitationView.setCredits			( ConfigurationParameterManager.getParameterString( "creditsPerContact"));
		startInvitationView.setExpirationTime	( ConfigurationParameterManager.getParameterString( "invitationExpirationTime"));
		
		if( ConfigurationParameterManager.getParameterInt( "creditsPerContact") > sellerSession.getCredits().intValue())
			startInvitationView.setEnabled( "0");
		else
			startInvitationView.setEnabled( "1");
		
		session.setAttribute( Constant.SELLER_START_INVITATION_OBJECT_NAME, startInvitationView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
