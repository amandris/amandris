package com.amandris.clients.web.form;


import java.io.Serializable;
import org.apache.struts.validator.ValidatorForm;

public class EditServiceForm extends ValidatorForm implements Serializable{

		private String	serviceType;
		private String	serviceTypeText;
		private boolean sex1Checked;
		private boolean sex2Checked;
		private boolean sex4Checked;
		private boolean sex8Checked;
		private boolean sex16Checked;
		private boolean sex32Checked;
		private boolean sex64Checked;
		private String firstHourPrice;
		private String additionalHoursPrice;
		private boolean isFree;
		private String	currency;
		private String	currencyConst;
			
		
		private static final long serialVersionUID = 223154725372840L;



		public EditServiceForm() 
		{
			serviceType					= "1";
			serviceTypeText				= "";
			sex1Checked 				= false;
			sex2Checked 				= false;
			sex4Checked 				= false;
			sex8Checked 				= false;
			sex16Checked 				= false;
			sex32Checked 				= false;
			sex64Checked 				= false;
			firstHourPrice 				= "0";
			additionalHoursPrice 		= "0";
			isFree 						= true;
			currency					= "";
			currencyConst				= "0";
		}


		public String getAdditionalHoursPrice() {
			return additionalHoursPrice;
		}



		public void setAdditionalHoursPrice(String additionalHoursPrice) {
			this.additionalHoursPrice = additionalHoursPrice;
		}



		public String getServiceTypeText() {
			return serviceTypeText;
		}


		public void setServiceTypeText(String serviceTypeText) {
			this.serviceTypeText = serviceTypeText;
		}


		public String getFirstHourPrice() {
			return firstHourPrice;
		}



		public void setFirstHourPrice(String firstHourPrice) {
			this.firstHourPrice = firstHourPrice;
		}




		public boolean getIsFree() {
			return isFree;
		}


		public void setIsFree(boolean isFree) {
			this.isFree = isFree;
		}


		public boolean isSex16Checked() {
			return sex16Checked;
		}



		public void setSex16Checked(boolean sex16Checked) {
			this.sex16Checked = sex16Checked;
		}



		public boolean isSex1Checked() {
			return sex1Checked;
		}



		public void setSex1Checked(boolean sex1Checked) {
			this.sex1Checked = sex1Checked;
		}



		public boolean isSex2Checked() {
			return sex2Checked;
		}



		public void setSex2Checked(boolean sex2Checked) {
			this.sex2Checked = sex2Checked;
		}



		public boolean isSex32Checked() {
			return sex32Checked;
		}



		public void setSex32Checked(boolean sex32Checked) {
			this.sex32Checked = sex32Checked;
		}



		public boolean isSex4Checked() {
			return sex4Checked;
		}



		public void setSex4Checked(boolean sex4Checked) {
			this.sex4Checked = sex4Checked;
		}



		public boolean isSex64Checked() {
			return sex64Checked;
		}



		public void setSex64Checked(boolean sex64Checked) {
			this.sex64Checked = sex64Checked;
		}



		public boolean isSex8Checked() {
			return sex8Checked;
		}



		public void setSex8Checked(boolean sex8Checked) {
			this.sex8Checked = sex8Checked;
		}





		public String getCurrency() {
			return currency;
		}


		public void setCurrency(String currency) {
			this.currency = currency;
		}


		public String getServiceType() {
			return serviceType;
		}


		public void setServiceType(String serviceType) {
			this.serviceType = serviceType;
		}


	

		public String getCurrencyConst() {
			return currencyConst;
		}


		public void setCurrencyConst(String currencyConst) {
			this.currencyConst = currencyConst;
		}

		
}
