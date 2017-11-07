package com.amandris.clients.web.action.common;

import java.io.DataInputStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.omg.CosNaming.NamingContextExtPackage.URLStringHelper;

public class ShowOxado2Action extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		Enumeration en = request.getParameterNames();
		String urlString = "https://pub.oxado.com/ad";
		boolean firstTime = true;
		
		while(en.hasMoreElements()){
			String paramName = (String)en.nextElement();
			String paramValue = request.getParameter(paramName);
			if( firstTime){
				urlString = urlString + "?" + paramName + "=" + URLEncoder.encode(paramValue);
				firstTime = false;
			}else{
				urlString = urlString + "&" + paramName + "=" + URLEncoder.encode(paramValue);
			}
		}
		
		
        URL url = new URL( urlString);
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
         
        System.out.println( resultLine);

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
