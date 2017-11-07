package com.amandris.clients.web.action.buyer;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.BuyerPasswordForm;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetBuyerPasswordAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 		session 			= request.getSession();
		Locale				locale				= getRequestLocale( request);
		BuyerFacade			buyerFacade			= new BuyerFacade();
		BuyerPasswordForm	buyerPasswordForm	= null;
		ActionErrors 		errors				= new ActionErrors();
		
		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ( form == null) || ( form.getClass() != BuyerPasswordForm.class))
			return error( "error.couldNotSetBuyerPassword", request, mapping);
		
		buyerPasswordForm = ( BuyerPasswordForm) form;

		if( ! DBUtils.digest( buyerPasswordForm.getPresentPassword()).equals( buyerSession.getPassword())){
			errors.add( "presePasswordNotValid", new ActionError( "error.presentPasswordNotValid"));
			saveErrors	( request, errors);
			saveToken	( request);
			return 		( mapping.findForward( "presentPassword"));
		}
		
		if( buyerFacade.setBuyerPassword( buyerPasswordForm, buyerSession, locale) == false)
			return error( "error.couldNotSetBuyerPassword", request, mapping);
		
		buyerSession = buyerFacade.getBuyerSessionByLoginAndPassword( buyerSession.getLogin(), DBUtils.digest( buyerPasswordForm.getPassword()), true, locale);
		
		if( buyerSession == null)
			return error( "error.couldNotSetBuyerPassword", request, mapping);
		
		session.setAttribute( Constant.BUYER_SESSION_OBJECT_NAME, buyerSession);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
	
}		
