package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.RecommendationFacade;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.mail.Mail;
import com.amandris.clients.util.mail.RecommendationMailObject;
import com.amandris.clients.web.form.RecommendForm;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetSellerRecommendAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 				session 					= request.getSession();
		Locale						locale						= getRequestLocale( request);
		RecommendationFacade		recommendationFacade		= new RecommendationFacade();
		RecommendForm				recommendForm				= null;
		RecommendationMailObject	recommendationMailObject	= new RecommendationMailObject( locale);
		
		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ( form == null) || ( form.getClass() != RecommendForm.class))
			return error( "error.couldNotSetRecommendation", request, mapping);
		
		recommendForm = ( RecommendForm) form;
				
		if( recommendationFacade.setSellerRecommendation( recommendForm.getEmail(), recommendForm.getMessage(), sellerSession.getId(), locale) == false)
			return error( "error.couldNotSetRecommendation", request, mapping);
		
		recommendationMailObject.setMail	( recommendForm.getEmail());
		recommendationMailObject.setName	( recommendForm.getName());
		recommendationMailObject.setMessage	( recommendForm.getMessage());
		
		String text = ConfigurationParameterManager.getMessages().getMessage( locale, "recommendationMailObject.subject", recommendForm.getName());
		
		Mail.sendMail( recommendForm.getEmail(), "Tu amigo " + recommendForm.getName() + " te quiere recomendar algo", recommendationMailObject);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
	
}		
