package com.amandris.clients.util.mail;

import java.util.Locale;

import com.amandris.clients.service.vo.Buyer;
import com.amandris.clients.service.vo.Seller;
import com.amandris.clients.util.ConfigurationParameterManager;

public class ContactMessageMailObject {

	private Buyer 	buyer;
	private boolean fromBuyerToSeller;
	private String 	text;
	private Seller 	seller;
	private String 	date;
	private Locale 	locale;
	
	public ContactMessageMailObject( Locale theLocale)
	{
		buyer 			= null;
		seller 			= null;
		date			= "";
		locale			= theLocale;
		text			= "";
	}

	public String toString()
	{
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
		
		if( fromBuyerToSeller) {
			result.append( "<tr>");
			result.append( "<td align='center' style='font-family:arial; font-size:20;'>");
			result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "contactMessageMailObject.text1", seller.getLogin(), "htts://" + server + "/showBuyer.do?id=" + buyer.getId().toString(), buyer.getLogin(), date));
			result.append( "</td>"); 
			result.append( "</tr>");
		} else {
			result.append( "<tr>");
			result.append( "<td align='center' style='font-family:arial; font-size:20;'>");
			result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "contactMessageMailObject.text2", buyer.getLogin(), "htts://" + server + "/showSeller.do?id=" + seller.getId().toString(), seller.getLogin(), date));
			result.append( "</td>"); 
			result.append( "</tr>");
		}
		
		if( text != null && !text.equals( "")) {
			result.append( "<tr>");
			result.append( "<td align='center' style='font-family:arial; font-size:14; font-weight:bold;'>");
			result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "contactMessageMailObject.text3"));
			result.append( "</td>"); 
			result.append( "</tr>");
			
			result.append( "<tr>");
			result.append( "<td>");
			result.append( "<table width='100%' cellpadding='5' cellspacing='15' style='border-style: dashed;border-color: #909090;border-bottom-width:2px;border-top-width:2px;border-left-width:2px;border-right-width:2px;'>");
			result.append( "<tr>");
			result.append( "<td align='center' style='font-family:arial; font-size:14;'>");
			result.append( text);
			result.append( "</td>");
			result.append( "</tr>");
			result.append( "</table>");
			result.append( "</td>");
			result.append( "</tr>");
		}
		
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:14;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "contactMessageMailObject.text4", server));
		result.append( "</td>"); 
		result.append( "</tr>");
		
		result.append( "<tr>");
		result.append( "<td align='center'>");
		result.append( "<img src='http://" + server + "/pictures/contactDetail.gif' border='0'/>");
		result.append( "</td>");
		result.append( "</tr>");
		
		result.append( "<tr><td height='20'></td></tr>");
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:9;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "contactMessageMailObject.text5", server));
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

	public Locale getLocale() {
		return locale;
	}

	public void setLocale(Locale locale) {
		this.locale = locale;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Seller getSeller() {
		return seller;
	}

	public void setSeller(Seller seller) {
		this.seller = seller;
	}

	public boolean geFromBuyerToSeller() {
		return fromBuyerToSeller;
	}

	public void setFromBuyerToSeller(boolean fromBuyerToSeller) {
		this.fromBuyerToSeller = fromBuyerToSeller;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}


}
