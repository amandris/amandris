package com.amandris.clients.web.action.buyer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.form.BuyCreditsForm;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowBuyerPaymentAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 	session 		= request.getSession();
		int				paymentType		= 0;
		BuyCreditsForm 	buyCreditsForm 	= new BuyCreditsForm(); 
		
		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
			
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		paymentType = DBUtils.parseInteger( request.getParameter( "id"), 0).intValue();
		
		switch( paymentType){
			case 1: return ( mapping.findForward( "bankTransfer"));
			case 2: return ( mapping.findForward( "creditCard"));
			case 3: return ( mapping.findForward( "paypal"));
			case 4: return ( mapping.findForward( "sms"));
			case 5: 
				buyCreditsForm.setCredits	( "10");
				buyCreditsForm.setUserId	( buyerSession.getId().toString());
				buyCreditsForm.setUserLogin	( buyerSession.getLogin());
				buyCreditsForm.setType		( "5");
				
				session.setAttribute( Constant.BUY_CREDITS_FORM_OBJECT_NAME, buyCreditsForm);
				
				saveToken(request);
				
				return ( mapping.findForward( "debug"));
			default: return error( "error.couldNotDoPayment", request, mapping); 
		}
	  }
}		
