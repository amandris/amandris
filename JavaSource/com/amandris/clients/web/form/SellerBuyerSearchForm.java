package com.amandris.clients.web.form;


import java.io.Serializable;
import org.apache.struts.validator.ValidatorForm;

public class SellerBuyerSearchForm extends ValidatorForm implements Serializable{

	private String  ageLow;
	private String  ageHigh;
	private String  login;
	private Boolean sex_girl;
	private Boolean sex_boy;
	private Boolean sex_shemale;
	private Boolean sex_boysCouple;
	private Boolean sex_girlsCouple;
	private Boolean sex_boyAndGirlCouple;
	private Boolean sex_group;
	private Integer state;
	private Integer country;
	private Boolean origin_caucasic;
	private Boolean origin_indian;
	private Boolean origin_oriental;
	private Boolean origin_african;
	private Boolean origin_arabian;
	private Boolean origin_hispanic;
	private Boolean origin_mediterranean;
	private Boolean skinColor_white;
	private Boolean skinColor_dark;
	private Boolean skinColor_veryDark;
	private Boolean skinColor_black;
	private Boolean hairColor_white;
	private Boolean hairColor_blonde;
	private Boolean hairColor_brown;
	private Boolean hairColor_red;
	private Boolean hairColor_dark;
	private Boolean hairLength_noHair;
	private Boolean hairLength_short;
	private Boolean hairLength_untilNeck;
	private Boolean hairLength_untilShoulders;
	private Boolean hairLength_beyondShoulders;
	private Boolean eyeColor_green;
	private Boolean eyeColor_blue;
	private Boolean eyeColor_brown;
	private Boolean eyeColor_black;
	private Boolean language_spanish;
	private Boolean language_english;
	private Boolean language_portuguese;
	private Boolean language_french;
	private Boolean language_german;
	private Boolean language_italian;
	private Boolean language_japanesse;
	private Boolean language_chinesse;
	private Boolean language_arabian;
	private Boolean educationLevel_primary;
	private Boolean educationLevel_seconday;
	private Boolean educationLevel_universitary;
	private Boolean educationLevel_postDegree;
	private Boolean smoker_noSmoker;
	private Boolean smoker_eventuallySmoker;
	private Boolean smoker_smoker;
	private Boolean physique_thin;
	private Boolean physique_normal;
	private Boolean physique_fat;
	private Boolean physique_muscled;
	private Boolean physique_atlethic;
	private Boolean height_lessThan150;
	private Boolean height_between150And159;
	private Boolean height_between160And169;
	private Boolean height_between170And179;
	private Boolean height_between180And189;
	private Boolean height_between190And200;
	private Boolean height_moreThan200;
	private Boolean orientation_heterosexual;
	private Boolean orientation_homosexual;
	private Boolean orientation_bisexual;
	private Boolean orientation_bicurious;
	private Boolean pennisSize_normal;
	private Boolean pennisSize_biggerThanNormal;
	private Boolean pennisSize_big;
	private Boolean pennisSize_veryBig;
	private Boolean breastSize_small;
	private Boolean breastSize_normal;
	private Boolean breastSize_big;
	private Boolean breastSize_veryBig;
	private String	itemsPerPage;
	private String	orderedBy;
	private Boolean isOnline;
	private Integer sellerId;
	
	private static final long serialVersionUID = 7026471055642270802L;
	
