package com.amandris.clients.job;

import java.util.Calendar;
import java.util.Iterator;
import java.util.Locale;

import org.apache.ojb.broker.PersistenceBroker;
import org.apache.ojb.broker.PersistenceBrokerException;
import org.apache.ojb.broker.PersistenceBrokerFactory;
import org.apache.ojb.broker.query.Criteria;
import org.apache.ojb.broker.query.Query;
import org.apache.ojb.broker.query.QueryByCriteria;

import com.amandris.clients.service.dao.BuyerDAO;
import com.amandris.clients.service.dao.ContactDAO;
import com.amandris.clients.service.dao.SellerDAO;
import com.amandris.clients.service.vo.Buyer;
import com.amandris.clients.service.vo.Contact;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.util.exception.DataAccessErrorException;
import com.amandris.clients.util.mail.Mail;
import com.amandris.clients.util.mail.VoteMailObject;

public class SendMailToVote extends AbstractJob {

	public int execute()throws Exception 
	{
		BuyerDAO 					buyerDAO 					= new BuyerDAO();
		SellerDAO 					sellerDAO 					= new SellerDAO();
		ContactDAO 					contactDAO 					= new ContactDAO();
		Iterator 					iterator 					= null;
		Buyer						buyer						= null;
		Contact						contact						= null;
		VoteMailObject				voteMailObject				= new VoteMailObject();
		String						text						= "";
		Locale 						locale 						= new Locale( "es");
		Criteria 					criteria					= new Criteria();
		PersistenceBroker 			broker 						= null;
		boolean						statusChanged				= false;
		
		try {
			criteria.addNotEqualTo	( "id", 			new Integer( 0));
			criteria.addLessThan	( "dateDate",		Calendar.getInstance( locale).getTime());
			criteria.addEqualTo		( "seller.active",	new Integer( 1));
			criteria.addEqualTo		( "buyer.active",	new Integer( 1));
			
			Query query = new QueryByCriteria( Contact.class, criteria);
			
			broker = PersistenceBrokerFactory.defaultPersistenceBroker();
	
			iterator = broker.getIteratorByQuery( query);

			while(iterator.hasNext()){
				contact = (Contact) iterator.next();
				
				System.out.println("--- se va a mirar la cita entre " + contact.getBuyer().getLogin() +  " y " + contact.getSeller().getLogin());
				
				if( DBUtils.getTimeFrom( contact.getDateDate(), locale, false) <= 0) {
					if ( contact.getPaymentStatusConst().intValue() == Constant.PAYMENT_STATUS_WAITING) {
						contact.setPaymentStatusConst	( new Integer( Constant.PAYMENT_STATUS_NOT_DONE));
						contact.setDateStatusConst		( new Integer( Constant.DATE_STATUS_NOT_DONE));
						contact.setVoteStatusConst		( new Integer( Constant.VOTE_STATUS_WAITING));
						contact.setSellerVoteStatusConst( new Integer( Constant.VOTE_STATUS_WAITING));
						statusChanged = true;
					}
					
					if(( contact.getPaymentStatusConst().intValue() == Constant.PAYMENT_STATUS_DONE) ||
					   ( contact.getPaymentStatusConst().intValue() == Constant.PAYMENT_STATUS_NOT_NEEDED)) { 
							if( ( contact.getDateStatusConst().intValue() == Constant.DATE_STATUS_WAITING) || ( contact.getDateStatusConst().intValue() == Constant.DATE_STATUS_NA)) {
								contact.setDateStatusConst( new Integer( Constant.DATE_STATUS_DONE));
								statusChanged = true;
							}
							
							if( contact.getVoteStatusConst().intValue() == Constant.VOTE_STATUS_NA) {
								contact.setVoteStatusConst		( new Integer( Constant.VOTE_STATUS_WAITING));
								contact.setSellerVoteStatusConst( new Integer( Constant.VOTE_STATUS_WAITING));
								statusChanged = true;
							}
					}
					
					if( contact.getPaymentStatusConst().intValue() == Constant.PAYMENT_STATUS_NA){
							contact.setMessageStatusConst( new Integer( Constant.MESSAGE_STATUS_NOT_REPLIED));
							contact.setDateStatusConst( new Integer( Constant.DATE_STATUS_NOT_DONE));
							contact.setPaymentStatusConst( new Integer( Constant.PAYMENT_STATUS_NOT_DONE));
							contact.setVoteStatusConst( new Integer( Constant.VOTE_STATUS_NA));
							contact.setVoteStatusConst( new Integer( Constant.VOTE_STATUS_NA));
							statusChanged = true;
							
							contact.getSeller().setContactsNotReplied( new Integer( contact.getSeller().getContactsNotReplied().intValue() + 1));
							sellerDAO.setSeller( contact.getSeller());
							
							contact.getBuyer().setContactsNotReplied( new Integer( contact.getBuyer().getContactsNotReplied().intValue() + 1));
							buyerDAO.setBuyer( contact.getBuyer());
					}
					
					if( statusChanged == true){
						System.out.println("---Se cambia el contact");
						
						contactDAO.setContact( contact);
					}
					
					
					if( contact.getVoteStatusConst().intValue() == Constant.VOTE_STATUS_WAITING){
						voteMailObject.setIsBuyer				( true);
						voteMailObject.setContact				( contact);
						voteMailObject.setLocale				( locale);
						
						text = ConfigurationParameterManager.getMessages().getMessage( locale, "voteMailObject.subject", contact.getBuyer().getLogin());
						
						if( contact.getSeller().getActive().intValue() == 1 && contact.getBuyer().getActive().intValue() == 1){
							if( !contact.getSeller().getEmail().equals("no-reply@amandris.com") && !contact.getBuyer().getEmail().equals("no-reply@amandris.com")){
								System.out.println("--Se envia el mail a "+ contact.getBuyer().getEmail());
								Mail.sendMail( contact.getBuyer().getEmail(), text, voteMailObject);
							}
						}
					}
					
					if( contact.getSellerVoteStatusConst().intValue() == Constant.VOTE_STATUS_WAITING){
						voteMailObject.setIsBuyer				( false);
						voteMailObject.setContact				( contact);
						voteMailObject.setLocale				( locale);
						
						text = ConfigurationParameterManager.getMessages().getMessage( locale, "voteMailObject.subject", contact.getSeller().getLogin());
						
						if( contact.getSeller().getActive().intValue() == 1 && contact.getBuyer().getActive().intValue() == 1){
							if( !contact.getSeller().getEmail().equals("no-reply@amandris.com") && !contact.getBuyer().getEmail().equals("no-reply@amandris.com")){
								System.out.println("--Se envia el mail a "+ contact.getSeller().getEmail());
								Mail.sendMail( contact.getSeller().getEmail(), text, voteMailObject);
							}
						}
					}
				}
			}
			
		}catch ( PersistenceBrokerException ex) {
			throw new DataAccessErrorException( Buyer.class.getName(), this.getClass().getName() + ".sendMailToVote()", ex);
		}finally {
			if ( broker != null) {
				broker.close();
			}
		}
		
		return 0;
	}
	
	public static void main(String[] args) {
		
		SendMailToVote instance = new SendMailToVote();
		
		try{
			instance.execute();
		}catch( Exception e) {
			e.printStackTrace();
		}
				
	}

}		
