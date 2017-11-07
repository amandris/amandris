package com.amandris.clients.web.action.seller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.ContactFacade;
import com.amandris.clients.service.facade.VoteFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.CancelDateForm;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.SellerContactView;
import com.amandris.clients.web.action.common.AbstractAction;

public class ShowSellerCancelDateAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 					= request.getSession();
		VoteFacade 				voteFacade 					= new VoteFacade();
		CancelDateForm			cancelDateForm				= new CancelDateForm();
		ContactFacade			contactFacade				= new ContactFacade();
		SellerContactView		sellerContactView			= new SellerContactView();
		Locale					locale						= null;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		sellerContactView = contactFacade.getSellerContactById( DBUtils.parseInteger( request.getParameter( "id"), 0), sellerSession, locale);
		
		if( sellerContactView == null)
			return error( "error.couldNotCancelDate", request, mapping);
		
		cancelDateForm.setText			( "");
		cancelDateForm.setBuyerId		( sellerContactView.getBuyerId());
		cancelDateForm.setBuyerLogin	( sellerContactView.getBuyerLogin());
		cancelDateForm.setContactId		( DBUtils.parseInteger( request.getParameter( "id"), 0).toString());

		session.setAttribute( Constant.CANCEL_DATE_FORM_OBJECT_NAME, cancelDateForm);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
