package com.amandris.clients.web.form;


import java.io.Serializable;
import org.apache.struts.validator.ValidatorForm;

public class BuyerProfileForm extends ValidatorForm implements Serializable{
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
		
	private static final long serialVersionUID = 123410125373276265L;
	
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

		
}
