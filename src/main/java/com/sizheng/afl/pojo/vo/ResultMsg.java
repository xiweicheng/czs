package com.sizheng.afl.pojo.vo;

import java.io.Serializable;
import java.util.List;

import com.sizheng.afl.util.WebUtil;

/**
 * 前端调用返回结果数据结构.
 * 
 * @creation 2013-9-18 下午1:43:31
 * @modification 2013-9-18 下午1:43:31
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public class ResultMsg implements Serializable {

	/** serialVersionUID [long] */
	private static final long serialVersionUID = -7236030319259368780L;

	/** mimeType [String] mime type */
	private String mimeType = "application/json";

	/** id [String] ID标识 */
	private String id;

	/** verson [String]结果版本 */
	private String verson = "3.0";

	/** auth [String] auth验证 */
	private String auth;

	/** succeed [boolean]是否为成功调用结果 */
	private boolean succeed = true;

	/** msg [Msg]单条消息 */
	private Msg msg;

	/** msgs [List<Msg>]多条消息 */
	private List<Msg> msgs;

	/** value [Object]调用返回结果对象 */
	private Object value;

	/** values [List<Object>]调用返回结果对象列表 */
	private List values;

	/** totalProperty [long]分页使用的总的行数 */
	private long total;

	{
		this.auth = WebUtil.getSessionId();
	}

	public ResultMsg() {
	}

	public ResultMsg(boolean succeed) {
		this.succeed = succeed;
	}

	public ResultMsg(boolean succeed, String id) {
		super();
		this.succeed = succeed;
		this.id = id;
	}

	public ResultMsg(Object value) {
		super();
		this.value = value;
	}

	public ResultMsg(boolean succeed, Object value) {
		this.succeed = succeed;
		this.value = value;
	}

	public ResultMsg(boolean succeed, String id, Object value) {
		super();
		this.succeed = succeed;
		this.id = id;
		this.value = value;
	}

	public ResultMsg(String id, Object value) {
		super();
		this.id = id;
		this.value = value;
	}

	public ResultMsg(String id, Object value, long total) {
		super();
		this.id = id;
		this.value = value;
		this.total = total;
	}

	public ResultMsg(boolean succeed, Msg msg) {
		super();
		this.succeed = succeed;
		this.msg = msg;
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

	public boolean isSucceed() {
		return succeed;
	}

	public void setSucceed(boolean succeed) {
		this.succeed = succeed;
	}

	public Msg getMsg() {
		return msg;
	}

	public void setMsg(Msg msg) {
		this.msg = msg;
	}

	public List<Msg> getMsgs() {
		return msgs;
	}

	public void setMsgs(List<Msg> msgs) {
		this.msgs = msgs;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	public List getValues() {
		return values;
	}

	public void setValues(List values) {
		this.values = values;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "ResultMsg [mimeType=" + mimeType + ", id=" + id + ", verson=" + verson + ", auth=" + auth
				+ ", succeed=" + succeed + ", msg=" + msg + ", msgs=" + msgs + ", value=" + value + ", values="
				+ values + ", total=" + total + "]";
	}

}
