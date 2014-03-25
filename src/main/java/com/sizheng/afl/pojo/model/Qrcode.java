/**
 * Qrcode.java
 */
package com.sizheng.afl.pojo.model;


import java.io.Serializable;

/**
 * 【二维码】请求参数.
 * 
 * @creation 2014年03月25日 05:57:01
 * @modification 2014年03月25日 05:57:01
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public class Qrcode implements Serializable {
	private String sceneId;
	private String description;

	public String getSceneId() {
		return sceneId;
	}

	public void setSceneId(String sceneId) {
		this.sceneId = sceneId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
