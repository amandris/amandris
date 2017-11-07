package com.amandris.clients.web.action.buyer;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.ContactFacade;
import com.amandris.clients.service.facade.VoteFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.VoteForm;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.view.BuyerContactView;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowBuyerVoteSellerAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 					= request.getSession();
		VoteFacade 				voteFacade 					= new VoteFacade();
		VoteForm				voteForm					= new VoteForm();
		ContactFacade			contactFacade				= new ContactFacade();
		BuyerContactView		buyerContactView			= new BuyerContactView();
		Locale					locale						= null;

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		buyerContactView = contactFacade.getBuyerContactById( DBUtils.parseInteger( request.getParameter( "id"), 0), buyerSession, locale);
		
		if( ( buyerContactView == null) || 
			( DBUtils.parseInteger( buyerContactView.getBuyerId() ,0).intValue() != buyerSession.getId().intValue()) || 
			( DBUtils.parseInteger( buyerContactView.getVoteStatusConst(), 0).intValue() != Constant.VOTE_STATUS_WAITING)) 
			return error( "error.couldNotSetVote", request, mapping);
		
		if( DBUtils.parseInteger( buyerContactView.getMessageStatusConst(), 0).intValue() != Constant.MESSAGE_STATUS_ACCEPTED)
			return error( "error.couldNotSetVote", request, mapping);
				
		voteForm.setText			( "");
		voteForm.setVote			( "1");
		voteForm.setSellerId		( buyerContactView.getSellerId());
		voteForm.setSellerLogin		( buyerContactView.getSellerLogin());
		voteForm.setContactId		( DBUtils.parseInteger( request.getParameter( "id"), 0).toString());

		session.setAttribute( Constant.VOTE_FORM_OBJECT_NAME, voteForm);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
