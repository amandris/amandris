package com.amandris.clients.web.form;

import java.io.Serializable;
import org.apache.struts.validator.ValidatorForm;

public class RecommendForm extends ValidatorForm implements Serializable{

		private String 	name;
		private String	email;
		private String	message;
		
		private static final long serialVersionUID = 82437565446563901L;

		public RecommendForm() 
		{
			name	= "";
			email	= "";
			message	= "";
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
}
