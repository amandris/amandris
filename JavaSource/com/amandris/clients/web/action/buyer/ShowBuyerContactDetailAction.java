package com.amandris.clients.web.action.buyer;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.ContactFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.view.BuyerContactView;
import com.amandris.clients.web.action.common.AbstractAction;

public class ShowBuyerContactDetailAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		ContactFacade 			contactFacade 			= new ContactFacade();
		Locale					locale					= null;
		BuyerContactView		buyerContactView		= null;

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		buyerContactView = contactFacade.getBuyerContactById( DBUtils.parseInteger( request.getParameter( "id"), 0), buyerSession, locale);
		
		if( buyerContactView == null)
			return super.error( "error.contactNotExist", request, mapping);
		
		request.setAttribute( Constant.BUYER_CONTACT_DETAIL_OBJECT_NAME, buyerContactView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
