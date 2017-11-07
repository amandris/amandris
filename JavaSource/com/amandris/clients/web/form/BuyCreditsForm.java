package com.amandris.clients.web.form;


import java.io.Serializable;
import org.apache.struts.validator.ValidatorForm;

public class BuyCreditsForm extends ValidatorForm implements Serializable{

	private String type;
	private String credits;
	private String userId;
	private String userLogin;
	
		
	private static final long serialVersionUID = 543210125373276264L;


	public String getCredits() {
		return credits;
	}


	public void setCredits(String credits) {
		this.credits = credits;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserLogin() {
		return userLogin;
	}


	public void setUserLogin(String userLogin) {
		this.userLogin = userLogin;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


			
}
