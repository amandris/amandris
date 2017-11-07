package com.amandris.clients.web.form;

import java.io.Serializable;
import org.apache.struts.validator.ValidatorForm;

public class PasswordResetForm extends ValidatorForm implements Serializable{

		private String	email;
		
		private static final long serialVersionUID = 52037565046163901L;

		public PasswordResetForm() 
		{
			email	= "";
		}
		
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
}
