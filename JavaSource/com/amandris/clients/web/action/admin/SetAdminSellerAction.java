package com.amandris.clients.web.action.admin;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.dao.SellerDAO;
import com.amandris.clients.service.vo.Seller;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.web.form.AdminEditSellerForm;
import com.amandris.clients.web.util.AdminSession;

public class SetAdminSellerAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		Locale					locale					= getRequestLocale( request);
		SellerDAO				sellerDAO				= new SellerDAO();
		Seller					seller					= null;
		AdminEditSellerForm		adminEditSellerForm		= null;
		
		AdminSession adminSession = ( AdminSession)session.getAttribute( Constant.ADMIN_SESSION_OBJECT_NAME);
		
		if( adminSession == null)
			return ( mapping.findForward( Constant.ADMIN_SESSION_FAIL));
		
		adminEditSellerForm = ( AdminEditSellerForm) form;
				
		seller = sellerDAO.getSellerById( adminEditSellerForm.getId());
		
		if( seller != null){
		
			BeanUtils.copyProperties( seller, adminEditSellerForm);
			
			sellerDAO.setSeller( seller);
					
			saveToken(request);
		}

		return ( mapping.findForward( Constant.SUCCESS));
	  }
	
}		
