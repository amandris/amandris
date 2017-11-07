package com.amandris.clients.web.action.admin;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.VoteFacade;
import com.amandris.clients.service.vo.VoteToSeller;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.mail.Mail;
import com.amandris.clients.util.mail.VoteAcceptedMailObject;
import com.amandris.clients.web.form.AdminCensorVoteForm;
import com.amandris.clients.web.util.AdminSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetAdminCensorVoteToSellerAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		Locale					locale					= getRequestLocale( request);
		VoteFacade				voteFacade				= new VoteFacade();
		AdminCensorVoteForm		adminCensorVoteForm		= null;
		VoteAcceptedMailObject	voteAcceptedMailObject	= new VoteAcceptedMailObject();
		String					subject					= "";
		VoteToSeller			voteToSeller			= null;	
		
		AdminSession adminSession = ( AdminSession)session.getAttribute( Constant.ADMIN_SESSION_OBJECT_NAME);
		
		if( adminSession == null)
			return ( mapping.findForward( Constant.ADMIN_SESSION_FAIL));
		
		adminCensorVoteForm = ( AdminCensorVoteForm) form;
				
		voteToSeller = voteFacade.setVoteToSellerCensor( adminCensorVoteForm);
		
		if( voteToSeller == null){
			return error( "error.general", request, mapping);
		}
		
		voteAcceptedMailObject.setBuyer			( voteToSeller.getBuyer());
		voteAcceptedMailObject.setIsVoteToBuyer	( false);
		voteAcceptedMailObject.setAnswer		( voteToSeller.getReply());
		voteAcceptedMailObject.setLocale		( locale);
		voteAcceptedMailObject.setSeller		( voteToSeller.getSeller());
		voteAcceptedMailObject.setText			( voteToSeller.getComment());
		voteAcceptedMailObject.setVote			( voteToSeller.getVote().intValue());
		
		if(  voteToSeller.getReply() == null ||  voteToSeller.getReply().equals( "")){
			subject = ConfigurationParameterManager.getMessages().getMessage( locale, "voteAcceptedMailObject.subject2", voteToSeller.getSeller().getLogin(), voteToSeller.getBuyer().getLogin());
			Mail.sendMail( voteToSeller.getSeller().getEmail(), subject, voteAcceptedMailObject);
		} else if( !voteToSeller.getReply().equals( "")){
			subject = ConfigurationParameterManager.getMessages().getMessage( locale, "voteAcceptedMailObject.subject4", voteToSeller.getBuyer().getLogin(), voteToSeller.getSeller().getLogin());
			Mail.sendMail( voteToSeller.getBuyer().getEmail(), subject, voteAcceptedMailObject);
		}
				
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
	
}		
