package com.amandris.clients.util.mail;

import java.util.Locale;

import com.amandris.clients.util.ConfigurationParameterManager;

public class PictureDenyMailObject {

	private String 	login;
	private String 	index;
	private boolean isBuyer;
	private Locale 	locale;
	
	public PictureDenyMailObject( Locale theLocale)
	{
		login 			= "";
		index 			= "";
		isBuyer 		= false;
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
		
		if( isBuyer) {
			result.append( "<tr>");
			result.append( "<td align='center' style='font-family:arial; font-size:20;'>");
			result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "pictureDenyMailObject.text1", login, index));
			result.append( "</td>"); 
			result.append( "</tr>");
		} else {
			result.append( "<tr>");
			result.append( "<td align='center' style='font-family:arial; font-size:20;'>");
			result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "pictureDenyMailObject.text2", login, index));
			result.append( "</td>");
			result.append( "</tr>");
		}
		
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:14;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "pictureDenyMailObject.text3", server + "/showPictureRules.do"));
		result.append( "</td>");
		result.append( "</tr>");
		result.append( "<tr><td height='20'></td></tr>");
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:14;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "pictureDenyMailObject.text4", server));
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

	public String getIndex() {
		return index;
	}

	public void setIndex(String index) {
		this.index = index;
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
	
	
	
}
