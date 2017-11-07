package com.amandris.clients.web.action.buyer;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.action.common.AbstractAction;


public class ShowBuyerSeePictureAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession	session 		= request.getSession();
		String		pictureFileName	= "";
		Locale		locale			= null;
		Integer		index			= null;
		Integer		value			= null;
		
		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		index = DBUtils.parseInteger( request.getParameter( "index"), 0);
		
		switch( index.intValue()){
			case 1: if( buyerSession.getPicture1().intValue() == 0)
						return error( "error.couldNotSeePicture", request, mapping);
					value = buyerSession.getPicture1(); 
			break;
			
			case 2: if( buyerSession.getPicture2().intValue() == 0)
						return error( "error.couldNotSeePicture", request, mapping);
					value = buyerSession.getPicture2(); 
			break;
			
			case 3: if( buyerSession.getPicture3().intValue() == 0)
						return error( "error.couldNotSeePicture", request, mapping);
					value = buyerSession.getPicture3(); 
			break;
			
			case 4: if( buyerSession.getPicture4().intValue() == 0)
						return error( "error.couldNotSeePicture", request, mapping);
					value = buyerSession.getPicture4(); 
			break;
			
			case 5: if( buyerSession.getPicture5().intValue() == 0)
						return error( "error.couldNotSeePicture", request, mapping);
					value = buyerSession.getPicture5(); 
			break;
			
			default: return error( "error.couldNotSeePicture", request, mapping);
		}
		
		pictureFileName = "/media/pictures/original/buyer_" + buyerSession.getId() + "_" + index.intValue() + "_" + value.intValue() + ".jpg";
				
		request.setAttribute( Constant.PICTURE_FILE_NAME, pictureFileName);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
