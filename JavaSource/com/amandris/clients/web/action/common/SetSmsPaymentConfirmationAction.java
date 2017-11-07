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
import com.amandris.clients.util.mail.Mail;
import com.amandris.clients.util.mail.PaymentConfirmationMailObject;

public class SetSmsPaymentConfirmationAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 					session 						= request.getSession();
		Locale							locale							= getRequestLocale( request);
		SellerFacade					sellerFacade					= new SellerFacade();
		BuyerFacade						buyerFacade						= new BuyerFacade();
		Integer 						userId							= null;
		String							rightKey						= ConfigurationParameterManager.getParameterString( "smsKey");
		String							sepomoIp						= ConfigurationParameterManager.getParameterString( "sepomoIp");
		PaymentConfirmationMailObject	paymentConfirmationMailObject	= new PaymentConfirmationMailObject( locale);	
		String							subject							= "";
		Buyer							buyer							= null;
		Seller							seller							= null;
		
		String id = request.getParameter( "id").toLowerCase();
		String key = request.getParameter( "key");
		
		
		System.out.println(" id = " + id);
		System.out.println(" key = " + key);
		System.out.println(" remoteAddress = " + request.getRemoteAddr());
		
		if( DBUtils.controlNull( id).equals( "") || DBUtils.controlNull( key).equals( "") || id.length() < 2 || !key.equals( rightKey))
			return null;
		
		if( !request.getRemoteAddr().equals( sepomoIp))
			return null;
		
		if( id.length() > 1 && id.charAt( 0 ) == 'b'){
			userId 	= DBUtils.parseInteger( id.substring( 1), -1);
			buyer = buyerFacade.increaseCredits( userId, new Integer (1), Constant.CREDIT_ACTION_BUY_WITH_SMS, locale);
			if( buyer != null){
				paymentConfirmationMailObject.setIsBuyer( true);
				paymentConfirmationMailObject.setLogin( buyer.getLogin());
				paymentConfirmationMailObject.setCredits( "1");
				subject = ConfigurationParameterManager.getMessages().getMessage( locale, "paymentConfirmationMailObject.subject", buyer.getLogin(), "1");
				Mail.sendMail( buyer.getEmail(), subject, paymentConfirmationMailObject);
			}
		} else if( id.charAt( 0 ) == 's') {
			userId 	= DBUtils.parseInteger( id.substring( 1), -1);
			seller = sellerFacade.increaseCredits( userId, new Integer (1), Constant.CREDIT_ACTION_BUY_WITH_SMS, locale);
			if( seller != null){
				paymentConfirmationMailObject.setIsBuyer( false);
				paymentConfirmationMailObject.setLogin( seller.getLogin());
				paymentConfirmationMailObject.setCredits( "1");
				subject = ConfigurationParameterManager.getMessages().getMessage( locale, "paymentConfirmationMailObject.subject", seller.getLogin(), "1");
				Mail.sendMail( seller.getEmail(), subject, paymentConfirmationMailObject);
			}
		}
		
		return null;
	}
	
	
}		
