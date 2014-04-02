/**
 * MenuServiceImpl.java
 */
package com.sizheng.afl.service.impl;

import java.io.File;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.sizheng.afl.base.impl.BaseServiceImpl;
import com.sizheng.afl.component.ApiInvoker;
import com.sizheng.afl.component.PropUtil;
import com.sizheng.afl.dao.IMenuDao;
import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.pojo.entity.Menu;
import com.sizheng.afl.pojo.entity.Resources;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.service.IMenuService;
import com.sizheng.afl.util.DateUtil;
import com.sizheng.afl.util.StringUtil;

/**
 * 【菜单】业务逻辑实现.
 * 
 * @creation 2014年03月29日 08:37:32
 * @modification 2014年03月29日 08:37:32
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Service
@Transactional
public class MenuServiceImpl extends BaseServiceImpl implements IMenuService {

	private static Logger logger = Logger.getLogger(MenuServiceImpl.class);

	@Autowired
	IMenuDao menuDao;

	@Autowired
	ApiInvoker apiInvoker;

	@Autowired
	PropUtil propUtil;

	@Override
	public boolean save(Locale locale, Menu menu) {

		logger.debug("[业务逻辑层]添加【菜单】");

		hibernateTemplate.save(menu);

		return true;
	}

	@Override
	public boolean delete(Locale locale, Menu menu) {

		logger.debug("[业务逻辑层]删除【菜单】");

		hibernateTemplate.delete(menu);

		return true;
	}

	@Override
	public Menu get(Locale locale, Menu menu) {

		logger.debug("[业务逻辑层]获取【菜单】");

		// TODO
		return null;
	}

	@Override
	public boolean update(Locale locale, Menu menu) {

		logger.debug("[业务逻辑层]更新【菜单】");

		hibernateTemplate.update(menu);

		return true;
	}

	@Override
	public List<Menu> list(Locale locale) {

		logger.debug("[业务逻辑层]列举【菜单】");

		// TODO
		return null;
	}

	@Override
	public List<Menu> query(Locale locale, Menu menu) {

		logger.debug("[业务逻辑层]查询【菜单】(不分页)");

		return hibernateTemplate.findByExample(menu);
	}

	@Override
	public PageResult paging(Locale locale, Menu menu, Long start, Long limit) {

		logger.debug("[业务逻辑层]查询【菜单】(分页)");

		PageResult pageResult = new PageResult();

		// TODO
		return pageResult;
	}

	@Override
	public boolean exists(Locale locale, Menu menu) {

		logger.debug("[业务逻辑层]判断【菜单】是否存在");

		return hibernateTemplate.findByExample(menu).size() > 0;
	}

	@Override
	public boolean upload(String calcServerBaseUrl, String realPath, MultipartFile imageFile, Locale locale, String openId) {

		logger.debug("[业务逻辑层]上传图片");

		if (imageFile == null || imageFile.isEmpty()) {
			return false;
		}

		String originalFilename = imageFile.getOriginalFilename();

		String type = originalFilename.substring(originalFilename.lastIndexOf("."));

		String fileName = StringUtil.replace("{?1}{?2}", UUID.randomUUID(), type);

		String path = propUtil.getMenuStorePath() + fileName;

		String filePath = realPath + path;

		try {
			imageFile.transferTo(new File(filePath));

			// 保存记录到数据库
			Resources resources = new Resources();
			resources.setDateTime(DateUtil.now());
			resources.setIsDelete((short) 0);
			resources.setName(originalFilename);
			resources.setOwner(openId);
			resources.setPath(path);
			resources.setType(SysConstant.RESOURCES_IMAGE);

			hibernateTemplate.save(resources);

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		}

		return false;
	}

	@Override
	public List<Map<String, Object>> queryMapList(Locale locale, Menu menu) {

		return menuDao.query(locale, menu, null, null);
	}

}