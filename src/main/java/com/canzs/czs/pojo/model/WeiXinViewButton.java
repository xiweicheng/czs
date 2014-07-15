package com.canzs.czs.pojo.model;

public class WeiXinViewButton extends WeiXinButton {
	private static final long serialVersionUID = -3835514136666452488L;
	private String url;

	public WeiXinViewButton() {
		super();
		this.type = "view";
	}

	public WeiXinViewButton(String name, String url) {
		this();
		this.name = name;
		this.url = url;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}