	public SellerBuyerSearchForm()
	{
		login = "";
		ageLow = "18";
		ageHigh = "99";
		sex_girl = new Boolean( false);
		sex_boy = new Boolean( false);
		sex_shemale = new Boolean( false);
		sex_boysCouple = new Boolean( false);
		sex_girlsCouple = new Boolean( false);
		sex_boyAndGirlCouple = new Boolean( false);
		sex_group = new Boolean( false);
		state = new Integer( 0);
		country = new Integer( 0);
		origin_caucasic = new Boolean( false);
		origin_indian = new Boolean( false);
		origin_oriental = new Boolean( false);
		origin_african = new Boolean( false);
		origin_arabian = new Boolean( false);
		origin_hispanic = new Boolean( false);
		origin_mediterranean = new Boolean( false);
		skinColor_white = new Boolean( false);
		skinColor_dark = new Boolean( false);
		skinColor_veryDark = new Boolean( false);
		skinColor_black = new Boolean( false);
		hairColor_white = new Boolean( false);
		hairColor_blonde = new Boolean( false);
		hairColor_brown = new Boolean( false);
		hairColor_red = new Boolean( false);
		hairColor_dark = new Boolean( false);
		hairLength_noHair = new Boolean( false);
		hairLength_short = new Boolean( false);
		hairLength_untilNeck = new Boolean( false);
		hairLength_untilShoulders = new Boolean( false);
		hairLength_beyondShoulders = new Boolean( false);
		eyeColor_green = new Boolean( false);
		eyeColor_blue = new Boolean( false);
		eyeColor_brown = new Boolean( false);
		eyeColor_black = new Boolean( false);
		language_spanish = new Boolean( false);
		language_english = new Boolean( false);
		language_portuguese = new Boolean( false);
		language_french = new Boolean( false);
		language_german = new Boolean( false);
		language_italian = new Boolean( false);
		language_japanesse = new Boolean( false);
		language_chinesse = new Boolean( false);
		language_arabian = new Boolean( false);
		educationLevel_primary = new Boolean( false);
		educationLevel_seconday = new Boolean( false);
		educationLevel_universitary = new Boolean( false);
		educationLevel_postDegree = new Boolean( false);
		smoker_noSmoker = new Boolean( false);
		smoker_eventuallySmoker = new Boolean( false);
		smoker_smoker = new Boolean( false);
		physique_thin = new Boolean( false);
		physique_normal = new Boolean( false);
		physique_fat = new Boolean( false);
		physique_muscled = new Boolean( false);
		physique_atlethic = new Boolean( false);
		height_lessThan150 = new Boolean( false);
		height_between150And159 = new Boolean( false);
		height_between160And169 = new Boolean( false);
		height_between170And179 = new Boolean( false);
		height_between180And189 = new Boolean( false);
		height_between190And200 = new Boolean( false);
		height_moreThan200 = new Boolean( false);
		orientation_heterosexual = new Boolean( false);
		orientation_homosexual = new Boolean( false);
		orientation_bisexual = new Boolean( false);
		orientation_bicurious = new Boolean( false);
		pennisSize_normal = new Boolean( false);
		pennisSize_biggerThanNormal = new Boolean( false);
		pennisSize_big = new Boolean( false);
		pennisSize_veryBig = new Boolean( false);
		breastSize_small = new Boolean( false);
		breastSize_normal = new Boolean( false);
		breastSize_big = new Boolean( false);
		breastSize_veryBig = new Boolean( false);
		itemsPerPage = "4";
		orderedBy = "";		
		isOnline = new Boolean( false);
		sellerId	= null;
	}
	
	
	public Boolean getBreastSize_big() {
		return breastSize_big;
	}
	public void setBreastSize_big(Boolean breastSize_big) {
		this.breastSize_big = breastSize_big;
	}
	public Boolean getBreastSize_normal() {
		return breastSize_normal;
	}
	public void setBreastSize_normal(Boolean breastSize_normal) {
		this.breastSize_normal = breastSize_normal;
	}
	public Boolean getBreastSize_small() {
		return breastSize_small;
	}
	public void setBreastSize_small(Boolean breastSize_small) {
		this.breastSize_small = breastSize_small;
	}
	public Boolean getBreastSize_veryBig() {
		return breastSize_veryBig;
	}
	public void setBreastSize_veryBig(Boolean breastSize_veryBig) {
		this.breastSize_veryBig = breastSize_veryBig;
	}
	public Integer getCountry() {
		return country;
	}
	public void setCountry(Integer country) {
		this.country = country;
	}
	public Boolean getEducationLevel_postDegree() {
		return educationLevel_postDegree;
	}
	public void setEducationLevel_postDegree(Boolean educationLevel_postDegree) {
		this.educationLevel_postDegree = educationLevel_postDegree;
	}
	public Boolean getEducationLevel_primary() {
		return educationLevel_primary;
	}
	public void setEducationLevel_primary(Boolean educationLevel_primary) {
		this.educationLevel_primary = educationLevel_primary;
	}
	public Boolean getEducationLevel_seconday() {
		return educationLevel_seconday;
	}
	public void setEducationLevel_seconday(Boolean educationLevel_seconday) {
		this.educationLevel_seconday = educationLevel_seconday;
	}
	public Boolean getEducationLevel_universitary() {
		return educationLevel_universitary;
	}
	public void setEducationLevel_universitary(Boolean educationLevel_universitary) {
		this.educationLevel_universitary = educationLevel_universitary;
	}
	public Boolean getEyeColor_black() {
		return eyeColor_black;
	}
	public void setEyeColor_black(Boolean eyeColor_black) {
		this.eyeColor_black = eyeColor_black;
	}
	public Boolean getEyeColor_blue() {
		return eyeColor_blue;
	}
	public void setEyeColor_blue(Boolean eyeColor_blue) {
		this.eyeColor_blue = eyeColor_blue;
	}
	public Boolean getEyeColor_brown() {
		return eyeColor_brown;
	}
	public void setEyeColor_brown(Boolean eyeColor_brown) {
		this.eyeColor_brown = eyeColor_brown;
	}
	public Boolean getEyeColor_green() {
		return eyeColor_green;
	}
	public void setEyeColor_green(Boolean eyeColor_green) {
		this.eyeColor_green = eyeColor_green;
	}
	public Boolean getHairColor_blonde() {
		return hairColor_blonde;
	}
	public void setHairColor_blonde(Boolean hairColor_blonde) {
		this.hairColor_blonde = hairColor_blonde;
	}
	public Boolean getHairColor_brown() {
		return hairColor_brown;
	}
	public void setHairColor_brown(Boolean hairColor_brown) {
		this.hairColor_brown = hairColor_brown;
	}
	public Boolean getHairColor_dark() {
		return hairColor_dark;
	}
	public void setHairColor_dark(Boolean hairColor_dark) {
		this.hairColor_dark = hairColor_dark;
	}
	public Boolean getHairColor_red() {
		return hairColor_red;
	}
	public void setHairColor_red(Boolean hairColor_red) {
		this.hairColor_red = hairColor_red;
	}
	public Boolean getHairColor_white() {
		return hairColor_white;
	}
	public void setHairColor_white(Boolean hairColor_white) {
		this.hairColor_white = hairColor_white;
	}
	public Boolean getHairLength_beyondShoulders() {
		return hairLength_beyondShoulders;
	}
	public void setHairLength_beyondShoulders(Boolean hairLength_beyondShoulders) {
		this.hairLength_beyondShoulders = hairLength_beyondShoulders;
	}
	public Boolean getHairLength_noHair() {
		return hairLength_noHair;
	}
	public void setHairLength_noHair(Boolean hairLength_noHair) {
		this.hairLength_noHair = hairLength_noHair;
	}
	public Boolean getHairLength_short() {
		return hairLength_short;
	}
	public void setHairLength_short(Boolean hairLength_short) {
		this.hairLength_short = hairLength_short;
	}
	public Boolean getHairLength_untilNeck() {
		return hairLength_untilNeck;
	}
	public void setHairLength_untilNeck(Boolean hairLength_untilNeck) {
		this.hairLength_untilNeck = hairLength_untilNeck;
	}
	public Boolean getHairLength_untilShoulders() {
		return hairLength_untilShoulders;
	}
	public void setHairLength_untilShoulders(Boolean hairLength_untilShoulders) {
		this.hairLength_untilShoulders = hairLength_untilShoulders;
	}
	public Boolean getHeight_between150And159() {
		return height_between150And159;
	}
	public void setHeight_between150And159(Boolean height_between150And159) {
		this.height_between150And159 = height_between150And159;
	}
	public Boolean getHeight_between160And169() {
		return height_between160And169;
	}
	public void setHeight_between160And169(Boolean height_between160And169) {
		this.height_between160And169 = height_between160And169;
	}
	public Boolean getHeight_between170And179() {
		return height_between170And179;
	}
	public void setHeight_between170And179(Boolean height_between170And179) {
		this.height_between170And179 = height_between170And179;
	}
	public Boolean getHeight_between180And189() {
		return height_between180And189;
	}
	public void setHeight_between180And189(Boolean height_between180And189) {
		this.height_between180And189 = height_between180And189;
	}
	public Boolean getHeight_between190And200() {
		return height_between190And200;
	}
	public void setHeight_between190And200(Boolean height_between190And200) {
		this.height_between190And200 = height_between190And200;
	}
	public Boolean getHeight_lessThan150() {
		return height_lessThan150;
	}
	public void setHeight_lessThan150(Boolean height_lessThan150) {
		this.height_lessThan150 = height_lessThan150;
	}
	public Boolean getHeight_moreThan200() {
		return height_moreThan200;
	}
	public void setHeight_moreThan200(Boolean height_moreThan200) {
		this.height_moreThan200 = height_moreThan200;
	}
	public Boolean getLanguage_arabian() {
		return language_arabian;
	}
	public void setLanguage_arabian(Boolean language_arabian) {
		this.language_arabian = language_arabian;
	}
	public Boolean getLanguage_chinesse() {
		return language_chinesse;
	}
	public void setLanguage_chinesse(Boolean language_chinesse) {
		this.language_chinesse = language_chinesse;
	}
	public Boolean getLanguage_english() {
		return language_english;
	}
	public void setLanguage_english(Boolean language_english) {
		this.language_english = language_english;
	}
	public Boolean getLanguage_french() {
		return language_french;
	}
	public void setLanguage_french(Boolean language_french) {
		this.language_french = language_french;
	}
	public Boolean getLanguage_german() {
		return language_german;
	}
	public void setLanguage_german(Boolean language_german) {
		this.language_german = language_german;
	}
	public Boolean getLanguage_italian() {
		return language_italian;
	}
	public void setLanguage_italian(Boolean language_italian) {
		this.language_italian = language_italian;
	}
	public Boolean getLanguage_japanesse() {
		return language_japanesse;
	}
	public void setLanguage_japanesse(Boolean language_japanesse) {
		this.language_japanesse = language_japanesse;
	}
	public Boolean getLanguage_portuguese() {
		return language_portuguese;
	}
	public void setLanguage_portuguese(Boolean language_portuguese) {
		this.language_portuguese = language_portuguese;
	}
	public Boolean getLanguage_spanish() {
		return language_spanish;
	}
	public void setLanguage_spanish(Boolean language_spanish) {
		this.language_spanish = language_spanish;
	}
	
