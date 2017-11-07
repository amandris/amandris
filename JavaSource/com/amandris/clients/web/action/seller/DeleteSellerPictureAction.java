package com.amandris.clients.web.action.seller;

import java.io.File;
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
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class DeleteSellerPictureAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 	session 	= request.getSession();
		SellerFacade 	sellerFacade = new SellerFacade();
		Locale			locale		= null;
		File			file		= null;
		Integer			index		= null;
		Integer			value		= null;
		
		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		index = DBUtils.parseInteger( request.getParameter( "index"), 0);
		
		switch( index.intValue()){
			case 1: value = sellerSession.getPicture1(); break;
			case 2: value = sellerSession.getPicture2(); break;
			case 3: value = sellerSession.getPicture3(); break;
			case 4: value = sellerSession.getPicture4(); break;
			case 5: value = sellerSession.getPicture5(); break;
		}
		
		if( ! sellerFacade.deletePicture( index, sellerSession.getId()))
			return error( "error.couldNotDeletePicture", request, mapping);
				
		sellerSession = sellerFacade.getSellerSessionByLoginAndPassword( sellerSession.getLogin(), sellerSession.getPassword(), true, locale);
		
		if( sellerSession == null)
			return error( "error.couldNotDeletePicture", request, mapping);
		
		file = new File( ConfigurationParameterManager.getParameterString( "mediaPath") + "/pictures/original/seller_" + sellerSession.getId() + "_" + index.intValue() + "_" + value.intValue() + ".jpg");
		file.delete();
		
		file = new File( ConfigurationParameterManager.getParameterString( "mediaPath") + "/pictures/smaller/seller_" + sellerSession.getId() + "_" + index.intValue() + "_" + value.intValue() + ".jpg");
		file.delete();
		
		session.setAttribute( Constant.SELLER_SESSION_OBJECT_NAME, sellerSession);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
