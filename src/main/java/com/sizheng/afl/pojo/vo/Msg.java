package com.sizheng.afl.pojo.vo;

import java.io.Serializable;

public class Msg implements Serializable {

	/** serialVersionUID [long] */
	private static final long serialVersionUID = 9006388192064350656L;

	/** 对应的是否为成功消息 **/
	private boolean succeed;

	/** 消息ID **/
	private Serializable id = "0";

	/** 消息详细 **/
	private String detail = "";

	public Msg() {
		super();
	}

	public Msg(boolean succeed, String detail) {
		this.succeed = succeed;
		this.detail = detail;
	}

	public Msg(Serializable id, boolean succeed, String detail) {
		this.succeed = succeed;
		this.id = id;
		this.detail = detail;
	}

	public boolean isSucceed() {
		return succeed;
	}

	public void setSucceed(boolean succeed) {
		this.succeed = succeed;
	}

	public Serializable getId() {
		return id;
	}

	public void setId(Serializable id) {
		this.id = id;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	@Override
	public String toString() {
		return "Msg [succeed=" + succeed + ", id=" + id + ", detail=" + detail + "]";
	}

}
