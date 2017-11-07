package com.amandris.clients.web.action.common;

import java.util.Collection;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.service.facade.ContactFacade;
import com.amandris.clients.service.facade.VoteFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.BuyerView;
import com.amandris.clients.web.view.SellerContactView;

public class ShowBuyerAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
 		  
		HttpSession 			session 				= request.getSession();
		BuyerFacade				buyerFacade				= new BuyerFacade();
		VoteFacade				voteFacade				= new VoteFacade();
		ContactFacade			contactFacade			= new ContactFacade();
		Locale					locale					= getLocale( request);
		BuyerView				buyerView				= null;
		SellerContactView		sellerContactView		= null;
		Collection				voteCollection			= null;
		SellerSession			sellerSession			= null;
		BuyerSession			buyerSession			= null;
		boolean					fail 					= false;

		buyerView = buyerFacade.getBuyerById( DBUtils.parseInteger( request.getParameter( "id"), 0), null, locale);		
		
		if( buyerView == null) {
			return error( "error.buyerNotExist", request, mapping);
		}
		
		if( ! buyerView.getIsPublic().equals( "1")){
			sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
			buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
			
			if( sellerSession == null && buyerSession == null) {
				fail = true;
			} else if( buyerSession != null && buyerSession.getId().intValue() != DBUtils.parseInteger( buyerView.getId() ,0).intValue()) {
				fail = true;
			} else if( sellerSession != null && !contactFacade.existsSellerContactBySellerIdAndBuyerId( sellerSession.getId(), DBUtils.parseInteger( request.getParameter( "id"),0 ), locale)) {
				fail = true;
			}
		}
			
		if( fail == true)
			return error( "error.buyerIsNotPublic", request, mapping);
		
		voteCollection = voteFacade.getVoteToBuyerByBuyerId( DBUtils.parseInteger( request.getParameter( "id"), 0), "date", false, Boolean.TRUE, 0, 5);
		
		request.setAttribute( Constant.BUYER_OBJECT_NAME, buyerView);
		request.setAttribute( Constant.VOTE_COLLECTION_OBJECT_NAME, voteCollection);
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
