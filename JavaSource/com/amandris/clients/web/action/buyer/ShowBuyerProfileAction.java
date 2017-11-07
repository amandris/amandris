package com.amandris.clients.web.action.buyer;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.util.Constant;
import com.amandris.clients.web.form.BuyerProfileForm;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowBuyerProfileAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 		session 			= request.getSession();
		Locale				locale				= null;
		BuyerProfileForm	buyerProfileForm	= new BuyerProfileForm();

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		buyerProfileForm.setBreastSize  	( buyerSession.getBreastSizeConst());
		buyerProfileForm.setEducationLevel	( buyerSession.getEducationLevelConst());
		buyerProfileForm.setEyeColor		( buyerSession.getEyeColorConst());
		buyerProfileForm.setHairColor		( buyerSession.getHairColorConst());
		buyerProfileForm.setHairLength		( buyerSession.getHairLengthConst());
		buyerProfileForm.setHeight			( buyerSession.getHeightConst());
		buyerProfileForm.setIntro			( buyerSession.getIntro());
		buyerProfileForm.setLanguage1		( buyerSession.getLanguage1Const());
		buyerProfileForm.setLanguage2		( buyerSession.getLanguage2Const());
		buyerProfileForm.setLanguage3		( buyerSession.getLanguage3Const());
		buyerProfileForm.setOrientation		( buyerSession.getOrientationConst());
		buyerProfileForm.setOrigin			( buyerSession.getOriginConst());
		buyerProfileForm.setPennisSize		( buyerSession.getPennisSizeConst());
		buyerProfileForm.setPhysique		( buyerSession.getPhysiqueConst());
		buyerProfileForm.setSkinColor		( buyerSession.getSkinColorConst());
		buyerProfileForm.setSmoker			( buyerSession.getSmokerConst());
		buyerProfileForm.setText			( buyerSession.getText());
		
		session.setAttribute( Constant.BUYER_PROFILE_FORM_OBJECT_NAME, buyerProfileForm);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
