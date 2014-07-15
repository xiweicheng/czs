package com.canzs.czs.pojo.model;

public class WeiXinQrcode {

	private String url;
	private String ticket;
	private String filePath;
	private String path;// 文件相对上下文的路径.
	private String myUrl;// 自己服务器的文件URL.
	private String description;

	public WeiXinQrcode() {
		super();
	}

	public WeiXinQrcode(String url, String ticket, String filePath, String path) {
		super();
		this.url = url;
		this.ticket = ticket;
		this.filePath = filePath;
		this.path = path;
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

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getMyUrl() {
		return myUrl;
	}

	public void setMyUrl(String myUrl) {
		this.myUrl = myUrl;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

}
