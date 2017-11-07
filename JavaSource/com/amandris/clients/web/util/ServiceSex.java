package com.amandris.clients.web.util;

import java.io.Serializable;


public class ServiceSex implements Serializable{

	private boolean sex1;
	private boolean sex2;
	private boolean sex4;
	private boolean sex8;
	private boolean sex16;
	private boolean sex32;
	private boolean sex64;
	
	public ServiceSex(){
		sex1 = false;
		sex2 = false;
		sex4 = false;
		sex8 = false;
		sex16 = false;
		sex32 = false;
		sex64 = false;
	}
	
	public boolean isSex1() {
		return sex1;
	}
	public void setSex1(boolean sex1) {
		this.sex1 = sex1;
	}
	public boolean isSex2() {
		return sex2;
	}
	public void setSex2(boolean sex2) {
		this.sex2 = sex2;
	}
	public boolean isSex4() {
		return sex4;
	}
	public void setSex4(boolean sex4) {
		this.sex4 = sex4;
	}
	public boolean isSex8() {
		return sex8;
	}
	public void setSex8(boolean sex8) {
		this.sex8 = sex8;
	}
	public boolean isSex16() {
		return sex16;
	}
	public void setSex16(boolean sex16) {
		this.sex16 = sex16;
	}
	public boolean isSex32() {
		return sex32;
	}
	public void setSex32(boolean sex32) {
		this.sex32 = sex32;
	}
	public boolean isSex64() {
		return sex64;
	}
	public void setSex64(boolean sex64) {
		this.sex64 = sex64;
	}


	
	
}
