package com.amandris.clients.web.action.admin;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.dao.BuyerDAO;
import com.amandris.clients.service.vo.Buyer;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.web.form.AdminEditBuyerForm;
import com.amandris.clients.web.util.AdminSession;

public class SetAdminBuyerAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		Locale					locale					= getRequestLocale( request);
		BuyerDAO				buyerDAO				= new BuyerDAO();
		Buyer					buyer					= null;
		AdminEditBuyerForm		adminEditBuyerForm		= null;
		
		AdminSession adminSession = ( AdminSession)session.getAttribute( Constant.ADMIN_SESSION_OBJECT_NAME);
		
		if( adminSession == null)
			return ( mapping.findForward( Constant.ADMIN_SESSION_FAIL));
		
		adminEditBuyerForm = ( AdminEditBuyerForm) form;
				
		buyer = buyerDAO.getBuyerById( adminEditBuyerForm.getId(), null);
		
		if( buyer != null){
		
			BeanUtils.copyProperties( buyer, adminEditBuyerForm);
			
			buyerDAO.setBuyer( buyer);
					
			saveToken(request);
		}

		return ( mapping.findForward( Constant.SUCCESS));
	  }
	
}		
