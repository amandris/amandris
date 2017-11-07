package com.amandris.clients.util.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.struts.util.MessageResources;

import com.amandris.clients.service.facade.UtilFacade;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.util.CountryState;
import com.amandris.clients.web.view.CountryView;
import com.amandris.clients.web.view.StateView;

public class IndexCountryStateTag extends TagSupport{
	
	protected String styleClass = "";
	protected String name 		= "";
	protected String countryKey = "";
	protected String stateKey 	= "";
	protected String withAny	= "";
	protected String inHome		= ""; 
	

	public int doStartTag() throws JspException {

		return (EVAL_BODY_INCLUDE);
	}

	public int doEndTag() throws JspException {
        String 				string 			= "";
        String 				firstCountryId 	= "";
		CountryState  		countryState 	= null;		
		CountryView			countryView 	= null;
		StateView			stateView  		= null;
		Iterator 			countryIterator	= null;
		Iterator 			stateIterator	= null;
		boolean 			isFirst 		= true;
		int 				index 			= 1;
		boolean				withAnyBoolean	= ! withAny.equalsIgnoreCase( "false");
		boolean				inHomeBoolean	= ! withAny.equalsIgnoreCase( "false");
		MessageResources 	messages 		= ConfigurationParameterManager.getMessages();
		UtilFacade			utilFacade		= UtilFacade.getInstance();
		        
        HttpServletRequest 	request =( HttpServletRequest) pageContext.getRequest();
        HttpSession 		session = request.getSession();
        Locale				locale 	= request.getLocale();
        
        countryState = ( CountryState)session.getAttribute( name);
        
        if ( countryState == null){
        	try{
        		countryState = utilFacade.getCountryState( false, locale);
        	} catch ( Exception e){}
        	
			countryState.setLocale( locale);
			if( locale != null) {
				countryState.setSelectedCountry	( new Integer( 70));
				countryState.setSelectedState( new Integer( 0));
			}
			
			session.setAttribute( Constant.COUNTRY_STATE_OBJECT_NAME, countryState);
        }
        
        string = string.concat( "<script language='javascript' type='text/javascript'>\r\n");
        string = string.concat( "function ss(i,v,t){document.getElementById('state').options[i]=new Option(t,v);}\r\n");
        string = string.concat( "function changeState(){\r\n");
        string = string.concat( "var userAgent=navigator.appName + ' ' + navigator.appVersion;\r\n");
        string = string.concat( "var agentInfo=userAgent.substring(0,5);\r\n");
        string = string.concat( "if(agentInfo=='WebTV'){return true;}\r\n");
        string = string.concat( "v=document.getElementById('country').value;\r\n");
        
        countryIterator = countryState.getCountry().iterator();
        while( countryIterator.hasNext()){
        	countryView = ( CountryView) countryIterator.next();
        	
        	string = string.concat( "if(v=='" + countryView.getId() + "'){var varState=document.getElementById('state');varState.options.length=0;varState.selectedIndex=-1;\r\n");
            
            if( withAnyBoolean) {
            	string = string.concat( "varState.options[0]=new Option('" + messages.getMessage( countryState.getLocale(), "common.any") + "',0);");
            	index = 1;
            } else {
            	index = 0;
            }
            
            stateIterator = countryView.getStates().iterator();
            
            while( stateIterator.hasNext()){
            	stateView = (StateView) stateIterator.next();
            	string = string.concat( "ss(" + index + ",'" + stateView.getId()+ "','" + stateView.getText() + "');\r\n");
            	index ++;
            }

            string = string.concat( "}\r\n");	
        }
        string = string.concat( "}\r\n");
        string = string.concat( "</script>\r\n");
        
        if( inHomeBoolean){
        	string = string.concat( "<label><span class='labelwidth'>\r\n");
        } else{
        	string = string.concat( "<tr><td><table cellpadding='0' cellspacing='0' border='0'><tr><td align='right' class='text1' width='65'>\r\n");
        }
        
        string = string.concat( messages.getMessage( countryState.getLocale(), countryKey) + "&nbsp;\r\n");
        
        if( inHomeBoolean){
        	string = string.concat( "</span><select name='country' onchange='changeState();'>\r\n");
        } else{
        	string = string.concat( "</td><td><select name='country' id='country' class='" + styleClass + "' onchange='changeState();'>\r\n");
        }
        
        isFirst = true;
        
        countryIterator = countryState.getCountry().iterator();
        
        while( countryIterator.hasNext()){
        	countryView = ( CountryView) countryIterator.next();
        	
        	if( isFirst)
        		firstCountryId = countryView.getId();
        	
        	if( countryState.getSelectedCountry() != null) {
        		string = string.concat( "<option value='" + countryView.getId() + "' " + ( countryState.getSelectedCountry().toString().equals( countryView.getId())? "selected":"")+ ">" + countryView.getText() + "</option>\r\n");
        		firstCountryId = countryState.getSelectedCountry().toString();
        	} else {
        		string = string.concat( "<option value='" + countryView.getId() + "' " + ( isFirst? "selected":"")+ ">" + countryView.getText() + "</option>\r\n");
        	}
        	
        	isFirst = false;
        }
        
        string = string.concat( "</select>\r\n");
        
        if(inHomeBoolean){
        	string = string.concat( "</label><label><span class='labelwidth'>\r\n");
        } else {
        	string = string.concat( "</td></tr></table></td></tr><tr><td height='8'></td></tr><tr><td><table cellpadding='0' cellspacing='0' border='0'><tr><td align='right' class='text1' width='65'>\r\n");
        }
        string = string.concat( messages.getMessage( countryState.getLocale(), stateKey) + "&nbsp;\r\n");
        if(inHomeBoolean){
        	string = string.concat( "</span><select name='state'>\r\n");
        } else{
        	string = string.concat( "</td><td><select name='state' id='state' class='" + styleClass + "'>\r\n");
        }
        
        if( withAnyBoolean)
        	string = string.concat( "<option value='0'>" + messages.getMessage( countryState.getLocale(), "common.any") + "</option>");
        	
        isFirst = false;
        
        stateIterator = getCountryViewById( countryState.getCountry(), firstCountryId).getStates().iterator();
        
        while( stateIterator.hasNext()){
        	stateView = ( StateView) stateIterator.next();
        	
        	if( countryState.getSelectedCountry() != null)
            	string = string.concat( "<option value='" + stateView.getId() + "' " + ( countryState.getSelectedState().toString().equals( stateView.getId())? "selected":"")+ ">" + stateView.getText() + "</option>");
        	else
        		string = string.concat( "<option value='" + stateView.getId() + "' " + ( isFirst? "selected":"") + ">" + stateView.getText() + "</option>\r\n");
        }
        if( inHomeBoolean){
        	string = string.concat( "</select></label>\r\n");
        } else{
        	string = string.concat( "</select></td></tr></table></td></tr>\r\n");
        }
        
        JspWriter writer = pageContext.getOut();
        
        try {
            writer.print(string);
        } catch ( IOException e) {
            throw new JspException( "Error PagerTag" + e.toString());
        }

	return ( EVAL_PAGE);

	}

