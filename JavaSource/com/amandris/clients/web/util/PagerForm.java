package com.amandris.clients.web.util;

import java.io.Serializable;
import org.apache.struts.validator.ValidatorForm;


public class PagerForm extends ValidatorForm implements Serializable{

	private int size;
	private int page;
	private int itemsPerPage;
	private static final long serialVersionUID = 2526471155622776003L;

	public int getPage() {
		return page;
	}


	public int getSize() {
		return size;
	}


	public void setPage(int i) {
		page = i;
	}


	public void setSize(int i) {
		size = i;
	}


	public int getItemsPerPage() {
		return itemsPerPage;
	}


	public void setItemsPerPage(int itemsPerPage) {
		this.itemsPerPage = itemsPerPage;
	}

}
