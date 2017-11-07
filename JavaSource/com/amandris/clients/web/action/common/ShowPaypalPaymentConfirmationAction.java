package com.amandris.clients.web.action.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.util.SellerSession;

public class ShowPaypalPaymentConfirmationAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 				session 					= request.getSession();
		Locale						locale						= getRequestLocale( request);
		SellerFacade				sellerFacade				= new SellerFacade();
		BuyerFacade					buyerFacade					= new BuyerFacade();
		String 						paymentEmail				= ConfigurationParameterManager.getParameterString( "paymentEmail");
		String						tx							= "";
		Integer						userId						= null;		
		BuyerSession				buyerSession				= null;
		SellerSession				sellerSession				= null;
		Enumeration					enumeration					= null;
		Vector 						attributeNames				= new Vector();
		String						attributeName				= "";
		
		
		//read post from PayPal system and add 'cmd'
		Enumeration en = request.getParameterNames();
		String str = "cmd=_notify-synch";
		while(en.hasMoreElements()){
			String paramName = (String)en.nextElement();
			String paramValue = request.getParameter(paramName);
			if( paramName.equals("tx"))
				tx = paramValue;
		}
		
		
		str = str + "&tx=" +  URLEncoder.encode(tx);
		str = str + "&at=" +  URLEncoder.encode("K5a2Tzld0lSEZp95NoN5lw-o0Ox7kBmWYlDai-FiKHSfd70H5NFJUw_paoa");

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
		String line;
		HashMap hashMap = new HashMap();
		while( (line = in.readLine()) != null){
			String[] paramValue = line.split( "=");
			if( paramValue.length == 2 )
				hashMap.put( paramValue[0], paramValue[1]);
		}
		in.close();
		
		String txp 			= request.getParameter("tx");
		String st 			= request.getParameter("st");
		String amt 			= request.getParameter("amt");
		String cc 			= request.getParameter("cc");
		String itemNumber 	= request.getParameter("item_number");

		
		if( res.equals("SUCCESS")) {
			if( itemNumber.charAt( 0) == 'b'){
				userId 			= DBUtils.parseInteger( itemNumber.substring( 1), -1);
				buyerSession 	= buyerFacade.getBuyerSessionByBuyerId( userId, locale);
				enumeration 	= session.getAttributeNames();
				
				while ( enumeration.hasMoreElements()){
					attributeName = ( String) enumeration.nextElement();
					attributeNames.add( attributeName);
				}
				
				for( int i = 0; i < attributeNames.size(); i++) {
					attributeName = ( String) attributeNames.get( i);
					
					if( ! attributeName.equals( Constant.COUNTRY_STATE_OBJECT_NAME)){
						session.removeAttribute( attributeName);
					}
				}
				
				session.setAttribute( Constant.BUYER_SESSION_OBJECT_NAME, buyerSession);
				saveToken( request);
				return ( mapping.findForward( Constant.SUCCESS));
		
			} else if( itemNumber.charAt( 0) == 's' ||  itemNumber.charAt( 0) == 'e'){
				userId 			= DBUtils.parseInteger( itemNumber.substring( 1), -1);
				sellerSession 	= sellerFacade.getSellerSessionBySellerId( userId, locale);
				enumeration 	= session.getAttributeNames();
				
				while ( enumeration.hasMoreElements()){
					attributeName = ( String) enumeration.nextElement();
					attributeNames.add( attributeName);
				}
				
				for( int i = 0; i < attributeNames.size(); i++) {
					attributeName = ( String) attributeNames.get( i);
					
					if( ! attributeName.equals( Constant.COUNTRY_STATE_OBJECT_NAME)){
						session.removeAttribute( attributeName);
					}
				}
				
				session.setAttribute( Constant.SELLER_SESSION_OBJECT_NAME, sellerSession);
				saveToken( request);
				
				return ( mapping.findForward( Constant.SUCCESS));
			} else if( itemNumber.charAt( 0) == 'f'){
				
				session.setAttribute( "escortSession", "true");
				saveToken( request);
				
				return ( mapping.findForward( "escort"));
			}
		
		} else if( res.equals( "FAIL")) {
			
			return ( mapping.findForward( Constant.FAIL));
		} else {
			
			return ( mapping.findForward( Constant.FAIL));
		}

		return ( mapping.findForward( Constant.SUCCESS));

	  }
 
}		
