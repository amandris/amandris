package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.PromotionFacade;
import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.AddPromotionConfirmView;
import com.amandris.clients.web.action.common.AbstractAction;


public class SetSellerPromotionAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		PromotionFacade 		promotionFacade 		= new PromotionFacade();
		SellerFacade			sellerFacade			= new SellerFacade();
		Locale					locale					= getLocale( request);
		AddPromotionConfirmView	addPromotionConfirmView = new AddPromotionConfirmView();
		int						promotionType			= 0;
		Integer					credits					= null;
		
		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
			
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		addPromotionConfirmView = ( AddPromotionConfirmView) session.getAttribute( Constant.SELLER_ADD_PROMOTION_CONFIRM_OBJECT_NAME);
		
		if( addPromotionConfirmView == null)
			return error( "error.couldNotAddPromotion", request, mapping);
		
		if( ( addPromotionConfirmView.getEnoughCredits().equals( "0")) || ( addPromotionConfirmView.getPromotionAlreadyActive().equals( "1")))
			return error( "error.couldNotAddPromotion", request, mapping);

		promotionType = DBUtils.parseInteger( addPromotionConfirmView.getPromotionType(), 0).intValue();
		
		if( promotionType < 1 || promotionType > 8)
			return error( "error.couldNotAddPromotion", request, mapping);
		
		if( promotionType == Constant.PROMOTION_HIGHLIGHT_PROFILE_3)
			return error( "error.couldNotAddPromotion", request, mapping);
		
		if( promotionFacade.setPromotion( sellerSession.getId(), promotionType, addPromotionConfirmView.getEndJavaDate(), locale) == false)
			return error( "error.couldNotAddPromotion", request, mapping);
		
		credits = DBUtils.parseInteger( addPromotionConfirmView.getPromotionCredits(), 0);
				
		sellerFacade.decreaseCredits( sellerSession.getId(), credits, Constant.CREDIT_ACTION_USE_IN_PROMOTION, locale);
		
		sellerSession = sellerFacade.getSellerSessionByLoginAndPassword( sellerSession.getLogin(), sellerSession.getPassword(), true, locale);
		
		if( sellerSession == null)
			return error( "error.couldNotAddPromotion", request, mapping);
		
		session.setAttribute( Constant.SELLER_SESSION_OBJECT_NAME, sellerSession);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
