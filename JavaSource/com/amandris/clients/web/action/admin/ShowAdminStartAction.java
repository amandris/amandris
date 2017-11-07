package com.amandris.clients.web.action.admin;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.ContactFacade;
import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.util.AdminSession;
import com.amandris.clients.web.view.ContactDataView;
import com.amandris.clients.web.view.SellerStartView;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowAdminStartAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		SellerFacade 			sellerFacade 			= new SellerFacade();
		ContactFacade			contactFacade			= new ContactFacade();
		SellerStartView 		sellerStartView			= null;
		ContactDataView			sellerContactDataView	= null;
		Locale					locale					= null;

		AdminSession adminSession = ( AdminSession)session.getAttribute( Constant.ADMIN_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( adminSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
