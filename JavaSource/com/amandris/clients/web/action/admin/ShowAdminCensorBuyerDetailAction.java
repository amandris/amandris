package com.amandris.clients.web.action.admin;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.web.form.AdminCensorBuyerForm;
import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.AdminSession;
import com.amandris.clients.web.view.BuyerToCensorView;

public class ShowAdminCensorBuyerDetailAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		BuyerFacade 			buyerFacade 			= new BuyerFacade();
		Locale					locale					= null;
		BuyerToCensorView		buyerToCensorView		= null;
		AdminCensorBuyerForm	adminCensorBuyerForm	= new AdminCensorBuyerForm();

		AdminSession adminSession = ( AdminSession)session.getAttribute( Constant.ADMIN_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( adminSession == null)
			return ( mapping.findForward( Constant.ADMIN_SESSION_FAIL));
		
		buyerToCensorView = buyerFacade.getBuyerToCensorById( DBUtils.parseInteger( request.getParameter( "id"), 0));
		
		adminCensorBuyerForm.setAddress1		( buyerToCensorView.getAddress1());
		adminCensorBuyerForm.setAddress2		( buyerToCensorView.getAddress2());
		adminCensorBuyerForm.setCity			( buyerToCensorView.getCity());
		adminCensorBuyerForm.setId				( buyerToCensorView.getId());
		adminCensorBuyerForm.setIntro			( buyerToCensorView.getIntro());
		adminCensorBuyerForm.setLogin			( buyerToCensorView.getLogin());
		adminCensorBuyerForm.setName			( buyerToCensorView.getName());
		adminCensorBuyerForm.setPostalCode		( buyerToCensorView.getPostalCode());
		adminCensorBuyerForm.setPreferredText	( buyerToCensorView.getPreferredText());
		adminCensorBuyerForm.setSurname			( buyerToCensorView.getSurname());
		adminCensorBuyerForm.setText			( buyerToCensorView.getText());
		
		session.setAttribute( Constant.ADMIN_CENSOR_BUYER_FORM_OBJECT_NAME, adminCensorBuyerForm);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
