package com.amandris.clients.web.action.seller;

import java.util.Collection;
import java.util.Iterator;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.web.form.SellerParameterForm;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.SellerView;


public class ShowSellerParameterAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 					= request.getSession();
		SellerFacade 			sellerFacade 				= new SellerFacade();
		SellerParameterForm		sellerParameterForm			= new SellerParameterForm();
		Collection				collection					= null;
		Locale					locale						= null;
		Iterator				iterator					= null;
		SellerView				sellerView					= null;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		sellerView = sellerFacade.getSellerById( sellerSession.getId(), locale);
		
		if( sellerView == null) 
			return error( "error.couldNotSetSellerParameter", request, mapping);

		sellerParameterForm.setAllowBankPayment		( DBUtils.string2Boolean( sellerView.getAllowBankPayment()));
		sellerParameterForm.setAllowEmail			( DBUtils.string2Boolean( sellerView.getAllowEmail()));
		sellerParameterForm.setAllowMessenger		( DBUtils.string2Boolean( sellerView.getAllowMessenger()));
		sellerParameterForm.setAllowPaypalPayment	( DBUtils.string2Boolean( sellerView.getAllowPaypalPayment()));
		sellerParameterForm.setAllowPhoneCall		( DBUtils.string2Boolean( sellerView.getAllowPhoneCall()));
		sellerParameterForm.setAllowUrl				( DBUtils.string2Boolean( sellerView.getAllowUrl()));
		sellerParameterForm.setAllowSkype			( DBUtils.string2Boolean( sellerView.getAllowSkype()));
		sellerParameterForm.setAllowSms				( DBUtils.string2Boolean( sellerView.getAllowSms()));
		sellerParameterForm.setAnalSex				( DBUtils.string2Boolean( sellerView.getAnalSex()));
		sellerParameterForm.setBankAccount			( sellerView.getBankAccount());
		sellerParameterForm.setBdsm					( DBUtils.string2Boolean( sellerView.getBdsm()));
		sellerParameterForm.setBuyerPaysDisplacement( DBUtils.string2Boolean( sellerView.getBuyerPaysDisplacement()));
		sellerParameterForm.setDisplacementPrize	( sellerView.getDisplacementPrize());
		sellerParameterForm.setGoogleMapsUrl		( sellerView.getGoogleMapsUrl());
		
		sellerParameterForm.setHasMeetingPlace		( DBUtils.integer2Boolean( sellerSession.getHasMeetingPlace()));
		sellerParameterForm.setInBuyerHouse			( DBUtils.string2Boolean( sellerView.getInBuyerHouse()));
		sellerParameterForm.setInCar				( DBUtils.string2Boolean( sellerView.getInCar()));
		sellerParameterForm.setInHotel				( DBUtils.string2Boolean( sellerView.getInHotel()));
		sellerParameterForm.setInSellerHouse		( DBUtils.string2Boolean( sellerView.getInSellerHouse()));
		sellerParameterForm.setMeetingAddress1		( sellerSession.getMeetingAddress1());
		sellerParameterForm.setMeetingAddress2		( sellerSession.getMeetingAddress2());
		sellerParameterForm.setMeetingCity			( sellerSession.getMeetingCity());
		sellerParameterForm.setMeetingCountry		( sellerSession.getMeetingCountry());
		sellerParameterForm.setMeetingPostalCode	( sellerSession.getMeetingPostalCode());
		sellerParameterForm.setMeetingState			( sellerSession.getMeetingState());
		sellerParameterForm.setMessengerAccount		( sellerView.getMessengerAccount());
		sellerParameterForm.setOralSex				( DBUtils.string2Boolean( sellerView.getOralSex()));
		sellerParameterForm.setPaymentBeforeDate	( DBUtils.string2Boolean( sellerView.getPaymentBeforeDate()));
		sellerParameterForm.setPaypalAccount		( sellerView.getPaypalAccount());
		sellerParameterForm.setPhoneNumberCall		( sellerView.getPhoneNumberCall());
		sellerParameterForm.setPhoneNumberSMS		( sellerView.getPhoneNumberSMS());
		sellerParameterForm.setUrl					( sellerView.getUrl());
		sellerParameterForm.setSkypeAccount			( sellerView.getSkypeAccount());
		sellerParameterForm.setAnalSex				( DBUtils.string2Boolean( sellerView.getAnalSex()));
		sellerParameterForm.setCurrencyText			( sellerView.getDefaultCurrencyText());
							
		session.setAttribute( Constant.SELLER_PARAMETER_FORM_OBJECT_NAME, sellerParameterForm);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
