package com.amandris.clients.web.action.seller;

import java.util.Enumeration;
import java.util.Locale;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.service.facade.SellerHistoricLoginFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.action.common.AbstractAction;


public class SellerLogoffAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 				session 					= request.getSession();
		SellerSession 				sellerSession				= null;
		SellerFacade				sellerFacade				= new SellerFacade();
		SellerHistoricLoginFacade	sellerHistoricLoginFacade	= new SellerHistoricLoginFacade();
		Locale						locale						= request.getLocale();
		Vector 						attributeNames				= new Vector();
		String						attributeName				= "";
		Enumeration					enumeration					= null;
		
		sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		if( sellerSession != null) {
			session.removeAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
			
			sellerFacade.setSellerOffLine( sellerSession.getId(), locale);
			
			sellerHistoricLoginFacade.setSellerHistoricLogin( sellerSession.getId(), "addr:" + request.getRemoteAddr() + "  host:" + request.getRemoteHost() + "  port:" + request.getRemotePort() + "  user:" + request.getRemoteUser(), false, locale);
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

		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
