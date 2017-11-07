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

import com.amandris.clients.service.dao.MessageDAO;
import com.amandris.clients.service.dao.SellerDAO;
import com.amandris.clients.service.vo.Seller;
import com.amandris.clients.service.vo.SellerMessage;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.util.mail.AdminMessageMailObject;
import com.amandris.clients.util.mail.Mail;
import com.amandris.clients.web.form.AdminSendMessageForm;
import com.amandris.clients.web.util.AdminSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetAdminSendMessageToSellerAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		Locale					locale					= getRequestLocale( request);
		SellerDAO				sellerDAO				= new SellerDAO();
		AdminMessageMailObject 	adminMessageMailObject 	= new AdminMessageMailObject( );
		MessageDAO				messageDAO				= new MessageDAO();
		SellerMessage			sellerMessage			= new SellerMessage();
		AdminSendMessageForm	adminSendMessageForm	= null;
		String					ids						= null;
		String					id						= null;
		Integer					sellerId				= null;
		Seller					seller					= null;		
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
            sellerMessage = new SellerMessage();
            
            if ( id != null && id.length() > 0) {
                id = id.trim();
                
                sellerId = DBUtils.parseInteger( id, 0);
                
                if( sellerId.intValue() == 0)
                	break;
                
                seller = sellerDAO.getSellerById( sellerId);
                
                if( seller == null)
                	break;
                	
                adminMessageMailObject.setLocale	( locale);
                adminMessageMailObject.setLogin		( seller.getLogin());
                adminMessageMailObject.setSubject	( adminSendMessageForm.getSubject());
                adminMessageMailObject.setText		( adminSendMessageForm.getText());
                adminMessageMailObject.setIsBuyer	( false);

        		text = adminSendMessageForm.getSubject();
        		
        		Mail.sendMail( seller.getEmail(), text, adminMessageMailObject);
        		
        		sellerMessage.setActive( new Integer(1));
        		sellerMessage.setSeller( seller);
        		sellerMessage.setSellerId( seller.getId());
        		sellerMessage.setDate( new Date());
        		sellerMessage.setIsHtml( new Integer(0));
        		sellerMessage.setIsNew( new Integer(1));
        		sellerMessage.setSender( "Amandris");
        		sellerMessage.setSubject( adminSendMessageForm.getSubject());
        		sellerMessage.setText( adminSendMessageForm.getText());
        		
        		messageDAO.setSellerMessage( sellerMessage);
            }
        }
		
				
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
	
}		
