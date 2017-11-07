package com.amandris.clients.util.mail;

import java.util.Locale;

import com.amandris.clients.util.ConfigurationParameterManager;

public class RecommendationMailObject {

	private String name;
	private String mail;
	private String message;
	private Locale locale;
	
	public RecommendationMailObject( Locale theLocale)
	{
		name 	= "";
		mail	= "";
		message	= "";
		locale	= theLocale;
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
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:20;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "recommendationMailObject.text1", name, server));
		result.append( "</td>");
		result.append( "</tr>");
		
		if( message != null && !message.equals( "")) {
			result.append( "<tr>");
			result.append( "<td>");
			result.append( "<table width='100%' cellpadding='5' cellspacing='15' style='border-style: dashed;border-color: #909090;border-bottom-width:2px;border-top-width:2px;border-left-width:2px;border-right-width:2px;'>");
			result.append( "<tr>");
			result.append( "<td align='center' style='font-family:arial; font-size:12;'>");
			result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "recommendationMailObject.text2", name) + "<p>" + message);
			result.append( "</td>");
			result.append( "</tr>");
			result.append( "</table>");
			result.append( "</td>");
			result.append( "</tr>");
		}
		
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:14;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "recommendationMailObject.text3", server));
		result.append( "</td>");
		result.append( "</tr>");
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:14;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "recommendationMailObject.text4", server));
		result.append( "</td>");
		result.append( "</tr>");
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:14;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "recommendationMailObject.text5", server));
		result.append( "</td>");
		result.append( "</tr>");
		result.append( "<tr><td height='30'></td></tr>");
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:9;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "recommendationMailObject.text6", server));
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
	
	
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public Locale getLocale() {
		return locale;
	}

	public void setLocale(Locale locale) {
		this.locale = locale;
	}
	
	 
	
	
}
