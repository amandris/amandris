package com.amandris.clients.web.action.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Enumeration;
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
import com.amandris.clients.web.action.common.AbstractAction;

public class SetPaypalPaymentConfirmationAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 						session 							= request.getSession();
		Locale								locale								= getRequestLocale( request);
		SellerFacade						sellerFacade						= new SellerFacade();
		BuyerFacade							buyerFacade							= new BuyerFacade();
		String 								paymentEmail						= ConfigurationParameterManager.getParameterString( "paymentEmail");
		PaymentConfirmationMailObject		paymentConfirmationMailObject		= new PaymentConfirmationMailObject( locale);
		SubscriptionConfirmationMailObject	subscriptionConfirmationMailObject	= new SubscriptionConfirmationMailObject( locale);
		FeeConfirmationMailObject			feeConfirmationMailObject			= new FeeConfirmationMailObject( );
		String								subject								= "";
		Buyer								buyer								= null;
		Seller								seller								= null;
		
		
		//read post from PayPal system and add 'cmd'
		Enumeration en = request.getParameterNames();
		String str = "cmd=_notify-validate";
		while(en.hasMoreElements()){
			String paramName = (String)en.nextElement();
			String paramValue = request.getParameter(paramName);
			str = str + "&" + paramName + "=" + URLEncoder.encode(paramValue);
		}

		//post back to PayPal system to validate
		//NOTE: change http: to https: in the following URL to verify using SSL (for increased security).
		//using HTTPS requires either Java 1.4 or greater, or Java Secure Socket Extension (JSSE)
		//and configured for older versions.
		URL u = new URL("https://www.paypal.com/cgi-bin/webscr");
		URLConnection uc = u.openConnection();
		uc.setDoOutput(true);
		uc.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
		PrintWriter pw = new PrintWriter(uc.getOutputStream());
		pw.println(str);
		pw.close();

		BufferedReader in = new BufferedReader(
		new InputStreamReader(uc.getInputStream()));
		String res = in.readLine();
		in.close();

		String itemName 		= request.getParameter("item_name");
		String itemNumber 		= request.getParameter("item_number");
		String paymentStatus 	= request.getParameter("payment_status");
		String paymentAmount 	= request.getParameter("mc_gross");
		String paymentCurrency 	= request.getParameter("mc_currency");
		String txnId 			= request.getParameter("txn_id");
		String receiverEmail 	= request.getParameter("receiver_email");
		String payerEmail 		= request.getParameter("payer_email");

		Integer userId = DBUtils.parseInteger( itemNumber.substring( 1), -1);

		
		System.out.println("---- itemName" + itemName);
		System.out.println("---- itemNumber" + itemNumber);
		System.out.println("---- paymentStatus" + paymentStatus);
		System.out.println("---- paymentAmmount" + paymentAmount);
		
		
		if( res.equals("VERIFIED")) {
			if( paymentStatus.equalsIgnoreCase( "completed") && receiverEmail.equals( paymentEmail)){
				if( itemName.equalsIgnoreCase( "buyerp10c") && paymentAmount.equals( ConfigurationParameterManager.getParameterString( "buyerp10c"))){
					buyer = buyerFacade.increaseCredits( userId, new Integer (10), Constant.CREDIT_ACTION_BUY_WITH_PAYPAL, locale);
					if( buyer != null){
						paymentConfirmationMailObject.setCredits( "10");
						paymentConfirmationMailObject.setIsBuyer( true);
						paymentConfirmationMailObject.setLogin( buyer.getLogin());
						subject = ConfigurationParameterManager.getMessages().getMessage( locale, "paymentConfirmationMailObject.subject", buyer.getLogin(), "10");
						Mail.sendMail( buyer.getEmail(), subject, paymentConfirmationMailObject);
					}
				} else if( itemName.equalsIgnoreCase( "sellerp10c") && paymentAmount.equals( ConfigurationParameterManager.getParameterString( "sellerp10c"))) {
					seller = sellerFacade.increaseCredits( userId, new Integer (10), Constant.CREDIT_ACTION_BUY_WITH_PAYPAL, locale);
					if( seller != null){
						paymentConfirmationMailObject.setCredits( "10");
						paymentConfirmationMailObject.setIsBuyer( false);
						paymentConfirmationMailObject.setLogin( seller.getLogin());
						subject = ConfigurationParameterManager.getMessages().getMessage( locale, "paymentConfirmationMailObject.subject", seller.getLogin(), "10");
						Mail.sendMail( seller.getEmail(), subject, paymentConfirmationMailObject);
					}
				} else if( itemName.equalsIgnoreCase( "buyerp20c") && paymentAmount.equals( ConfigurationParameterManager.getParameterString( "buyerp20c"))) {
					buyer = buyerFacade.increaseCredits( userId, new Integer (20), Constant.CREDIT_ACTION_BUY_WITH_PAYPAL, locale);
					if( buyer != null){
						paymentConfirmationMailObject.setCredits( "20");
						paymentConfirmationMailObject.setIsBuyer( true);
						paymentConfirmationMailObject.setLogin( buyer.getLogin());
						subject = ConfigurationParameterManager.getMessages().getMessage( locale, "paymentConfirmationMailObject.subject", buyer.getLogin(), "20");
						Mail.sendMail( buyer.getEmail(), subject, paymentConfirmationMailObject);
					}
				} else if( itemName.equalsIgnoreCase( "sellerp20c") && paymentAmount.equals( ConfigurationParameterManager.getParameterString( "sellerp20c"))) {
					seller = sellerFacade.increaseCredits( userId, new Integer (20), Constant.CREDIT_ACTION_BUY_WITH_PAYPAL, locale);
					if( seller != null){
						paymentConfirmationMailObject.setCredits( "20");
						paymentConfirmationMailObject.setIsBuyer( false);
						paymentConfirmationMailObject.setLogin( seller.getLogin());
						subject = ConfigurationParameterManager.getMessages().getMessage( locale, "paymentConfirmationMailObject.subject", seller.getLogin(), "20");
						Mail.sendMail( seller.getEmail(), subject, paymentConfirmationMailObject);
					}
				} else if( itemName.equalsIgnoreCase( "escortp150c") && paymentAmount.equals( ConfigurationParameterManager.getParameterString( "escortp150c"))) {
					seller = sellerFacade.setSubscription( userId, new Integer (3), Constant.SUBSCRIPTION_ACTION_3_MONTHS, locale);
					if( seller != null){
						subscriptionConfirmationMailObject.setMonths( "3");
						subscriptionConfirmationMailObject.setLogin( seller.getLogin());
						subject = ConfigurationParameterManager.getMessages().getMessage( locale, "subscriptionConfirmationMailObject.subject", seller.getLogin(), "3");
						Mail.sendMail( seller.getEmail(), subject, subscriptionConfirmationMailObject);
					}
				} else if( itemName.equalsIgnoreCase( "escortp250c") && paymentAmount.equals( ConfigurationParameterManager.getParameterString( "escortp250c"))) {
					seller = sellerFacade.setSubscription( userId, new Integer (6), Constant.SUBSCRIPTION_ACTION_6_MONTHS, locale);
					if( seller != null){
						subscriptionConfirmationMailObject.setMonths( "6");
						subscriptionConfirmationMailObject.setLogin( seller.getLogin());
						subject = ConfigurationParameterManager.getMessages().getMessage( locale, "subscriptionConfirmationMailObject.subject", seller.getLogin(), "6");
						Mail.sendMail( seller.getEmail(), subject, subscriptionConfirmationMailObject);
					}
				} else if( itemName.equalsIgnoreCase( "escortp400c") && paymentAmount.equals( ConfigurationParameterManager.getParameterString( "escortp400c"))) {
					seller = sellerFacade.setSubscription( userId, new Integer (12), Constant.SUBSCRIPTION_ACTION_12_MONTHS, locale);
					if( seller != null){
						subscriptionConfirmationMailObject.setMonths( "12");
						subscriptionConfirmationMailObject.setLogin( seller.getLogin());
						subject = ConfigurationParameterManager.getMessages().getMessage( locale, "subscriptionConfirmationMailObject.subject", seller.getLogin(), "12");
						Mail.sendMail( seller.getEmail(), subject, subscriptionConfirmationMailObject);
					}
				} else if( itemName.equalsIgnoreCase( "feep30c") && paymentAmount.equals( "30.00")) {
					System.out.println("---Entra por fee30");
					feeConfirmationMailObject.setPrice( "30.00");
					feeConfirmationMailObject.setPaymentMethod( "Paypal");
					Mail.sendMail( "reinas73@hotmail.com", "Se ha realizado un ingreso de 30 euros mediante Paypal", feeConfirmationMailObject);
				}
				
				
			}
		} else if( res.equals( "INVALID")) {} 

		return null;

	  }
	
	
	
}		
