/**
 * WeiXinMsg.java
 */
package com.canzs.czs.pojo.model;

import java.io.Serializable;

/**
 * 【微信】请求参数.
 * 
 * @creation 2014年03月19日 02:07:25
 * @modification 2014年03月19日 02:07:25
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
public class WeiXinCustomMsg implements Serializable {
	private static final long serialVersionUID = 7914391500753417645L;
	private String touser;
	private String msgtype;
	private WeiXinCustomText text;
	private WeiXinCustomVoice voice;

	public String getTouser() {
		return touser;
	}

	public void setTouser(String touser) {
		this.touser = touser;
	}

	public String getMsgtype() {
		return msgtype;
	}

	public void setMsgtype(String msgtype) {
		this.msgtype = msgtype;
	}

	public WeiXinCustomText getText() {
		return text;
	}

	public void setText(WeiXinCustomText text) {
		this.text = text;
	}

	public WeiXinCustomVoice getVoice() {
		return voice;
	}

	public void setVoice(WeiXinCustomVoice voice) {
		this.voice = voice;
	}

}
