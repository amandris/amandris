package com.amandris.clients.web.action.common;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.AmandrisMessageFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.form.AmandrisMessageForm;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetAmandrisMessageAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		Locale					locale					= null;
		AmandrisMessageForm		amandrisMessageForm		= null;
		AmandrisMessageFacade	amandrisMessageFacade	= new AmandrisMessageFacade();
		SellerSession			sellerSession			= null;
		BuyerSession			buyerSession			= null;
		int						userType				= 0;
		int						userId					= 0;

		
		locale = getLocale( request);
		
		if( ( form == null) || ( form.getClass() != AmandrisMessageForm.class))
			return error( "error.couldSendAmandrisMessage", request, mapping);
		
		amandrisMessageForm = ( AmandrisMessageForm) form;
		
		sellerSession = ( SellerSession) session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		buyerSession = ( BuyerSession) session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		if( buyerSession != null){
			userType 	= 1;
			userId 		= buyerSession.getId().intValue();
		} else if( sellerSession != null){
			userType 	= 2;
			userId 		= sellerSession.getId().intValue();
		} else {
			userType 	= 0;
			userId		= 0;
		}
		
		if( amandrisMessageFacade.setAmandrisMessage( new Integer( userId), userType, amandrisMessageForm.getEmail(), amandrisMessageForm.getSubject(), amandrisMessageForm.getText(), locale) == false)
			return error( "error.couldSendAmandrisMessage", request, mapping);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
