package com.amandris.clients.web.action.buyer;

import java.io.File;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class DeleteBuyerPictureAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 	session 	= request.getSession();
		BuyerFacade 	buyerFacade = new BuyerFacade();
		Locale			locale		= null;
		File			file		= null;
		Integer			index		= null;
		Integer			value		= null;
		
		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		index = DBUtils.parseInteger( request.getParameter( "index"), 0);
		
		switch( index.intValue()){
			case 1: value = buyerSession.getPicture1(); break;
			case 2: value = buyerSession.getPicture2(); break;
			case 3: value = buyerSession.getPicture3(); break;
			case 4: value = buyerSession.getPicture4(); break;
			case 5: value = buyerSession.getPicture5(); break;
		}
		
		if( ! buyerFacade.deletePicture( index, buyerSession.getId()))
			return error( "error.couldNotDeletePicture", request, mapping);
				
		buyerSession = buyerFacade.getBuyerSessionByLoginAndPassword( buyerSession.getLogin(), buyerSession.getPassword(), true, locale);
		
		if( buyerSession == null)
			return error( "error.couldNotDeletePicture", request, mapping);
		
		file = new File( ConfigurationParameterManager.getParameterString( "mediaPath") + "/pictures/original/buyer_" + buyerSession.getId() + "_" + index.intValue() + "_" + value.intValue() + ".jpg");
		file.delete();
		
		file = new File( ConfigurationParameterManager.getParameterString( "mediaPath") + "/pictures/smaller/buyer_" + buyerSession.getId() + "_" + index.intValue() + "_" + value.intValue() + ".jpg");
		file.delete();
		
		session.setAttribute( Constant.BUYER_SESSION_OBJECT_NAME, buyerSession);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
