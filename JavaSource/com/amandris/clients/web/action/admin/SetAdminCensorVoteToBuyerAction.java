package com.amandris.clients.web.action.admin;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.VoteFacade;
import com.amandris.clients.service.vo.VoteToBuyer;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.mail.Mail;
import com.amandris.clients.util.mail.VoteAcceptedMailObject;
import com.amandris.clients.web.form.AdminCensorVoteForm;
import com.amandris.clients.web.util.AdminSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetAdminCensorVoteToBuyerAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		Locale					locale					= getRequestLocale( request);
		VoteFacade				voteFacade				= new VoteFacade();
		AdminCensorVoteForm		adminCensorVoteForm		= null;
		VoteAcceptedMailObject	voteAcceptedMailObject	= new VoteAcceptedMailObject();
		String					subject					= "";
		VoteToBuyer				voteToBuyer				= null;				
		
		AdminSession adminSession = ( AdminSession)session.getAttribute( Constant.ADMIN_SESSION_OBJECT_NAME);
		
		if( adminSession == null)
			return ( mapping.findForward( Constant.ADMIN_SESSION_FAIL));
		
		adminCensorVoteForm = ( AdminCensorVoteForm) form;
		
		voteToBuyer = voteFacade.setVoteToBuyerCensor( adminCensorVoteForm);
				
		if( voteToBuyer == null){
			return error( "error.general", request, mapping);
		}
		
		voteAcceptedMailObject.setBuyer			( voteToBuyer.getBuyer());
		voteAcceptedMailObject.setIsVoteToBuyer	( true);
		voteAcceptedMailObject.setAnswer		( voteToBuyer.getReply());
		voteAcceptedMailObject.setLocale		( locale);
		voteAcceptedMailObject.setSeller		( voteToBuyer.getSeller());
		voteAcceptedMailObject.setText			( voteToBuyer.getComment());
		voteAcceptedMailObject.setVote			( voteToBuyer.getVote().intValue());
		
		if(  voteToBuyer.getReply() == null ||  voteToBuyer.getReply().equals( "")){
			subject = ConfigurationParameterManager.getMessages().getMessage( locale, "voteAcceptedMailObject.subject1", voteToBuyer.getBuyer().getLogin(), voteToBuyer.getSeller().getLogin());
			Mail.sendMail( voteToBuyer.getBuyer().getEmail(), subject, voteAcceptedMailObject);
		} else if( !voteToBuyer.getReply().equals( "")){
			subject = ConfigurationParameterManager.getMessages().getMessage( locale, "voteAcceptedMailObject.subject3", voteToBuyer.getSeller().getLogin(), voteToBuyer.getBuyer().getLogin());
			Mail.sendMail( voteToBuyer.getSeller().getEmail(), subject, voteAcceptedMailObject);
		}
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
	
}		
