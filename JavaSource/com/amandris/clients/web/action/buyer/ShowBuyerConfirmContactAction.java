package com.amandris.clients.web.action.buyer;

import java.util.GregorianCalendar;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.InvitationFacade;
import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.service.facade.SellerServiceFacade;
import com.amandris.clients.service.facade.CalendarFacade;
import com.amandris.clients.service.facade.UtilFacade;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.StartContactForm;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.util.Price;
import com.amandris.clients.web.view.BuyerConfirmContactView;
import com.amandris.clients.web.view.InvitationView;
import com.amandris.clients.web.view.SellerView;
import com.amandris.clients.web.action.common.AbstractAction;

public class ShowBuyerConfirmContactAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		StartContactForm		startContactForm		= new StartContactForm();
		BuyerConfirmContactView	buyerConfirmContactView = new BuyerConfirmContactView();
		SellerServiceFacade		sellerServiceFacade		= new SellerServiceFacade();
		UtilFacade				utilFacade				= UtilFacade.getInstance();
		SellerFacade			sellerFacade			= new SellerFacade();
		CalendarFacade			calendarFacade			= new CalendarFacade();
		InvitationFacade		invitationFacade		= new InvitationFacade();
		SellerView				sellerView				= null;
		InvitationView			invitationView			= null;
		GregorianCalendar 		selectedDate 			= null; 
		Price					price					= null;
		Locale					locale					= null;
		int						length					= 0;
		double					finalPrice				= 0;

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ( form == null) || ( form.getClass() != StartContactForm.class))
			return error( "error.couldNotStartContact", request, mapping);
		
		startContactForm = ( StartContactForm) form;
		
		length = DBUtils.parseInteger( startContactForm.getLength(), 0).intValue();
		
		if( length == 0)
			return error( "error.confirmContactLength", Integer.toString( length), startContactForm.getLength(), request, mapping);
		
		sellerView 	= sellerFacade.getSellerById( DBUtils.parseInteger( startContactForm.getSellerId(), 0), locale);	
		
		if( sellerView == null)
			return error( "error.couldNotStartContact", request, mapping);
		
		price = sellerServiceFacade.getSellerServicePrice( DBUtils.parseInteger( startContactForm.getSellerId(), 0), DBUtils.parseInteger( startContactForm.getServiceType() , 0), buyerSession.getSexConst()); 
		
		if( price == null)
			return error( "error.couldNotStartContact", request, mapping);
		
		selectedDate = new GregorianCalendar( );
		selectedDate.setTime( DBUtils.parseDate( startContactForm.getDate()));
		selectedDate.set( GregorianCalendar.HOUR, DBUtils.parseInteger( startContactForm.getHour().substring(0, 2), 0).intValue());
		
		if( calendarFacade.isFreeHours( DBUtils.parseInteger( startContactForm.getSellerId(), 0), selectedDate.getTime(), length, locale) == false)
			return error( "error.confirmContactLength", Integer.toString( length), request, mapping);
		
		if( length == 1)
			finalPrice = price.getFirstHourPrice();
		else {
			finalPrice = price.getFirstHourPrice();
			finalPrice = finalPrice + ( ( length - 1) * price.getAdditionalHoursPrice());
		}
		
		if( startContactForm.getMeetingPlaceType().equals( "1")) {
			buyerConfirmContactView.setAddress1	( sellerView.getAddress1());
			buyerConfirmContactView.setAddress2	( sellerView.getAddress2());
			buyerConfirmContactView.setCity		( sellerView.getCity());
			buyerConfirmContactView.setCountry	( sellerView.getCountry());
			buyerConfirmContactView.setCountryId( sellerView.getCountryId());
			buyerConfirmContactView.setState	( sellerView.getState());
			buyerConfirmContactView.setStateId	( sellerView.getStateId());
		} else {
			String countryText = utilFacade.getCountryById( startContactForm.getCountry()).getText();
			String stateText = utilFacade.getStateById( startContactForm.getState()).getText();
			
			buyerConfirmContactView.setAddress1			( startContactForm.getAddress1());
			buyerConfirmContactView.setAddress2			( startContactForm.getAddress2());
			buyerConfirmContactView.setCity				( startContactForm.getCity());
			buyerConfirmContactView.setCountryId		( startContactForm.getCountry());
			buyerConfirmContactView.setStateId			( startContactForm.getState());
			buyerConfirmContactView.setCountry			( countryText);
			buyerConfirmContactView.setState			( stateText);
			
			if( sellerView.getBuyerPaysDisplacement().equals( "1")) {
				finalPrice = finalPrice + sellerView.getDisplacementPrizeDouble().doubleValue();
			}
		}
		
		buyerConfirmContactView.setPaymentBeforeDate( sellerView.getPaymentBeforeDate());
		buyerConfirmContactView.setDate				( startContactForm.getDate());
		buyerConfirmContactView.setLongDate			( DBUtils.getDate( DBUtils.parseDate( startContactForm.getDate()), 4));
		buyerConfirmContactView.setJavaDate			( selectedDate.getTime());
		buyerConfirmContactView.setHour				( startContactForm.getHour().substring(0, 2) + ":00");
		buyerConfirmContactView.setLength			( startContactForm.getLength());
		buyerConfirmContactView.setMeetingPlaceType	( startContactForm.getMeetingPlaceType());
		buyerConfirmContactView.setPrice			( DBUtils.controlNull( new Double( finalPrice)));
		buyerConfirmContactView.setCurrency			( ConfigurationParameterManager.getMessages().getMessage( locale, "currency." + price.getCurrency()));
		buyerConfirmContactView.setCurrencyConst	( Integer.toString( price.getCurrency()));
		buyerConfirmContactView.setPriceDouble		( new Double( finalPrice));
		buyerConfirmContactView.setServiceTypeConst	( startContactForm.getServiceType());
		buyerConfirmContactView.setServiceTypeText	( ConfigurationParameterManager.getMessages().getMessage( locale, "service." + startContactForm.getServiceType()));
		buyerConfirmContactView.setText				( startContactForm.getText());
		buyerConfirmContactView.setSellerLogin		( sellerView.getLogin());
		buyerConfirmContactView.setSellerId			( sellerView.getId());
		buyerConfirmContactView.setUserCredits		( DBUtils.controlNull( buyerSession.getCredits()));
		
		if( sellerView.getFreeContacts().equals( "1")) {
			buyerConfirmContactView.setCredits( "0");
			buyerConfirmContactView.setUsingInvitationFreeContact	( "0");
		} else {
			invitationView = invitationFacade.getFreeContactInvitationByBuyerIdAndSellerId( buyerSession.getId(), DBUtils.parseInteger( sellerView.getId(), 0), locale);
			
			if( invitationView == null){
				buyerConfirmContactView.setCredits						( ConfigurationParameterManager.getParameterString( "creditsPerContact"));
				buyerConfirmContactView.setUsingInvitationFreeContact	( "0");
			} else {
				buyerConfirmContactView.setCredits						( "0");
				buyerConfirmContactView.setUsingInvitationFreeContact	( "1");
				buyerConfirmContactView.setInvitationId					( invitationView.getId());
			}
		}
		
		if( finalPrice == 0)
			buyerConfirmContactView.setIsFree( "1");
		else
			buyerConfirmContactView.setIsFree( "0");
		
		if( DBUtils.parseInteger( buyerConfirmContactView.getCredits(), 0).intValue() > buyerSession.getCredits().intValue())
			buyerConfirmContactView.setAllowed( "0");
		else
			buyerConfirmContactView.setAllowed( "1");
		
		session.setAttribute( Constant.BUYER_CONFIRM_CONTACT_OBJECT_NAME, buyerConfirmContactView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
