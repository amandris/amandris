package com.amandris.clients.web.form;


import java.io.Serializable;
import org.apache.struts.validator.ValidatorForm;

public class BuyerPreferencesForm extends ValidatorForm implements Serializable{
	private String	text;
	private Integer	sex;
	private String	ageLow;
	private String	ageHigh;
	private Integer	height;
	private Integer	physique;
	private Integer	origin;
	private Integer	smoker;
	private Integer	language;
	private Integer	orientation;
	private Integer	educationLevel;
	private Integer	skinColor;
	private Integer	eyeColor;
	private Integer	hairColor;
	private Integer	hairLength;
	private Integer	breastSize;
	private Integer	pennisSize;
		
	private static final long serialVersionUID = 123410125373276266L;
	
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

	public Integer getLanguage() {
		return language;
	}

	public void setLanguage(Integer language) {
		this.language = language;
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

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getAgeHigh() {
		return ageHigh;
	}

	public void setAgeHigh(String ageHigh) {
		this.ageHigh = ageHigh;
	}

	public String getAgeLow() {
		return ageLow;
	}

	public void setAgeLow(String ageLow) {
		this.ageLow = ageLow;
	}

		
}
