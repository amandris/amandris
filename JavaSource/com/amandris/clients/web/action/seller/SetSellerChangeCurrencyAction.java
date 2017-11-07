package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.SellerServiceFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.form.ChangeCurrencyForm;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetSellerChangeCurrencyAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		Locale					locale					= null;
		ChangeCurrencyForm		changeCurrencyForm		= null;
		SellerServiceFacade		serviceFacade			= new SellerServiceFacade();

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ( form == null) || ( form.getClass() != ChangeCurrencyForm.class))
			return error( "error.couldNotChangeCurrency", request, mapping);
		
		changeCurrencyForm = ( ChangeCurrencyForm) form;
			
		if( serviceFacade.changeCurrency( changeCurrencyForm, sellerSession, locale) == false)
			return error( "error.couldNotChangeCurrency", request, mapping);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
