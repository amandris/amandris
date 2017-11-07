package com.amandris.clients.web.form;


import java.io.Serializable;
import org.apache.struts.validator.ValidatorForm;

public class LoginForm extends ValidatorForm implements Serializable{

		private String login; 
		private String password;
		private static final long serialVersionUID = 7526471155622776003L;
		
		
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getLogin() {
			return login;
		}
		public void setLogin(String userName) {
			this.login = userName;
		}
}
