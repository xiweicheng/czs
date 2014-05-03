package com.canzs.czs.pojo.vo;

import java.io.Serializable;
import java.util.List;

/**
 * 分页查询结果封装.
 * 
 * @creation 2014年1月3日 上午10:27:10
 * @modification 2014年1月3日 上午10:27:10
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
public class PageResult implements Serializable {

	/** serialVersionUID [long] */
	private static final long serialVersionUID = 5432590571005841532L;

	private long total;

	private List<?> list;

	public PageResult() {
		super();
	}

	public PageResult(long total, List<?> list) {
		super();
		this.total = total;
		this.list = list;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}

	/**
	 * 判断结果是否为空.
	 * 
	 * @author xiweicheng
	 * @creation 2014年1月3日 上午10:31:32
	 * @modification 2014年1月3日 上午10:31:32
	 * @return
	 */
	public boolean isEmpty() {
		return this.list == null || this.list.isEmpty();
	}

	@Override
	public String toString() {
		return "PageResult [total=" + total + ", list=" + list + "]";
	}

}
