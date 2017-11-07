package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.VoteFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.form.VoteForm;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetSellerVoteBuyerAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		VoteFacade				voteFacade				= new VoteFacade();
		Locale					locale					= null;
		VoteForm				voteForm				= null;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ( form == null) || ( form.getClass() != VoteForm.class))
			return error( "error.couldNotSetVote", request, mapping);
		
		voteForm = ( VoteForm) form;
		
		if( voteFacade.setVoteToBuyer( voteForm, sellerSession.getId(), locale) == false)
			return error( "error.couldNotSetVote", request, mapping);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
