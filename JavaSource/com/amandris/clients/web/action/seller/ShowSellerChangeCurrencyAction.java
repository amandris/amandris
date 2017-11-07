package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.SellerServiceFacade;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.form.ChangeCurrencyForm;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.SellerServiceView;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowSellerChangeCurrencyAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 					= request.getSession();
		SellerServiceFacade 	sellerServiceFacade 		= new SellerServiceFacade();
		ChangeCurrencyForm		changeCurrencyForm			= new ChangeCurrencyForm();
		SellerServiceView		sellerServiceView			= null;
		Locale					locale						= null;
		int						serviceType					= 1;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		sellerServiceView = sellerServiceFacade.getSellerServiceBySellerId( sellerSession.getId(), locale);
		
		if( sellerServiceView == null)
			return error( "error.couldNotChangeCurrency", request, mapping);

		
		if( ( sellerServiceView.getCurrencyConst() == null) || ( sellerServiceView.getCurrencyConst().equals( ""))){
			changeCurrencyForm.setCurrentCurrencyText	(  ConfigurationParameterManager.getMessages().getMessage( locale, "currency." + sellerSession.getDefaultCurrency()));
			changeCurrencyForm.setCurrentCurrencyConst	( sellerSession.getDefaultCurrency().toString());
		} else {
			changeCurrencyForm.setCurrentCurrencyText	( sellerServiceView.getCurrency());
			changeCurrencyForm.setCurrentCurrencyConst	( sellerServiceView.getCurrencyConst());
		}
		
		changeCurrencyForm.setCurrencyConst( changeCurrencyForm.getCurrentCurrencyConst());
		
		session.setAttribute( Constant.CHANGE_CURRENCY_FORM_OBJECT_NAME, changeCurrencyForm);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
