package com.amandris.clients.web.action.admin;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.web.action.common.AbstractAction;
import com.amandris.clients.web.form.AdminEditBuyerForm;
import com.amandris.clients.service.dao.BuyerDAO;
import com.amandris.clients.service.vo.Buyer;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.AdminSession;

public class ShowAdminBuyerAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		BuyerDAO 				buyerDAO 				= new BuyerDAO();
		Buyer					buyer					= null;
		Locale					locale					= null;
		AdminEditBuyerForm		adminEditBuyerForm		= new AdminEditBuyerForm();

		AdminSession adminSession = ( AdminSession)session.getAttribute( Constant.ADMIN_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( adminSession == null)
			return ( mapping.findForward( Constant.ADMIN_SESSION_FAIL));
		
		buyer = buyerDAO.getBuyerById( DBUtils.parseInteger( request.getParameter( "id"), 0), null);

		if( buyer != null){
			BeanUtils.copyProperties( adminEditBuyerForm, buyer);
		
			session.setAttribute( Constant.ADMIN_EDIT_BUYER_FORM_OBJECT_NAME, adminEditBuyerForm);
		
			saveToken(request);
		} else {
			session.removeAttribute( Constant.ADMIN_EDIT_BUYER_FORM_OBJECT_NAME);
		}

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
