package com.amandris.clients.util.mail;

import java.util.Locale;

import com.amandris.clients.util.ConfigurationParameterManager;

public class ResetPasswordMailObject {

	private String login;
	private String code;
	private boolean isBuyer;
	private Locale locale;
	
	public ResetPasswordMailObject( Locale theLocale)
	{
		login 	= "";
		code	= "";
		isBuyer	= true;
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
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "resetPasswordMailObject.text1"));
		result.append( "</td>");
		result.append( "</tr>");
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:14;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "resetPasswordMailObject.text2"));
		result.append( "</td>");
		result.append( "</tr>");
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:16;'>");
		if( isBuyer)
			result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "resetPasswordMailObject.text3", "http://"+server+"/setBuyerPasswordReset.do?login=" + login + "&code=" + code));
		else
			result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "resetPasswordMailObject.text3", "http://"+server+"/setSellerPasswordReset.do?login=" + login + "&code=" + code));
		result.append( "</td>");
		result.append( "</tr>");
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:14;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "resetPasswordMailObject.text4"));
		result.append( "</td>");
		result.append( "</tr>");
		result.append( "<tr><td height='30'></td></tr>");
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:9;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "resetPasswordMailObject.text5", server));
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
	

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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

	public boolean getIsBuyer() {
		return isBuyer;
	}

	public void setIsBuyer(boolean isBuyer) {
		this.isBuyer = isBuyer;
	}
	
	 
	
	
}
