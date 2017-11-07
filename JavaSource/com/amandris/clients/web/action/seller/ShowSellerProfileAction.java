package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.util.Constant;
import com.amandris.clients.web.form.SellerProfileForm;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowSellerProfileAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 		session 			= request.getSession();
		Locale				locale				= null;
		SellerProfileForm	sellerProfileForm	= new SellerProfileForm();

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		sellerProfileForm.setBreastSize  	( sellerSession.getBreastSizeConst());
		sellerProfileForm.setEducationLevel	( sellerSession.getEducationLevelConst());
		sellerProfileForm.setEyeColor		( sellerSession.getEyeColorConst());
		sellerProfileForm.setHairColor		( sellerSession.getHairColorConst());
		sellerProfileForm.setHairLength		( sellerSession.getHairLengthConst());
		sellerProfileForm.setHeight			( sellerSession.getHeightConst());
		sellerProfileForm.setIntro			( sellerSession.getIntro());
		sellerProfileForm.setLanguage1		( sellerSession.getLanguage1Const());
		sellerProfileForm.setLanguage2		( sellerSession.getLanguage2Const());
		sellerProfileForm.setLanguage3		( sellerSession.getLanguage3Const());
		sellerProfileForm.setOrientation	( sellerSession.getOrientationConst());
		sellerProfileForm.setOrigin			( sellerSession.getOriginConst());
		sellerProfileForm.setPennisSize		( sellerSession.getPennisSizeConst());
		sellerProfileForm.setPhysique		( sellerSession.getPhysiqueConst());
		sellerProfileForm.setSkinColor		( sellerSession.getSkinColorConst());
		sellerProfileForm.setSmoker			( sellerSession.getSmokerConst());
		sellerProfileForm.setText			( sellerSession.getText());
		
		session.setAttribute( Constant.SELLER_PROFILE_FORM_OBJECT_NAME, sellerProfileForm);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
