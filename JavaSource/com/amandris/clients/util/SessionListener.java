package com.amandris.clients.util;

import java.util.Calendar;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.amandris.clients.service.dao.BuyerDAO;
import com.amandris.clients.service.dao.BuyerHistoricLoginDAO;
import com.amandris.clients.service.dao.SellerDAO;
import com.amandris.clients.service.dao.SellerHistoricLoginDAO;
import com.amandris.clients.service.vo.Buyer;
import com.amandris.clients.service.vo.BuyerHistoricLogin;
import com.amandris.clients.service.vo.Seller;
import com.amandris.clients.service.vo.SellerHistoricLogin;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.util.SellerSession;

public final class SessionListener implements HttpSessionListener{

	public void sessionCreated(HttpSessionEvent event)
	{
	}

	public void sessionDestroyed( HttpSessionEvent event) 
	{
		BuyerSession 			buyerSession 			= null;
		SellerSession 			sellerSession 			= null;
		BuyerDAO				buyerDAO				= new BuyerDAO();
		BuyerHistoricLoginDAO	buyerHistoricLoginDAO	= new BuyerHistoricLoginDAO();
		SellerHistoricLoginDAO	sellerHistoricLoginDAO	= new SellerHistoricLoginDAO();
		BuyerHistoricLogin		buyerHistoricLogin		= null;
		SellerHistoricLogin		sellerHistoricLogin		= null;
		Buyer					buyer					= null;
		SellerDAO				sellerDAO				= new SellerDAO();
		Seller					seller					= null;
		
		buyerSession 	= ( BuyerSession) event.getSession().getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		sellerSession 	= ( SellerSession) event.getSession().getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);

		try{
			if( buyerSession != null) {
				 buyer = buyerDAO.getBuyerById( buyerSession.getId(), null);
				 
				 if( buyer != null) {
					 buyer.setIsOnLine( new Integer( 0));
					 
					 buyerDAO.setBuyer( buyer);
					 
					 buyerHistoricLogin = new BuyerHistoricLogin();
					 buyerHistoricLogin.setBuyer( buyer);
					 buyerHistoricLogin.setBuyerId( buyer.getId());
					 buyerHistoricLogin.setIsLogin( new Integer( 0));
					 buyerHistoricLogin.setDate( Calendar.getInstance().getTime());

					 buyerHistoricLoginDAO.setBuyerHistoricLogin( buyerHistoricLogin);
				 }
				 
				 
			} 
			
			if( sellerSession != null) {
				 seller = sellerDAO.getSellerById( sellerSession.getId());
				 
				 if( seller != null) {
					 seller.setIsOnLine( new Integer( 0));
					 
					 sellerDAO.setSeller( seller);
					 
					 sellerHistoricLogin = new SellerHistoricLogin();
					 sellerHistoricLogin.setSeller( seller);
					 sellerHistoricLogin.setSellerId( seller.getId());
					 sellerHistoricLogin.setIsLogin( new Integer( 0));
					 sellerHistoricLogin.setDate( Calendar.getInstance().getTime());

					 sellerHistoricLoginDAO.setSellerHistoricLogin( sellerHistoricLogin);
				 }
			} 
		} catch ( Exception e) {}
	}
}
	