package com.amandris.clients.web.action.admin;

import java.util.Date;
import java.util.Locale;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.dao.BuyerDAO;
import com.amandris.clients.service.dao.MessageDAO;
import com.amandris.clients.service.vo.Buyer;
import com.amandris.clients.service.vo.BuyerMessage;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.util.mail.AdminMessageMailObject;
import com.amandris.clients.util.mail.Mail;
import com.amandris.clients.web.form.AdminSendMessageForm;
import com.amandris.clients.web.util.AdminSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetAdminSendMessageToBuyerAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		Locale					locale					= getRequestLocale( request);
		BuyerDAO				buyerDAO				= new BuyerDAO();
		AdminMessageMailObject 	adminMessageMailObject 	= new AdminMessageMailObject( );
		MessageDAO				messageDAO				= new MessageDAO();
		BuyerMessage			buyerMessage			= new BuyerMessage();
		AdminSendMessageForm	adminSendMessageForm	= null;
		String					ids						= null;
		String					id						= null;
		Integer					buyerId					= null;
		Buyer					buyer					= null;		
		String					text					= null;
	
		AdminSession adminSession = ( AdminSession)session.getAttribute( Constant.ADMIN_SESSION_OBJECT_NAME);
		
		if( adminSession == null)
			return ( mapping.findForward( Constant.ADMIN_SESSION_FAIL));
		
		adminSendMessageForm = ( AdminSendMessageForm) form;
				
		ids = adminSendMessageForm.getIds();
		
		StringTokenizer st = new StringTokenizer(ids, ",");
		
		while ( st.hasMoreTokens()) {
            id = st.nextToken();
            adminMessageMailObject = new AdminMessageMailObject();
            buyerMessage = new BuyerMessage();
            
            if ( id != null && id.length() > 0) {
                id = id.trim();
                
                buyerId = DBUtils.parseInteger( id, 0);
                
                if( buyerId.intValue() == 0)
                	break;
                
                buyer = buyerDAO.getBuyerById( buyerId, null);
                
                if( buyer == null)
                	break;
                	
                adminMessageMailObject.setLocale	( locale);
                adminMessageMailObject.setLogin		( buyer.getLogin());
                adminMessageMailObject.setSubject	( adminSendMessageForm.getSubject());
                adminMessageMailObject.setText		( adminSendMessageForm.getText());
                adminMessageMailObject.setIsBuyer	( true);

        		text = adminSendMessageForm.getSubject();
        		
        		Mail.sendMail( buyer.getEmail(), text, adminMessageMailObject);
        		
        		buyerMessage.setActive( new Integer(1));
        		buyerMessage.setBuyer( buyer);
        		buyerMessage.setBuyerId( buyer.getId());
        		buyerMessage.setDate( new Date());
        		buyerMessage.setIsHtml( new Integer(0));
        		buyerMessage.setIsNew( new Integer(1));
        		buyerMessage.setSender( "Amandris");
        		buyerMessage.setSubject( adminSendMessageForm.getSubject());
        		buyerMessage.setText( adminSendMessageForm.getText());
        		
        		messageDAO.setBuyerMessage( buyerMessage);
            }
        }
		
				
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
	
}		
