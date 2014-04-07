/**
 * MenuServiceImpl.java
 */
package com.sizheng.afl.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.sizheng.afl.pojo.entity.BusinessConsumer;
import com.sizheng.afl.pojo.entity.Menu;
import com.sizheng.afl.pojo.entity.MenuBill;
import com.sizheng.afl.pojo.entity.Resources;
import com.sizheng.afl.pojo.entity.User;
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
	public boolean upload(String calcServerBaseUrl, String realPath, MultipartFile imageFile, Locale locale,
			String openId) {

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
	public List<Map<String, Object>> queryMapList(Locale locale, Menu menu, String consumeCode) {

		List<Map<String, Object>> list = menuDao.query(locale, menu, consumeCode, null, null);

		Map<String, Map<String, Object>> mapMap = new HashMap<String, Map<String, Object>>();

		for (Map<String, Object> map : list) {
			String id = StringUtil.getNotNullString(map, "id");

			if (!mapMap.containsKey(id)) {
				mapMap.put(id, map);
				List<Map<String, Object>> mapList = new ArrayList<>();
				map.put("menuBill", mapList);
				Map<String, Object> map2 = new HashMap<>();
				mapList.add(map2);
				map2.put("status", map.get("status"));
				map2.put("consumer_id", map.get("consumer_id"));
				map2.put("copies", map.get("copies"));
				map2.put("consume_code", map.get("consume_code"));
				map2.put("nickname", map.get("nickname"));

				if (!consumeCode.equals(map.get("consume_code"))) {
					map.remove("status");
					map.remove("consumer_id");
					map.remove("copies");
					map.remove("consume_code");
					map.remove("nickname");
				}
			} else {
				Map<String, Object> map2 = mapMap.get(id);
				List<Map<String, Object>> mapList = (List<Map<String, Object>>) map2.get("menuBill");

				Map<String, Object> map3 = new HashMap<>();
				map3.put("status", map.get("status"));
				map3.put("consumer_id", map.get("consumer_id"));
				map3.put("copies", map.get("copies"));
				map3.put("consume_code", map.get("consume_code"));
				map3.put("nickname", map.get("nickname"));
				mapList.add(map3);

				if (consumeCode.equals(map.get("consume_code"))) {
					map2.put("status", map.get("status"));
					map2.put("consumer_id", map.get("consumer_id"));
					map2.put("copies", map.get("copies"));
					map2.put("consume_code", map.get("consume_code"));
					map2.put("nickname", map.get("nickname"));
				}
			}
		}

		return new ArrayList<>(mapMap.values());
	}

	@Override
	public boolean billDeal(Locale locale, MenuBill menuBill) {

		User user = new User();
		user.setUserName(menuBill.getConsumerId());

		List list = hibernateTemplate.findByExample(user);

		if (list.size() > 0) {

			MenuBill menuBill2 = new MenuBill();
			menuBill2.setConsumeCode(((User) list.get(0)).getConsumeCode());
			menuBill2.setConsumerId(menuBill.getConsumerId());
			menuBill2.setMenuId(menuBill.getMenuId());

			List list2 = hibernateTemplate.findByExample(menuBill2);

			if (list2.size() > 0) {
				MenuBill menuBill3 = (MenuBill) list2.get(0);

				// 原来 待定 =>请求 定了
				if (menuBill3.getStatus() == 0) {
					if (menuBill.getStatus() == 1) {
						menuBill3.setDateTime(DateUtil.now());
						menuBill3.setStatus(menuBill.getStatus());

						hibernateTemplate.update(menuBill3);
						return true;
					}
				} else if (menuBill3.getStatus() == 1) {
					if (menuBill.getStatus() == 2) {// TODO 商家同意可以退订

						menuBill3.setDateTime(DateUtil.now());

						if (menuBill3.getCopies() == 1) {
							menuBill3.setStatus(menuBill.getStatus());
						} else if (menuBill3.getCopies() > 1) {
							menuBill3.setCopies(menuBill3.getCopies() - 1);
						}

						hibernateTemplate.update(menuBill3);
						return true;
					} else if (menuBill.getStatus() == 1) {// 追加一份
						menuBill3.setDateTime(DateUtil.now());
						menuBill3.setCopies(StringUtil.isEmpty(menuBill3.getCopies()) ? 1L : menuBill3.getCopies() + 1);

						hibernateTemplate.update(menuBill3);
						return true;
					}
				} else if (menuBill3.getStatus() == 2) {
					if (menuBill.getStatus() == 0 || menuBill.getStatus() == 1) {
						menuBill3.setDateTime(DateUtil.now());
						menuBill3.setStatus(menuBill.getStatus());

						hibernateTemplate.update(menuBill3);
						return true;
					}
				}
				return false;
			} else {
				menuBill.setConsumeCode(((User) list.get(0)).getConsumeCode());
				menuBill.setDateTime(DateUtil.now());
				menuBill.setCopies(1L);

				BusinessConsumer businessConsumer = new BusinessConsumer();
				businessConsumer.setConsumeCode(((User) list.get(0)).getConsumeCode());
				businessConsumer.setConsumerId(menuBill.getConsumerId());

				List list3 = hibernateTemplate.findByExample(businessConsumer);

				if (list3.size() > 0) {
					menuBill.setSceneId(((BusinessConsumer) list3.get(0)).getSceneId());
				} else {
					logger.debug("BusinessConsumer信息不存在!");
					return false;
				}

				hibernateTemplate.save(menuBill);
				return true;
			}
		} else {
			logger.error("顾客用户不存在! openId:" + menuBill.getConsumerId());
		}

		return false;
	}

	@Override
	public List<Map<String, Object>> queryBillMapList(Locale locale, Menu menu) {
		return menuDao.queryBillList(locale, menu, null, null);
	}

}