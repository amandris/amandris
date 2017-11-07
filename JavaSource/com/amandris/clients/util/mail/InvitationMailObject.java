package com.amandris.clients.util.mail;

import java.util.Locale;

import com.amandris.clients.util.ConfigurationParameterManager;

public class InvitationMailObject {

	private String 	login;
	private String 	buyerLogin;
	private String 	id;
	private boolean isFreeContact;
	private String 	date;
	private Locale 	locale;
	
	public InvitationMailObject( Locale theLocale)
	{
		login 			= "";
		buyerLogin		= "";
		id 				= "";
		isFreeContact 	= false;
		date			= "";
		locale			= theLocale;
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
		
		if( !isFreeContact) {
			result.append( "<tr>");
			result.append( "<td align='center' style='font-family:arial; font-size:20;'>");
			result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "invitationMailObject.text1", buyerLogin, "http://" + server + "/showSeller.do?id=" + id, login));
			result.append( "</td>"); 
			result.append( "</tr>");
		} else {
			result.append( "<tr>");
			result.append( "<td align='center' style='font-family:arial; font-size:14;'>");
			result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "invitationMailObject.text2", buyerLogin, "http://" + server + "/showSeller.do?id=" + id, login));
			result.append( "</td>");
			result.append( "</tr>");
		}
		
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:14;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "invitationMailObject.text3", server));
		result.append( "</td>");
		result.append( "</tr>");
		result.append( "<tr><td height='30'></td></tr>");
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:9;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "invitationMailObject.text4", server));
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
	
	
	

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
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

	public boolean getIsFreeContact() {
		return isFreeContact;
	}

	public void setIsFreeContact(boolean isFreeContact) {
		this.isFreeContact = isFreeContact;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBuyerLogin() {
		return buyerLogin;
	}

	public void setBuyerLogin(String buyerLogin) {
		this.buyerLogin = buyerLogin;
	}
	
	 
	
	
}
