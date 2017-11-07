package com.amandris.clients.web.action.buyer;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.BuyerPreferencesForm;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowBuyerPreferencesAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		Locale					locale					= null;
		BuyerPreferencesForm	buyerPreferencesForm	= new BuyerPreferencesForm();

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		buyerPreferencesForm.setBreastSize  	( buyerSession.getPreferredBreastSizeConst());
		buyerPreferencesForm.setSex  			( buyerSession.getPreferredSexConst());
		buyerPreferencesForm.setAgeHigh  		( DBUtils.controlNull( buyerSession.getPreferredAgeHigh()));
		buyerPreferencesForm.setAgeLow  		( DBUtils.controlNull( buyerSession.getPreferredAgeLow()));
		buyerPreferencesForm.setEducationLevel	( buyerSession.getPreferredEducationLevelConst());
		buyerPreferencesForm.setEyeColor		( buyerSession.getPreferredEyeColorConst());
		buyerPreferencesForm.setHairColor		( buyerSession.getPreferredHairColorConst());
		buyerPreferencesForm.setHairLength		( buyerSession.getPreferredHairLengthConst());
		buyerPreferencesForm.setHeight			( buyerSession.getPreferredHeightConst());
		buyerPreferencesForm.setLanguage		( buyerSession.getPreferredLanguageConst());
		buyerPreferencesForm.setOrientation		( buyerSession.getPreferredOrientationConst());
		buyerPreferencesForm.setOrigin			( buyerSession.getPreferredOriginConst());
		buyerPreferencesForm.setPennisSize		( buyerSession.getPreferredPennisSizeConst());
		buyerPreferencesForm.setPhysique		( buyerSession.getPreferredPhysiqueConst());
		buyerPreferencesForm.setSkinColor		( buyerSession.getPreferredSkinColorConst());
		buyerPreferencesForm.setSmoker			( buyerSession.getPreferredSmokerConst());
		buyerPreferencesForm.setText			( buyerSession.getPreferredText());
		
		session.setAttribute( Constant.BUYER_PREFERENCES_FORM_OBJECT_NAME, buyerPreferencesForm);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
