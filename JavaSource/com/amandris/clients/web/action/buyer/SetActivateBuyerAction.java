package com.amandris.clients.web.action.buyer;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.service.facade.RecommendationFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetActivateBuyerAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 					= request.getSession();
		BuyerFacade 			buyerFacade 				= new BuyerFacade();
		RecommendationFacade	recommendationFacade		= new RecommendationFacade();
		Locale					locale						= getLocale( request);

		if( buyerFacade.activateBuyerByLogin( DBUtils.controlNull( request.getParameter( "user")), DBUtils.controlNull( request.getParameter( "code")), true, locale) == false)
				return error( "error.couldNotActivateUser", request, mapping);
				
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
