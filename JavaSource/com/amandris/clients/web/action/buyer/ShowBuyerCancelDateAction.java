package com.amandris.clients.web.action.buyer;

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
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.view.BuyerContactView;
import com.amandris.clients.web.action.common.AbstractAction;

public class ShowBuyerCancelDateAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 					= request.getSession();
		VoteFacade 				voteFacade 					= new VoteFacade();
		CancelDateForm			cancelDateForm				= new CancelDateForm();
		ContactFacade			contactFacade				= new ContactFacade();
		BuyerContactView		buyerContactView			= new BuyerContactView();
		Locale					locale						= null;

		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		buyerContactView = contactFacade.getBuyerContactById( DBUtils.parseInteger( request.getParameter( "id"), 0), buyerSession, locale);
		
		if( buyerContactView == null)
			return error( "error.couldNotCancelDate", request, mapping);
		
		cancelDateForm.setText			( "");
		cancelDateForm.setSellerId		( buyerContactView.getSellerId());
		cancelDateForm.setSellerLogin	( buyerContactView.getSellerLogin());
		cancelDateForm.setContactId		( DBUtils.parseInteger( request.getParameter( "id"), 0).toString());

		session.setAttribute( Constant.CANCEL_DATE_FORM_OBJECT_NAME, cancelDateForm);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
