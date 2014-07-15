/**
 * IRequestService.java
 */
package com.canzs.czs.service;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.canzs.czs.base.IBaseService;
import com.canzs.czs.pojo.entity.Request;
import com.canzs.czs.pojo.vo.PageResult;

/**
 * 【顾客实时请求】业务逻辑接口.
 * 
 * @creation 2014年04月11日 03:18:24
 * @modification 2014年04月11日 03:18:24
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IRequestService extends IBaseService {

	/**
	 * 创建【顾客实时请求】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月11日 03:18:24
	 * @modification 2014年04月11日 03:18:24
	 * @param request
	 * @return
	 */
	boolean save(Locale locale, Request request);

	/**
	 * 删除【顾客实时请求】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月11日 03:18:24
	 * @modification 2014年04月11日 03:18:24
	 * @param request
	 * @return
	 */
	boolean delete(Locale locale, Request request);

	/**
	 * 获取【顾客实时请求】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月11日 03:18:24
	 * @modification 2014年04月11日 03:18:24
	 * @param request
	 * @return
	 */
	Request get(Locale locale, Request request);
	
	/**
	 * 更新【顾客实时请求】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月11日 03:18:24
	 * @modification 2014年04月11日 03:18:24
	 * @param request
	 * @return
	 */
	boolean update(Locale locale, Request request);
	
	/**
	 * 列举【顾客实时请求】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月11日 03:18:24
	 * @modification 2014年04月11日 03:18:24
	 * @param request
	 * @return
	 */
	List<Request> list(Locale locale);

	/**
	 * 查询【顾客实时请求】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月11日 03:18:24
	 * @modification 2014年04月11日 03:18:24
	 * @param request
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, Request request);

	/**
	 * 查询【顾客实时请求】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月11日 03:18:24
	 * @modification 2014年04月11日 03:18:24
	 * @param request
	 * @return
	 */
	PageResult paging(Locale locale, Request request, Long start, Long limit);

	/**
	 * 判断【顾客实时请求】是否存在.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月11日 03:18:24
	 * @modification 2014年04月11日 03:18:24
	 * @param request
	 * @return
	 */
	boolean exists(Locale locale, Request request);

	/**
	 * 更新请求状态.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月11日 下午5:32:15
	 * @modification 2014年4月11日 下午5:32:15
	 * @param id
	 * @param requestStatusStop
	 * @return
	 */
	boolean updateStatus(long id, Short status);

}
