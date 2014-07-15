package com.canzs.czs.pojo.model;

import java.io.Serializable;
import java.util.List;

public class WeiXinButton implements Serializable {
	private static final long serialVersionUID = -8780312068885832634L;
	protected String type;
	protected String name;
	protected List<WeiXinButton> sub_button;

	public WeiXinButton() {
		super();
	}

	public WeiXinButton(String name) {
		super();
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<WeiXinButton> getSub_button() {
		return sub_button;
	}

	public void setSub_button(List<WeiXinButton> sub_button) {
		this.sub_button = sub_button;
	}

}