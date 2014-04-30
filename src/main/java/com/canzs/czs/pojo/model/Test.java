/**
 * Test.java
 */
package com.canzs.czs.pojo.model;


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
public class Test implements Serializable {

	/** serialVersionUID [long] */
	private static final long serialVersionUID = -8648096090515469018L;
	/** startTime [String] 告警时间范围的开始时间 */
	private String startTime;
	/** endTime [String] 告警时间范围的结束时间 */
	private String endTime;
	/** monitoringType [String] 监控类型 */
	private String monitoringType;
	/** level [String] 告警级别 */
	private String level;
	/** keyword [String] 查询关键字[主机名] */
	private String keyword;
	/** description [String] 告警描述 */
	private String description;

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getMonitoringType() {
		return monitoringType;
	}

	public void setMonitoringType(String monitoringType) {
		this.monitoringType = monitoringType;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
