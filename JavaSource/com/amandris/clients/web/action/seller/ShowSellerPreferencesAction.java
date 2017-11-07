package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.SellerPreferencesForm;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowSellerPreferencesAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		Locale					locale					= null;
		SellerPreferencesForm	sellerPreferencesForm	= new SellerPreferencesForm();

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		sellerPreferencesForm.setSex  			( sellerSession.getPreferredSexConst());
		sellerPreferencesForm.setAgeHigh		( DBUtils.controlNull( sellerSession.getPreferredAgeHigh()));
		sellerPreferencesForm.setAgeLow 		( DBUtils.controlNull( sellerSession.getPreferredAgeLow()));
		sellerPreferencesForm.setBreastSize  	( sellerSession.getPreferredBreastSizeConst());
		sellerPreferencesForm.setEducationLevel	( sellerSession.getPreferredEducationLevelConst());
		sellerPreferencesForm.setEyeColor		( sellerSession.getPreferredEyeColorConst());
		sellerPreferencesForm.setHairColor		( sellerSession.getPreferredHairColorConst());
		sellerPreferencesForm.setHairLength		( sellerSession.getPreferredHairLengthConst());
		sellerPreferencesForm.setHeight			( sellerSession.getPreferredHeightConst());
		sellerPreferencesForm.setLanguage		( sellerSession.getPreferredLanguageConst());
		sellerPreferencesForm.setOrientation	( sellerSession.getPreferredOrientationConst());
		sellerPreferencesForm.setOrigin			( sellerSession.getPreferredOriginConst());
		sellerPreferencesForm.setPennisSize		( sellerSession.getPreferredPennisSizeConst());
		sellerPreferencesForm.setPhysique		( sellerSession.getPreferredPhysiqueConst());
		sellerPreferencesForm.setSkinColor		( sellerSession.getPreferredSkinColorConst());
		sellerPreferencesForm.setSmoker			( sellerSession.getPreferredSmokerConst());
		sellerPreferencesForm.setText			( sellerSession.getPreferredText());
		
		session.setAttribute( Constant.SELLER_PREFERENCES_FORM_OBJECT_NAME, sellerPreferencesForm);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
