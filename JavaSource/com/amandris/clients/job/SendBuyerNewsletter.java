package com.amandris.clients.job;

import java.util.Collection;
import java.util.Iterator;
import java.util.Locale;

import org.apache.ojb.broker.PersistenceBroker;
import org.apache.ojb.broker.PersistenceBrokerException;
import org.apache.ojb.broker.PersistenceBrokerFactory;
import org.apache.ojb.broker.query.Criteria;
import org.apache.ojb.broker.query.Query;
import org.apache.ojb.broker.query.QueryByCriteria;

import com.amandris.clients.service.dao.BuyerDAO;
import com.amandris.clients.service.dao.SellerDAO;
import com.amandris.clients.service.vo.Buyer;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.exception.DataAccessErrorException;
import com.amandris.clients.util.mail.BuyerNewsletterMailObject;
import com.amandris.clients.util.mail.Mail;

public class SendBuyerNewsletter extends AbstractJob {

	public int execute()throws Exception 
	{
		BuyerDAO 					buyerDAO 					= new BuyerDAO();
		SellerDAO 					sellerDAO 					= new SellerDAO();
		Iterator 					iterator 					= null;
		Buyer						buyer						= null;
		Collection					sellerList					= null;		
		BuyerNewsletterMailObject	buyerNewsletterMailObject	= new BuyerNewsletterMailObject();
		String						text						= "";
		Locale 						locale 						= new Locale( "es");
		Criteria 					criteria					= new Criteria();
		PersistenceBroker 			broker 						= null;
		
		try {
			criteria.addNotEqualTo	( "id", 			new Integer( 0));
			criteria.addEqualTo		( "active",			new Integer( 1));
			criteria.addEqualTo		( "sendBulletin",	new Integer( 1));
			
			Query query = new QueryByCriteria( Buyer.class, criteria);
			
			broker = PersistenceBrokerFactory.defaultPersistenceBroker();
	
			iterator = broker.getIteratorByQuery( query);

			while(iterator.hasNext()){
				buyer = (Buyer) iterator.next();
				
				sellerList = sellerDAO.getSellerListForBuyer( buyer);
				
				if( sellerList.size() >= 1){
					buyerNewsletterMailObject.setBuyer				( buyer);
					buyerNewsletterMailObject.setSellerList			( sellerList);
					buyerNewsletterMailObject.setLocale				( locale);
					
					text = ConfigurationParameterManager.getMessages().getMessage( locale, "buyerNewsletterMailObject.subject", buyer.getLogin());
					
					Mail.sendMail( buyer.getEmail(), text, buyerNewsletterMailObject);
				}
			}
			
		}catch ( PersistenceBrokerException ex) {
			throw new DataAccessErrorException( Buyer.class.getName(), this.getClass().getName() + ".getBuyerToCensor()", ex);
		}finally {
			if ( broker != null) {
				broker.close();
			}
		}
		
		return 0;
	}
	
	public static void main(String[] args) {
		
		SendBuyerNewsletter instance = new SendBuyerNewsletter();
		
		try{
			instance.execute();
		}catch( Exception e) {
			e.printStackTrace();
		}
				
	}

}		
