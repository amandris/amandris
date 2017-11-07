package com.amandris.clients.web.action.buyer;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.service.facade.ContactFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.form.CancelDateForm;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetBuyerCancelDateAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		ContactFacade			contactFacade			= new ContactFacade();
		BuyerFacade				buyerFacade				= new BuyerFacade();
		Locale					locale					= null;
		CancelDateForm			cancelDateForm			= null;

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ( form == null) || ( form.getClass() != CancelDateForm.class))
			return error( "error.couldNotCancelDate", request, mapping);
		
		cancelDateForm = ( CancelDateForm) form;
		
		if( contactFacade.cancelDate( cancelDateForm, buyerSession.getId(), false, true, locale) == false)
			return error( "error.couldNotCancelDate", request, mapping);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
