package com.amandris.clients.util.mail;

import java.util.Locale;

import com.amandris.clients.util.ConfigurationParameterManager;

public class RegisterSellerMailObject {

	private String login;
	private String activationCode;
	private Integer id;
	private Locale locale;
	
	public RegisterSellerMailObject( Locale theLocale)
	{
		login 	= "";
		activationCode	= "";
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
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "registerSellerMailObject.text1"));
		result.append( "</td>");
		result.append( "</tr>");
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:14;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "registerSellerMailObject.text2"));
		result.append( "</td>");
		result.append( "</tr>");
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:16;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "registerSellerMailObject.text3", "http://" + server + "/" + ConfigurationParameterManager.getParameterString( "sellerRegisterMailAction") + activationCode + "&login=" + login + "&id=" + id.intValue()  ));
		result.append( "</td>");
		result.append( "</tr>");
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:14;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "registerSellerMailObject.text4"));
		result.append( "</td>");
		result.append( "</tr>");
		result.append( "<tr><td height='20'></td></tr>");
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:14;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "registerSellerMailObject.text5"));
		result.append( "</td>");
		result.append( "</tr>");
		result.append( "<tr><td height='30'></td></tr>");
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:9;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "registerSellerMailObject.text6", server));
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
	



	public String getActivationCode() {
		return activationCode;
	}

	public void setActivationCode(String activationCode) {
		this.activationCode = activationCode;
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

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	
}
