package com.amandris.clients.web.form;


import java.io.Serializable;
import org.apache.struts.validator.ValidatorForm;

public class AmandrisMessageForm extends ValidatorForm implements Serializable{

		private String email;
		private String subject;
		private String text;
		
		private static final long serialVersionUID = 886656443356734456L;

		public AmandrisMessageForm() 
		{
			email			= "";
			subject 		= "";
			text 			= "";
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}
		public String getSubject() {
			return subject;
		}

		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getText() {
			return text;
		}
		public void setText(String text) {
			this.text = text;
		}
}
