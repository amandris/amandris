package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.PromotionFacade;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.AddPromotionView;
import com.amandris.clients.web.action.common.AbstractAction;

public class ShowSellerAddPromotionAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 		session 			= request.getSession();
		Locale				locale				= getLocale( request);;
		AddPromotionView	addPromotionView 	= new AddPromotionView();
		PromotionFacade		promotionFacade		= new PromotionFacade();
		int					checked				= 0;
		boolean				isPromotion1Active	= false;
		boolean				isPromotion2Active	= false;
		//boolean				isPromotion3Active	= false;
		boolean				isPromotion4Active	= false;
		boolean				isPromotion5Active	= false;
		boolean				isPromotion6Active	= false;
		boolean				isPromotion7Active	= false;
		boolean				isPromotion8Active	= false;
		
		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		addPromotionView.setPromotion1Price( ConfigurationParameterManager.getParameterString( "promotion1Price"));
		addPromotionView.setPromotion2Price( ConfigurationParameterManager.getParameterString( "promotion2Price"));
		//addPromotionView.setPromotion3Price( ConfigurationParameterManager.getParameterString( "promotion3Price"));
		addPromotionView.setPromotion4Price( ConfigurationParameterManager.getParameterString( "promotion4Price"));
		addPromotionView.setPromotion5Price( ConfigurationParameterManager.getParameterString( "promotion5Price"));
		addPromotionView.setPromotion6Price( ConfigurationParameterManager.getParameterString( "promotion6Price"));
		addPromotionView.setPromotion7Price( ConfigurationParameterManager.getParameterString( "promotion7Price"));
		addPromotionView.setPromotion8Price( ConfigurationParameterManager.getParameterString( "promotion8Price"));
		
		addPromotionView.setPromotion1Length( ConfigurationParameterManager.getParameterString( "promotion1Length"));
		addPromotionView.setPromotion2Length( ConfigurationParameterManager.getParameterString( "promotion2Length"));
		//addPromotionView.setPromotion3Length( ConfigurationParameterManager.getParameterString( "promotion3Length"));
		addPromotionView.setPromotion4Length( ConfigurationParameterManager.getParameterString( "promotion4Length"));
		addPromotionView.setPromotion5Length( ConfigurationParameterManager.getParameterString( "promotion5Length"));
		addPromotionView.setPromotion6Length( ConfigurationParameterManager.getParameterString( "promotion6Length"));
		addPromotionView.setPromotion7Length( ConfigurationParameterManager.getParameterString( "promotion7Length"));

		isPromotion1Active = promotionFacade.isPromotionActive( sellerSession.getId(), Constant.PROMOTION_HIGHLIGHT_PROFILE_1, locale);
		isPromotion2Active = promotionFacade.isPromotionActive( sellerSession.getId(), Constant.PROMOTION_HIGHLIGHT_PROFILE_2, locale);
		//isPromotion3Active = promotionFacade.isPromotionActive( sellerSession.getId(), Constant.PROMOTION_HIGHLIGHT_PROFILE_3, locale);
		isPromotion4Active = promotionFacade.isPromotionActive( sellerSession.getId(), Constant.PROMOTION_FIRST_PLACE_IN_SEARCH, locale);
		isPromotion5Active = promotionFacade.isPromotionActive( sellerSession.getId(), Constant.PROMOTION_SHOW_IN_INDEX, locale);
		isPromotion6Active = promotionFacade.isPromotionActive( sellerSession.getId(), Constant.PROMOTION_SHOW_IN_BULLETIN, locale);
		isPromotion7Active = promotionFacade.isPromotionActive( sellerSession.getId(), Constant.PROMOTION_FREE_CONTACT, locale);
		isPromotion8Active = promotionFacade.isPromotionActive( sellerSession.getId(), Constant.PROMOTION_ALBUM, locale);

		if( isPromotion1Active || isPromotion2Active /*|| isPromotion3Active*/){
			addPromotionView.setPromotion1Enabled( "0");
			addPromotionView.setPromotion2Enabled( "0");
			//addPromotionView.setPromotion3Enabled( "0");
		}

		addPromotionView.setPromotion4Enabled( DBUtils.boolean2String( ! isPromotion4Active));
		addPromotionView.setPromotion5Enabled( DBUtils.boolean2String( ! isPromotion5Active));
		addPromotionView.setPromotion6Enabled( DBUtils.boolean2String( ! isPromotion6Active));
		addPromotionView.setPromotion7Enabled( DBUtils.boolean2String( ! isPromotion7Active));
		addPromotionView.setPromotion8Enabled( DBUtils.boolean2String( ! isPromotion8Active));
		
		if( addPromotionView.getPromotion8Enabled().equals( "1"))
			checked = 8;
		if( addPromotionView.getPromotion7Enabled().equals( "1"))
			checked = 7;
		if( addPromotionView.getPromotion6Enabled().equals( "1"))
			checked = 6;
		if( addPromotionView.getPromotion5Enabled().equals( "1"))
			checked = 5;
		if( addPromotionView.getPromotion4Enabled().equals( "1"))
			checked = 4;
		/*if( addPromotionView.getPromotion3Enabled().equals( "1"))
			checked = 3;*/
		if( addPromotionView.getPromotion2Enabled().equals( "1"))
			checked = 2;
		if( addPromotionView.getPromotion1Enabled().equals( "1"))
			checked = 1;
		
		if (checked == 0)
			addPromotionView.setEnabled( "0");
		
		switch( checked) {
			case 1: addPromotionView.setPromotion1Checked( "1"); break;
			case 2: addPromotionView.setPromotion2Checked( "1"); break;
			//case 3: addPromotionView.setPromotion3Checked( "1"); break;
			case 4: addPromotionView.setPromotion4Checked( "1"); break;
			case 5: addPromotionView.setPromotion5Checked( "1"); break;
			case 6: addPromotionView.setPromotion6Checked( "1"); break;
			case 7: addPromotionView.setPromotion7Checked( "1"); break;
			case 8: addPromotionView.setPromotion8Checked( "1"); break;
		}
		
		
		session.setAttribute( Constant.SELLER_ADD_PROMOTION_OBJECT_NAME, addPromotionView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
