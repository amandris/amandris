package com.amandris.clients.util.mail;

import java.util.Locale;

import com.amandris.clients.util.ConfigurationParameterManager;

public class AdminMessageMailObject {

	private String 	login;
	private boolean isBuyer;
	private String 	subject;
	private String 	text;
	private Locale 	locale;
	
	public AdminMessageMailObject( )
	{
		login 			= null;
		isBuyer 		= false;
		subject			= null;
		text			= null;
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
			result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "adminMessageMailObject.text1", login));
			result.append( "</td>"); 
			result.append( "</tr>");
		} else {
			result.append( "<tr>");
			result.append( "<td align='center' style='font-family:arial; font-size:20;'>");
			result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "adminMessageMailObject.text2", login));
			result.append( "</td>"); 
			result.append( "</tr>");
		}
		
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:14;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "adminMessageMailObject.text3", server));
		result.append( "</td>"); 
		result.append( "</tr>");
		
		if( text != null && !text.equals( "")) {
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
		
		
		result.append( "<tr><td height='30'></td></tr>");
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:9;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "contactMessageMailObject.text4", server));
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

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
}
