package com.amandris.clients.web.action.seller;

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
import com.amandris.clients.web.form.PayForm;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.PayView;
import com.amandris.clients.web.view.SellerContactView;
import com.amandris.clients.web.action.common.AbstractAction;

public class ShowSellerMarkAsPayAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 					= request.getSession();
		PayForm					payForm						= new PayForm();
		ContactFacade			contactFacade				= new ContactFacade();
		SellerContactView		sellerContactView			= null;
		PayView					payView						= new PayView();
		Locale					locale						= null;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		sellerContactView = contactFacade.getSellerContactById( DBUtils.parseInteger( request.getParameter( "id"), 0), sellerSession, locale);
		
		if( ( sellerContactView == null) )
			return error( "error.couldNotPay", request, mapping);
		
		if( ( sellerSession.getAllowBankPayment().intValue() == 0) && ( sellerSession.getAllowPaypalPayment().intValue() == 0))
			return error( "error.couldNotPay", request, mapping);
		
		payView.setAllowBankPayment		( DBUtils.controlNull( sellerSession.getAllowBankPayment()));
		payView.setAllowPaypalPayment	( DBUtils.controlNull( sellerSession.getAllowPaypalPayment()));
		payView.setBankAccount			( DBUtils.controlNull( sellerSession.getBankAccount()));
		payView.setPaypalAccount		( DBUtils.controlNull( sellerSession.getPaypalAccount()));
		payView.setContactId			( sellerContactView.getId());
		payView.setCurrency				( sellerContactView.getCurrency());
		payView.setPrice				( sellerContactView.getPrice());
		payView.setBuyerMadePayment		( sellerContactView.getBuyerMadePayment());
		payView.setBuyerId				( sellerContactView.getBuyerId());
		payView.setBuyerLogin			( sellerContactView.getBuyerLogin());
		
		payForm.setText( "");

		session.setAttribute( Constant.PAY_FORM_OBJECT_NAME, payForm);
		session.setAttribute( Constant.PAY_OBJECT_NAME, payView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
