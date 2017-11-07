package com.amandris.clients.web.util;

import java.io.Serializable;
import org.apache.struts.validator.ValidatorForm;


public class Price extends ValidatorForm implements Serializable{

	private double 	firstHourPrice;
	private double 	additionalHoursPrice;
	private int		currency;
	
	public double getAdditionalHoursPrice() {
		return additionalHoursPrice;
	}
	public void setAdditionalHoursPrice(double additionalHoursPrice) {
		this.additionalHoursPrice = additionalHoursPrice;
	}
	public int getCurrency() {
		return currency;
	}
	public void setCurrency(int currency) {
		this.currency = currency;
	}
	public double getFirstHourPrice() {
		return firstHourPrice;
	}
	public void setFirstHourPrice(double firstHourPrice) {
		this.firstHourPrice = firstHourPrice;
	}

	}
