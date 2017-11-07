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
import com.amandris.clients.web.form.AddServiceForm;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.SellerServiceView;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowSellerAddServiceAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 					= request.getSession();
		SellerServiceFacade 	sellerServiceFacade 		= new SellerServiceFacade();
		AddServiceForm			addServiceForm				= new AddServiceForm();
		SellerServiceView		sellerServiceView			= null;
		Locale					locale						= null;
		int						serviceType					= 1;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		sellerServiceView = sellerServiceFacade.getSellerServiceBySellerId( sellerSession.getId(), locale);
		
		if( sellerServiceView == null)
			return error( "error.couldNotAddService", request, mapping);

		
		if( ( sellerServiceView.getCurrencyConst() == null) || ( sellerServiceView.getCurrencyConst().equals( ""))){
			addServiceForm.setCurrency		(  ConfigurationParameterManager.getMessages().getMessage( locale, "currency." + sellerSession.getDefaultCurrency()));
			addServiceForm.setCurrencyConst	( Integer.toString( sellerSession.getDefaultCurrency().intValue()));
		} else {
			addServiceForm.setCurrency		( sellerServiceView.getCurrency());
			addServiceForm.setCurrencyConst	( sellerServiceView.getCurrencyConst());
		}
		
		if( !sellerServiceView.getCompanyWithoutSexSex().equals( "")){
			addServiceForm.setCompanyWithoutSexEnabled( "0");
			serviceType = 2;
		}
		
		if( !sellerServiceView.getCompanyWithSexSex().equals( "")){
			addServiceForm.setCompanyWithSexEnabled( "0");
			
			if( serviceType == 2)
				serviceType = 4;
		}
		
		if( !sellerServiceView.getSexSex().equals( "")){
			addServiceForm.setSexEnabled( "0");
			if( serviceType == 4)
				serviceType = 8;
		}
		
		if( !sellerServiceView.getEroticShowSex().equals( "")){
			addServiceForm.setEroticShowEnabled( "0");
		}
		
		addServiceForm.setServiceType( Integer.toString( serviceType));
		
		if( ( addServiceForm.getCompanyWithoutSexEnabled().equals( "0")) && 
			( addServiceForm.getCompanyWithSexEnabled().equals( "0")) &&
			( addServiceForm.getSexEnabled().equals( "0")) &&
			( addServiceForm.getEroticShowEnabled().equals( "0")))
				
			addServiceForm.setNoMoreServiceAvailable( "1");
		
		session.setAttribute( Constant.ADD_SERVICE_FORM_OBJECT_NAME, addServiceForm);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
