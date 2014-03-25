/**
 * QrcodeServiceImpl.java
 */
package com.sizheng.afl.service.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sizheng.afl.base.impl.BaseServiceImpl;
import com.sizheng.afl.component.ApiInvoker;
import com.sizheng.afl.component.WeiXinApiInvoker;
import com.sizheng.afl.dao.IQrcodeDao;
import com.sizheng.afl.pojo.model.Qrcode;
import com.sizheng.afl.pojo.model.WeiXinActionInfo;
import com.sizheng.afl.pojo.model.WeiXinQrcodeCreateParam;
import com.sizheng.afl.pojo.model.WeiXinScene;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.service.IQrcodeService;
import com.sizheng.afl.util.StringUtil;

/**
 * 【二维码】业务逻辑实现.
 * 
 * @creation 2014年03月25日 05:57:01
 * @modification 2014年03月25日 05:57:01
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Service
@Transactional
public class QrcodeServiceImpl extends BaseServiceImpl implements IQrcodeService {

	private static Logger logger = Logger.getLogger(QrcodeServiceImpl.class);

	@Autowired
	IQrcodeDao qrcodeDao;

	@Autowired
	ApiInvoker apiInvoker;

	@Autowired
	WeiXinApiInvoker weiXinApiInvoker;

	@Override
	public boolean save(Locale locale, Qrcode qrcode) {
		
		logger.debug("[业务逻辑层]添加【二维码】");
		
		// TODO
		return true;
	}

	@Override
	public boolean delete(Locale locale, Qrcode qrcode) {
		
		logger.debug("[业务逻辑层]删除【二维码】");
		
		// TODO
		return true;
	}

	@Override
	public Qrcode get(Locale locale, Qrcode qrcode) {
		
		logger.debug("[业务逻辑层]获取【二维码】");
		
		// TODO
		return null;
	}

	@Override
	public boolean update(Locale locale, Qrcode qrcode) {
		
		logger.debug("[业务逻辑层]更新【二维码】");
		
		// TODO
		return true;
	}
	
	@Override
	public List<Qrcode> list(Locale locale) {

		logger.debug("[业务逻辑层]列举【二维码】");

		// TODO
		return null;
	}
	
	@Override
	public List<Map<String, Object>> query(Locale locale, Qrcode qrcode) {

		logger.debug("[业务逻辑层]查询【二维码】(不分页)");

		// TODO
		return null;
	}

	@Override
	public PageResult paging(Locale locale, Qrcode qrcode, Long start, Long limit) {

		logger.debug("[业务逻辑层]查询【二维码】(分页)");

		PageResult pageResult = new PageResult();

		// TODO
		return pageResult;
	}
	
	@Override
	public boolean exists(Locale locale, Qrcode qrcode) {
		
		logger.debug("[业务逻辑层]判断【二维码】是否存在");
		
		// TODO
		return true;
	}

	@Override
	public String create(Qrcode qrcode, String realPath) {

		logger.debug("[业务逻辑层]创建【二维码】");

		if (!realPath.endsWith("/")) {
			realPath += "/";
		}

		String filePath = "resources/images/qrcode/{?1}_{?2}_{?3}.jpg";

		filePath = StringUtil.replace(filePath, UUID.randomUUID(), qrcode.getSceneId(), qrcode.getDescription());

		logger.debug(filePath);

		weiXinApiInvoker.downQrcodeImage(new WeiXinQrcodeCreateParam("QR_LIMIT_SCENE", new WeiXinActionInfo(
				new WeiXinScene(qrcode.getSceneId()))), realPath + filePath);

		return filePath;
	}
	
}