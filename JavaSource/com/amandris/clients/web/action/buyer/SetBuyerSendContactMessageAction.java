package com.amandris.clients.web.action.buyer;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.service.facade.ContactMessageFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.form.ContactMessageForm;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetBuyerSendContactMessageAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		ContactMessageFacade	contactMessageFacade	= new ContactMessageFacade();
		BuyerFacade				buyerFacade				= new BuyerFacade();
		Locale					locale					= null;
		ContactMessageForm		contactMessageForm		= null;

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ( form == null) || ( form.getClass() != ContactMessageForm.class))
			return error( "error.couldNotSendContactMessage", request, mapping);
		
		contactMessageForm = ( ContactMessageForm) form;
		
		contactMessageFacade.setContactMessage( contactMessageForm, buyerSession.getId(), true, true, locale);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
