package com.amandris.clients.web.action.common;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
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


public class ShowAlbumAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 		session 			= request.getSession();
		Locale				locale				= null;
		AlbumElementFacade	albumElementFacade	= new AlbumElementFacade();
		Collection			collection			= null;
		ArrayList			albumElementList	= new ArrayList();
		ArrayList			subList				= null;
		Iterator			iterator			= null;
		AlbumElementView	albumElementView	= null;

		SellerSession 	sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		BuyerSession 	buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);	
		
		locale = getLocale( request);
		
		if( sellerSession == null && buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		collection = albumElementFacade.getAlbumElement( DBUtils.parseInteger( request.getParameter( "id"), 0), Boolean.TRUE, locale);
		
		iterator 	= collection .iterator();
		subList		= new ArrayList();
		
		while( iterator.hasNext()) {
			albumElementView = ( AlbumElementView) iterator.next();
			
			subList.add( albumElementView);
			
			if( subList.size() == 6) {
				albumElementList.add( subList);
				
				subList = new ArrayList();
			}
		}
		
		if( subList.size() != 0)
			albumElementList.add( subList);
		
		
		request.setAttribute( Constant.SELLER_ALBUM_ELEMENT_OBJECT_NAME, albumElementList);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
