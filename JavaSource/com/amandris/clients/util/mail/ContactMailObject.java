package com.amandris.clients.util.mail;

import java.util.Locale;

import com.amandris.clients.util.ConfigurationParameterManager;

public class ContactMailObject {

	private String 	login;
	private String 	seller;
	private String 	id;
	private boolean isPublic;
	private String 	date;
	private Locale 	locale;
	private String 	text;
	
	public ContactMailObject( Locale theLocale)
	{
		login 			= "";
		seller			= "";
		id 				= "";
		isPublic 		= false;
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
		
		if( isPublic) {
			result.append( "<tr>");
			result.append( "<td align='center' style='font-family:arial; font-size:20;'>");
			result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "contactMailObject.text1", seller, "http://" + server + "/showBuyer.do?id=" + id, login, date));
			result.append( "</td>"); 
			result.append( "</tr>");
		} else {
			result.append( "<tr>");
			result.append( "<td align='center' style='font-family:arial; font-size:14;'>");
			result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "contactMailObject.text2", seller, date));
			result.append( "</td>");
			result.append( "</tr>");
		}
		
		if( text != null && !text.equals( "")) {
			result.append( "<tr>");
			result.append( "<td align='center' style='font-family:arial; font-size:14; font-weight:bold;'>");
			result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "contactMailObject.text3"));
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
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "contactMailObject.text4", server));
		result.append( "</td>");
		result.append( "</tr>");

		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:14; font-weight:bold;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "contactMailObject.text5", server));
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
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "contactMailObject.text6", server));
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

	public boolean getIsPublic() {
		return isPublic;
	}

	public void setIsPublic(boolean isPublic) {
		this.isPublic = isPublic;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}
	 
	
	
}
