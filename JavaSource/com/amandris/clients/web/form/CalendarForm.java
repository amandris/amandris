package com.amandris.clients.web.form;


import java.io.Serializable;
import org.apache.struts.validator.ValidatorForm;

public class CalendarForm extends ValidatorForm implements Serializable{

		private String pattern;
		private String startHour2;
		private String endHour2;
		private String startHour4;
		private String endHour4;
		private String startHour6;
		private String endHour6;
		private String startDay7;
		private String endDay7;
		private String startDay8;
		private String endDay8;
		private String startHour8;
		private String endHour8;
		
		
		private static final long serialVersionUID = 8327261064370921L;

		public CalendarForm() {
			pattern 	= "1";
			startHour2	= "0";
			endHour2	= "23";
			startHour4	= "0";
			endHour4	= "23";
			startHour6	= "0";
			endHour6	= "23";
			startDay7	= "2";
			endDay7		= "1";
			startDay8	= "2";
			endDay8		= "1";
			startHour8	= "0";
			endHour8	= "23";
		}

		public String getEndDay7() {
			return endDay7;
		}

		public void setEndDay7(String endDay7) {
			this.endDay7 = endDay7;
		}

		public String getEndDay8() {
			return endDay8;
		}

		public void setEndDay8(String endDay8) {
			this.endDay8 = endDay8;
		}

		public String getEndHour2() {
			return endHour2;
		}

		public void setEndHour2(String endHour2) {
			this.endHour2 = endHour2;
		}

		public String getEndHour4() {
			return endHour4;
		}

		public void setEndHour4(String endHour4) {
			this.endHour4 = endHour4;
		}

		public String getEndHour6() {
			return endHour6;
		}

		public void setEndHour6(String endHour6) {
			this.endHour6 = endHour6;
		}

		public String getEndHour8() {
			return endHour8;
		}

		public void setEndHour8(String endHour8) {
			this.endHour8 = endHour8;
		}

		public String getPattern() {
			return pattern;
		}

		public void setPattern(String pattern) {
			this.pattern = pattern;
		}

		public String getStartDay7() {
			return startDay7;
		}

		public void setStartDay7(String startDay7) {
			this.startDay7 = startDay7;
		}

		public String getStartDay8() {
			return startDay8;
		}

		public void setStartDay8(String startDay8) {
			this.startDay8 = startDay8;
		}

		public String getStartHour2() {
			return startHour2;
		}

		public void setStartHour2(String startHour2) {
			this.startHour2 = startHour2;
		}

		public String getStartHour4() {
			return startHour4;
		}

		public void setStartHour4(String startHour4) {
			this.startHour4 = startHour4;
		}

		public String getStartHour6() {
			return startHour6;
		}

		public void setStartHour6(String startHour6) {
			this.startHour6 = startHour6;
		}

		public String getStartHour8() {
			return startHour8;
		}

		public void setStartHour8(String startHour8) {
			this.startHour8 = startHour8;
		}
		
		
		
}
