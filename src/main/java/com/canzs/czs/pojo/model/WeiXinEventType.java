package com.canzs.czs.pojo.model;

public enum WeiXinEventType {

	SUBSCRIBE("subscribe"), UNSUBSCRIBE("unsubscribe"), CLICK("CLICK"), LOCATION("LOCATION"), SCAN("SCAN"), VIEW("VIEW");

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
