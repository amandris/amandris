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
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.web.util.SellerSession;

public class ShowSellerMailActivationAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 				session 					= request.getSession();
		Locale						locale						= getRequestLocale( request);
		SellerFacade				sellerFacade				= new SellerFacade();
		SellerHistoricLoginFacade	sellerHistoricLoginFacade	= new SellerHistoricLoginFacade();
		SellerSession				sellerSession				= null;
		Enumeration					enumeration					= null;
		Vector 						attributeNames				= new Vector();
		String						attributeName				= "";

		String login 	= DBUtils.controlNull( request.getParameter( "login"));
		String code 	=  DBUtils.controlNull( request.getParameter( "code"));
		Integer id 		=  DBUtils.parseInteger( request.getParameter( "id"), 0);
		
		if( sellerFacade.activateSellerByLogin( login, code, true, locale) == false)
			return error( "error.couldNotActivateUser", request, mapping);
		
		sellerSession 	= sellerFacade.getSellerSessionBySellerId( id, locale);
		enumeration 	= session.getAttributeNames();
		
		if( sellerSession == null)
			return error( "error.couldNotActivateUser", request, mapping);
		
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
		
		sellerHistoricLoginFacade.setSellerHistoricLogin( sellerSession.getId(), "addr:" + request.getRemoteAddr() + "  host:" + request.getRemoteHost() + "  port:" + request.getRemotePort() + "  user:" + request.getRemoteUser(), true, locale);
		
		saveToken( request);
		
		return ( mapping.findForward( Constant.SUCCESS));
	  }
 
}		
