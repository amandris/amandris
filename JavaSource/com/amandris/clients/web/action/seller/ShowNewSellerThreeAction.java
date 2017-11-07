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
import com.amandris.clients.web.form.NewSellerForm;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowNewSellerThreeAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 		session 		= request.getSession();
		Locale				locale			= getRequestLocale( request);
		SellerFacade		sellerFacade	= new SellerFacade();
		NewSellerForm		newSellerForm	= null;
		
		if( ( form == null) || ( form.getClass() != NewSellerForm.class))
			return error( "error.couldNotSetNewSeller", request, mapping);
		
		newSellerForm = ( NewSellerForm) form;
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
