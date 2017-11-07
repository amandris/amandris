package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.UtilFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.SellerAccountForm;
import com.amandris.clients.web.util.CountryState;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class ShowSellerAccountAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 		session 			= request.getSession();
		Locale				locale				= null;
		CountryState 		countryState		= new CountryState();
		UtilFacade 			utilFacade			= UtilFacade.getInstance();
		SellerAccountForm	sellerAccountForm	= new SellerAccountForm();

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		countryState = ( CountryState) session.getAttribute( Constant.COUNTRY_STATE_OBJECT_NAME); 
		if( countryState == null) {
			countryState = utilFacade.getCountryState( false, locale);
		}
		countryState.setLocale			( locale);
		countryState.setSelectedState	( sellerSession.getStateId());
		countryState.setSelectedCountry	( sellerSession.getCountryId());

		sellerAccountForm.setAddress1	( sellerSession.getAddress1());
		sellerAccountForm.setAddress2	( sellerSession.getAddress2());
		sellerAccountForm.setBirthDate	( DBUtils.getDate( sellerSession.getBirthdate() , 1));
		sellerAccountForm.setCity		( sellerSession.getCity());
		sellerAccountForm.setCountry	( sellerSession.getCountryId());
		sellerAccountForm.setName		( sellerSession.getName());
		sellerAccountForm.setPostalCode	( sellerSession.getPostalCode());
		sellerAccountForm.setSendNews	( Boolean.valueOf( DBUtils.integer2Boolean( sellerSession.getSendNews())));
		sellerAccountForm.setSex		( sellerSession.getSexConst());
		sellerAccountForm.setState		( sellerSession.getStateId());
		sellerAccountForm.setSurname	( sellerSession.getSurname());
		
		session.setAttribute( Constant.SELLER_ACCOUNT_FORM_OBJECT_NAME, sellerAccountForm);
		
		session.setAttribute( Constant.COUNTRY_STATE_OBJECT_NAME, countryState);
				
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
