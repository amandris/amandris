package com.amandris.clients.web.action.common;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.util.mail.Mail;
import com.amandris.clients.util.mail.NewPasswordMailObject;
import com.amandris.clients.web.form.PasswordResetForm;
import com.amandris.clients.web.view.SellerView;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetSellerPasswordResetAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 				session 					= request.getSession();
		Locale						locale						= getRequestLocale( request);
		SellerFacade				sellerFacade				= new SellerFacade();
		PasswordResetForm			passwordResetForm			= null;
		SellerView					sellerView					= null;
		NewPasswordMailObject		newPasswordMailObject		= new NewPasswordMailObject( locale);
		String						password					= "";
		String						email						= "";
				
		sellerView = sellerFacade.getSellerByLogin( DBUtils.controlNull( request.getParameter( "login")), locale);
		
		if( sellerView == null)
			return error( "error.couldNotResetPassword", request, mapping);

		if( ! sellerFacade.getSellerActivationCodeById( DBUtils.parseInteger( sellerView.getId(), 0)).equals( DBUtils.controlNull( request.getParameter( "code"))))
			return error( "error.couldNotResetPassword", request, mapping);

		String text = ConfigurationParameterManager.getMessages().getMessage( locale, "newPasswordMailObject.subject");
	
		password = generatePassword();
		email = sellerFacade.getSellerEmailById( DBUtils.parseInteger( sellerView.getId(), 0));
		
		if( sellerFacade.setSellerResetPassword( DBUtils.parseInteger( sellerView.getId(), 0), DBUtils.digest( password)) == false)
			return error( "error.couldNotResetPassword", request, mapping);
		
		newPasswordMailObject.setLogin( sellerView.getLogin());
		newPasswordMailObject.setPassword( password);
		
		Mail.sendMail( email, text, newPasswordMailObject);
	
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
	
	private String generatePassword() 
	{
		String 	chars 	= "123456789abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ";
		String 	code	= "";
		long 	size	= Math.round( ( Math.random() * 5) + 4);
		
		while( code.length() < size){
	      code = code + chars.charAt( ( int) Math.round( Math.random() * ( chars.length() - 1)));
		}
		
		return code;
	}
	
}		
