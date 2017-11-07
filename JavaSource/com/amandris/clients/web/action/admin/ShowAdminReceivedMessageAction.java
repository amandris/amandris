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
import com.amandris.clients.service.facade.AmandrisMessageFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.util.AdminSession;

public class ShowAdminReceivedMessageAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		AmandrisMessageFacade 	amandrisMessageFacade 	= new AmandrisMessageFacade();
		Locale					locale					= null;
		Collection				messageCollection		= null;

		AdminSession adminSession = ( AdminSession)session.getAttribute( Constant.ADMIN_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( adminSession == null)
			return ( mapping.findForward( Constant.ADMIN_SESSION_FAIL));
		
		messageCollection = amandrisMessageFacade.getAmandrisMessage( locale, null);
		
		session.setAttribute( Constant.ADMIN_AMANDRIS_MESSAGE_COLLECTION_OBJECT_NAME, messageCollection);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
