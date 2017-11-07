package com.amandris.clients.web.action.seller;

import java.util.Calendar;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.PromotionFacade;
import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.AddPromotionConfirmView;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowSellerAddPromotionConfirmAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		SellerFacade			sellerFacade			= new SellerFacade();
		PromotionFacade 		promotionFacade 		= new PromotionFacade();
		Locale					locale					= getLocale( request);
		AddPromotionConfirmView	addPromotionConfirmView = new AddPromotionConfirmView();
		int						promotionType			= 0;
		Calendar				today					= Calendar.getInstance( locale);
		
		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
			
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		promotionType = DBUtils.parseInteger( request.getParameter( "id"), 0).intValue();
		
		switch( promotionType){
			case Constant.PROMOTION_HIGHLIGHT_PROFILE_1:
				today.add( Calendar.DAY_OF_YEAR, ConfigurationParameterManager.getParameterInt( "promotion1Length"));

				addPromotionConfirmView.setPromotionType		( "1");
				addPromotionConfirmView.setPromotionCredits		( ConfigurationParameterManager.getParameterString( "promotion1Price"));
				addPromotionConfirmView.setPromotionLength		( ConfigurationParameterManager.getParameterString( "promotion1Length"));
				
				if( sellerSession.getCredits().intValue() >= ConfigurationParameterManager.getParameterInt( "promotion1Price"))
					addPromotionConfirmView.setEnoughCredits( "1");
				else 
					addPromotionConfirmView.setEnoughCredits( "0");
				
				if( ( promotionFacade.isPromotionActive( sellerSession.getId(), Constant.PROMOTION_HIGHLIGHT_PROFILE_1, locale)) ||
					( promotionFacade.isPromotionActive( sellerSession.getId(), Constant.PROMOTION_HIGHLIGHT_PROFILE_2, locale)) ||
					( promotionFacade.isPromotionActive( sellerSession.getId(), Constant.PROMOTION_HIGHLIGHT_PROFILE_3, locale)))
					addPromotionConfirmView.setPromotionAlreadyActive( "1");
				else
					addPromotionConfirmView.setPromotionAlreadyActive( "0");
				
				break;
				
			case Constant.PROMOTION_HIGHLIGHT_PROFILE_2:
				today.add( Calendar.DAY_OF_YEAR, ConfigurationParameterManager.getParameterInt( "promotion2Length"));

				addPromotionConfirmView.setPromotionType	( "2");
				addPromotionConfirmView.setPromotionCredits	( ConfigurationParameterManager.getParameterString( "promotion2Price"));
				addPromotionConfirmView.setPromotionLength	( ConfigurationParameterManager.getParameterString( "promotion2Length"));
				
				if( sellerSession.getCredits().intValue() >= ConfigurationParameterManager.getParameterInt( "promotion2Price"))
					addPromotionConfirmView.setEnoughCredits( "1");
				else 
					addPromotionConfirmView.setEnoughCredits( "0");
				
				if( ( promotionFacade.isPromotionActive( sellerSession.getId(), Constant.PROMOTION_HIGHLIGHT_PROFILE_1, locale)) ||
						( promotionFacade.isPromotionActive( sellerSession.getId(), Constant.PROMOTION_HIGHLIGHT_PROFILE_2, locale)) ||
						( promotionFacade.isPromotionActive( sellerSession.getId(), Constant.PROMOTION_HIGHLIGHT_PROFILE_3, locale)))
						addPromotionConfirmView.setPromotionAlreadyActive( "1");
					else
						addPromotionConfirmView.setPromotionAlreadyActive( "0");
				break;
			/*	
			case Constant.PROMOTION_HIGHLIGHT_PROFILE_3:
				today.add( Calendar.DAY_OF_YEAR, ConfigurationParameterManager.getParameterInt( "promotion3Length"));

				addPromotionConfirmView.setPromotionType	( "3");
				addPromotionConfirmView.setPromotionCredits	( ConfigurationParameterManager.getParameterString( "promotion3Price"));
				addPromotionConfirmView.setPromotionLength	( ConfigurationParameterManager.getParameterString( "promotion3Length"));
				
				if( sellerSession.getCredits().intValue() >= ConfigurationParameterManager.getParameterInt( "promotion3Price"))
					addPromotionConfirmView.setEnoughCredits( "1");
				else 
					addPromotionConfirmView.setEnoughCredits( "0");
				
				if( ( promotionFacade.isPromotionActive( sellerSession.getId(), Constant.PROMOTION_HIGHLIGHT_PROFILE_1, locale)) ||
						( promotionFacade.isPromotionActive( sellerSession.getId(), Constant.PROMOTION_HIGHLIGHT_PROFILE_2, locale)) ||
						( promotionFacade.isPromotionActive( sellerSession.getId(), Constant.PROMOTION_HIGHLIGHT_PROFILE_3, locale)))
						addPromotionConfirmView.setPromotionAlreadyActive( "1");
					else
						addPromotionConfirmView.setPromotionAlreadyActive( "0");
				break;
			*/	
			case Constant.PROMOTION_FIRST_PLACE_IN_SEARCH:
				today.add( Calendar.DAY_OF_YEAR, ConfigurationParameterManager.getParameterInt( "promotion4Length"));

				addPromotionConfirmView.setPromotionType	( "4");
				addPromotionConfirmView.setPromotionCredits	( ConfigurationParameterManager.getParameterString( "promotion4Price"));
				addPromotionConfirmView.setPromotionLength	( ConfigurationParameterManager.getParameterString( "promotion4Length"));
				
				if( sellerSession.getCredits().intValue() >= ConfigurationParameterManager.getParameterInt( "promotion1Price"))
					addPromotionConfirmView.setEnoughCredits( "1");
				else 
					addPromotionConfirmView.setEnoughCredits( "0");
				
				if( promotionFacade.isPromotionActive( sellerSession.getId(), 4, locale))
					addPromotionConfirmView.setPromotionAlreadyActive( "1");
				else
					addPromotionConfirmView.setPromotionAlreadyActive( "0");
				break;
				
			case Constant.PROMOTION_SHOW_IN_INDEX:
				today.add( Calendar.DAY_OF_YEAR, ConfigurationParameterManager.getParameterInt( "promotion5Length"));

				addPromotionConfirmView.setPromotionType	( "5");
				addPromotionConfirmView.setPromotionCredits	( ConfigurationParameterManager.getParameterString( "promotion5Price"));
				addPromotionConfirmView.setPromotionLength	( ConfigurationParameterManager.getParameterString( "promotion5Length"));

				if( sellerSession.getCredits().intValue() >= ConfigurationParameterManager.getParameterInt( "promotion5Price"))
					addPromotionConfirmView.setEnoughCredits( "1");
				else 
					addPromotionConfirmView.setEnoughCredits( "0");
				
				if( promotionFacade.isPromotionActive( sellerSession.getId(), 5, locale))
					addPromotionConfirmView.setPromotionAlreadyActive( "1");
				else
					addPromotionConfirmView.setPromotionAlreadyActive( "0");
				break;
				
			case Constant.PROMOTION_SHOW_IN_BULLETIN:
				today.add( Calendar.DAY_OF_YEAR, ConfigurationParameterManager.getParameterInt( "promotion6Length"));

				addPromotionConfirmView.setPromotionType	( "6");
				addPromotionConfirmView.setPromotionCredits	( ConfigurationParameterManager.getParameterString( "promotion6Price"));
				addPromotionConfirmView.setPromotionLength	( ConfigurationParameterManager.getParameterString( "promotion6Length"));
				
				if( sellerSession.getCredits().intValue() >= ConfigurationParameterManager.getParameterInt( "promotion6Price"))
					addPromotionConfirmView.setEnoughCredits( "1");
				else 
					addPromotionConfirmView.setEnoughCredits( "0");
				
				if( promotionFacade.isPromotionActive( sellerSession.getId(), 6, locale))
					addPromotionConfirmView.setPromotionAlreadyActive( "1");
				else
					addPromotionConfirmView.setPromotionAlreadyActive( "0");
				break;
				
			case Constant.PROMOTION_ALBUM:
				today.add( Calendar.DAY_OF_YEAR, ConfigurationParameterManager.getParameterInt( "promotion8Length"));

				addPromotionConfirmView.setPromotionType	( "8");
				addPromotionConfirmView.setPromotionCredits	( ConfigurationParameterManager.getParameterString( "promotion8Price"));
				addPromotionConfirmView.setPromotionLength	( ConfigurationParameterManager.getParameterString( "promotion8Length"));
				
				if( sellerSession.getCredits().intValue() >= ConfigurationParameterManager.getParameterInt( "promotion8Price"))
					addPromotionConfirmView.setEnoughCredits( "1");
				else 
					addPromotionConfirmView.setEnoughCredits( "0");
				
				if( promotionFacade.isPromotionActive( sellerSession.getId(), 8, locale))
					addPromotionConfirmView.setPromotionAlreadyActive( "1");
				else
					addPromotionConfirmView.setPromotionAlreadyActive( "0");
				break;
				
			default:
				return error( "error.couldNotAddPromotion", request, mapping);
		}
		
		addPromotionConfirmView.setEndDate				( DBUtils.getDate( today.getTime(), 4));
		addPromotionConfirmView.setEndJavaDate			( today.getTime());
		addPromotionConfirmView.setUserCredits			( DBUtils.controlNull( sellerSession.getCredits()));
		
		if( promotionType == Constant.PROMOTION_ALBUM) {
			addPromotionConfirmView.setEndDate				( ConfigurationParameterManager.getMessages().getMessage( locale, "showSellerAddPromotionConfirm.forever"));
			addPromotionConfirmView.setEndJavaDate			( DBUtils.parseDate( "01/01/2038"));
		}
		
		session.setAttribute( Constant.SELLER_ADD_PROMOTION_CONFIRM_OBJECT_NAME, addPromotionConfirmView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
