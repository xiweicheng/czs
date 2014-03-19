/**
 * SysConfig.java
 */
package com.sizheng.afl.pojo.vo;

/**
 * 系统配置属性.
 * 
 * @creation 2013年12月30日 下午6:38:17
 * @modification 2013年12月30日 下午6:38:17
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public final class SysConfig {

	private SysConfig() {
	}

	public static String sessionid;
	/** departmentid [Long] 创建者部门ID */
	public static Long creater_departmentid = 0L;
	/** createrid [Long] 创建者ID */
	public static Long createrid = 1L;
	/** templateid [String] web站点监控使用的模板ID */
	public static String website_templateid = "10159";
	/** typeId_website [Long] >> table[skycloud_grouptype] {14 Web服务} */
	public static Long typeId_website = 14L;

}
