package com.amandris.clients.web.form;


import java.io.Serializable;
import org.apache.struts.validator.ValidatorForm;

public class SellerParameterForm extends ValidatorForm implements Serializable{

	private boolean hasMeetingPlace;
	private String 	meetingCountry;
	private String	meetingState;
	private String 	meetingAddress1;
	private String 	meetingAddress2;
	private String 	meetingCity;
	private String 	meetingPostalCode;
	private String 	googleMapsUrl;
	private boolean oralSex;
	private boolean analSex;
	private boolean bdsm;
	private boolean inSellerHouse;
	private boolean inBuyerHouse;
	private boolean inHotel;
	private boolean inCar;
	private boolean buyerPaysDisplacement;
	private String 	displacementPrize;
	private String 	paypalAccount;
	private String 	phoneNumberSMS;
	private String 	phoneNumberCall;
	private String 	url;
	private String 	skypeAccount;
	private String 	messengerAccount;
	private String 	bankAccount;
	private boolean paymentBeforeDate;
	private boolean allowSms;
	private boolean allowPhoneCall;
	private boolean allowUrl;
	private boolean allowSkype;
	private boolean allowMessenger;
	private boolean allowEmail;
	private boolean allowPaypalPayment;
	private boolean allowBankPayment;
	private String	currencyText;
	
	private static final long serialVersionUID = 3426785469908764343L;
	
	
	public boolean getAllowBankPayment() {
		return allowBankPayment;
	}
	public void setAllowBankPayment(boolean allowBankPayment) {
		this.allowBankPayment = allowBankPayment;
	}
	public boolean getAllowEmail() {
		return allowEmail;
	}
	public void setAllowEmail(boolean allowEmail) {
		this.allowEmail = allowEmail;
	}
	public boolean getAllowMessenger() {
		return allowMessenger;
	}
	public void setAllowMessenger(boolean allowMessenger) {
		this.allowMessenger = allowMessenger;
	}
	public boolean getAllowPaypalPayment() {
		return allowPaypalPayment;
	}
	public void setAllowPaypalPayment(boolean allowPaypalPayment) {
		this.allowPaypalPayment = allowPaypalPayment;
	}
	public boolean getAllowPhoneCall() {
		return allowPhoneCall;
	}
	public void setAllowPhoneCall(boolean allowPhoneCall) {
		this.allowPhoneCall = allowPhoneCall;
	}
	public boolean getAllowSkype() {
		return allowSkype;
	}
	public void setAllowSkype(boolean allowSkype) {
		this.allowSkype = allowSkype;
	}
	public boolean getAllowSms() {
		return allowSms;
	}
	public void setAllowSms(boolean allowSms) {
		this.allowSms = allowSms;
	}
	public boolean getAnalSex() {
		return analSex;
	}
	public void setAnalSex(boolean analSex) {
		this.analSex = analSex;
	}
	public String getBankAccount() {
		return bankAccount;
	}
	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}
	public boolean getBdsm() {
		return bdsm;
	}
	public void setBdsm(boolean bdsm) {
		this.bdsm = bdsm;
	}
	public boolean getBuyerPaysDisplacement() {
		return buyerPaysDisplacement;
	}
	public void setBuyerPaysDisplacement(boolean buyerPaysDisplacement) {
		this.buyerPaysDisplacement = buyerPaysDisplacement;
	}
	public String getDisplacementPrize() {
		return displacementPrize;
	}
	public void setDisplacementPrize(String displacementPrize) {
		this.displacementPrize = displacementPrize;
	}
	public String getGoogleMapsUrl() {
		return googleMapsUrl;
	}
	public void setGoogleMapsUrl(String googleMapsUrl) {
		this.googleMapsUrl = googleMapsUrl;
	}
	public boolean getInBuyerHouse() {
		return inBuyerHouse;
	}
	public void setInBuyerHouse(boolean inBuyerHouse) {
		this.inBuyerHouse = inBuyerHouse;
	}
	public boolean getInCar() {
		return inCar;
	}
	public void setInCar(boolean inCar) {
		this.inCar = inCar;
	}
	public boolean getInHotel() {
		return inHotel;
	}
	public void setInHotel(boolean inHotel) {
		this.inHotel = inHotel;
	}
	public boolean getInSellerHouse() {
		return inSellerHouse;
	}
	public void setInSellerHouse(boolean inSellerHouse) {
		this.inSellerHouse = inSellerHouse;
	}
	public String getMeetingAddress1() {
		return meetingAddress1;
	}
	public void setMeetingAddress1(String meetingAddress1) {
		this.meetingAddress1 = meetingAddress1;
	}
	public String getMeetingAddress2() {
		return meetingAddress2;
	}
	public void setMeetingAddress2(String meetingAddress2) {
		this.meetingAddress2 = meetingAddress2;
	}
	public String getMeetingCity() {
		return meetingCity;
	}
	public void setMeetingCity(String meetingCity) {
		this.meetingCity = meetingCity;
	}
	public String getMeetingCountry() {
		return meetingCountry;
	}
	public void setMeetingCountry(String meetingCountry) {
		this.meetingCountry = meetingCountry;
	}
	public String getMeetingPostalCode() {
		return meetingPostalCode;
	}
	public void setMeetingPostalCode(String meetingPostalCode) {
		this.meetingPostalCode = meetingPostalCode;
	}
	public String getMeetingState() {
		return meetingState;
	}
	public void setMeetingState(String meetingState) {
		this.meetingState = meetingState;
	}
	public String getMessengerAccount() {
		return messengerAccount;
	}
	public void setMessengerAccount(String messengerAccount) {
		this.messengerAccount = messengerAccount;
	}
	public boolean getOralSex() {
		return oralSex;
	}
	public void setOralSex(boolean oralSex) {
		this.oralSex = oralSex;
	}
	public boolean getPaymentBeforeDate() {
		return paymentBeforeDate;
	}
	public void setPaymentBeforeDate(boolean paymentBeforeDate) {
		this.paymentBeforeDate = paymentBeforeDate;
	}
	public String getPaypalAccount() {
		return paypalAccount;
	}
	public void setPaypalAccount(String paypalAccount) {
		this.paypalAccount = paypalAccount;
	}
	public String getPhoneNumberCall() {
		return phoneNumberCall;
	}
	public void setPhoneNumberCall(String phoneNumberCall) {
		this.phoneNumberCall = phoneNumberCall;
	}
	public String getPhoneNumberSMS() {
		return phoneNumberSMS;
	}
	public void setPhoneNumberSMS(String phoneNumberSMS) {
		this.phoneNumberSMS = phoneNumberSMS;
	}
	public String getSkypeAccount() {
		return skypeAccount;
	}
	public void setSkypeAccount(String skypeAccount) {
		this.skypeAccount = skypeAccount;
	}
	public boolean getHasMeetingPlace() {
		return hasMeetingPlace;
	}
	public void setHasMeetingPlace(boolean hasMeetingPlace) {
		this.hasMeetingPlace = hasMeetingPlace;
	}
	public String getCurrencyText() {
		return currencyText;
	}
	public void setCurrencyText(String currencyText) {
		this.currencyText = currencyText;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public boolean getAllowUrl() {
		return allowUrl;
	}
	public void setAllowUrl(boolean allowUrl) {
		this.allowUrl = allowUrl;
	}

				
}
