
package com.amandris.clients.util.translator;

import java.util.Locale;

import com.amandris.clients.util.exception.TranslateValueObjectErrorException;


public abstract class Translator {
	
	Object object;
	Locale locale;

	public Translator() {
	}


	public Translator(Object object) {
		this.object = object;
	}

	public Object translateView() throws TranslateValueObjectErrorException{
		return null;
	}
	
	public Object translateViewNew() {
		return null;
	}
	
	
	public Object translate() {
		
		return null;
	}
	
	
	public Object translate(Object object) {
		
		return null;
	}

	public Object getObject() {
		return object;
	}


	public void setObject(Object object) {
		this.object = object;
	}


	public Locale getLocale() {
		return locale;
	}


	public void setLocale(Locale locale) {
		this.locale = locale;
	}

}
