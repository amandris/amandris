package com.amandris.clients.web.action.buyer;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowBuyerPicturesAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 		session 			= request.getSession();
		Locale				locale				= null;
		BuyerFacade 		buyerFacade 		= new BuyerFacade();

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		buyerSession = buyerFacade.getBuyerSessionByLoginAndPassword( buyerSession.getLogin(), buyerSession.getPassword(), true, locale);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		session.setAttribute( Constant.BUYER_SESSION_OBJECT_NAME, buyerSession);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
