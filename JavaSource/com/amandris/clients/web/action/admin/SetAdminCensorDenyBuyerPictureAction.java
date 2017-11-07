package com.amandris.clients.web.action.admin;

import java.io.File;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.dao.BuyerDAO;
import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.service.vo.Buyer;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.util.mail.Mail;
import com.amandris.clients.util.mail.PictureDenyMailObject;
import com.amandris.clients.web.util.AdminSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetAdminCensorDenyBuyerPictureAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		Locale					locale					= getRequestLocale( request);
		BuyerFacade				buyerFacade				= new BuyerFacade();
		Integer					value					= null;
		Buyer					buyer					= null;
		BuyerDAO				buyerDAO				= new BuyerDAO();
		File					file					= null;
		PictureDenyMailObject 	pictureDenyMailObject 	= new PictureDenyMailObject( locale);
		String					subject					= "";
		
		AdminSession adminSession = ( AdminSession)session.getAttribute( Constant.ADMIN_SESSION_OBJECT_NAME);
		
		if( adminSession == null)
			return ( mapping.findForward( Constant.ADMIN_SESSION_FAIL));
		
		
		
		Integer id = DBUtils.parseInteger( request.getParameter( "id"), 0);
		Integer index = DBUtils.parseInteger( request.getParameter( "index"), 0);
		
		buyer = buyerDAO.getBuyerById( id, null);
		
		if( buyer != null){
			switch( index.intValue()){
				case 1: value = buyer.getPicture1(); break;
				case 2: value = buyer.getPicture2(); break;
				case 3: value = buyer.getPicture3(); break;
				case 4: value = buyer.getPicture4(); break;
				case 5: value = buyer.getPicture5(); break;
			}
			
			buyerFacade.deletePicture( index, buyer.getId());
				
			
			file = new File( ConfigurationParameterManager.getParameterString( "mediaPath") + "/pictures/original/buyer_" + buyer.getId() + "_" + index.intValue() + "_" + value.intValue() + ".jpg");
			file.delete();
			
			file = new File( ConfigurationParameterManager.getParameterString( "mediaPath") + "/pictures/smaller/buyer_" + buyer.getId() + "_" + index.intValue() + "_" + value.intValue() + ".jpg");
			file.delete();
			
			pictureDenyMailObject.setIsBuyer			( true);
			pictureDenyMailObject.setIndex				( index.toString());
			pictureDenyMailObject.setLogin				( buyer.getLogin());
			
			subject = ConfigurationParameterManager.getMessages().getMessage( locale, "pictureDenyMailObject.subject", index);
			Mail.sendMail( buyer.getEmail(), subject, pictureDenyMailObject);
			
			
		}
				
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
	
}		
