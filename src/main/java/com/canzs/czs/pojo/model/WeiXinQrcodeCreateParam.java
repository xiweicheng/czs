package com.canzs.czs.pojo.model;

public class WeiXinQrcodeCreateParam {
	private String expire_seconds;
	private String action_name;
	private WeiXinActionInfo action_info;

	public WeiXinQrcodeCreateParam() {
		super();
	}

	public WeiXinQrcodeCreateParam(String expire_seconds, String action_name, WeiXinActionInfo action_info) {
		super();
		this.expire_seconds = expire_seconds;
		this.action_name = action_name;
		this.action_info = action_info;
	}

	public WeiXinQrcodeCreateParam(String action_name, WeiXinActionInfo action_info) {
		super();
		this.action_name = action_name;
		this.action_info = action_info;
	}

	public String getExpire_seconds() {
		return expire_seconds;
	}

	public void setExpire_seconds(String expire_seconds) {
		this.expire_seconds = expire_seconds;
	}

	public String getAction_name() {
		return action_name;
	}

	public void setAction_name(String action_name) {
		this.action_name = action_name;
	}

	public WeiXinActionInfo getAction_info() {
		return action_info;
	}

	public void setAction_info(WeiXinActionInfo action_info) {
		this.action_info = action_info;
	}

}
