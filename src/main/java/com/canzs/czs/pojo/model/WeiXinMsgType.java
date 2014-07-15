package com.canzs.czs.pojo.model;

public enum WeiXinMsgType {

	EVENT("event"), TEXT("text"), IMAGE("image"), VOICE("voice"), VIDEO("video"), LOCATION("location"), LINK("link");

	private String value;

	WeiXinMsgType(String value) {
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
