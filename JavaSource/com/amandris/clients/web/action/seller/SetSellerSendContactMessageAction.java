package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.ContactMessageFacade;
import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.form.ContactMessageForm;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetSellerSendContactMessageAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		ContactMessageFacade	contactMessageFacade	= new ContactMessageFacade();
		SellerFacade			sellerFacade			= new SellerFacade();
		Locale					locale					= null;
		ContactMessageForm		contactMessageForm		= null;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ( form == null) || ( form.getClass() != ContactMessageForm.class))
			return error( "error.couldNotSendContactMessage", request, mapping);
		
		contactMessageForm = ( ContactMessageForm) form;
		
		contactMessageFacade.setContactMessage( contactMessageForm, sellerSession.getId(), false, true, locale);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
