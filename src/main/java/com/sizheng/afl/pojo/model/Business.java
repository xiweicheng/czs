/**
 * Business.java
 */
package com.sizheng.afl.pojo.model;

import java.io.Serializable;

/**
 * 【商家】请求参数.
 * 
 * @creation 2014年03月25日 02:46:32
 * @modification 2014年03月25日 02:46:32
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public class Business implements Serializable {

	private String openId;
	private String name;
	private String address;
	private String mail;
	private String introduce;
	private String phoneNumber;
	private Long qrcodeLimit;

	public Long getQrcodeLimit() {
		return qrcodeLimit;
	}

	public void setQrcodeLimit(Long qrcodeLimit) {
		this.qrcodeLimit = qrcodeLimit;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

}
