package com.amandris.clients.util.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.amandris.clients.web.util.PagerForm;

public class PagerTag extends TagSupport{
	
	protected String 	styleClass = "";
	protected String 	name = "";
	protected int 		maxPages = 7;
	protected String 	previousImageOn= "";
	protected String 	previousImageOff= "";
	protected String 	nextImageOn= "";
	protected String 	nextImageOff= "";
	protected String 	action= "";
	
	public int doStartTag() throws JspException 
	{
		return ( EVAL_BODY_INCLUDE);
	}


	public int doEndTag() throws JspException 
	{
        String 		HtmlString 	= "";
		int 		PagesCount 	= 0;
		int 		FirstPage 	= 0;
		int 		LastPage 	= 0;
		boolean 	Previous 	= false;
		boolean 	Next 		= false;
		int 		Count 		= 1;
		int 		Page 		= 1;
		        
        HttpServletRequest 	request 	= ( HttpServletRequest) pageContext.getRequest();
        HttpSession 		session 	= request.getSession();
        PagerForm 			pagerForm 	= ( PagerForm)session.getAttribute(name);

        if ( pagerForm == null){
			throw new JspException ( "Not found session object " + name);
        }
        
		try {        
        	Page 	= pagerForm.getPage();
			Count 	= pagerForm.getSize();
		} catch ( NumberFormatException e){
			Page 	= 1;
			Count 	= 1;
		}
        
        
		if (( Count % pagerForm.getItemsPerPage()) == 0){
			PagesCount = (Count / pagerForm.getItemsPerPage());
		} else {
			PagesCount = (Count / pagerForm.getItemsPerPage()) + 1;
		}
        
	 	if ( PagesCount <= this.maxPages){
	 		FirstPage 	= 1;
	 		LastPage 	= PagesCount;
	 	} else {
		 	if (Page < ((this.maxPages / 2) + 1)) {
		 		FirstPage 	= 1;
	 			LastPage 	= this.maxPages;
	 			Previous 	= false;
	 			Next		= true;
	 		} else if (Page >= (PagesCount - this.maxPages /2 )){ 
	 			FirstPage 	= PagesCount - (this.maxPages);
	 			LastPage 	= PagesCount;
	 			Previous 	= true;
	 			Next 		= false;
	 		} else {
	 			FirstPage 	= Page - ( this.maxPages / 2) + 1;
	 			LastPage 	= Page +  ( this.maxPages / 2);
	 			Previous 	= true;
	 			Next 		= true;
	 		}
	 	}
	 	
	 	if ( Count == 0) {
	 		HtmlString = "&nbsp;";
	 	} else {
		 	HtmlString = "<table><tr>";
		 	
		 	if ( Previous) { 
	 			HtmlString = HtmlString + "<td nowrap align='left' ><a href='" + action + "&page=" + (Page - 1) + "' onMouseOut=\"MM_swapImgRestore()\"  onMouseOver=\"MM_swapImage('PreviousImage','','" + this.previousImageOn + "',1)\"><img src='" + this.previousImageOff + "' name='PreviousImage' border='0'></a></td>";
		 	}
		 	
		 	for ( long i = FirstPage; i<= LastPage; i++) {
	 			if ( i != Page) {
					HtmlString = HtmlString + "<td><a href='" + action + "&page=" + i + "' class='" + this.styleClass + "'>" + i + "</a></td>";
		 		} else {
					HtmlString = HtmlString + "<td class='" + this.styleClass + "'>" + i + "</td>";
	 			}
		 	}
		 	
			if ( Next) { 
				HtmlString = HtmlString + "<td nowrap align='left' ><a href='" + action + "&page=" + (Page + 1) + "' onMouseOut=\"MM_swapImgRestore()\"  onMouseOver=\"MM_swapImage('NextImage','','" + this.nextImageOn  + "',1)\"><img src='" + this.nextImageOff + "' name='NextImage' border='0'></a></td>";
			}
	 	
			HtmlString =HtmlString+"</tr></table>";
	 	}
	 	
        
        JspWriter writer = pageContext.getOut();
        
        try {
            writer.print( HtmlString);
        } catch ( IOException e) {
            throw new JspException( "Error PagerTag " + e.toString());
        }

	return (EVAL_PAGE);

	}

	public void release() {

		super.release();
		this.name				= "";
		this.maxPages			= 0;
		this.nextImageOn		= "";
		this.previousImageOn 	= "";
		this.nextImageOff		= "";
		this.previousImageOff 	= "";
		this.styleClass 		= "";
		this.action 			= "";		
	}

	public String getAction() {
		return action;
	}

	public int getMaxPages() {
		return maxPages;
	}

	public String getName() {
		return name;
	}


	public String getStyleClass() {
		return styleClass;
	}

	public void setAction(String string) {
		action = string;
	}


	public void setMaxPages(int i) {
		maxPages = i;
	}

	public void setName(String string) {
		name = string;
	}

	public void setStyleClass(String string) {
		styleClass = string;
	}

	public String getNextImageOff() {
		return nextImageOff;
	}

	public String getNextImageOn() {
		return nextImageOn;
	}

	public String getPreviousImageOff() {
		return previousImageOff;
	}

	public String getPreviousImageOn() {
		return previousImageOn;
	}

	public void setNextImageOff(String string) {
		nextImageOff = string;
	}

	public void setNextImageOn(String string) {
		nextImageOn = string;
	}

	public void setPreviousImageOff(String string) {
		previousImageOff = string;
	}

	public void setPreviousImageOn(String string) {
		previousImageOn = string;
	}
}
