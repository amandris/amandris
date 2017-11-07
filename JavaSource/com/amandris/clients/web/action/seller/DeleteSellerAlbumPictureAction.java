package com.amandris.clients.web.action.seller;

import java.io.File;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.AlbumElementFacade;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.AlbumElementView;
import com.amandris.clients.web.action.common.AbstractAction;

public class DeleteSellerAlbumPictureAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 		session 			= request.getSession();
		AlbumElementView	albumElementView 	= null;
		AlbumElementFacade	albumElementFacade	= new AlbumElementFacade();
		Locale				locale				= null;
		File				file				= null;
		Integer				id					= null;
		
		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));

		id = DBUtils.parseInteger( request.getParameter( "id"), 0);
	
		albumElementView = albumElementFacade.getAlbumElementById( id, null, locale);
			
		if( albumElementView == null)
			return error( "error.couldNotDeletePicture", request, mapping);
		
		if( DBUtils.parseInteger( albumElementView.getSellerId(), 0).intValue() != sellerSession.getId().intValue())
			return error( "error.couldNotDeletePicture", request, mapping);
		
		if( ! albumElementFacade.deletePicture( id, sellerSession))
			return error( "error.couldNotDeletePicture", request, mapping);
						
		file = new File( ConfigurationParameterManager.getParameterString( "mediaPath") + "/album/original/seller_" + sellerSession.getId() + "_" + albumElementView.getCode()+ ".jpg");
		file.delete();
		
		file = new File( ConfigurationParameterManager.getParameterString( "mediaPath") + "/album/smaller/seller_" + sellerSession.getId() + "_" + albumElementView.getCode() + ".jpg");
		file.delete();
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