	public Boolean getOrientation_bicurious() {
		return orientation_bicurious;
	}
	public void setOrientation_bicurious(Boolean orientation_bicurious) {
		this.orientation_bicurious = orientation_bicurious;
	}
	public Boolean getOrientation_bisexual() {
		return orientation_bisexual;
	}
	public void setOrientation_bisexual(Boolean orientation_bisexual) {
		this.orientation_bisexual = orientation_bisexual;
	}
	public Boolean getOrientation_heterosexual() {
		return orientation_heterosexual;
	}
	public void setOrientation_heterosexual(Boolean orientation_heterosexual) {
		this.orientation_heterosexual = orientation_heterosexual;
	}
	public Boolean getOrientation_homosexual() {
		return orientation_homosexual;
	}
	public void setOrientation_homosexual(Boolean orientation_homosexual) {
		this.orientation_homosexual = orientation_homosexual;
	}
	public Boolean getOrigin_african() {
		return origin_african;
	}
	public void setOrigin_african(Boolean origin_african) {
		this.origin_african = origin_african;
	}
	public Boolean getOrigin_arabian() {
		return origin_arabian;
	}
	public void setOrigin_arabian(Boolean origin_arabian) {
		this.origin_arabian = origin_arabian;
	}
	public Boolean getOrigin_caucasic() {
		return origin_caucasic;
	}
	public void setOrigin_caucasic(Boolean origin_caucasic) {
		this.origin_caucasic = origin_caucasic;
	}
	public Boolean getOrigin_hispanic() {
		return origin_hispanic;
	}
	public void setOrigin_hispanic(Boolean origin_hispanic) {
		this.origin_hispanic = origin_hispanic;
	}
	public Boolean getOrigin_indian() {
		return origin_indian;
	}
	public void setOrigin_indian(Boolean origin_indian) {
		this.origin_indian = origin_indian;
	}
	public Boolean getOrigin_mediterranean() {
		return origin_mediterranean;
	}
	public void setOrigin_mediterranean(Boolean origin_mediterranean) {
		this.origin_mediterranean = origin_mediterranean;
	}
	public Boolean getOrigin_oriental() {
		return origin_oriental;
	}
	public void setOrigin_oriental(Boolean origin_oriental) {
		this.origin_oriental = origin_oriental;
	}
	public Boolean getPennisSize_big() {
		return pennisSize_big;
	}
	public void setPennisSize_big(Boolean pennisSize_big) {
		this.pennisSize_big = pennisSize_big;
	}
	public Boolean getPennisSize_biggerThanNormal() {
		return pennisSize_biggerThanNormal;
	}
	public void setPennisSize_biggerThanNormal(Boolean pennisSize_biggerThanNormal) {
		this.pennisSize_biggerThanNormal = pennisSize_biggerThanNormal;
	}
	public Boolean getPennisSize_normal() {
		return pennisSize_normal;
	}
	public void setPennisSize_normal(Boolean pennisSize_normal) {
		this.pennisSize_normal = pennisSize_normal;
	}
	public Boolean getPennisSize_veryBig() {
		return pennisSize_veryBig;
	}
	public void setPennisSize_veryBig(Boolean pennisSize_veryBig) {
		this.pennisSize_veryBig = pennisSize_veryBig;
	}
	public Boolean getPhysique_atlethic() {
		return physique_atlethic;
	}
	public void setPhysique_atlethic(Boolean physique_atlethic) {
		this.physique_atlethic = physique_atlethic;
	}
	public Boolean getPhysique_fat() {
		return physique_fat;
	}
	public void setPhysique_fat(Boolean physique_fat) {
		this.physique_fat = physique_fat;
	}
	public Boolean getPhysique_muscled() {
		return physique_muscled;
	}
	public void setPhysique_muscled(Boolean physique_muscled) {
		this.physique_muscled = physique_muscled;
	}
	public Boolean getPhysique_normal() {
		return physique_normal;
	}
	public void setPhysique_normal(Boolean physique_normal) {
		this.physique_normal = physique_normal;
	}
	public Boolean getPhysique_thin() {
		return physique_thin;
	}
	public void setPhysique_thin(Boolean physique_thin) {
		this.physique_thin = physique_thin;
	}
	public Boolean getSex_boy() {
		return sex_boy;
	}
	public void setSex_boy(Boolean sex_boy) {
		this.sex_boy = sex_boy;
	}
	public Boolean getSex_boyAndGirlCouple() {
		return sex_boyAndGirlCouple;
	}
	public void setSex_boyAndGirlCouple(Boolean sex_boyAndGirlCouple) {
		this.sex_boyAndGirlCouple = sex_boyAndGirlCouple;
	}
	public Boolean getSex_boysCouple() {
		return sex_boysCouple;
	}
	public void setSex_boysCouple(Boolean sex_boysCouple) {
		this.sex_boysCouple = sex_boysCouple;
	}
	public Boolean getSex_girl() {
		return sex_girl;
	}
	public void setSex_girl(Boolean sex_girl) {
		this.sex_girl = sex_girl;
	}
	public Boolean getSex_girlsCouple() {
		return sex_girlsCouple;
	}
	public void setSex_girlsCouple(Boolean sex_girlsCouple) {
		this.sex_girlsCouple = sex_girlsCouple;
	}
	public Boolean getSex_group() {
		return sex_group;
	}
	public void setSex_group(Boolean sex_group) {
		this.sex_group = sex_group;
	}
	public Boolean getSex_shemale() {
		return sex_shemale;
	}
	public void setSex_shemale(Boolean sex_shemale) {
		this.sex_shemale = sex_shemale;
	}
	public Boolean getSkinColor_black() {
		return skinColor_black;
	}
	public void setSkinColor_black(Boolean skinColor_black) {
		this.skinColor_black = skinColor_black;
	}
	public Boolean getSkinColor_dark() {
		return skinColor_dark;
	}
	public void setSkinColor_dark(Boolean skinColor_dark) {
		this.skinColor_dark = skinColor_dark;
	}
	public Boolean getSkinColor_veryDark() {
		return skinColor_veryDark;
	}
	public void setSkinColor_veryDark(Boolean skinColor_veryDark) {
		this.skinColor_veryDark = skinColor_veryDark;
	}
	public Boolean getSkinColor_white() {
		return skinColor_white;
	}
	public void setSkinColor_white(Boolean skinColor_white) {
		this.skinColor_white = skinColor_white;
	}
	public Boolean getSmoker_eventuallySmoker() {
		return smoker_eventuallySmoker;
	}
	public void setSmoker_eventuallySmoker(Boolean smoker_eventuallySmoker) {
		this.smoker_eventuallySmoker = smoker_eventuallySmoker;
	}
	public Boolean getSmoker_noSmoker() {
		return smoker_noSmoker;
	}
	public void setSmoker_noSmoker(Boolean smoker_noSmoker) {
		this.smoker_noSmoker = smoker_noSmoker;
	}
	public Boolean getSmoker_smoker() {
		return smoker_smoker;
	}
	public void setSmoker_smoker(Boolean smoker_smoker) {
		this.smoker_smoker = smoker_smoker;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
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

	public String getItemsPerPage() {
		return itemsPerPage;
	}


	public void setItemsPerPage(String itemsPerPage) {
		this.itemsPerPage = itemsPerPage;
	}


	public String getOrderedBy() {
		return orderedBy;
	}


	public void setOrderedBy(String orderedBy) {
		this.orderedBy = orderedBy;
	}

	public Boolean getIsOnline() {
		return isOnline;
	}


	public void setIsOnline(Boolean isOnline) {
		this.isOnline = isOnline;
	}


	public String getLogin() {
		return login;
	}


	public void setLogin(String login) {
		this.login = login;
	}


	public Integer getSellerId() {
		return sellerId;
	}


	public void setSellerId(Integer sellerId) {
		this.sellerId = sellerId;
	}


	
}
