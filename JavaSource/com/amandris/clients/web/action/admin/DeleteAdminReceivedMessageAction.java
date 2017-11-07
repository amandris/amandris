package com.amandris.clients.web.action.admin;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.AmandrisMessageFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.web.util.AdminSession;

public class DeleteAdminReceivedMessageAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		AmandrisMessageFacade 	amandrisMessageFacade	= new AmandrisMessageFacade();	
		Locale					locale					= null;
		AdminSession adminSession = ( AdminSession)session.getAttribute( Constant.ADMIN_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( adminSession == null)
			return ( mapping.findForward( Constant.ADMIN_SESSION_FAIL));
		
		amandrisMessageFacade.deleteAmandrisMessageById( DBUtils.parseInteger( request.getParameter( "id"), 0), locale);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
