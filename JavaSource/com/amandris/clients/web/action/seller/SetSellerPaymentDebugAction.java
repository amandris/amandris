package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.form.BuyCreditsForm;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetSellerPaymentDebugAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		SellerFacade			sellerFacade			= new SellerFacade();
		Locale					locale					= null;
		BuyCreditsForm			buyCreditsForm			= null;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ( form == null) || ( form.getClass() != BuyCreditsForm.class))
			return error( "error.couldNotDoPayment", request, mapping);
		
		buyCreditsForm = ( BuyCreditsForm) form;
		
		if( sellerFacade.increaseCredits( buyCreditsForm, sellerSession, locale) == false)
			return error( "error.couldNotDoPayment", request, mapping);
		
		sellerSession = sellerFacade.getSellerSessionByLoginAndPassword( sellerSession.getLogin(), sellerSession.getPassword(), true, locale);
		
		if( sellerSession == null)
			return error( "error.couldNotSetSellerAccount", request, mapping);
		
		session.setAttribute( Constant.SELLER_SESSION_OBJECT_NAME, sellerSession);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
