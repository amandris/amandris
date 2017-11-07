package com.amandris.clients.web.action.seller;

import java.util.Collection;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.BuyerView;
import com.amandris.clients.web.view.CompatibilityView;
import com.amandris.clients.web.action.common.AbstractAction;

public class ShowSellerCompatibilityAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
 		  
		HttpSession 			session 				= request.getSession();
		BuyerFacade				buyerFacade				= new BuyerFacade();
		Locale					locale					= getLocale( request);
		BuyerView				buyerView				= null;
		CompatibilityView		compatibilityView		= new CompatibilityView();
		Collection				voteCollection			= null;
		int						compatibility			= 0;
		int						accuracy				= 100;
		int						accuracyUpdated			= 0;
		int						compatibilityUpdated	= 0;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		
		buyerView = buyerFacade.getBuyerById( DBUtils.parseInteger( request.getParameter( "id"), 0), Boolean.TRUE, locale);		
		
		if( buyerView == null) {
			return error( "error.buyerNotExist", request, mapping);
		}
		

		if(( sellerSession.getAge().intValue() >= DBUtils.parseInteger( buyerView.getPreferredAgeLow(), 18).intValue()) && ( sellerSession.getAge().intValue() <= DBUtils.parseInteger( buyerView.getPreferredAgeHigh(), 99).intValue())) {
			compatibilityView.setAge( "1");
			compatibility += 16;
		} else {
			compatibilityView.setAge( "0");
		}

		
		if( DBUtils.parseInteger( buyerView.getPreferredSexConst(), 0).intValue() == 0) {
			compatibilityView.setSex( "2");
			compatibility += 32;
			accuracy -= 32;
		} else {
			if( sellerSession.getSexConst().intValue() == DBUtils.parseInteger( buyerView.getPreferredSexConst(), 0).intValue()) {
				compatibilityView.setSex( "1");
				compatibility += 32;
			} else
				compatibilityView.setSex( "0");
		}
		
		if( DBUtils.parseInteger( buyerView.getPreferredOrientationConst(), 0).intValue() == 0) {
			compatibilityView.setOrientation( "2");
			compatibility += 12;
			accuracy -= 12;
		} else {
			if( sellerSession.getOrientationConst().intValue() == DBUtils.parseInteger( buyerView.getPreferredOrientationConst(), 0).intValue()) {
				compatibilityView.setOrientation( "1");
				compatibility += 12;
			} else
				compatibilityView.setOrientation( "0");
		}
		
		if( DBUtils.parseInteger( buyerView.getPreferredPhysiqueConst(), 0).intValue() == 0) {
			compatibilityView.setPhysique( "2");
			compatibility += 10;
			accuracy -= 10;
		} else {
			if( sellerSession.getPhysiqueConst().intValue() == DBUtils.parseInteger( buyerView.getPreferredPhysiqueConst(), 0).intValue()) {
				compatibilityView.setPhysique( "1");
				compatibility += 10;
			} else
				compatibilityView.setPhysique( "0");
		}
		
		if( DBUtils.parseInteger( buyerView.getPreferredOriginConst(), 0).intValue() == 0) {
			compatibilityView.setOrigin( "2");
			compatibility += 4;
			accuracy -= 4;
		} else {
			if( sellerSession.getOriginConst().intValue() == DBUtils.parseInteger( buyerView.getPreferredOriginConst(), 0).intValue()) {
				compatibilityView.setOrigin( "1");
				compatibility += 4;
			} else
				compatibilityView.setOrigin( "0");
		}
		
		if( DBUtils.parseInteger( buyerView.getPreferredLanguageConst(), 0).intValue() == 0) {
			compatibilityView.setOrigin( "2");
			compatibility += 4;
			accuracy -= 4;
		} else {
			if( ( sellerSession.getLanguage1Const().intValue() == DBUtils.parseInteger( buyerView.getPreferredOriginConst(), 0).intValue()) ||
				( sellerSession.getLanguage2Const().intValue() == DBUtils.parseInteger( buyerView.getPreferredOriginConst(), 0).intValue()) ||
				( sellerSession.getLanguage3Const().intValue() == DBUtils.parseInteger( buyerView.getPreferredOriginConst(), 0).intValue())) {
				compatibilityView.setOrigin( "1");
				compatibility += 4;
			} else
				compatibilityView.setOrigin( "0");
		}
		
		if( DBUtils.parseInteger( buyerView.getPreferredSmokerConst(), 0).intValue() == 0) {
			compatibilityView.setSmoker( "2");
			compatibility += 6;
			accuracy -= 6;
		} else {
			if( sellerSession.getSmokerConst().intValue() == DBUtils.parseInteger( buyerView.getPreferredSmokerConst(), 0).intValue()) {
				compatibility += 6;
				compatibilityView.setSmoker( "1");
			} else
				compatibilityView.setSmoker( "0");
		}
		
		if( DBUtils.parseInteger( buyerView.getPreferredHeightConst(), 0).intValue() == 0) {
			compatibilityView.setHeight( "2");
			compatibility += 2;
			accuracy -= 2;
		} else {
			if( sellerSession.getHeightConst().intValue() == DBUtils.parseInteger( buyerView.getPreferredHeightConst(), 0).intValue()) {
				compatibility += 2;
				compatibilityView.setHeight( "1");
				
			} else
				compatibilityView.setHeight( "0");
		}
		//82
		if( DBUtils.parseInteger( buyerView.getPreferredEducationLevelConst(), 0).intValue() == 0) {
			compatibilityView.setEducationLevel( "2");
			compatibility += 2;
			accuracy -= 2;
		} else {
			if( sellerSession.getEducationLevelConst().intValue() == DBUtils.parseInteger( buyerView.getPreferredEducationLevelConst(), 0).intValue()) {
				compatibilityView.setEducationLevel( "1");
				compatibility += 2;
			} else
				compatibilityView.setEducationLevel( "0");
		}

		if( DBUtils.parseInteger( buyerView.getPreferredSkinColorConst(), 0).intValue() == 0) {
			compatibilityView.setSkinColor( "2");
			compatibility += 4;
			accuracy -= 4;
		} else {
			if( sellerSession.getSkinColorConst().intValue() == DBUtils.parseInteger( buyerView.getPreferredSkinColorConst(), 0).intValue()) {
				compatibilityView.setSkinColor( "1");
				compatibility += 4;
			} else
				compatibilityView.setSkinColor( "0");
		}
		
		if( DBUtils.parseInteger( buyerView.getPreferredBreastSizeConst(), 0).intValue() == 0) {
			compatibilityView.setBreastSize( "2");
			compatibility += 4;
			accuracyUpdated += 1;
			compatibilityUpdated += 1;
		} else {
			if( sellerSession.getBreastSizeConst().intValue() == DBUtils.parseInteger( buyerView.getPreferredBreastSizeConst(), 0).intValue()) {
				compatibilityView.setBreastSize( "1");
				compatibility += 4;
				compatibilityUpdated += 1;
			} else
				compatibilityView.setBreastSize( "0");
		}
		
		if( DBUtils.parseInteger( buyerView.getPreferredPennisSizeConst(), 0).intValue() == 0) {
			compatibilityView.setPennisSize( "2");
			compatibility += 4;
			accuracyUpdated += 1;
			compatibilityUpdated += 1;
		} else {
			if( sellerSession.getPennisSizeConst().intValue() == DBUtils.parseInteger( buyerView.getPreferredPennisSizeConst(), 0).intValue()) {
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
		
		if( DBUtils.parseInteger( buyerView.getPreferredHairColorConst(), 0).intValue() == 0) {
			compatibilityView.setHairColor( "2");
			compatibility += 2;
			accuracy -= 2;
		} else {
			if( sellerSession.getHairColorConst().intValue() == DBUtils.parseInteger( buyerView.getPreferredHairColorConst(), 0).intValue()) {
				compatibilityView.setHairColor( "1");
				compatibility += 4;
			} else
				compatibilityView.setHairColor( "0");
		}
		
		if( DBUtils.parseInteger( buyerView.getPreferredHairLengthConst(), 0).intValue() == 0)  {
			compatibilityView.setHairLength( "2");
			compatibility += 1;
			accuracy -= 1;
		} else {
			if( sellerSession.getHairLengthConst().intValue() == DBUtils.parseInteger( buyerView.getPreferredHairLengthConst(), 0).intValue()) {
				compatibility += 1;
				compatibilityView.setHairLength( "1");
			} else
				compatibilityView.setHairLength( "0");
		}
		
		if( DBUtils.parseInteger( buyerView.getPreferredEyeColorConst(), 0).intValue() == 0) {
			compatibilityView.setEyeColor( "2");
			compatibility += 1;
			accuracy -= 1;
		} else {
			if( sellerSession.getEyeColorConst().intValue() == DBUtils.parseInteger( buyerView.getPreferredEyeColorConst(), 0).intValue()) {
				compatibilityView.setEyeColor( "1");
				compatibility += 1;
			} else
				compatibilityView.setEyeColor( "0");
		}
		
		if( compatibility > 100)
			compatibility = 100;
		
		compatibilityView.setPercentage( Integer.toString( compatibility));
		compatibilityView.setAccuracy( Integer.toString( accuracy));
		
		request.setAttribute( Constant.BUYER_OBJECT_NAME, buyerView);
		request.setAttribute( Constant.COMPATIBILITY_OBJECT_NAME, compatibilityView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
