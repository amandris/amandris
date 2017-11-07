package com.amandris.clients.web.action.buyer;

import java.util.Collection;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.view.CompatibilityView;
import com.amandris.clients.web.view.SellerView;
import com.amandris.clients.web.action.common.AbstractAction;

public class ShowBuyerCompatibilityAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
 		  
		HttpSession 			session 				= request.getSession();
		SellerFacade			sellerFacade			= new SellerFacade();
		Locale					locale					= getLocale( request);
		SellerView				sellerView				= null;
		CompatibilityView		compatibilityView		= new CompatibilityView();
		Collection				voteCollection			= null;
		int						compatibility			= 0;
		int						accuracy				= 100;
		int						accuracyUpdated			= 0;
		int						compatibilityUpdated	= 0;

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		
		sellerView = sellerFacade.getSellerById( DBUtils.parseInteger( request.getParameter( "id"), 0), locale);		
		
		if( sellerView == null) {
			return error( "error.sellerNotExist", request, mapping);
		}
		

		if(( buyerSession.getAge().intValue() >= DBUtils.parseInteger( sellerView.getPreferredAgeLow(), 18).intValue()) && (buyerSession.getAge().intValue() <= DBUtils.parseInteger( sellerView.getPreferredAgeHigh(), 99).intValue())) {
			compatibilityView.setAge( "1");
			compatibility += 16;
		} else {
			compatibilityView.setAge( "0");
		}

		
		if( DBUtils.parseInteger( sellerView.getPreferredSexConst(), 0).intValue() == 0) {
			compatibilityView.setSex( "2");
			compatibility += 32;
			accuracy -= 32;
		} else {
			if( buyerSession.getSexConst().intValue() == DBUtils.parseInteger( sellerView.getPreferredSexConst(), 0).intValue()) {
				compatibilityView.setSex( "1");
				compatibility += 32;
			} else
				compatibilityView.setSex( "0");
		}
		
		if( DBUtils.parseInteger( sellerView.getPreferredOrientationConst(), 0).intValue() == 0) {
			compatibilityView.setOrientation( "2");
			compatibility += 12;
			accuracy -= 12;
		} else {
			if( buyerSession.getOrientationConst().intValue() == DBUtils.parseInteger( sellerView.getPreferredOrientationConst(), 0).intValue()) {
				compatibilityView.setOrientation( "1");
				compatibility += 12;
			} else
				compatibilityView.setOrientation( "0");
		}
		
		if( DBUtils.parseInteger( sellerView.getPreferredPhysiqueConst(), 0).intValue() == 0) {
			compatibilityView.setPhysique( "2");
			compatibility += 10;
			accuracy -= 10;
		} else {
			if( buyerSession.getPhysiqueConst().intValue() == DBUtils.parseInteger( sellerView.getPreferredPhysiqueConst(), 0).intValue()) {
				compatibilityView.setPhysique( "1");
				compatibility += 10;
			} else
				compatibilityView.setPhysique( "0");
		}
		
		if( DBUtils.parseInteger( sellerView.getPreferredOriginConst(), 0).intValue() == 0) {
			compatibilityView.setOrigin( "2");
			compatibility += 4;
			accuracy -= 4;
		} else {
			if( buyerSession.getOriginConst().intValue() == DBUtils.parseInteger( sellerView.getPreferredOriginConst(), 0).intValue()) {
				compatibilityView.setOrigin( "1");
				compatibility += 4;
			} else
				compatibilityView.setOrigin( "0");
		}
		
		if( DBUtils.parseInteger( sellerView.getPreferredLanguageConst(), 0).intValue() == 0) {
			compatibilityView.setOrigin( "2");
			compatibility += 4;
			accuracy -= 4;
		} else {
			if( ( buyerSession.getLanguage1Const().intValue() == DBUtils.parseInteger( sellerView.getPreferredOriginConst(), 0).intValue()) ||
				( buyerSession.getLanguage2Const().intValue() == DBUtils.parseInteger( sellerView.getPreferredOriginConst(), 0).intValue()) ||
				( buyerSession.getLanguage3Const().intValue() == DBUtils.parseInteger( sellerView.getPreferredOriginConst(), 0).intValue())) {
				compatibilityView.setOrigin( "1");
				compatibility += 4;
			} else
				compatibilityView.setOrigin( "0");
		}
		
		if( DBUtils.parseInteger( sellerView.getPreferredSmokerConst(), 0).intValue() == 0) {
			compatibilityView.setSmoker( "2");
			compatibility += 6;
			accuracy -= 6;
		} else {
			if( buyerSession.getSmokerConst().intValue() == DBUtils.parseInteger( sellerView.getPreferredSmokerConst(), 0).intValue()) {
				compatibility += 6;
				compatibilityView.setSmoker( "1");
			} else
				compatibilityView.setSmoker( "0");
		}
		
		if( DBUtils.parseInteger( sellerView.getPreferredHeightConst(), 0).intValue() == 0) {
			compatibilityView.setHeight( "2");
			compatibility += 2;
			accuracy -= 2;
		} else {
			if( buyerSession.getHeightConst().intValue() == DBUtils.parseInteger( sellerView.getPreferredHeightConst(), 0).intValue()) {
				compatibility += 2;
				compatibilityView.setHeight( "1");
				
			} else
				compatibilityView.setHeight( "0");
		}
		//82
		if( DBUtils.parseInteger( sellerView.getPreferredEducationLevelConst(), 0).intValue() == 0) {
			compatibilityView.setEducationLevel( "2");
			compatibility += 2;
			accuracy -= 2;
		} else {
			if( buyerSession.getEducationLevelConst().intValue() == DBUtils.parseInteger( sellerView.getPreferredEducationLevelConst(), 0).intValue()) {
				compatibilityView.setEducationLevel( "1");
				compatibility += 2;
			} else
				compatibilityView.setEducationLevel( "0");
		}

		if( DBUtils.parseInteger( sellerView.getPreferredSkinColorConst(), 0).intValue() == 0) {
			compatibilityView.setSkinColor( "2");
			compatibility += 4;
			accuracy -= 4;
		} else {
			if( buyerSession.getSkinColorConst().intValue() == DBUtils.parseInteger( sellerView.getPreferredSkinColorConst(), 0).intValue()) {
				compatibilityView.setSkinColor( "1");
				compatibility += 4;
			} else
				compatibilityView.setSkinColor( "0");
		}
		
		if( DBUtils.parseInteger( sellerView.getPreferredBreastSizeConst(), 0).intValue() == 0) {
			compatibilityView.setBreastSize( "2");
			compatibility += 4;
			accuracyUpdated += 1;
			compatibilityUpdated += 1;
		} else {
			if( buyerSession.getBreastSizeConst().intValue() == DBUtils.parseInteger( sellerView.getPreferredBreastSizeConst(), 0).intValue()) {
				compatibilityView.setBreastSize( "1");
				compatibility += 4;
				compatibilityUpdated += 1;
			} else
				compatibilityView.setBreastSize( "0");
		}
		
		if( DBUtils.parseInteger( sellerView.getPreferredPennisSizeConst(), 0).intValue() == 0) {
			compatibilityView.setPennisSize( "2");
			compatibility += 4;
			accuracyUpdated += 1;
			compatibilityUpdated += 1;
		} else {
			if( buyerSession.getPennisSizeConst().intValue() == DBUtils.parseInteger( sellerView.getPreferredPennisSizeConst(), 0).intValue()) {
				compatibilityView.setPennisSize( "1");
				compatibility += 4;
				compatibilityUpdated += 1;
			} else
				compatibilityView.setPennisSize( "0");
		}

		if( accuracyUpdated == 2)
			accuracy -= 4;
		if( compatibilityUpdated == 2)
			compatibility -= 4;
		
		if( DBUtils.parseInteger( sellerView.getPreferredHairColorConst(), 0).intValue() == 0) {
			compatibilityView.setHairColor( "2");
			compatibility += 2;
			accuracy -= 2;
		} else {
			if( buyerSession.getHairColorConst().intValue() == DBUtils.parseInteger( sellerView.getPreferredHairColorConst(), 0).intValue()) {
				compatibilityView.setHairColor( "1");
				compatibility += 4;
			} else
				compatibilityView.setHairColor( "0");
		}
		
		if( DBUtils.parseInteger( sellerView.getPreferredHairLengthConst(), 0).intValue() == 0)  {
			compatibilityView.setHairLength( "2");
			compatibility += 1;
			accuracy -= 1;
		} else {
			if( buyerSession.getHairLengthConst().intValue() == DBUtils.parseInteger( sellerView.getPreferredHairLengthConst(), 0).intValue()) {
				compatibility += 1;
				compatibilityView.setHairLength( "1");
			} else
				compatibilityView.setHairLength( "0");
		}
		
		if( DBUtils.parseInteger( sellerView.getPreferredEyeColorConst(), 0).intValue() == 0) {
			compatibilityView.setEyeColor( "2");
			compatibility += 1;
			accuracy -= 1;
		} else {
			if( buyerSession.getEyeColorConst().intValue() == DBUtils.parseInteger( sellerView.getPreferredEyeColorConst(), 0).intValue()) {
				compatibilityView.setEyeColor( "1");
				compatibility += 1;
			} else
				compatibilityView.setEyeColor( "0");
		}
		
		if( compatibility > 100)
			compatibility = 100;
		
		compatibilityView.setPercentage( Integer.toString( compatibility));
		compatibilityView.setAccuracy( Integer.toString( accuracy));
		
		request.setAttribute( Constant.SELLER_OBJECT_NAME, sellerView);
		request.setAttribute( Constant.COMPATIBILITY_OBJECT_NAME, compatibilityView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
