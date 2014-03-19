/**
 * ReqBody.java
 */
package com.sizheng.afl.pojo.vo;

import java.io.Serializable;

/**
 * 调用请求的内容主体.
 * 
 * @creation 2013年12月28日 下午4:31:59
 * @modification 2013年12月28日 下午4:31:59
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public class ReqBody implements Serializable {

	/** serialVersionUID [long] */
	private static final long serialVersionUID = -5271121515580392647L;

	/** mimeType [String] mime type */
	private String mimeType = "application/json";

	/** id [String] ID标识 */
	private String id;

	/** verson [String]结果版本 */
	private String verson = "3.0";

	/** auth [String] auth验证 */
	private String auth;

	/** callback [String] Ajax调用设置的回调函数名 */
	private String callback;

	/** params [String] 请求参数 */
	private Object params;

	/** start [String] 分页参数-起始索引 */
	private Long start;

	/** limit [String] 分页参数-条目限制 */
	private Long limit;

	public ReqBody() {
		super();
	}

	public ReqBody(Object params) {
		super();
		this.params = params;
	}

	public ReqBody(String callback) {
		super();
		this.callback = callback;
	}

	public ReqBody(String callback, Object params) {
		super();
		this.callback = callback;
		this.params = params;
	}

	public ReqBody(String mimeType, String id, String verson, String auth) {
		super();
		this.mimeType = mimeType;
		this.id = id;
		this.verson = verson;
		this.auth = auth;
	}

	public ReqBody(String mimeType, String id, String verson, String auth, Object params) {
		super();
		this.mimeType = mimeType;
		this.id = id;
		this.verson = verson;
		this.auth = auth;
		this.params = params;
	}

	public String getMimeType() {
		return mimeType;
	}

	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getVerson() {
		return verson;
	}

	public void setVerson(String verson) {
		this.verson = verson;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public String getCallback() {
		return callback;
	}

	public void setCallback(String callback) {
		this.callback = callback;
	}

	public Object getParams() {
		return params;
	}

	public void setParams(Object params) {
		this.params = params;
	}

	public Long getStart() {
		return start;
	}

	public void setStart(Long start) {
		this.start = start;
	}

	public Long getLimit() {
		return limit;
	}

	public void setLimit(Long limit) {
		this.limit = limit;
	}

	@Override
	public String toString() {
		return "ReqBody [mimeType=" + mimeType + ", id=" + id + ", verson=" + verson + ", auth=" + auth + ", callback="
				+ callback + ", params=" + params + ", start=" + start + ", limit=" + limit + "]";
	}

}
