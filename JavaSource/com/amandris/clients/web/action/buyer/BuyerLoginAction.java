package com.amandris.clients.web.action.buyer;

import java.util.Enumeration;
import java.util.Locale;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.service.facade.BuyerHistoricLoginFacade;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.web.form.LoginForm;
import com.amandris.clients.web.util.BuyerSession;

public class BuyerLoginAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		
		HttpSession			 		session 					= request.getSession();
		BuyerFacade 				buyerFacade					= new BuyerFacade();
		BuyerHistoricLoginFacade	buyerHistoricLoginFacade	= new BuyerHistoricLoginFacade();
		Locale						locale						= getLocale( request);
		LoginForm 					loginForm 					= null;
		ActionErrors 				errors						= new ActionErrors();
		BuyerSession 				buyerSession 				= null;
		Enumeration					enumeration					= null;
		Vector 						attributeNames				= new Vector();
		String						attributeName				= "";
		
		getRequestLocale( request);

		if( ( form == null) || ( form.getClass() != LoginForm.class))
			return ( mapping.findForward( Constant.FAIL));
		
		loginForm = ( LoginForm)form;
		
		if( loginForm.getLogin().equals( ConfigurationParameterManager.getParameterString( "adminUserName")) && 
			loginForm.getPassword().equals( ConfigurationParameterManager.getParameterString( "adminPassword"))) {
			
			
			int number1 = ( int) Math.round( Math.random() * 11);
			int number2 = ( int) Math.round( Math.random() * 11);
			int number3 = ( int) Math.round( Math.random() * 11);
			String adminPasswordLetters = Integer.toString( number1) + Integer.toString( number2) + Integer.toString( number3);
			LoginForm adminLoginForm = new LoginForm();
			
			adminLoginForm.setLogin( adminPasswordLetters.substring(0, 3));
			
			session.setAttribute( Constant.ADMIN_LOGIN_FORM_OBJECT_NAME, adminLoginForm);
			
			saveToken( request);
			
			return ( mapping.findForward( "admin"));
		}
		
		if( loginForm.getLogin().equals( ConfigurationParameterManager.getParameterString( "escortUserName")) && 
			loginForm.getPassword().equals( ConfigurationParameterManager.getParameterString( "escortPassword"))) {
		
			session.setAttribute( "escortSession", "true");
		
			saveToken( request);
			
			return ( mapping.findForward( "escort"));
		}
		
		
		buyerSession = buyerFacade.getBuyerSessionByLoginAndPassword( loginForm.getLogin(), DBUtils.digest( loginForm.getPassword()), true, locale);
		
		if( buyerSession == null){
			buyerSession = buyerFacade.getBuyerSessionByEmailAndPassword( loginForm.getLogin(), DBUtils.digest( loginForm.getPassword()), true, locale);
		}
		
		if( buyerSession == null) {
			errors.add( "buyerLoginError",new ActionError( "error.buyerLoginError2"));
			
			saveErrors	( request, errors);
			saveToken	( request);
			return 		( mapping.findForward( Constant.FAIL));
			
		}
		
		enumeration = session.getAttributeNames();
		
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
		
		buyerHistoricLoginFacade.setBuyerHistoricLogin( buyerSession.getId(), "addr:" + request.getRemoteAddr() + "  host:" + request.getRemoteHost() + "  port:" + request.getRemotePort() + "  user:" + request.getRemoteUser(), true, locale);
		
		buyerFacade.setBuyerMaxCredits( buyerSession.getId());
		
		session.setAttribute( Constant.BUYER_SESSION_OBJECT_NAME, buyerSession);
		
		saveToken( request);
		
		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
