package com.amandris.clients.web.action.admin;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.dao.CalendarDAO;
import com.amandris.clients.service.dao.ContactDAO;
import com.amandris.clients.service.dao.ContactMessageDAO;
import com.amandris.clients.service.dao.InvitationDAO;
import com.amandris.clients.service.dao.MessageDAO;
import com.amandris.clients.service.dao.PromotionDAO;
import com.amandris.clients.service.dao.RecommendationDAO;
import com.amandris.clients.service.dao.SellerDAO;
import com.amandris.clients.service.dao.SellerHistoricCreditDAO;
import com.amandris.clients.service.dao.SellerHistoricLoginDAO;
import com.amandris.clients.service.dao.SellerServiceDAO;
import com.amandris.clients.service.dao.VoteDAO;
import com.amandris.clients.service.vo.Seller;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.web.util.AdminSession;

public class SetAdminDeleteSellerAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 				session 				= request.getSession();
		SellerDAO 					sellerDAO 				= new SellerDAO();
		Locale						locale					= null;
		Seller						seller					= null;
		SellerHistoricCreditDAO		sellerHistoricCreditDAO	= new SellerHistoricCreditDAO();
		SellerHistoricLoginDAO		sellerHistoricLoginDAO	= new SellerHistoricLoginDAO();
		MessageDAO					messageDAO				= new MessageDAO();
		RecommendationDAO			recommendationDAO		= new RecommendationDAO();
		ContactDAO					contactDAO				= new ContactDAO();
		ContactMessageDAO			contactMessageDAO		= new ContactMessageDAO();
		VoteDAO						voteDAO					= new VoteDAO();
		InvitationDAO				invitationDAO			= new InvitationDAO();
		CalendarDAO					calendarDAO				= new CalendarDAO();
		SellerServiceDAO			sellerServiceDAO		= new SellerServiceDAO();
		PromotionDAO				promotionDAO			= new PromotionDAO();

		AdminSession adminSession = ( AdminSession)session.getAttribute( Constant.ADMIN_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( adminSession == null)
			return ( mapping.findForward( Constant.ADMIN_SESSION_FAIL));
		
		seller = sellerDAO.getSellerById( DBUtils.parseInteger( request.getParameter( "id"), 0));
		
		if( seller != null){
		
			if( (contactDAO.getSellerContactCount( seller.getId()) == 0 ) && ( voteDAO.getVoteToSellerBySellerId( seller.getId(), "id", true, null, 0, Integer.MAX_VALUE).size() == 0)){
				sellerHistoricCreditDAO.deleteSellerHistoricCreditBySellerId	( seller.getId());
				sellerHistoricLoginDAO.deleteSellerHistoricLoginBySellerId		( seller.getId());
				messageDAO.deleteSellerMessageBySellerId						( seller.getId());
				recommendationDAO.deleteSellerRecomendationBySellerId			( seller.getId());
				invitationDAO.deleteInvitationBySellerId						( seller.getId());
				calendarDAO.deleteCalendarBySellerId							( seller.getId());
				sellerServiceDAO.deleteSellerServiceBySellerId					( seller.getId());
				promotionDAO.deleteSellerPromotionBySellerId					( seller.getId());
				sellerDAO.deleteSeller											( seller);
			} else {
				seller.setLogin					( seller.getLogin() + "(borrado)");
				seller.setActive				( new Integer(0));
				seller.setIsCalendarGenerated	( new Integer( 0));
				seller.setServicesSaved			( new Integer( 0));
				seller.setParametersSaved		( new Integer( 0));
				seller.setHasPicture			( new Integer( 0));
				seller.setIntro					( "Usuario borrado");
				seller.setText					( "Usuario borrado");
				seller.setPreferredText			( "");
				seller.setEmail					( "no-reply@amandris.com");
				
				calendarDAO.deleteCalendarBySellerId			( seller.getId());
				sellerServiceDAO.deleteSellerServiceBySellerId	( seller.getId());
				promotionDAO.deleteSellerPromotionBySellerId	( seller.getId());
				
				sellerDAO.setSeller( seller);
			}
		}
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
