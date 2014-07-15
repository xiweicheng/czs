package com.canzs.czs.pojo.model;

public enum WeiXinEventKey {

	CUSTOMER_EVT_KEY_1("customer_evt_key_1"), CUSTOMER_EVT_KEY_2("customer_evt_key_2"), CUSTOMER_EVT_KEY_3(
			"customer_evt_key_3"), CUSTOMER_EVT_KEY_4("customer_evt_key_4"), CUSTOMER_EVT_KEY_5("customer_evt_key_5"),

	PLATFORM_EVT_KEY_1("platform_evt_key_1"), PLATFORM_EVT_KEY_2("platform_evt_key_2"), PLATFORM_EVT_KEY_3(
			"platform_evt_key_3"), PLATFORM_EVT_KEY_4("platform_evt_key_4"), PLATFORM_EVT_KEY_5("platform_evt_key_5"),

	BUSINESS_EVT_KEY_1("business_evt_key_1"), BUSINESS_EVT_KEY_2("business_evt_key_2"), BUSINESS_EVT_KEY_3(
			"business_evt_key_3"), BUSINESS_EVT_KEY_4("business_evt_key_4"), BUSINESS_EVT_KEY_5("business_evt_key_5");

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
