package com.canzs.czs.pojo.model;

import java.io.Serializable;
import java.util.List;

public class WeiXinMenu implements Serializable {

	private static final long serialVersionUID = -5073904690785026774L;
	private List<WeiXinButton> button;

	public List<WeiXinButton> getButton() {
		return button;
	}

	public void setButton(List<WeiXinButton> button) {
		this.button = button;
	}

}
