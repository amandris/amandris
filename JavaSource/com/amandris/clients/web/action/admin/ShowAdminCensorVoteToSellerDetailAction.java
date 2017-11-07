package com.amandris.clients.web.action.admin;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.web.form.AdminCensorVoteForm;
import com.amandris.clients.service.facade.VoteFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.AdminSession;
import com.amandris.clients.web.view.VoteView;

public class ShowAdminCensorVoteToSellerDetailAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 				session 					= request.getSession();
		VoteFacade 					voteFacade 					= new VoteFacade();
		Locale						locale						= null;
		VoteView					voteView					= null;
		AdminCensorVoteForm			adminCensorVoteForm			= new AdminCensorVoteForm();

		AdminSession adminSession = ( AdminSession)session.getAttribute( Constant.ADMIN_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( adminSession == null)
			return ( mapping.findForward( Constant.ADMIN_SESSION_FAIL));
		
		voteView = voteFacade.getVoteToSellerById( DBUtils.parseInteger( request.getParameter( "id"), 0), locale);
		
		adminCensorVoteForm.setBuyerLogin		( voteView.getBuyerLogin());
		adminCensorVoteForm.setSellerLogin		( voteView.getSellerLogin());
		adminCensorVoteForm.setVote				( voteView.getVote());
		adminCensorVoteForm.setComment			( voteView.getComment());
		adminCensorVoteForm.setReply			( voteView.getReply());
		adminCensorVoteForm.setId				( voteView.getId());
		
		
		session.setAttribute( Constant.ADMIN_CENSOR_VOTE_FORM_OBJECT_NAME, adminCensorVoteForm);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
