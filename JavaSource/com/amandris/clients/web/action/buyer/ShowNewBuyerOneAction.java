package com.amandris.clients.web.action.buyer;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.UtilFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.util.CountryState;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowNewBuyerOneAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 		session 				= request.getSession();
		Locale				locale					= getRequestLocale( request);
		CountryState 		countryState			= new CountryState();
		UtilFacade 			utilFacade				= UtilFacade.getInstance();
		
		countryState = ( CountryState) session.getAttribute( Constant.COUNTRY_STATE_OBJECT_NAME); 
		if( countryState == null) {
			countryState = utilFacade.getCountryState( false, locale);
		}
		countryState.setLocale	( locale);

		session.setAttribute( Constant.COUNTRY_STATE_OBJECT_NAME, countryState);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
