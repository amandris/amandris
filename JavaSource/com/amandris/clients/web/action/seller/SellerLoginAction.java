package com.amandris.clients.web.action.seller;

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

import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.service.facade.SellerHistoricLoginFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.web.form.LoginForm;
import com.amandris.clients.web.util.SellerSession;

public class SellerLoginAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		
		HttpSession 				session 					= request.getSession();
		SellerFacade 				sellerFacade				= new SellerFacade();
		SellerHistoricLoginFacade	sellerHistoricLoginFacade	= new SellerHistoricLoginFacade();
		Locale						locale						= getLocale( request);
		LoginForm 					loginForm 					= null;
		SellerSession 				sellerSession 				= null;
		ActionErrors 				errors						= new ActionErrors();
		Enumeration					enumeration					= null;
		Vector 						attributeNames				= new Vector();
		String						attributeName				= "";
		
		getRequestLocale( request);

		if( ( form == null) || ( form.getClass() != LoginForm.class))
			return ( mapping.findForward( Constant.FAIL));
		
		loginForm = ( LoginForm)form;
		
		sellerSession = sellerFacade.getSellerSessionByLoginAndPassword( loginForm.getLogin(), DBUtils.digest( loginForm.getPassword()), true, locale);
		
		if( sellerSession == null){
			sellerSession = sellerFacade.getSellerSessionByEmailAndPassword( loginForm.getLogin(), DBUtils.digest( loginForm.getPassword()), true, locale);
		}
		
		if( sellerSession == null) {
			errors.add( "sellerLoginError",new ActionError( "error.sellerLoginError2"));
			
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
		
		sellerHistoricLoginFacade.setSellerHistoricLogin( sellerSession.getId(), "addr:" + request.getRemoteAddr() + "  host:" + request.getRemoteHost() + "  port:" + request.getRemotePort() + "  user:" + request.getRemoteUser(), true, locale);
		
		session.setAttribute( Constant.SELLER_SESSION_OBJECT_NAME, sellerSession);
		
		sellerFacade.setSellerMaxCredits( sellerSession.getId());
		
		saveToken(request);
		
		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