	private CountryView getCountryViewById( Collection countryCollection, String countryId)
	{
		Iterator 	countryIterator = countryCollection.iterator();
		ArrayList 	Result 			= new ArrayList();
		CountryView countryView 	= null;
		
		while( countryIterator.hasNext()){
			countryView = ( CountryView) countryIterator.next();
			
			if( countryView.getId().equals( countryId))
				return countryView;
		}
		
		return null;
	}
	

	public void release() {

		styleClass 	= "";
		name 		= "";
		countryKey 	= "";
		stateKey 	= "";
		withAny		= "";
		inHome		= "";
	}

	public String getCountryKey() {
		return countryKey;
	}

	public void setCountryKey(String countryKey) {
		this.countryKey = countryKey;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStateKey() {
		return stateKey;
	}

	public void setStateKey(String stateKey) {
		this.stateKey = stateKey;
	}

	public String getStyleClass() {
		return styleClass;
	}

	public void setStyleClass(String styleClass) {
		this.styleClass = styleClass;
	}

	public String getWithAny() {
		return withAny;
	}

	public void setWithAny(String withAny) {
		this.withAny = withAny;
	}

	public String getInHome() {
		return inHome;
	}

	public void setInHome(String inHome) {
		this.inHome = inHome;
	}
	
	


}
