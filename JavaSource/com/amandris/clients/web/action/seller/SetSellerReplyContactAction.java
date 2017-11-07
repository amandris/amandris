package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.ContactFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.form.SellerReplyContactForm;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetSellerReplyContactAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		ContactFacade			contactFacade			= new ContactFacade();
		Locale					locale					= null;
		SellerReplyContactForm	sellerReplyContactForm	= null;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ( form == null) || ( form.getClass() != SellerReplyContactForm.class))
			return error( "error.couldNotReplyContact", request, mapping);
		
		sellerReplyContactForm = ( SellerReplyContactForm) form;
		
		if( contactFacade.setSellerReplyContact( sellerReplyContactForm, sellerSession.getId(), true, locale) == false)
			return error( "error.couldNotReplyContact", request, mapping);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
