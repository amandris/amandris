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
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.view.VoteDataView;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowBuyerGivenVoteAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 					= request.getSession();
		VoteFacade 				voteFacade 					= new VoteFacade();
		Locale					locale						= null;
		VoteDataView			buyerGivenVoteDataView		= null;

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		buyerGivenVoteDataView = voteFacade.getBuyerGivenVoteDataByBuyerId( buyerSession.getId(), "date", false, Boolean.TRUE, 0, Integer.MAX_VALUE, locale);
		
		request.setAttribute( Constant.BUYER_GIVEN_VOTE_DATA_OBJECT_NAME, buyerGivenVoteDataView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
