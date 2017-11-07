package com.amandris.clients.web.action.buyer;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.service.facade.ContactFacade;
import com.amandris.clients.service.vo.Contact;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.util.exception.DataUpdateErrorException;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.view.BuyerConfirmContactView;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetBuyerContactAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		BuyerConfirmContactView	buyerConfirmContactView = new BuyerConfirmContactView();
		ContactFacade			contactFacade			= new ContactFacade();
		BuyerFacade				buyerFacade				= new BuyerFacade();
		Locale					locale					= null;

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		buyerConfirmContactView = ( BuyerConfirmContactView) session.getAttribute( Constant.BUYER_CONFIRM_CONTACT_OBJECT_NAME);
		
		if( ! buyerConfirmContactView.getAllowed().equals( "1"))
			return error( "error.couldNotStartContact", request, mapping);
		
		if( buyerConfirmContactView == null)
			return error( "error.couldNotStartContact", request, mapping);
		
		
		if( buyerFacade.decreaseCredits( buyerSession.getId(), DBUtils.parseInteger( buyerConfirmContactView.getCredits(), 0), 1, locale) == false)
			return error( "error.couldNotStartContact", request, mapping);
		
		try{
			if( contactFacade.setContact( buyerConfirmContactView, buyerSession.getId(), true, locale) == false) {
				buyerFacade.increaseCredits( buyerSession.getId(), DBUtils.parseInteger( buyerConfirmContactView.getCredits(), 0));
				return error( "error.couldNotStartContact", request, mapping);
			}
		}catch ( Exception e) {
			buyerFacade.increaseCredits( buyerSession.getId(), DBUtils.parseInteger( buyerConfirmContactView.getCredits(), 0));
			throw new DataUpdateErrorException( Contact.class.getName(), this.getClass().getName() + ".setContact()", e);
		}
	
		buyerSession.setCredits( new Integer( buyerSession.getCredits().intValue() - DBUtils.parseInteger( buyerConfirmContactView.getCredits(), 0).intValue()));
		
		session.setAttribute( Constant.BUYER_SESSION_OBJECT_NAME, buyerSession);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
