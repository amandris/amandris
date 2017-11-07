package com.amandris.clients.util.mail;

import java.util.Locale;

import com.amandris.clients.service.vo.Contact;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.DBUtils;

public class VoteMailObject {

	private Contact contact;
	private boolean isBuyer;
	private Locale 	locale;
	
	public VoteMailObject( )
	{
		contact 		= null;
		isBuyer 		= false;
		locale			= null;
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
		
		if( isBuyer) {
			result.append( "<tr>");
			result.append( "<td align='center' style='font-family:arial; font-size:20;'>");
			result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "voteMailObject.text1", contact.getBuyer().getLogin(), DBUtils.getDate( contact.getDateDate(), 4), "http://" + server + "/showSeller.do?id=" + contact.getSeller().getId(), contact.getSeller().getLogin()));
			result.append( "</td>"); 
			result.append( "</tr>");
		} else {
			result.append( "<tr>");
			result.append( "<td align='center' style='font-family:arial; font-size:20;'>");
			result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "voteMailObject.text2", contact.getSeller().getLogin(), DBUtils.getDate( contact.getDateDate(), 4), "http://" + server + "/showBuyer.do?id=" + contact.getBuyer().getId(), contact.getBuyer().getLogin()));
			result.append( "</td>"); 
			result.append( "</tr>");
		}
		
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:14;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "voteMailObject.text3", server));
		result.append( "</td>"); 
		result.append( "</tr>");
		result.append( "<tr><td height='30'></td></tr>");
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:9;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "voteMailObject.text4", server));
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

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public boolean getIsBuyer() {
		return isBuyer;
	}

	public void setIsBuyer(boolean isBuyer) {
		this.isBuyer = isBuyer;
	}

	public Locale getLocale() {
		return locale;
	}

	public void setLocale(Locale locale) {
		this.locale = locale;
	}
	
}
