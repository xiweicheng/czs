package com.sizheng.afl.pojo.model;

public class WeiXinQrcode {

	private String url;
	private String ticket;
	private String filePath;

	public WeiXinQrcode() {
		super();
	}

	public WeiXinQrcode(String url, String ticket, String filePath) {
		super();
		this.url = url;
		this.ticket = ticket;
		this.filePath = filePath;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTicket() {
		return ticket;
	}

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

}
