package com.amandris.clients.web.action.buyer;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.SavedSearchFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.action.common.AbstractAction;

public class DeleteSavedSearchAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
 		  
		HttpSession 		session 				= request.getSession();
		SavedSearchFacade 	savedSearchFacade		= new SavedSearchFacade();
		BuyerSession 		buyerSession			= null;
		Collection			savedSearchCollection	= null;

		buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);

		if( buyerSession == null)
			return mapping.findForward( Constant.SESSION);
		
		savedSearchFacade.deleteSavedSearch( DBUtils.parseInteger( request.getParameter( "id"), 0));
		
		savedSearchCollection = savedSearchFacade.getSavedSearch( buyerSession.getId());		
		
		session.setAttribute( Constant.SAVED_SEARCH_COLLECTION_OBJECT_NAME, savedSearchCollection);
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
