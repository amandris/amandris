package com.amandris.clients.web.form;


import java.io.Serializable;
import org.apache.struts.validator.ValidatorForm;

public class SearchByLoginForm extends ValidatorForm implements Serializable{

		private String login; 
		private static final long serialVersionUID = 7526471155622776004L;
		
		
		public String getLogin() {
			return login;
		}
		public void setLogin(String userName) {
			this.login = userName;
		}
}
