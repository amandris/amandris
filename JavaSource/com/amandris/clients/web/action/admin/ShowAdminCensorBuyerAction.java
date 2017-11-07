package com.amandris.clients.web.action.admin;

import java.util.Collection;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.util.AdminSession;

public class ShowAdminCensorBuyerAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		BuyerFacade 			buyerFacade 			= new BuyerFacade();
		Locale					locale					= null;
		Collection				buyerCollection			= null;

		AdminSession adminSession = ( AdminSession)session.getAttribute( Constant.ADMIN_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( adminSession == null)
			return ( mapping.findForward( Constant.ADMIN_SESSION_FAIL));
		
		buyerCollection = buyerFacade.getBuyerToCensor();
		
		session.setAttribute( Constant.ADMIN_CENSOR_BUYER_COLLECTION_OBJECT_NAME, buyerCollection);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
