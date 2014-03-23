package com.sizheng.afl.pojo.model;

public enum WeiXinMsgType {

	EVENT("event"), TEXT("text");

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
