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
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.Validates;
import com.amandris.clients.web.view.BuyerView;
import com.amandris.clients.web.view.SellerView;

public class ShowCheckUserNameAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
 		  
		HttpSession 			session 				= request.getSession();
		SellerFacade			sellerFacade			= new SellerFacade();
		BuyerFacade				buyerFacade				= new BuyerFacade();
		Locale					locale					= getLocale( request);
		SellerView				sellerView				= null;
		BuyerView				buyerView				= null;
		String					userName				= request.getParameter( "userName");
		String					type					= request.getParameter( "type");
		
		if ( userName == null || type == null)
			return error( "error", request, mapping);
		
		if( userName.equals("")) {
			session.setAttribute( Constant.CHECK_USER_TEXT, ConfigurationParameterManager.getMessages().getMessage( locale, "showCheckUserName.notValid", userName));
		} else if( userName.equals( ConfigurationParameterManager.getParameterString( "adminUserName"))) {
			session.setAttribute( Constant.CHECK_USER_TEXT, ConfigurationParameterManager.getMessages().getMessage( locale, "showCheckUserName.notFree", userName));
		} else{
			if( type.equals( "buyer")) {
		
				buyerView = buyerFacade.getBuyerByLogin( userName, locale);
				
				if ( ! Validates.checkChars( userName)){
					session.setAttribute( Constant.CHECK_USER_TEXT, ConfigurationParameterManager.getMessages().getMessage( locale, "showCheckUserName.notValid", userName));
				} else if( buyerView == null){
					session.setAttribute( Constant.CHECK_USER_TEXT, ConfigurationParameterManager.getMessages().getMessage( locale, "showCheckUserName.free", userName));
				} else {
					session.setAttribute( Constant.CHECK_USER_TEXT, ConfigurationParameterManager.getMessages().getMessage( locale, "showCheckUserName.notFree", userName));
				}
			} else if( type.equals( "seller")) {
				sellerView = sellerFacade.getSellerByLogin( userName, locale);
				
				if ( ! Validates.checkChars( userName)){
					session.setAttribute( Constant.CHECK_USER_TEXT, ConfigurationParameterManager.getMessages().getMessage( locale, "showCheckUserName.notValid", userName));
				} else if( sellerView == null){
					session.setAttribute( Constant.CHECK_USER_TEXT, ConfigurationParameterManager.getMessages().getMessage( locale, "showCheckUserName.free", userName));
				} else {
					session.setAttribute( Constant.CHECK_USER_TEXT, ConfigurationParameterManager.getMessages().getMessage( locale, "showCheckUserName.notFree", userName));
				}
			} else {
			return error( "error", request, mapping);
			}
		}
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
