package com.canzs.czs.pojo.model;

import java.io.Serializable;

public class WeiXinCustomText implements Serializable {
	private static final long serialVersionUID = -357080744415898671L;
	private String content;

	public WeiXinCustomText(String content) {
		super();
		this.content = content;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
