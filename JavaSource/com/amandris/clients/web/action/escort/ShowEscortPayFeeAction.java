package com.amandris.clients.web.action.escort;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.util.Constant;
import com.amandris.clients.web.action.common.AbstractAction;

public class ShowEscortPayFeeAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 	session = request.getSession();
		Locale			locale	= null;

		String escortSession = ( String)session.getAttribute( "escortSession");
		
		locale = getLocale( request);
		
		if( escortSession == null || !escortSession.equals( "true"))
			return ( mapping.findForward( Constant.SESSION));
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
