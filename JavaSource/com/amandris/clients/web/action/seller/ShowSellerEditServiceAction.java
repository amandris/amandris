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

import com.amandris.clients.service.facade.SellerServiceFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.EditServiceForm;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.ServiceView;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowSellerEditServiceAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 					= request.getSession();
		SellerServiceFacade 	sellerServiceFacade 		= new SellerServiceFacade();
		EditServiceForm			editServiceForm				= new EditServiceForm();
		Collection				collection					= null;
		Locale					locale						= null;
		Iterator				iterator					= null;
		ServiceView				serviceView					= null;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		collection = sellerServiceFacade.getSellerServiceBySellerIdAndServiceType( sellerSession.getId(), DBUtils.parseInteger( request.getParameter( "id"), 0), locale);
		
		if( ( collection == null) || ( collection.size() == 0))
			return error( "error.couldNotEditService", request, mapping);

		iterator = collection.iterator();
		
		while( iterator.hasNext()) {
			serviceView = ( ServiceView) iterator.next();
			
			if( serviceView.getSexConst().equals( "1"))
				editServiceForm.setSex1Checked( true);
			if( serviceView.getSexConst().equals( "2"))
				editServiceForm.setSex2Checked( true);
			if( serviceView.getSexConst().equals( "4"))
				editServiceForm.setSex4Checked( true);
			if( serviceView.getSexConst().equals( "8"))
				editServiceForm.setSex8Checked( true);
			if( serviceView.getSexConst().equals( "16"))
				editServiceForm.setSex16Checked( true);
			if( serviceView.getSexConst().equals( "32"))
				editServiceForm.setSex32Checked( true);
			if( serviceView.getSexConst().equals( "64"))
				editServiceForm.setSex64Checked( true);
		}
		
		editServiceForm.setAdditionalHoursPrice	( serviceView.getServiceAdditionalHoursPrice());
		editServiceForm.setFirstHourPrice		( serviceView.getServiceFirstHourPrice());
		
		if( ( serviceView.getServiceAdditionalHoursPriceDouble().doubleValue() == 0 ) && ( serviceView.getServiceFirstHourPriceDouble().doubleValue() == 0 ))
			editServiceForm.setIsFree( true);
		else
			editServiceForm.setIsFree( false);
		
		editServiceForm.setCurrencyConst	( serviceView.getCurrencyConst());
		editServiceForm.setCurrency			( serviceView.getCurrencyText());
		
		editServiceForm.setServiceType		( serviceView.getServiceTypeConst());
		editServiceForm.setServiceTypeText	( serviceView.getServiceTypeText());
						
		session.setAttribute( Constant.EDIT_SERVICE_FORM_OBJECT_NAME, editServiceForm);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
