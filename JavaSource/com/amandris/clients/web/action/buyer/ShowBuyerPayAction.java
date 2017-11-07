package com.amandris.clients.web.action.buyer;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.ContactFacade;
import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.PayForm;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.view.BuyerContactView;
import com.amandris.clients.web.view.PayView;
import com.amandris.clients.web.view.SellerView;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowBuyerPayAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 					= request.getSession();
		PayForm					payForm						= new PayForm();
		ContactFacade			contactFacade				= new ContactFacade();
		SellerFacade			sellerFacade				= new SellerFacade();
		BuyerContactView		buyerContactView			= null;
		SellerView				sellerView					= null;
		PayView					payView						= new PayView();
		Locale					locale						= null;

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		buyerContactView = contactFacade.getBuyerContactById( DBUtils.parseInteger( request.getParameter( "id"), 0), buyerSession, locale);
		
		sellerView = sellerFacade.getSellerById( DBUtils.parseInteger( buyerContactView.getSellerId(), 0), locale);
		
		if( ( buyerContactView == null) || ( sellerView == null))
			return error( "error.couldNotPay", request, mapping);
		
		if( ( sellerView.getAllowBankPayment().equals( "0")) && ( sellerView.getAllowPaypalPayment().equals( "0")))
			return error( "error.couldNotPay", request, mapping);
		
		payView.setAllowBankPayment		( sellerView.getAllowBankPayment());
		payView.setAllowPaypalPayment	( sellerView.getAllowPaypalPayment());
		payView.setBankAccount			( sellerView.getBankAccount());
		payView.setPaypalAccount		( sellerView.getPaypalAccount());
		payView.setContactId			( buyerContactView.getId());
		payView.setCurrency				( buyerContactView.getCurrency());
		payView.setPrice				( buyerContactView.getPrice());
		payView.setBuyerMadePayment		( buyerContactView.getBuyerMadePayment());
		payView.setSellerId				( sellerView.getId());
		payView.setSellerLogin			( sellerView.getLogin());
		
		payForm.setText( "");

		session.setAttribute( Constant.PAY_FORM_OBJECT_NAME, payForm);
		session.setAttribute( Constant.PAY_OBJECT_NAME, payView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
