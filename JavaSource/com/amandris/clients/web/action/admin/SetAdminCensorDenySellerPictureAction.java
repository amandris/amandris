package com.amandris.clients.web.action.admin;

import java.io.File;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.dao.SellerDAO;
import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.service.vo.Seller;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.util.mail.Mail;
import com.amandris.clients.util.mail.PictureDenyMailObject;
import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.web.util.AdminSession;

public class SetAdminCensorDenySellerPictureAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		Locale					locale					= getRequestLocale( request);
		SellerFacade			sellerFacade				= new SellerFacade();
		Integer					value					= null;
		Seller					seller					= null;
		SellerDAO				sellerDAO				= new SellerDAO();
		File					file					= null;
		PictureDenyMailObject 	pictureDenyMailObject 	= new PictureDenyMailObject( locale);
		String					subject					= "";
		
		AdminSession adminSession = ( AdminSession)session.getAttribute( Constant.ADMIN_SESSION_OBJECT_NAME);
		
		if( adminSession == null)
			return ( mapping.findForward( Constant.ADMIN_SESSION_FAIL));
		
		
		
		Integer id = DBUtils.parseInteger( request.getParameter( "id"), 0);
		Integer index = DBUtils.parseInteger( request.getParameter( "index"), 0);
		
		seller = sellerDAO.getSellerById( id);
		
		if( seller != null){
			switch( index.intValue()){
				case 1: value = seller.getPicture1(); break;
				case 2: value = seller.getPicture2(); break;
				case 3: value = seller.getPicture3(); break;
				case 4: value = seller.getPicture4(); break;
				case 5: value = seller.getPicture5(); break;
			}
			
			sellerFacade.deletePicture( index, seller.getId());
				
			
			file = new File( ConfigurationParameterManager.getParameterString( "mediaPath") + "/pictures/original/seller_" + seller.getId() + "_" + index.intValue() + "_" + value.intValue() + ".jpg");
			file.delete();
			
			file = new File( ConfigurationParameterManager.getParameterString( "mediaPath") + "/pictures/smaller/seller_" + seller.getId() + "_" + index.intValue() + "_" + value.intValue() + ".jpg");
			file.delete();
			
			pictureDenyMailObject.setIsBuyer			( false);
			pictureDenyMailObject.setIndex				( index.toString());
			pictureDenyMailObject.setLogin				( seller.getLogin());
			
			subject = ConfigurationParameterManager.getMessages().getMessage( locale, "pictureDenyMailObject.subject", index);
			Mail.sendMail( seller.getEmail(), subject, pictureDenyMailObject);
			
			
		}
				
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
	
}		
