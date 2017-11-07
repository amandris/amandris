package com.amandris.clients.web.action.admin;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.util.Constant;
import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.web.form.LoginForm;
import com.amandris.clients.web.util.AdminSession;


public class AdminLoginAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		
		HttpSession		session 		= request.getSession();
		Locale			locale			= getLocale( request);
		LoginForm 		loginForm 		= null;
		AdminSession	adminSession	= new AdminSession();
		
		getRequestLocale( request);

		if( ( form == null) || ( form.getClass() != LoginForm.class))
			return ( mapping.findForward( Constant.FAIL));
		
		loginForm = ( LoginForm)form;
		
		if( loginForm.getPassword().length() == 3 && 
			checkLetter( loginForm.getLogin().charAt( 0), loginForm.getPassword().charAt( 0)) &&
			checkLetter( loginForm.getLogin().charAt( 1), loginForm.getPassword().charAt( 1)) &&
			checkLetter( loginForm.getLogin().charAt( 2), loginForm.getPassword().charAt( 2))) {
		
			adminSession.setLogin	( loginForm.getLogin());
			adminSession.setPassword( loginForm.getPassword());
			
			session.setAttribute( Constant.ADMIN_SESSION_OBJECT_NAME, adminSession);
			
			saveToken( request);
			
			return ( mapping.findForward( Constant.SUCCESS)); 
		} else {
			Thread.sleep( 30000);
		}
		
		return ( null);
	  }
	
	private boolean checkLetter( char number, char letter) 
	{
		switch( number) {
			case '1': if( letter == 'G' || letter == 'g') return true; return false;
			case '2': if( letter == 'P' || letter == 'p') return true; return false;
			case '3': if( letter == 'M' || letter == 'm') return true; return false;
			case '4': if( letter == 'P' || letter == 'p') return true; return false;
			case '5': if( letter == 'K' || letter == 'k') return true; return false;
			case '6': if( letter == 'O' || letter == 'o') return true; return false;
			case '7': if( letter == 'I' || letter == 'i') return true; return false;
			case '8': if( letter == 'N' || letter == 'n') return true; return false;
			case '9': if( letter == 'J' || letter == 'j') return true; return false;
			case '0': if( letter == 'L' || letter == 'l') return true; return false;
		}
		
		return false;
	}
}		
