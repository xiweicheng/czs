/**
 * IServiceService.java
 */
package com.canzs.czs.service;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.canzs.czs.base.IBaseService;
import com.canzs.czs.pojo.entity.Service;
import com.canzs.czs.pojo.vo.PageResult;

/**
 * 【呼叫服务】业务逻辑接口.
 * 
 * @creation 2014年04月23日 08:28:44
 * @modification 2014年04月23日 08:28:44
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IServiceService extends IBaseService {

	/**
	 * 创建【呼叫服务】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 08:28:44
	 * @modification 2014年04月23日 08:28:44
	 * @param service
	 * @return
	 */
	boolean save(Locale locale, Service service);

	/**
	 * 删除【呼叫服务】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 08:28:44
	 * @modification 2014年04月23日 08:28:44
	 * @param service
	 * @return
	 */
	boolean delete(Locale locale, Service service);

	/**
	 * 获取【呼叫服务】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 08:28:44
	 * @modification 2014年04月23日 08:28:44
	 * @param service
	 * @return
	 */
	Service get(Locale locale, Service service);
	
	/**
	 * 更新【呼叫服务】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 08:28:44
	 * @modification 2014年04月23日 08:28:44
	 * @param service
	 * @return
	 */
	boolean update(Locale locale, Service service);
	
	/**
	 * 列举【呼叫服务】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 08:28:44
	 * @modification 2014年04月23日 08:28:44
	 * @param service
	 * @return
	 */
	List<Service> list(Locale locale);

	/**
	 * 查询【呼叫服务】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 08:28:44
	 * @modification 2014年04月23日 08:28:44
	 * @param service
	 * @return
	 */
	List<Service> query(Locale locale, Service service);

	/**
	 * 查询【呼叫服务】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 08:28:44
	 * @modification 2014年04月23日 08:28:44
	 * @param service
	 * @return
	 */
	List<Map<String, Object>> queryMapList(Locale locale, Service service);

	/**
	 * 查询【呼叫服务】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 08:28:44
	 * @modification 2014年04月23日 08:28:44
	 * @param service
	 * @return
	 */
	PageResult paging(Locale locale, Service service, Long start, Long limit);

	/**
	 * 判断【呼叫服务】是否存在.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 08:28:44
	 * @modification 2014年04月23日 08:28:44
	 * @param service
	 * @return
	 */
	boolean exists(Locale locale, Service service);

	boolean updateStatus(Locale locale, Service service);
}
