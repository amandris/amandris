package com.amandris.clients.web.action.seller;

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
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.SellerContactView;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowSellerVoteBuyerAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 					= request.getSession();
		VoteFacade 				voteFacade 					= new VoteFacade();
		VoteForm				voteForm					= new VoteForm();
		ContactFacade			contactFacade				= new ContactFacade();
		SellerContactView		sellerContactView			= new SellerContactView();
		Locale					locale						= null;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		sellerContactView = contactFacade.getSellerContactById( DBUtils.parseInteger( request.getParameter( "id"), 0), sellerSession, locale);
		
		if( ( sellerContactView == null) || 
			( DBUtils.parseInteger( sellerContactView.getSellerId() ,0).intValue() != sellerSession.getId().intValue()) || 
			( DBUtils.parseInteger( sellerContactView.getSellerVoteStatusConst(), 0).intValue() != Constant.VOTE_STATUS_WAITING)) 
			return error( "error.couldNotSetVote", request, mapping);
		
		if( DBUtils.parseInteger( sellerContactView.getMessageStatusConst(), 0).intValue() != Constant.MESSAGE_STATUS_ACCEPTED)
			return error( "error.couldNotSetVote", request, mapping);
		
		voteForm.setText			( "");
		voteForm.setVote			( "1");
		voteForm.setBuyerId			( sellerContactView.getBuyerId());
		voteForm.setBuyerLogin		( sellerContactView.getBuyerLogin());
		voteForm.setContactId		( DBUtils.parseInteger( request.getParameter( "id"), 0).toString());

		session.setAttribute( Constant.VOTE_FORM_OBJECT_NAME, voteForm);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
