package com.amandris.clients.web.form;


import java.io.Serializable;
import org.apache.struts.validator.ValidatorForm;

public class ChangeCurrencyForm extends ValidatorForm implements Serializable{

		private String	currentCurrencyConst;
		private String	currentCurrencyText;
		private String	currencyConst;
		
		private static final long serialVersionUID = 293427439100639L;



		public ChangeCurrencyForm() 
		{
			
		}



		public String getCurrentCurrencyConst() {
			return currentCurrencyConst;
		}



		public void setCurrentCurrencyConst(String currentCurrencyConst) {
			this.currentCurrencyConst = currentCurrencyConst;
		}



		public String getCurrencyConst() {
			return currencyConst;
		}



		public void setCurrencyConst(String currencyConst) {
			this.currencyConst = currencyConst;
		}



		public String getCurrentCurrencyText() {
			return currentCurrencyText;
		}



		public void setCurrentCurrencyText(String currentCurrencyText) {
			this.currentCurrencyText = currentCurrencyText;
		}


		
}
