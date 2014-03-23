package com.sizheng.afl.pojo.model;

public enum WeiXinEventType {

	SUBSCRIBE("subscribe"), UNSUBSCRIBE("unsubscribe"), CLICK("CLICK"), LOCATION("LOCATION");

	private String value;

	WeiXinEventType(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	@Override
	public String toString() {
		return value;
	}

}
