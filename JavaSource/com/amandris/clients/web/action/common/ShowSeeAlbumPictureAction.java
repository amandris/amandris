package com.amandris.clients.web.action.common;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.AlbumElementFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.AlbumElementView;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowSeeAlbumPictureAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession			session 			= request.getSession();
		String				pictureFileName		= "";
		AlbumElementFacade	albumElementFacade	= new AlbumElementFacade();
		AlbumElementView	albumElementView	= null;
		Locale				locale				= null;
		Integer				id					= null;
		
		SellerSession 	sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		BuyerSession 	buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);	
		
		locale = getLocale( request);
		
		if( sellerSession == null && buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		id = DBUtils.parseInteger( request.getParameter( "id"), 0);
		
		albumElementView = albumElementFacade.getAlbumElementById( id, Boolean.TRUE, locale);
			
		if( albumElementView == null)
			return error( "error.couldNotSeePicture", request, mapping);
				
		pictureFileName = "/media/album/original/seller_" + albumElementView.getSellerId() + "_" + albumElementView.getCode()+ ".jpg";
				
		request.setAttribute( Constant.PICTURE_FILE_NAME, pictureFileName);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
