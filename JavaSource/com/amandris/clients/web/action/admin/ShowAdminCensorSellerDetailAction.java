package com.amandris.clients.web.action.admin;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.web.form.AdminCensorSellerForm;
import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.AdminSession;
import com.amandris.clients.web.view.SellerToCensorView;

public class ShowAdminCensorSellerDetailAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		SellerFacade 			sellerFacade 			= new SellerFacade();
		Locale					locale					= null;
		SellerToCensorView		sellerToCensorView		= null;
		AdminCensorSellerForm	adminCensorSellerForm	= new AdminCensorSellerForm();

		AdminSession adminSession = ( AdminSession)session.getAttribute( Constant.ADMIN_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( adminSession == null)
			return ( mapping.findForward( Constant.ADMIN_SESSION_FAIL));
		
		sellerToCensorView = sellerFacade.getSellerToCensorById( DBUtils.parseInteger( request.getParameter( "id"), 0));
		
		adminCensorSellerForm.setAddress1		( sellerToCensorView.getAddress1());
		adminCensorSellerForm.setAddress2		( sellerToCensorView.getAddress2());
		adminCensorSellerForm.setCity			( sellerToCensorView.getCity());
		adminCensorSellerForm.setId				( sellerToCensorView.getId());
		adminCensorSellerForm.setIntro			( sellerToCensorView.getIntro());
		adminCensorSellerForm.setLogin			( sellerToCensorView.getLogin());
		adminCensorSellerForm.setName			( sellerToCensorView.getName());
		adminCensorSellerForm.setPostalCode		( sellerToCensorView.getPostalCode());
		adminCensorSellerForm.setPreferredText	( sellerToCensorView.getPreferredText());
		adminCensorSellerForm.setSurname		( sellerToCensorView.getSurname());
		adminCensorSellerForm.setText			( sellerToCensorView.getText());
		
		session.setAttribute( Constant.ADMIN_CENSOR_SELLER_FORM_OBJECT_NAME, adminCensorSellerForm);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
