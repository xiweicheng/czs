package com.sizheng.afl.pojo.entity;

// Generated 2014-4-24 14:11:05 by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Business generated by hbm2java
 */
@Entity
@Table(name = "business", catalog = "afl")
public class Business implements java.io.Serializable {

	private Long id;
	private String openId;
	private Short isDeleted;
	private String name;
	private String address;
	private String mail;
	private String introduce;
	private String phoneNumber;
	private Long qrcodeLimit;
	private String dynamicCode;
	private Short isMailVerify;
	private Short isPhoneVerify;
	private String password;
	private Short status;

	public Business() {
	}

	public Business(String openId, Short isDeleted, String name, String address, String mail, String introduce,
			String phoneNumber, Long qrcodeLimit, String dynamicCode, Short isMailVerify, Short isPhoneVerify,
			String password, Short status) {
		this.openId = openId;
		this.isDeleted = isDeleted;
		this.name = name;
		this.address = address;
		this.mail = mail;
		this.introduce = introduce;
		this.phoneNumber = phoneNumber;
		this.qrcodeLimit = qrcodeLimit;
		this.dynamicCode = dynamicCode;
		this.isMailVerify = isMailVerify;
		this.isPhoneVerify = isPhoneVerify;
		this.password = password;
		this.status = status;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "open_id")
	public String getOpenId() {
		return this.openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	@Column(name = "is_deleted")
	public Short getIsDeleted() {
		return this.isDeleted;
	}

	public void setIsDeleted(Short isDeleted) {
		this.isDeleted = isDeleted;
	}

	@Column(name = "name", length = 500)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "address", length = 500)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "mail")
	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	@Column(name = "introduce", length = 1000)
	public String getIntroduce() {
		return this.introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	@Column(name = "phone_number", length = 50)
	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Column(name = "qrcode_limit")
	public Long getQrcodeLimit() {
		return this.qrcodeLimit;
	}

	public void setQrcodeLimit(Long qrcodeLimit) {
		this.qrcodeLimit = qrcodeLimit;
	}

	@Column(name = "dynamic_code")
	public String getDynamicCode() {
		return this.dynamicCode;
	}

	public void setDynamicCode(String dynamicCode) {
		this.dynamicCode = dynamicCode;
	}

	@Column(name = "is_mail_verify")
	public Short getIsMailVerify() {
		return this.isMailVerify;
	}

	public void setIsMailVerify(Short isMailVerify) {
		this.isMailVerify = isMailVerify;
	}

	@Column(name = "is_phone_verify")
	public Short getIsPhoneVerify() {
		return this.isPhoneVerify;
	}

	public void setIsPhoneVerify(Short isPhoneVerify) {
		this.isPhoneVerify = isPhoneVerify;
	}

	@Column(name = "password")
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "status")
	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

}
