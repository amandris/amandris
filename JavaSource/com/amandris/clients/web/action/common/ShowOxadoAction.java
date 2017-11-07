package com.amandris.clients.web.action.common;

import java.io.DataInputStream;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class ShowOxadoAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		URL url = new URL( "https://pub.oxado.com/insert_ad?pub=149246");
		URLConnection oxadoConnection = url.openConnection();
		DataInputStream dis = new
		DataInputStream(oxadoConnection.getInputStream()); 
		String inputLine;
		String resultLine = "";
		  
		while ((inputLine = dis.readLine()) != null) {
		    resultLine = resultLine.concat( inputLine);
		}
		dis.close();
		 
		//resultLine = resultLine.replaceAll( "http", "https");
		//resultLine = resultLine.replaceAll( "https://pub.oxado.com/ad", "https://www.amandris.com/showOxado2.do");
		
		
		ServletOutputStream stream = null;
		
		if( response != null){
		 	response.setContentType( "text/javascript");
		 		
			response.setContentLength	( resultLine.length());
			response.setHeader			( "Expires", "Wed, 01 Jan 2020 00:00:00 GMT");
			response.setHeader			( "Last-Modified", "Wed, 04 Oct 2006 00:00:00 GMT");
			
			stream 	= response.getOutputStream();
			stream.write( resultLine.getBytes());
		} 

		return null;

	  }
	
	
	
}		
