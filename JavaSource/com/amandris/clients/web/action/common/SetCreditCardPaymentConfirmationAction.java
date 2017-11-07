package com.amandris.clients.web.action.common;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.service.vo.Buyer;
import com.amandris.clients.service.vo.Seller;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.util.mail.FeeConfirmationMailObject;
import com.amandris.clients.util.mail.Mail;
import com.amandris.clients.util.mail.PaymentConfirmationMailObject;
import com.amandris.clients.util.mail.SubscriptionConfirmationMailObject;

public class SetCreditCardPaymentConfirmationAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 						session 							= request.getSession();
		Locale								locale								= getRequestLocale( request);
		SellerFacade						sellerFacade						= new SellerFacade();
		BuyerFacade							buyerFacade							= new BuyerFacade();
		String								tpvKey								= ConfigurationParameterManager.getParameterString( "tpvKey");
		String								tpvIp								= ConfigurationParameterManager.getParameterString( "tpvIp");
		PaymentConfirmationMailObject		paymentConfirmationMailObject		= new PaymentConfirmationMailObject( locale);	
		SubscriptionConfirmationMailObject	subscriptionConfirmationMailObject	= new SubscriptionConfirmationMailObject( locale);
		FeeConfirmationMailObject			feeConfirmationMailObject			= new FeeConfirmationMailObject( );
		String								subject								= "";
		Buyer								buyer								= null;
		Seller								seller								= null;
		
		String result 			= request.getParameter("result");
		String pszPurchorderNum = request.getParameter("pszPurchorderNum");
		String pszTxnDate 		= request.getParameter("pszTxnDate");
		String tipotrans 		= request.getParameter("tipotrans");
		String store 			= request.getParameter("store");
		String pszApprovalCode 	= request.getParameter("pszApprovalCode");
		String pszTxnID 		= request.getParameter("pszTxnID");
		String coderror 		= request.getParameter("coderror");
		String deserror 		= request.getParameter("deserror");
		String MAC 				= request.getParameter("MAC");
		
		String userType = pszPurchorderNum.substring( 0, 1).toLowerCase();
		String item = pszPurchorderNum.substring( 1, 3).toLowerCase();
		Integer userId = DBUtils.parseInteger( pszPurchorderNum.substring( 3, pszPurchorderNum.length()), 0);
		
		
		if( result.equalsIgnoreCase( "0") && store.equals( tpvKey) && request.getRemoteAddr().equals( tpvIp)){
			if( userType.equals( "b") && item.equals( "10")){
				buyer = buyerFacade.increaseCredits( userId, new Integer (10), Constant.CREDIT_ACTION_BUY_WITH_CREDIT_CARD, locale);
				if( buyer != null){
					paymentConfirmationMailObject.setCredits( "10");
					paymentConfirmationMailObject.setIsBuyer( true);
					paymentConfirmationMailObject.setLogin( buyer.getLogin());
					subject = ConfigurationParameterManager.getMessages().getMessage( locale, "paymentConfirmationMailObject.subject", buyer.getLogin(), "10");
					Mail.sendMail( buyer.getEmail(), subject, paymentConfirmationMailObject);
				}
			} else if( userType.equals( "s") && item.equals( "10")) {
				seller = sellerFacade.increaseCredits( userId, new Integer (10), Constant.CREDIT_ACTION_BUY_WITH_CREDIT_CARD, locale);
				if( seller != null){
					paymentConfirmationMailObject.setCredits( "10");
					paymentConfirmationMailObject.setIsBuyer( false);
					paymentConfirmationMailObject.setLogin( seller.getLogin());
					subject = ConfigurationParameterManager.getMessages().getMessage( locale, "paymentConfirmationMailObject.subject", seller.getLogin(), "10");
					Mail.sendMail( seller.getEmail(), subject, paymentConfirmationMailObject);
				}
			} else if( userType.equals( "b") && item.equals( "20")) {
				buyer = buyerFacade.increaseCredits( userId, new Integer (20), Constant.CREDIT_ACTION_BUY_WITH_CREDIT_CARD, locale);
				if( buyer != null){
					paymentConfirmationMailObject.setCredits( "20");
					paymentConfirmationMailObject.setIsBuyer( true);
					paymentConfirmationMailObject.setLogin( buyer.getLogin());
					subject = ConfigurationParameterManager.getMessages().getMessage( locale, "paymentConfirmationMailObject.subject", buyer.getLogin(), "20");
					Mail.sendMail( buyer.getEmail(), subject, paymentConfirmationMailObject);
				}
				
			} else if( userType.equals( "s") && item.equals( "20")) {
				seller = sellerFacade.increaseCredits( userId, new Integer (20), Constant.CREDIT_ACTION_BUY_WITH_CREDIT_CARD, locale);
				if( seller != null){
					paymentConfirmationMailObject.setCredits( "20");
					paymentConfirmationMailObject.setIsBuyer( false);
					paymentConfirmationMailObject.setLogin( seller.getLogin());
					subject = ConfigurationParameterManager.getMessages().getMessage( locale, "paymentConfirmationMailObject.subject", seller.getLogin(), "20");
					Mail.sendMail( seller.getEmail(), subject, paymentConfirmationMailObject);
				}
			} else if( userType.equals( "e") && item.equals( "15")) {
				seller = sellerFacade.setSubscription( userId, new Integer (3), Constant.SUBSCRIPTION_ACTION_3_MONTHS, locale);
				if( seller != null){
					subscriptionConfirmationMailObject.setMonths( "3");
					subscriptionConfirmationMailObject.setLogin( seller.getLogin());
					subject = ConfigurationParameterManager.getMessages().getMessage( locale, "subscriptionConfirmationMailObject.subject", seller.getLogin(), "3");
					Mail.sendMail( seller.getEmail(), subject, subscriptionConfirmationMailObject);
				}
			} else if( userType.equals( "e") && item.equals( "25")) {
				seller = sellerFacade.setSubscription( userId, new Integer (6), Constant.SUBSCRIPTION_ACTION_6_MONTHS, locale);
				if( seller != null){
					subscriptionConfirmationMailObject.setMonths( "6");
					subscriptionConfirmationMailObject.setLogin( seller.getLogin());
					subject = ConfigurationParameterManager.getMessages().getMessage( locale, "subscriptionConfirmationMailObject.subject", seller.getLogin(), "6");
					Mail.sendMail( seller.getEmail(), subject, subscriptionConfirmationMailObject);
				}
			} else if( userType.equals( "e") && item.equals( "40")) {
				seller = sellerFacade.setSubscription( userId, new Integer (12), Constant.SUBSCRIPTION_ACTION_12_MONTHS, locale);
				if( seller != null){
					subscriptionConfirmationMailObject.setMonths( "12");
					subscriptionConfirmationMailObject.setLogin( seller.getLogin());
					subject = ConfigurationParameterManager.getMessages().getMessage( locale, "subscriptionConfirmationMailObject.subject", seller.getLogin(), "12");
					Mail.sendMail( seller.getEmail(), subject, subscriptionConfirmationMailObject);
				}
			} else if( userType.equals( "f") && item.equals( "30")) {
					feeConfirmationMailObject.setPrice( "30");
					feeConfirmationMailObject.setPaymentMethod( "Tarjeta de crédito");
					Mail.sendMail( "reinas73@hotmail.com", "Se ha realizado un ingreso de 30 euros mediante Tarjeta de crédito", feeConfirmationMailObject);
			}
		}


		return null;

	  }
	
	
	
}		
