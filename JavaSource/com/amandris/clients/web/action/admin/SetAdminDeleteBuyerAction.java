package com.amandris.clients.web.action.admin;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.dao.BuyerDAO;
import com.amandris.clients.service.dao.BuyerHistoricCreditDAO;
import com.amandris.clients.service.dao.BuyerHistoricLoginDAO;
import com.amandris.clients.service.dao.ContactDAO;
import com.amandris.clients.service.dao.ContactMessageDAO;
import com.amandris.clients.service.dao.InvitationDAO;
import com.amandris.clients.service.dao.MessageDAO;
import com.amandris.clients.service.dao.RecommendationDAO;
import com.amandris.clients.service.dao.SavedSearchDAO;
import com.amandris.clients.service.dao.VoteDAO;
import com.amandris.clients.service.vo.Buyer;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.web.util.AdminSession;

public class SetAdminDeleteBuyerAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 				session 				= request.getSession();
		BuyerDAO 					buyerDAO 				= new BuyerDAO();
		Locale						locale					= null;
		Buyer						buyer					= null;
		BuyerHistoricCreditDAO		buyerHistoricCreditDAO	= new BuyerHistoricCreditDAO();
		BuyerHistoricLoginDAO		buyerHistoricLoginDAO	= new BuyerHistoricLoginDAO();
		MessageDAO					messageDAO				= new MessageDAO();
		RecommendationDAO			recommendationDAO		= new RecommendationDAO();
		SavedSearchDAO				savedSearchDAO			= new SavedSearchDAO();
		ContactDAO					contactDAO				= new ContactDAO();
		ContactMessageDAO			contactMessageDAO		= new ContactMessageDAO();
		VoteDAO						voteDAO					= new VoteDAO();
		InvitationDAO				invitationDAO			= new InvitationDAO();

		AdminSession adminSession = ( AdminSession)session.getAttribute( Constant.ADMIN_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( adminSession == null)
			return ( mapping.findForward( Constant.ADMIN_SESSION_FAIL));
		
		buyer = buyerDAO.getBuyerById( DBUtils.parseInteger( request.getParameter( "id"), 0), null);
		
		if( buyer != null){
		
			if( (contactDAO.getBuyerContactCount( buyer.getId()) == 0 ) && ( voteDAO.getVoteToBuyerByBuyerId( buyer.getId(), "id", true, null, 0, Integer.MAX_VALUE).size() == 0)){
				buyerHistoricCreditDAO.deleteBuyerHistoricCreditByBuyerId	( buyer.getId());
				buyerHistoricLoginDAO.deleteBuyerHistoricLoginByBuyerId		( buyer.getId());
				messageDAO.deleteBuyerMessageByBuyerId						( buyer.getId());
				recommendationDAO.deleteBuyerRecomendationByBuyerId			( buyer.getId());
				savedSearchDAO.deleteBuyerSavedSearchByBuyerId				( buyer.getId());
				invitationDAO.deleteInvitationByBuyerId						( buyer.getId());
				buyerDAO.deleteBuyer										( buyer);
			} else {
				buyer.setLogin			( buyer.getLogin() + "(borrado)");
				buyer.setActive			( new Integer(0));
				buyer.setIsPublic		( new Integer( 0));
				buyer.setIntro			( "Usuario borrado");
				buyer.setText			( "Usuario borrado");
				buyer.setPreferredText	( "");
				buyer.setEmail			( "no-reply@amandris.com");
				
				buyerDAO.setBuyer( buyer);
			}
		}
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
