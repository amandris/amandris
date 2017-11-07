package com.amandris.clients.web.action.common;

import java.util.Enumeration;
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

public class ShowCreditCardPaymentConfirmationAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 				session 					= request.getSession();
		Locale						locale						= getRequestLocale( request);
		SellerFacade				sellerFacade				= new SellerFacade();
		BuyerFacade					buyerFacade					= new BuyerFacade();
		String						tpvKey						= ConfigurationParameterManager.getParameterString( "tpvKey");
		String						tpvIp						= ConfigurationParameterManager.getParameterString( "tpvIp");
		String						tpvReturnIp					= ConfigurationParameterManager.getParameterString( "tpvReturnIp");
		BuyerSession				buyerSession				= null;
		SellerSession				sellerSession				= null;
		Enumeration					enumeration					= null;
		Vector 						attributeNames				= new Vector();
		String						attributeName				= "";

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
		
		
		if( result.equals( "0") && store.equals( tpvKey) /*&& request.getRemoteAddr().equals( tpvReturnIp)*/){
		
			if( userType.equals("b")){
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
		
			} else if( userType.equals("s") || userType.equals("e")){
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
			} else if( userType.equals("f")){
				
				session.setAttribute( "escortSession", "true");
				saveToken( request);
				
				return ( mapping.findForward( "escort"));
			}
		} else {
			return ( mapping.findForward( Constant.FAIL));
		}
			
		return ( mapping.findForward( Constant.FAIL));
			

	  }
 
}		
