package com.amandris.clients.web.action.buyer;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.VoteFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.ReplyVoteForm;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.view.VoteView;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowBuyerReplyVoteAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 					= request.getSession();
		VoteFacade 				voteFacade 					= new VoteFacade();
		ReplyVoteForm			replyVoteForm				= new ReplyVoteForm();
		Locale					locale						= null;
		VoteView				voteView					= null;

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		voteView = voteFacade.getVoteToBuyerById( DBUtils.parseInteger( request.getParameter( "id"), 0), locale);
		
		if( voteView == null)
			return error( "error.couldNotReplyVote", request, mapping);
		
		if( DBUtils.parseInteger( voteView.getBuyerId(), 0).intValue() != buyerSession.getId().intValue())
			return error( "error.couldNotReplyVote", request, mapping);
		
		if( !voteView.getReply().equals( ""))
			return error( "error.couldNotReplyVote", request, mapping);
		
		replyVoteForm.setText			( "");
		replyVoteForm.setSellerId		( voteView.getSellerId());
		replyVoteForm.setBuyerId		( voteView.getBuyerId());
		replyVoteForm.setVoteId			( voteView.getId());
		replyVoteForm.setContactId		( voteView.getContactId());

		session.setAttribute( Constant.REPLY_VOTE_FORM_OBJECT_NAME, replyVoteForm);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
