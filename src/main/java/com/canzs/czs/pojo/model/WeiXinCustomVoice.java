package com.canzs.czs.pojo.model;

import java.io.Serializable;

public class WeiXinCustomVoice implements Serializable {
	private static final long serialVersionUID = -357080744415898671L;
	private String media_id;

	public WeiXinCustomVoice(String media_id) {
		super();
		this.media_id = media_id;
	}

	public String getMedia_id() {
		return media_id;
	}

	public void setMedia_id(String media_id) {
		this.media_id = media_id;
	}

}
