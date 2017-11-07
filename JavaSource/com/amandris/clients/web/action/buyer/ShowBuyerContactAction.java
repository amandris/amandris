package com.amandris.clients.web.action.buyer;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.service.facade.ContactFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.view.ContactDataView;

public class ShowBuyerContactAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		ContactFacade 			contactFacade 			= new ContactFacade();
		Locale					locale					= null;
		ContactDataView			buyerContactDataView	= null;

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		buyerContactDataView = contactFacade.getBuyerContactDataByBuyerId( buyerSession.getId(), 0, Integer.MAX_VALUE, locale);
		
		request.setAttribute( Constant.BUYER_CONTACT_DATA_OBJECT_NAME, buyerContactDataView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
