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
	/** sceneId [String] 使用参数标识 */
	private String sceneId;
	/** description [String] 使用描述 */
	private String description;
	/** category [String] 二维码使用场景分类 */
	private String category;
	/** openId [String] */
	private String openId;

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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

}
