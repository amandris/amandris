package com.amandris.clients.web.action.buyer;

import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.ContactFacade;
import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.service.facade.UtilFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.util.CountryState;
import com.amandris.clients.web.view.StartContactView;
import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.web.form.StartContactForm;


public class ShowBuyerStartContactAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 			= request.getSession();
		SellerFacade 			sellerFacade 		= new SellerFacade();
		UtilFacade 				utilFacade			= UtilFacade.getInstance();
		ContactFacade			contactFacade		= new ContactFacade();
		CountryState 			countryState		= new CountryState();
		StartContactView 		startContactView	= null;
		StartContactForm		startContactForm	= new StartContactForm();
		Locale					locale				= null;
		String					startDate			= null;
		Date					startJavaDate		= null;
		Date					endJavaDate			= null;
		Date					previousStartDate	= null;

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		
		startDate = request.getParameter( "startDate");
		
		if( DBUtils.parseDate( startDate) != null) {
			startJavaDate = DBUtils.parseDate( startDate);
		} else {
			startJavaDate = DBUtils.parseDate( DBUtils.getDate( Calendar.getInstance( locale).getTime(), 1));
		}
		
		endJavaDate = new Date( startJavaDate.getTime() + 1036799000);
		previousStartDate = new Date( startJavaDate.getTime() - 950399000);
		
		startContactView = sellerFacade.getStartContactBySellerId( DBUtils.parseInteger( request.getParameter( "id"), 0), buyerSession, startJavaDate, endJavaDate, locale);
		
		if( startContactView == null)
			return error( "error.couldNotStartContact", request, mapping);
				
		if( startContactView.getHasServicesForThisUser().equals( "0"))
			return error( "error.doesNotHasServicesForThisUser", request, mapping);
				
		
		startContactView.setSellerId( request.getParameter( "id"));
		
		countryState.setSelectedCountry	( buyerSession.getCountryId());
		countryState.setSelectedState	( buyerSession.getStateId());

		countryState = ( CountryState) session.getAttribute( Constant.COUNTRY_STATE_OBJECT_NAME); 
		if( countryState == null) {
			countryState = utilFacade.getCountryState( false, locale);
		}
		countryState.setLocale	( locale);
		
		if( startContactView.getAllowOtherPlace().equals( "1"))
			startContactForm.setMeetingPlaceType( "1");
		else
			startContactForm.setMeetingPlaceType( "2");
		
		session.setAttribute( Constant.COUNTRY_STATE_OBJECT_NAME, countryState);
		session.setAttribute( Constant.BUYER_START_CONTACT_OBJECT_NAME, startContactView);
		session.setAttribute( Constant.BUYER_START_CONTACT_FORM_OBJECT_NAME, startContactForm);
		session.setAttribute( "nextStartDate", DBUtils.getDate( endJavaDate, 1));
		session.setAttribute( "previousStartDate", DBUtils.getDate( previousStartDate, 1));
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
