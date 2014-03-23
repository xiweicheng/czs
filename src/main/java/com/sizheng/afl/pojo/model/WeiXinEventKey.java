package com.sizheng.afl.pojo.model;

public enum WeiXinEventKey {

	EVT_KEY_01("evt_key_01"), EVT_KEY_02("evt_key_02");

	private String value;

	WeiXinEventKey(String value) {
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
