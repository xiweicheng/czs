/**
 * Token.java
 */
package com.sizheng.afl.pojo.model;

import java.io.Serializable;

/**
 * 【测试】请求参数.
 * 
 * @creation 2014年03月19日 02:07:25
 * @modification 2014年03月19日 02:07:25
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public class Token implements Serializable {

	/** serialVersionUID [long] */
	private static final long serialVersionUID = -8648096090515469018L;
	/**
	 * signature [String]
	 * 微信加密签名，signature结合了开发者填写的token参数和请求中的timestamp参数、nonce参数。
	 */
	private String signature;
	/** timestamp [String] 时间戳 */
	private String timestamp;
	/** nonce [String] 随机数 */
	private String nonce;
	/** echostr [String] 随机字符串 */
	private String echostr;

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	public String getNonce() {
		return nonce;
	}

	public void setNonce(String nonce) {
		this.nonce = nonce;
	}

	public String getEchostr() {
		return echostr;
	}

	public void setEchostr(String echostr) {
		this.echostr = echostr;
	}

}
