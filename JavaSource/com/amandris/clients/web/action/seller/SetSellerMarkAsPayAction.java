package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.ContactFacade;
import com.amandris.clients.service.facade.ContactMessageFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.PayForm;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.PayView;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetSellerMarkAsPayAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		ContactMessageFacade	contactMessageFacade	= new ContactMessageFacade();
		ContactFacade			contactFacade			= new ContactFacade();
		Locale					locale					= getLocale( request);
		PayForm					payForm					= null;
		PayView					payView					= null;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		payView = ( PayView) session.getAttribute( Constant.PAY_OBJECT_NAME); 
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( payView == null)
			return error( "error.couldNotPay", request, mapping);
		
		if( ( form == null) || ( form.getClass() != PayForm.class))
			return error( "error.couldNotPay", request, mapping);
		
		payForm = ( PayForm) form;
		
		if( contactFacade.setSellerMarkAsPay( DBUtils.parseInteger( payView.getContactId(), 0), sellerSession.getId(), locale) == false)
			return error( "error.couldNotPay", request, mapping);
		
		if( payForm.getText().length() > 0) {
			if( contactMessageFacade.setContactMessageToBuyer( DBUtils.parseInteger( payView.getContactId(), 0), sellerSession.getId(), payForm.getText(), locale) == false)
				return error( "error.couldNotPay", request, mapping);
		}
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
