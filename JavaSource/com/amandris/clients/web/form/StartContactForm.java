package com.amandris.clients.web.form;


import java.io.Serializable;
import org.apache.struts.validator.ValidatorForm;

public class StartContactForm extends ValidatorForm implements Serializable{

		private String date; 
		private String hour;
		private String length;
		private String serviceType;
		private String meetingPlaceType;
		private String address1;
		private String address2;
		private String city;
		private Integer country;
		private Integer state;
		private String text;
		private String sellerId;
		
		private static final long serialVersionUID = 3566871135606796043L;

		public StartContactForm()
		{
			date 				= "";
			hour 				= "";
			length				= "1";
			serviceType			= "1";
			meetingPlaceType	= "1";
			address1			= "";
			address2			= "";
			city				= "";
			text				= "";
			sellerId			= "";
		}
		
		
		public String getDate() {
			return date;
		}

		public void setDate(String date) {
			this.date = date;
		}

		public String getLength() {
			return length;
		}

		public void setLength(String length) {
			this.length = length;
		}


		public String getMeetingPlaceType() {
			return meetingPlaceType;
		}

		public void setMeetingPlaceType(String meetingPlaceType) {
			this.meetingPlaceType = meetingPlaceType;
		}

		public String getServiceType() {
			return serviceType;
		}

		public void setServiceType(String serviceType) {
			this.serviceType = serviceType;
		}



		public String getHour() {
			return hour;
		}

		public void setHour(String hour) {
			this.hour = hour;
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

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public Integer getCountry() {
			return country;
		}

		public void setCountry(Integer country) {
			this.country = country;
		}

		public Integer getState() {
			return state;
		}

		public void setState(Integer state) {
			this.state = state;
		}

		public String getText() {
			return text;
		}

		public void setText(String text) {
			this.text = text;
		}


		public String getSellerId() {
			return sellerId;
		}


		public void setSellerId(String sellerId) {
			this.sellerId = sellerId;
		}
		
		
		
}
