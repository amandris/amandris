package com.amandris.clients.web.action.buyer;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.view.ContactWaysView;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowBuyerSellerContactWaysAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
 		  
		HttpSession 			session 				= request.getSession();
		SellerFacade			sellerFacade			= new SellerFacade();
		Locale					locale					= getLocale( request);
		ContactWaysView			contactWaysView			= null;

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		
		contactWaysView = sellerFacade.getSellerContactWaysByContactId( DBUtils.parseInteger( request.getParameter( "id"), 0), buyerSession, locale);		
		
		if( contactWaysView == null) {
			return error( "error.contactNotExist", request, mapping);
		}
		
		request.setAttribute( Constant.CONTACT_WAYS_OBJECT_NAME, contactWaysView);
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
