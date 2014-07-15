package com.canzs.czs.pojo.model;

public class WeiXinClickButton extends WeiXinButton {
	private static final long serialVersionUID = -3835514136666452488L;
	private String key;

	public WeiXinClickButton() {
		super();
		this.type = "click";
	}

	public WeiXinClickButton(String name, String key) {
		this();
		this.name = name;
		this.key = key;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

}