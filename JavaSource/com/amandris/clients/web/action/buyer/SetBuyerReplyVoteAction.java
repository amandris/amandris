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
import com.amandris.clients.web.form.ReplyVoteForm;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.view.BuyerConfirmContactView;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetBuyerReplyVoteAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		BuyerConfirmContactView	buyerConfirmContactView = new BuyerConfirmContactView();
		VoteFacade				voteFacade				= new VoteFacade();
		Locale					locale					= null;
		ReplyVoteForm			replyVoteForm			= null;

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ( form == null) || ( form.getClass() != ReplyVoteForm.class))
			return error( "error.couldNotReplyVote", request, mapping);
		
		replyVoteForm = ( ReplyVoteForm) form;
		
		if( voteFacade.setBuyerReplyVote( replyVoteForm, buyerSession.getId(), locale) == false)
			return error( "error.couldNotReplyVote", request, mapping);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
