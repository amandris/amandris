package com.amandris.clients.web.form;


import java.io.Serializable;
import org.apache.struts.validator.ValidatorForm;

public class PayForm extends ValidatorForm implements Serializable{

		private String text;
		
		private static final long serialVersionUID = 16322763409956830L;
		
		public String getText() {
			return text;
		}
		public void setText(String text) {
			this.text = text;
		}
}
