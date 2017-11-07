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
import com.amandris.clients.web.view.OtherUserVoteDataView;

public class ShowOtherBuyerVoteAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 					= request.getSession();
		VoteFacade 				voteFacade 					= new VoteFacade();
		Locale					locale						= null;
		OtherUserVoteDataView	otherBuyerVoteDataView		= null;
		
		locale = getLocale( request);
		
		otherBuyerVoteDataView = voteFacade.getOtherBuyerVoteDataByBuyerId( DBUtils.parseInteger( request.getParameter( "id"), 0), "date", false, Boolean.TRUE, 0, Integer.MAX_VALUE, locale);
		
		if( otherBuyerVoteDataView == null)
			return error( "error.couldNotShowBuyerVote", request, mapping);
		
		request.setAttribute( Constant.OTHER_BUYER_VOTE_DATA_OBJECT_NAME, otherBuyerVoteDataView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
