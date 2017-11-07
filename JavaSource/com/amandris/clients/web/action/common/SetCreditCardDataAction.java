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
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.DBUtils;

public class SetCreditCardDataAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 				session 				= request.getSession();
		Locale						locale					= getRequestLocale( request);
		SellerFacade				sellerFacade			= new SellerFacade();
		BuyerFacade					buyerFacade				= new BuyerFacade();
		String 						userId					= null;
		String						tpvKey					= ConfigurationParameterManager.getParameterString( "tpvKey");
		String						tpvIp					= ConfigurationParameterManager.getParameterString( "tpvIp");
		String						userType				= null;
		String						item					= null;
		StringBuffer 				sTemplateModule         = null;
		
		String order = request.getParameter( "order");
		String store = request.getParameter( "store");
		
		if( DBUtils.controlNull( order).equals( "") || DBUtils.controlNull( order).equals( "") || order.length() < 4 || !store.equals( tpvKey))
			return null;
		
		if( !request.getRemoteAddr().equals( tpvIp))
			return null;
		
		userType = order.substring( 0, 1).toLowerCase();
		item = order.substring( 1, 3).toLowerCase();
		userId = order.substring( 3, order.length());
		
		 try{
			 sTemplateModule = new StringBuffer();
			 
			 if( userType.equals( "b")){
				 if( item.equals( "10")) {
					 sTemplateModule.append("M978" + ConfigurationParameterManager.getParameterString( "buyercc10c") + "\r\n");
				 } else if( item.equals( "20")){
					 sTemplateModule.append("M978" + ConfigurationParameterManager.getParameterString( "buyercc20c") + "\r\n");
				 }
			 } else if( userType.equals( "s")){
				 if( item.equals( "10")) {
					 sTemplateModule.append("M978" + ConfigurationParameterManager.getParameterString( "sellercc10c") + "\r\n");
				 } else if( item.equals( "20")){
					 sTemplateModule.append("M978" + ConfigurationParameterManager.getParameterString( "sellercc20c") + "\r\n");
				 }
			 } else if( userType.equals( "e")){
				 if( item.equals( "15")) {
					 sTemplateModule.append("M978" + ConfigurationParameterManager.getParameterString( "escortcc150c") + "\r\n");
				 } else if( item.equals( "25")){
					 sTemplateModule.append("M978" + ConfigurationParameterManager.getParameterString( "escortcc250c") + "\r\n");
				 } else if( item.equals( "40")){
					 sTemplateModule.append("M978" + ConfigurationParameterManager.getParameterString( "escortcc400c") + "\r\n");
				 }
			 } else if( userType.equals( "f")){
				 if( item.equals( "30")) {
					 sTemplateModule.append("M9783000\r\n");
				 } 
			 }
			 sTemplateModule.append("1\r\n");
			 sTemplateModule.append( order + "\r\n");
			 
			 if( userType.equals( "b")){
				 if( item.equals( "10")) {
					 sTemplateModule.append("BuyerCc10c\r\n");
				 } else if( item.equals( "20")){
					 sTemplateModule.append("BuyerCc20c\r\n");
				 }
			 } else if( userType.equals( "s")){
				 if( item.equals( "10")) {
					 sTemplateModule.append("SellerCc10c\r\n");
				 } else if( item.equals( "20")){
					 sTemplateModule.append("SellerCc20c\r\n");
				 }
			 } else if( userType.equals( "e")){
				 if( item.equals( "15")) {
					 sTemplateModule.append("EscortCc15c\r\n");
				 } else if( item.equals( "25")){
					 sTemplateModule.append("EscortCc25c\r\n");
				 } else if( item.equals( "40")){
					 sTemplateModule.append("EscortCc40c\r\n");
				 }
			 } else if( userType.equals( "f")){
				 if( item.equals( "30")) {
					 sTemplateModule.append("FeeCc30c\r\n");
				 }
			 }
			 
			 sTemplateModule.append("1\r\n");
			 
			 if( userType.equals( "b")){
				 if( item.equals( "10")) {
					 sTemplateModule.append(ConfigurationParameterManager.getParameterString( "buyercc10c") + "\r\n");
				 } else if( item.equals( "20")){
					 sTemplateModule.append(ConfigurationParameterManager.getParameterString( "buyercc20c") + "\r\n");
				 }
			 } else if( userType.equals( "s")){
				 if( item.equals( "10")) {
					 sTemplateModule.append(ConfigurationParameterManager.getParameterString( "sellercc10c") + "\r\n");
				 } else if( item.equals( "20")){
					 sTemplateModule.append(ConfigurationParameterManager.getParameterString( "sellercc20c") + "\r\n");
				 }
			 } else if( userType.equals( "e")){
				 if( item.equals( "15")) {
					 sTemplateModule.append(ConfigurationParameterManager.getParameterString( "escortcc150c") + "\r\n");
				 } else if( item.equals( "25")){
					 sTemplateModule.append(ConfigurationParameterManager.getParameterString( "escortcc250c") + "\r\n");
				 } else if( item.equals( "40")){
					 sTemplateModule.append(ConfigurationParameterManager.getParameterString( "escortcc400c") + "\r\n");
				 }
			 } else if( userType.equals( "f")){
				 if( item.equals( "30")) {
					 sTemplateModule.append(ConfigurationParameterManager.getParameterString( "feecc30c") + "\r\n");
				 } 
			 }
			 
			 response.getWriter().println(sTemplateModule);
    	 }catch( Exception ex3){
    		 response.getWriter().println("");
    		 ex3.getMessage();
    	 }
		
		
		
		return null;
	}
	
	
}		
