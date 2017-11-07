package com.amandris.clients.web.form;


import java.io.Serializable;
import org.apache.struts.validator.ValidatorForm;

public class ReplyVoteForm extends ValidatorForm implements Serializable{

		private String text;
		private String sellerId;
		private String buyerId;
		private String contactId;
		private String voteId;
		
		private static final long serialVersionUID = 5523432254029176804L;

		public String getBuyerId() {
			return buyerId;
		}

		public void setBuyerId(String buyerId) {
			this.buyerId = buyerId;
		}

		public String getContactId() {
			return contactId;
		}

		public void setContactId(String contactId) {
			this.contactId = contactId;
		}

		public String getSellerId() {
			return sellerId;
		}

		public void setSellerId(String sellerId) {
			this.sellerId = sellerId;
		}

		public String getText() {
			return text;
		}

		public void setText(String text) {
			this.text = text;
		}

		public String getVoteId() {
			return voteId;
		}

		public void setVoteId(String voteId) {
			this.voteId = voteId;
		}
		
		
}
