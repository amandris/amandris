package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.PromotionFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.PromotionDataView;
import com.amandris.clients.web.action.common.AbstractAction;

public class ShowSellerPromotionAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		PromotionFacade 		promotionFacade 		= new PromotionFacade();
		Locale					locale					= null;
		PromotionDataView		promotionDataView		= null;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		request.removeAttribute( Constant.SELLER_PROMOTION_DATA_OBJECT_NAME);
		
		promotionDataView = promotionFacade.getPromotionDataBySellerId( sellerSession.getId(), locale);
		
		request.setAttribute( Constant.SELLER_PROMOTION_DATA_OBJECT_NAME, promotionDataView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
