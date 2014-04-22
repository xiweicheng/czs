/**
 * IMessageService.java
 */
package com.sizheng.afl.service;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.base.IBaseService;
import com.sizheng.afl.pojo.entity.Message;
import com.sizheng.afl.pojo.vo.PageResult;

/**
 * 【顾客消息】业务逻辑接口.
 * 
 * @creation 2014年04月22日 04:15:09
 * @modification 2014年04月22日 04:15:09
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IMessageService extends IBaseService {

	/**
	 * 创建【顾客消息】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 04:15:09
	 * @modification 2014年04月22日 04:15:09
	 * @param message
	 * @return
	 */
	boolean save(Locale locale, Message message);

	/**
	 * 删除【顾客消息】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 04:15:09
	 * @modification 2014年04月22日 04:15:09
	 * @param message
	 * @return
	 */
	boolean delete(Locale locale, Message message);

	/**
	 * 获取【顾客消息】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 04:15:09
	 * @modification 2014年04月22日 04:15:09
	 * @param message
	 * @return
	 */
	Message get(Locale locale, Message message);
	
	/**
	 * 更新【顾客消息】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 04:15:09
	 * @modification 2014年04月22日 04:15:09
	 * @param message
	 * @return
	 */
	boolean update(Locale locale, Message message);
	
	/**
	 * 列举【顾客消息】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 04:15:09
	 * @modification 2014年04月22日 04:15:09
	 * @param message
	 * @return
	 */
	List<Message> list(Locale locale);

	/**
	 * 查询【顾客消息】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 04:15:09
	 * @modification 2014年04月22日 04:15:09
	 * @param message
	 * @return
	 */
	List<Message> query(Locale locale, Message message);

	/**
	 * 查询【顾客消息】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 04:15:09
	 * @modification 2014年04月22日 04:15:09
	 * @param message
	 * @return
	 */
	List<Map<String, Object>> queryMapList(Locale locale, Message message);

	/**
	 * 查询【顾客消息】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 04:15:09
	 * @modification 2014年04月22日 04:15:09
	 * @param message
	 * @return
	 */
	PageResult paging(Locale locale, Message message, Long start, Long limit);

	/**
	 * 判断【顾客消息】是否存在.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 04:15:09
	 * @modification 2014年04月22日 04:15:09
	 * @param message
	 * @return
	 */
	boolean exists(Locale locale, Message message);

	/**
	 * 更新状态.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月22日 下午4:21:47
	 * @modification 2014年4月22日 下午4:21:47
	 * @param locale
	 * @param message
	 * @return
	 */
	boolean updateStatus(Locale locale, Message message);
}
