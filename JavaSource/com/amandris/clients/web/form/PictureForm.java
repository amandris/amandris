package com.amandris.clients.web.form;

import java.io.Serializable;
import org.apache.struts.upload.FormFile;


import org.apache.struts.validator.ValidatorForm;

public class PictureForm extends ValidatorForm implements Serializable{

	private FormFile 	pictureFile;
	private String		index;
	
	private static final long serialVersionUID = 123410125373276267L;

	public FormFile getPictureFile() {
		return pictureFile;
	}

	public void setPictureFile(FormFile pictureFile) {
		this.pictureFile = pictureFile;
	}

	public String getIndex() {
		return index;
	}

	public void setIndex(String index) {
		this.index = index;
	}


}
