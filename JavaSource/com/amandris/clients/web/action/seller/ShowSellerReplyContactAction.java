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
import com.amandris.clients.web.form.SellerReplyContactForm;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.SellerContactView;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowSellerReplyContactAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		Locale					locale					= null;
		SellerReplyContactForm	sellerReplyContactForm	= new SellerReplyContactForm();
		VoteFacade 				voteFacade 				= new VoteFacade();
		ContactFacade			contactFacade			= new ContactFacade();
		SellerContactView		sellerContactView		= new SellerContactView();

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		sellerContactView = contactFacade.getSellerContactById( DBUtils.parseInteger( request.getParameter( "id"), 0), sellerSession, locale);
		
		if( ( sellerContactView == null) || 
			( DBUtils.parseInteger( sellerContactView.getSellerId() ,0).intValue() != sellerSession.getId().intValue()) || 
			( DBUtils.parseInteger( sellerContactView.getMessageStatusConst(), 0).intValue() != Constant.MESSAGE_STATUS_WAITING)) 
			return error( "error.couldNotSetContactReply", request, mapping);
						
		sellerReplyContactForm.setText			( "");
		sellerReplyContactForm.setReply			( Integer.toString( Constant.CONTACT_REPLY_ACCEPTED));
		sellerReplyContactForm.setSellerId		( sellerContactView.getSellerId());
		sellerReplyContactForm.setSellerLogin	( sellerSession.getLogin());
		sellerReplyContactForm.setBuyerId		( sellerContactView.getBuyerId());
		sellerReplyContactForm.setBuyerLogin	( sellerContactView.getBuyerLogin());
		sellerReplyContactForm.setContactId		( DBUtils.parseInteger( request.getParameter( "id"), 0).toString());

		session.setAttribute( Constant.SELLER_REPLY_CONTACT_FORM_OBJECT_NAME, sellerReplyContactForm);
		session.setAttribute( Constant.SELLER_CONTACT_DETAIL_OBJECT_NAME, sellerContactView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
