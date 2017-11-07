package com.amandris.clients.web.form;


import java.io.Serializable;
import org.apache.struts.validator.ValidatorForm;

public class NewSellerForm extends ValidatorForm implements Serializable{

	private String 	login; 
	private String 	password;
	private String 	repeatPassword;
	private String 	email;
	private String 	repeatEmail;
	private Integer sex;
	private String 	birthDate;
	private Integer country;
	private Integer state;
	private String 	city;
	private String 	address1;
	private String 	address2;
	private String 	postalCode;
	private String 	name;
	private String 	surname;
	
	private String	intro;
	private String	text;
	private Integer	height;
	private Integer	physique;
	private Integer	origin;
	private Integer	smoker;
	private Integer	language1;
	private Integer	language2;
	private Integer	language3;
	private Integer	orientation;
	private Integer	educationLevel;
	private Integer	skinColor;
	private Integer	eyeColor;
	private Integer	hairColor;
	private Integer	hairLength;
	private Integer	breastSize;
	private Integer	pennisSize;
	
	private Boolean	sendNews;
	private String	promoCode;
	private Integer	defaultCurrency;
	private Boolean	acceptTerms;
	private Integer	isEscort;
	
	private String activationCode;
		
	private static final long serialVersionUID = 4230923353216073L;
	
	public NewSellerForm()
	{
		sendNews 		= Boolean.TRUE;
		acceptTerms 	= Boolean.FALSE;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getRepeatPassword() {
		return repeatPassword;
	}

	public void setRepeatPassword(String repeatPassword) {
		this.repeatPassword = repeatPassword;
	}

	
	public Integer getCountry() {
		return country;
	}

	public void setCountry(Integer country) {
		this.country = country;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public Integer getBreastSize() {
		return breastSize;
	}

	public void setBreastSize(Integer breastSize) {
		this.breastSize = breastSize;
	}

	public Integer getEducationLevel() {
		return educationLevel;
	}

	public void setEducationLevel(Integer educationLevel) {
		this.educationLevel = educationLevel;
	}

	public Integer getEyeColor() {
		return eyeColor;
	}

	public void setEyeColor(Integer eyeColor) {
		this.eyeColor = eyeColor;
	}

	public Integer getHairColor() {
		return hairColor;
	}

	public void setHairColor(Integer hairColor) {
		this.hairColor = hairColor;
	}

	public Integer getHairLength() {
		return hairLength;
	}

	public void setHairLength(Integer hairLength) {
		this.hairLength = hairLength;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public Integer getLanguage1() {
		return language1;
	}

	public void setLanguage1(Integer language1) {
		this.language1 = language1;
	}

	public Integer getLanguage2() {
		return language2;
	}

	public void setLanguage2(Integer language2) {
		this.language2 = language2;
	}

	public Integer getLanguage3() {
		return language3;
	}

	public void setLanguage3(Integer language3) {
		this.language3 = language3;
	}

	public Integer getOrientation() {
		return orientation;
	}

	public void setOrientation(Integer orientation) {
		this.orientation = orientation;
	}

	public Integer getOrigin() {
		return origin;
	}

	public void setOrigin(Integer origin) {
		this.origin = origin;
	}

	public Integer getPennisSize() {
		return pennisSize;
	}

	public void setPennisSize(Integer pennisSize) {
		this.pennisSize = pennisSize;
	}

	public Integer getPhysique() {
		return physique;
	}

	public void setPhysique(Integer physique) {
		this.physique = physique;
	}

	public Integer getSkinColor() {
		return skinColor;
	}

	public void setSkinColor(Integer skinColor) {
		this.skinColor = skinColor;
	}

	public Integer getSmoker() {
		return smoker;
	}

	public void setSmoker(Integer smoker) {
		this.smoker = smoker;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Boolean getAcceptTerms() {
		return acceptTerms;
	}

	public void setAcceptTerms(Boolean acceptTerms) {
		this.acceptTerms = acceptTerms;
	}

	public Boolean getSendNews() {
		return sendNews;
	}

	public void setSendNews(Boolean sendNews) {
		this.sendNews = sendNews;
	}

	public String getActivationCode() {
		return activationCode;
	}

	public void setActivationCode(String activationCode) {
		this.activationCode = activationCode;
	}

	public Integer getDefaultCurrency() {
		return defaultCurrency;
	}

	public void setDefaultCurrency(Integer defaultCurrency) {
		this.defaultCurrency = defaultCurrency;
	}

	public String getRepeatEmail() {
		return repeatEmail;
	}

	public void setRepeatEmail(String repeatEmail) {
		this.repeatEmail = repeatEmail;
	}

	public Integer getIsEscort() {
		return isEscort;
	}

	public void setIsEscort(Integer isEscort) {
		this.isEscort = isEscort;
	}

	public String getPromoCode() {
		return promoCode;
	}

	public void setPromoCode(String promoCode) {
		this.promoCode = promoCode;
	}
		
		
}
