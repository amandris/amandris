package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.SellerPasswordForm;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetSellerPasswordAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 		session 			= request.getSession();
		Locale				locale				= getRequestLocale( request);
		SellerFacade		sellerFacade		= new SellerFacade();
		SellerPasswordForm	sellerPasswordForm	= null;
		ActionErrors 		errors				= new ActionErrors();
		
		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ( form == null) || ( form.getClass() != SellerPasswordForm.class))
			return error( "error.couldNotSetSellerPassword", request, mapping);
		
		sellerPasswordForm = ( SellerPasswordForm) form;

		if( ! DBUtils.digest( sellerPasswordForm.getPresentPassword()).equals( sellerSession.getPassword())){
			errors.add( "presetPasswordNotValid", new ActionError( "error.presentPasswordNotValid"));
			saveErrors	( request, errors);
			saveToken	( request);
			return 		( mapping.findForward( "presentPassword"));
		}
		
		if( sellerFacade.setSellerPassword( sellerPasswordForm, sellerSession, locale) == false)
			return error( "error.couldNotSetSellerPassword", request, mapping);
		
		sellerSession = sellerFacade.getSellerSessionByLoginAndPassword( sellerSession.getLogin(), DBUtils.digest( sellerPasswordForm.getPassword()), true, locale);
		
		if( sellerSession == null)
			return error( "error.couldNotSetSellerPassword", request, mapping);
		
		session.setAttribute( Constant.SELLER_SESSION_OBJECT_NAME, sellerSession);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
	
}		
