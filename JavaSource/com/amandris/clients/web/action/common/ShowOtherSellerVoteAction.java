package com.amandris.clients.web.action.common;

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
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.view.OtherUserVoteDataView;

public class ShowOtherSellerVoteAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 					= request.getSession();
		VoteFacade 				voteFacade 					= new VoteFacade();
		Locale					locale						= null;
		OtherUserVoteDataView	otherSellerVoteDataView		= null;

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		otherSellerVoteDataView = voteFacade.getOtherSellerVoteDataBySellerId( DBUtils.parseInteger( request.getParameter( "id"), 0), "date", false, Boolean.TRUE, 0, Integer.MAX_VALUE, locale);
		
		if( otherSellerVoteDataView == null)
			return error( "error.couldNotShowSellerVote", request, mapping);
		
		request.setAttribute( Constant.OTHER_SELLER_VOTE_DATA_OBJECT_NAME, otherSellerVoteDataView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
