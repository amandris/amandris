package com.amandris.clients.util.mail;

import java.util.Collection;
import java.util.Iterator;
import java.util.Locale;

import com.amandris.clients.service.vo.Buyer;
import com.amandris.clients.service.vo.Seller;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.translator.SellerToSellerViewSmallTranslator;
import com.amandris.clients.web.view.SellerViewSmall;

public class BuyerNewsletterMailObject {

	private Buyer 		buyer;
	private Collection 	sellerList;
	private Locale		locale;
	

	public BuyerNewsletterMailObject( )
	{
		buyer 			= null;
		sellerList		= null;
	}

	public String toString()
	{
		Seller 			seller 			= null;
		SellerViewSmall sellerViewSmall = null;
		int				count 			= 0;
		
		
		StringBuffer 	result 	= new StringBuffer( "");
		String			server	= ConfigurationParameterManager.getParameterString( "serverName") + ConfigurationParameterManager.getParameterString( "serverPath");
		
		result.append( "<html>");
		result.append( "<head>");
		result.append( "</head>");
		result.append( "<body>");
		result.append( "<table width='100%' cellpadding='0' cellspacing='0' border='0'>");
		result.append( "<tr>");
		result.append( "<td align='center'>");
		result.append( "<a href='http://" + server + "'><img src='http://" + server + "/pictures/logo.gif' border='0'/></a>");
		result.append( "</td>");
		result.append( "</tr>");
		result.append( "<tr>");
		result.append( "<td>");
		result.append( "<table width='100%' cellpadding='0' cellspacing='15' border='0'>");
		
		
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:20;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( "buyerNewsletterMailObject.text1", buyer.getLogin(), server));
		result.append( "</td>"); 
		result.append( "</tr>");
		
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:14;'>");


		result.append( "<table cellpadding='0' cellspacing='3' border='0' >");
		Iterator iterator = sellerList.iterator();
		while( iterator.hasNext()){
			seller = ( Seller) iterator.next();
			
			SellerToSellerViewSmallTranslator translator = new SellerToSellerViewSmallTranslator();
			translator.setLocale( locale);
			translator.setObject( seller);
			try{
				sellerViewSmall = ( SellerViewSmall) translator.translateView();
			}catch( Exception e) {
				e.printStackTrace();
			}
			
			if( count ==0 ){
				result.append( "<tr valign='top'>");
			}
			result.append( "<td>");
			result.append( "<table cellpadding='0' cellspacing='3' border='0' >");
			result.append( "<tr>");
			result.append( "<td valign='top'>");
			if( sellerViewSmall.getHasPicture().equals( "1")){
				result.append( "<img src='http://" + server + "/media/pictures/smaller/seller_" + sellerViewSmall.getId() + "_" + sellerViewSmall.getMainPicture() + "_" + sellerViewSmall.getMainPictureCode() + ".jpg'/>");
			}

			if( !sellerViewSmall.getHasPicture().equals( "1")){
				if( sellerViewSmall.getSexId().equals( "1")){
					result.append( "<img src='http://" + server + "/pictures/defaultGirl.gif'/>");
				}
				if( sellerViewSmall.getSexId().equals( "2")){
					result.append( "<img src='http://" + server + "/pictures/defaultBoy.gif'/>");
				}
				if( sellerViewSmall.getSexId().equals( "4")){
					result.append( "<img src='http://" + server + "/pictures/defaultShemale.gif'/>");
				}
				if( sellerViewSmall.getSexId().equals( "8")){
					result.append( "<img src='http://" + server + "/pictures/defaultBoysCouple.gif'/>");
				}
				if( sellerViewSmall.getSexId().equals( "16")){
					result.append( "<img src='http://" + server + "/pictures/defaultGirlsCouple.gif'/>");
				}
				if( sellerViewSmall.getSexId().equals( "32")){
					result.append( "<img src='http://" + server + "/pictures/defaultBoyAndGirlCouple.gif'/>");
				}
				if( sellerViewSmall.getSexId().equals( "64")){
					result.append( "<img src='http://" + server + "/pictures/defaultGroup.gif'/>");
				}
			}
			
			result.append( "</td>");
			result.append( "<td align='left' width='80' valign='top'>");
			result.append( "<table cellpadding='0' cellspacing='0' border='0' align='left'>");
			result.append( "<tr align='left'>");
			result.append( "<td nowrap style='FONT-WEIGHT: normal; FONT-SIZE: 10px; COLOR: #333333; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; ' align='left'>");
			result.append( "<a href='http://" + server + "/showSeller.do?id=" + sellerViewSmall.getId() + "' style='FONT-WEIGHT: normal; FONT-SIZE: 10px; COLOR: #6666aa; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif;TEXT-DECORATION: underline'>");
			result.append( sellerViewSmall.getLogin());
			result.append( "</a>");
			result.append( "</td>");
			result.append( "</tr>");
			result.append( "<tr align='left'>");
			result.append( "<td style='FONT-WEIGHT: normal; FONT-SIZE: 10px; COLOR: #333333; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; ' align='left'>");
			result.append( sellerViewSmall.getSex());
			result.append( "</td>");
			result.append( "</tr>");
			result.append( "<tr align='left'>");
			result.append( "<td nowrap style='FONT-WEIGHT: normal; FONT-SIZE: 10px; COLOR: #333333; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; ' align='left'>");
			result.append( sellerViewSmall.getAge());
			result.append( "</td>");
			result.append( "</tr>");
			result.append( "<tr align='left'>");
			result.append( "<td nowrap style='FONT-WEIGHT: normal; FONT-SIZE: 10px; COLOR: #333333; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; ' align='left'>");
			result.append( sellerViewSmall.getBriefCity());
			result.append( "</td>");
			result.append( "</tr>");										  					
			result.append( "<tr align='left'>");
			result.append( "<td nowrap style='FONT-WEIGHT: normal; FONT-SIZE: 10px; COLOR: #333333; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; ' align='left'>");
			result.append( sellerViewSmall.getState());
			result.append( "</td>");
			result.append( "</tr>");
			result.append( "<tr align='left'>");
			result.append( "<td nowrap style='FONT-WEIGHT: normal; FONT-SIZE: 10px; COLOR: #333333; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; ' align='left'>");
			result.append( sellerViewSmall.getCountry());
			result.append( "</td>");
			result.append( "</tr>");
			result.append( "</table>");
			result.append( "</td>");
			result.append( "</tr>");
			result.append( "</table>");
			result.append( "</td>");
			if( count ==2 ){
				count = 0;
				result.append( "</tr>");
			}else{
				count ++;
			}
		}
		
		result.append( "</table>");
		result.append( "</td>"); 
		result.append( "</tr>");
		result.append( "<tr><td height='30'></td></tr>");
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:9;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "buyerNewsletterMailObject.text2", server));
		result.append( "</td>");
		result.append( "</tr>");
		result.append( "</table>");
		result.append( "</td>");
		result.append( "</tr>");
		result.append( "</table>"); 
		result.append( "</body>");
		result.append( "</html>");
		
		return result.toString();
	}

	public Buyer getBuyer() {
		return buyer;
	}

	public void setBuyer(Buyer buyer) {
		this.buyer = buyer;
	}

	public Collection getSellerList() {
		return sellerList;
	}

	public void setSellerList(Collection sellerList) {
		this.sellerList = sellerList;
	}
	
	
	public Locale getLocale() {
		return locale;
	}

	public void setLocale(Locale locale) {
		this.locale = locale;
	}


	
	 
	
	
}
