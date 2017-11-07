package com.amandris.clients.util.mail;

import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;


import com.amandris.clients.util.ConfigurationParameterManager;

public class Mail {

	public static boolean sendMail( String email, String title, Object mailObject)
	{
        final String  	from  			= ConfigurationParameterManager.getParameterString( "amandrisEmail");
        final String  	host  			= ConfigurationParameterManager.getParameterString( "smptHost");
        final String  	mailUser  		= ConfigurationParameterManager.getParameterString( "mailUser");
        final String  	mailPassword  	= ConfigurationParameterManager.getParameterString( "mailPassword");
        Properties 		properties 		= new Properties();

        properties.put( "mail.smtp.host", host);
        properties.put( "mail.smtp.port", ConfigurationParameterManager.getParameterString( "smptPort"));
        properties.put( "mail.smtp.starttls.enable", "true");
        properties.put( "mail.smtp.auth", "true");
        properties.put( "mail.user", mailUser);
        properties.put( "mail.password", mailPassword);
        
        Session session = Session.getInstance( properties, new Authenticator (  )   {  
	       public PasswordAuthentication  
	          getPasswordAuthentication (  )   {  
	            return new PasswordAuthentication ( mailUser, mailPassword ) ; 
	        }  
	    }); 

        try {
            MimeMessage 		message 	= new MimeMessage( session);
            InternetAddress  	fromAddress = new InternetAddress( from, ConfigurationParameterManager.getParameterString( "mailSender"));
            InternetAddress  	toAddress1 	= null;
            InternetAddress  	toAddress2 	= null;
            Multipart			multipart	= null;
            MimeBodyPart 		bodyPart1 	= new MimeBodyPart();
            MimeBodyPart 		bodyPart2 	= new MimeBodyPart();

            message.setFrom( fromAddress);
            
            toAddress1 		= new InternetAddress( email, "");
            toAddress2 		= new InternetAddress( "gustavomiguelez@hotmail.com", "");
            InternetAddress[] address = { toAddress1};
            InternetAddress[] address2 = { toAddress2};
            
            message.setRecipients	( Message.RecipientType.TO, address);
            message.setRecipients	( Message.RecipientType.BCC, address2);
            
            message.setSubject		( ( title != null ? title : ""));
            message.setSentDate		( new Date());

            bodyPart1.setText			( "texto plano");
            bodyPart2.setDataHandler	( new DataHandler( new ByteArrayDataSource( mailObject.toString(), "text/html")));
            
            multipart = new MimeMultipart( "alternative");
            multipart.addBodyPart( bodyPart1);
            multipart.addBodyPart( bodyPart2);
            
            message.setContent		( multipart);
            Transport t = session.getTransport("smtp");
            t.connect( mailUser,mailPassword);
            t.sendMessage( message,message.getAllRecipients());
            t.close();
            
        } catch ( Exception e) {
        		e.printStackTrace();
            return false;
        }
        return true;
	}
}		
