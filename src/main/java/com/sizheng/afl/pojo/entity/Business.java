package com.sizheng.afl.pojo.entity;

// Generated 2014-4-29 20:37:11 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

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
	private Date dateTime;
	private String auditHandler;
	private Date auditDateTime;
	private Long days;
	private Long loginTimes;

	public Business() {
	}

	public Business(String openId, Short isDeleted, String name, String address, String mail, String introduce,
			String phoneNumber, Long qrcodeLimit, String dynamicCode, Short isMailVerify, Short isPhoneVerify,
			String password, Short status, Date dateTime, String auditHandler, Date auditDateTime, Long days,
			Long loginTimes) {
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
		this.dateTime = dateTime;
		this.auditHandler = auditHandler;
		this.auditDateTime = auditDateTime;
		this.days = days;
		this.loginTimes = loginTimes;
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

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date_time", length = 19)
	public Date getDateTime() {
		return this.dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	@Column(name = "audit_handler")
	public String getAuditHandler() {
		return this.auditHandler;
	}

	public void setAuditHandler(String auditHandler) {
		this.auditHandler = auditHandler;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "audit_date_time", length = 19)
	public Date getAuditDateTime() {
		return this.auditDateTime;
	}

	public void setAuditDateTime(Date auditDateTime) {
		this.auditDateTime = auditDateTime;
	}

	@Column(name = "days")
	public Long getDays() {
		return this.days;
	}

	public void setDays(Long days) {
		this.days = days;
	}

	@Column(name = "login_times")
	public Long getLoginTimes() {
		return this.loginTimes;
	}

	public void setLoginTimes(Long loginTimes) {
		this.loginTimes = loginTimes;
	}

}
