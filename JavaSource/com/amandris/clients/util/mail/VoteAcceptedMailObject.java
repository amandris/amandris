package com.amandris.clients.util.mail;

import java.util.Locale;

import com.amandris.clients.service.vo.Buyer;
import com.amandris.clients.service.vo.Seller;
import com.amandris.clients.util.ConfigurationParameterManager;

public class VoteAcceptedMailObject {

	private String 	text;
	private String 	answer;
	private Seller	seller;
	private Buyer	buyer;
	private boolean isVoteToBuyer;
	private int 	vote;
	private Locale 	locale;
	
	public VoteAcceptedMailObject( )
	{
		text 			= "";
		answer			= "";
		buyer			= null;
		seller			= null;
		isVoteToBuyer 	= false;
		locale			= null;
		vote			= 0;
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
		
		if( answer == null || answer.equals( "")){
			if( isVoteToBuyer && vote == 1) {
				result.append( "<tr>");
				result.append( "<td align='center' style='font-family:arial; font-size:20;'>");
				result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "voteAcceptedMailObject.text1", buyer.getLogin(), "http://" + server + "/showSeller.do?id=" + seller.getId(), seller.getLogin()));
				result.append( "</td>"); 
				result.append( "</tr>");
			} else if( isVoteToBuyer && vote == -1) {
				result.append( "<tr>");
				result.append( "<td align='center' style='font-family:arial; font-size:20;'>");
				result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "voteAcceptedMailObject.text2", buyer.getLogin(), "http://" + server + "/showSeller.do?id=" + seller.getId(), seller.getLogin()));
				result.append( "</td>"); 
				result.append( "</tr>");
			} else if( !isVoteToBuyer && vote == 1) {
				result.append( "<tr>");
				result.append( "<td align='center' style='font-family:arial; font-size:20;'>");
				result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "voteAcceptedMailObject.text3", seller.getLogin(), "http://" + server + "/showBuyer.do?id=" + buyer.getId(), buyer.getLogin()));
				result.append( "</td>"); 
				result.append( "</tr>");
			} else if( !isVoteToBuyer && vote == -1) {
				result.append( "<tr>");
				result.append( "<td align='center' style='font-family:arial; font-size:20;'>");
				result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "voteAcceptedMailObject.text4", seller.getLogin(), "http://" + server + "/showBuyer.do?id=" + buyer.getId(), buyer.getLogin()));
				result.append( "</td>"); 
				result.append( "</tr>");
			}
		} else if( !answer.equals( "")){
			if( isVoteToBuyer ) {
				result.append( "<tr>");
				result.append( "<td align='center' style='font-family:arial; font-size:20;'>");
				result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "voteAcceptedMailObject.text5", seller.getLogin(), "http://" + server + "/showBuyer.do?id=" + buyer.getId(), buyer.getLogin()));
				result.append( "</td>"); 
				result.append( "</tr>");
			} else {
				result.append( "<tr>");
				result.append( "<td align='center' style='font-family:arial; font-size:20;'>");
				result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "voteAcceptedMailObject.text6", buyer.getLogin(), "http://" + server + "/showSeller.do?id=" + seller.getId(), seller.getLogin()));
				result.append( "</td>"); 
				result.append( "</tr>");
			}
		}
		
		if( text != null && !text.equals( "")) {
			result.append( "<tr>");
			result.append( "<td align='center' style='font-family:arial; font-size:14; font-weight:bold;'>");
			result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "voteAcceptedMailObject.text7"));
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
		
		if( answer != null && !text.equals( "")) {
			result.append( "<tr>");
			result.append( "<td align='center' style='font-family:arial; font-size:14; font-weight:bold;'>");
			result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "voteAcceptedMailObject.text8"));
			result.append( "</td>"); 
			result.append( "</tr>");
			
			result.append( "<tr>");
			result.append( "<td>");
			result.append( "<table width='100%' cellpadding='5' cellspacing='15' style='border-style: dashed;border-color: #909090;border-bottom-width:2px;border-top-width:2px;border-left-width:2px;border-right-width:2px;'>");
			result.append( "<tr>");
			result.append( "<td align='center' style='font-family:arial; font-size:14;'>");
			result.append( answer);
			result.append( "</td>");
			result.append( "</tr>");
			result.append( "</table>");
			result.append( "</td>");
			result.append( "</tr>");
		}
		
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:14;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "voteAcceptedMailObject.text9", server));
		result.append( "</td>"); 
		result.append( "</tr>");
		result.append( "<tr><td height='30'></td></tr>");
		result.append( "<tr>");
		result.append( "<td align='center' style='font-family:arial; font-size:9;'>");
		result.append( ConfigurationParameterManager.getMessages().getMessage( locale, "voteAcceptedMailObject.text10", server));
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


	public boolean getIsVoteToBuyer() {
		return isVoteToBuyer;
	}

	public void setIsVoteToBuyer(boolean isVoteToBuyer) {
		this.isVoteToBuyer = isVoteToBuyer;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Locale getLocale() {
		return locale;
	}

	public void setLocale(Locale locale) {
		this.locale = locale;
	}

	public int getVote() {
		return vote;
	}

	public void setVote(int vote) {
		this.vote = vote;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Buyer getBuyer() {
		return buyer;
	}

	public void setBuyer(Buyer buyer) {
		this.buyer = buyer;
	}

	public Seller getSeller() {
		return seller;
	}

	public void setSeller(Seller seller) {
		this.seller = seller;
	}
	
	
}
