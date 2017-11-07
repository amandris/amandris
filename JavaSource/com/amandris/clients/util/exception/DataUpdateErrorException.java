
package com.amandris.clients.util.exception;

import java.util.Date;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class DataUpdateErrorException extends Exception
{
		 
	public DataUpdateErrorException( String object, String name, Exception e)
	{
		super("\n" + name + " : No se han podido escribir los datos de " + object + "\n");
		
		Log log = LogFactory.getLog(this.getClass());
		if (log.isErrorEnabled()){
			log.error(name + " :No se han podido escribir los datos de " + object + "\n" + e.toString());
		}
		
		System.out.println(new Date().toString()+ ": " + name + " : No se han podido escribir los datos de " + object + "\n" + e.toString());
		
		
	}
}
