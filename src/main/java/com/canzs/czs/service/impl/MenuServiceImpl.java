/**
 * MenuServiceImpl.java
 */
package com.canzs.czs.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
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

import com.canzs.czs.base.impl.BaseServiceImpl;
import com.canzs.czs.component.ApiInvoker;
import com.canzs.czs.component.PropUtil;
import com.canzs.czs.dao.IMenuDao;
import com.canzs.czs.pojo.constant.SysConstant;
import com.canzs.czs.pojo.entity.BusinessConsumer;
import com.canzs.czs.pojo.entity.Menu;
import com.canzs.czs.pojo.entity.MenuBill;
import com.canzs.czs.pojo.entity.Resources;
import com.canzs.czs.pojo.entity.User;
import com.canzs.czs.pojo.vo.PageResult;
import com.canzs.czs.service.IMenuService;
import com.canzs.czs.util.DateUtil;
import com.canzs.czs.util.FileUtil;
import com.canzs.czs.util.ImageUtil;
import com.canzs.czs.util.StringUtil;

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

		if (!ImageUtil.isImage(originalFilename)) {
			return false;
		}

		String type = originalFilename.substring(originalFilename.lastIndexOf("."));

		String fileName = StringUtil.replace("{?1}{?2}", UUID.randomUUID(), type);

		String filePath = realPath + propUtil.getMenuStorePath() + "0/" + fileName;// 原始图片存放
		String scale120FilePath = realPath + propUtil.getMenuStorePath() + "120/" + fileName;// 缩放图片存放
		String scale640FilePath = realPath + propUtil.getMenuStorePath() + "640/" + fileName;// 缩放图片存放

		try {
			imageFile.transferTo(new File(filePath));

			// 图片缩放处理.120*120
			ImageUtil.scale2(filePath, scale120FilePath, propUtil.getImgScaleSizeLarge(),
					propUtil.getImgScaleSizeLarge(), true);
			// 图片缩放处理.640*640
			ImageUtil.scale2(filePath, scale640FilePath, propUtil.getImgScaleSizeHuge(),
					propUtil.getImgScaleSizeHuge(), true);

			// 保存记录到数据库
			Resources resources = new Resources();
			resources.setDateTime(DateUtil.now());
			resources.setIsDelete((short) 0);
			resources.setName(FileUtil.getName(originalFilename));
			resources.setOwner(openId);
			resources.setPath(propUtil.getMenuStorePath());
			resources.setFileName(fileName);
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
	public List<Map<String, Object>> queryMapList(Locale locale, Menu menu, String consumeCode, String order,
			String consumerId) {

		List<Map<String, Object>> list = menuDao.query(locale, menu, consumeCode, null, null, order, consumerId);

		Map<String, Map<String, Object>> mapMap = new HashMap<String, Map<String, Object>>();

		List<Map<String, Object>> retList = new ArrayList<>();

		for (Map<String, Object> map : list) {
			String id = StringUtil.getNotNullString(map, "id");

			if (!mapMap.containsKey(id)) {
				mapMap.put(id, map);
				retList.add(map);
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
					map2.put("fav_status", map.get("fav_status"));
				}
			}
		}

		return retList;
	}

	@Override
	public boolean billDeal(Locale locale, MenuBill menuBill) {

		User user = new User();
		user.setUserName(menuBill.getConsumerId());

		User user2 = findOneByExample(user, User.class);

		if (user2 != null) {

			MenuBill menuBill2 = new MenuBill();
			menuBill2.setConsumeCode(user2.getConsumeCode());
			menuBill2.setConsumerId(menuBill.getConsumerId());
			menuBill2.setMenuId(menuBill.getMenuId());

			MenuBill menuBill3 = findOneByExample(menuBill2, MenuBill.class);

			if (menuBill3 != null) {

				if (menuBill3.getStatus() == 0) {
					if (menuBill.getStatus() == 0) { // 待定追加
						menuBill3.setDateTime(DateUtil.now());

						if (StringUtil.isEmpty(menuBill3.getCopies())) {
							menuBill3.setCopies(1L);
						} else {
							menuBill3.setCopies(menuBill3.getCopies() + 1);
						}

						hibernateTemplate.update(menuBill3);
						return true;
					} else if (menuBill.getStatus() == 1) {// 待定 =>提交订单
						menuBill3.setDateTime(DateUtil.now());
						menuBill3.setStatus(SysConstant.MENU_BILL_STATUS_CONFIRM);

						if (StringUtil.isEmpty(menuBill3.getCopies())) {
							menuBill3.setCopies(1L);
						}

						hibernateTemplate.update(menuBill3);
						return true;
					} else if (menuBill.getStatus() == 2) {// 待定 =>退订

						menuBill3.setDateTime(DateUtil.now());

						if (menuBill3.getCopies() == 1) {
							menuBill3.setStatus(SysConstant.MENU_BILL_STATUS_DEBOOK);
						} else if (menuBill3.getCopies() > 1) {
							menuBill3.setCopies(menuBill3.getCopies() - 1);
						}

						hibernateTemplate.update(menuBill3);
						return true;
					}
				} else if (menuBill3.getStatus() == 1) {// 退订
					if (menuBill.getStatus() == 2) {

						menuBill3.setDateTime(DateUtil.now());

						if (menuBill3.getCopies() == 1) {
							menuBill3.setStatus(SysConstant.MENU_BILL_STATUS_DEBOOK);
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
				} else if (menuBill3.getStatus() == 2) {// 退订 =>待定 | 提交
					if (menuBill.getStatus() == 0) {
						menuBill3.setDateTime(DateUtil.now());
						menuBill3.setStatus(SysConstant.MENU_BILL_STATUS_STOW);
						menuBill3.setCopies(StringUtil.isEmpty(menuBill.getCopies()) ? 1L : menuBill.getCopies());

						hibernateTemplate.update(menuBill3);
						return true;
					} else if (menuBill.getStatus() == 1) {
						menuBill3.setDateTime(DateUtil.now());
						menuBill3.setStatus(SysConstant.MENU_BILL_STATUS_CONFIRM);
						menuBill3.setCopies(StringUtil.isEmpty(menuBill.getCopies()) ? 1L : menuBill.getCopies());

						hibernateTemplate.update(menuBill3);
						return true;
					}
				}

				return false;
			} else {
				menuBill.setConsumeCode(user2.getConsumeCode());
				menuBill.setDateTime(DateUtil.now());

				if (StringUtil.isEmpty(menuBill.getCopies())) {
					menuBill.setCopies(1L);
				}

				BusinessConsumer businessConsumer = new BusinessConsumer();
				businessConsumer.setConsumeCode(user2.getConsumeCode());

				BusinessConsumer businessConsumer2 = findOneByExample(businessConsumer, BusinessConsumer.class);

				if (businessConsumer2 != null) {
					menuBill.setSceneId(businessConsumer2.getSceneId());
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

	@Override
	public List<Map<String, Object>> queryOrderMapList(Locale locale, Menu menu) {

		return menuDao.queryOrderMapList(locale, menu);
	}

	@Override
	public boolean acceptBill(Locale locale, MenuBill menuBill) {

		MenuBill menuBill2 = hibernateTemplate.get(MenuBill.class, menuBill.getId());

		if (SysConstant.MENU_BILL_STATUS_CONFIRM.equals(menuBill2.getStatus())) {

			if (menuBill.getCopies().equals(menuBill2.getCopies())) {

				menuBill2.setStatus(SysConstant.MENU_BILL_STATUS_ACCEPT);
				menuBill2.setAccepterId(menuBill.getAccepterId());

				hibernateTemplate.update(menuBill2);

				Menu menu = hibernateTemplate.get(Menu.class, menuBill2.getMenuId());

				if (menu != null) {
					long orderTimes = StringUtil.isEmpty(menu.getOrderTimes()) ? 0L : menu.getOrderTimes();
					menu.setOrderTimes(menu.getOrderTimes() + menuBill2.getCopies());
					hibernateTemplate.update(menu);
				}

				return true;
			}
		}

		return false;
	}

	@Override
	public List<Map<String, Object>> queryJoinBill(Locale locale, Menu menu) {
		return menuDao.queryJoinBill(locale, menu);
	}

	@Override
	public boolean acceptBillJoin(Locale locale, String[] ids, Long[] copies, String accepterId) {

		int i = -1;

		for (String id : ids) {
			i++;
			MenuBill menuBill2 = hibernateTemplate.get(MenuBill.class, Long.valueOf(id));

			if (SysConstant.MENU_BILL_STATUS_CONFIRM.equals(menuBill2.getStatus())) {
				if (menuBill2.getCopies().equals(copies[i])) {

					menuBill2.setStatus(SysConstant.MENU_BILL_STATUS_ACCEPT);
					menuBill2.setAccepterId(accepterId);

					hibernateTemplate.update(menuBill2);

					Menu menu = hibernateTemplate.get(Menu.class, menuBill2.getMenuId());

					if (menu != null) {
						menu.setOrderTimes(menu.getOrderTimes() + copies[i]);
						hibernateTemplate.update(menu);
					}
				} else {
					throwRuntimeException("批量接受订单失败!");
				}
			} else {
				throwRuntimeException("批量接受订单失败!");
			}
		}

		return true;
	}

	@Override
	public boolean billSubmit(Locale locale, String openId) {
		return menuDao.billSubmit(locale, openId);
	}

	@Override
	public List<Map<String, Object>> queryHistoryMenuBill(Locale locale, String businessId, Date start, Date end,
			String... status) {
		return menuDao.queryHistoryMenuBill(locale, businessId, start, end, status);
	}

	@Override
	public List<Map<String, Object>> queryOrderHistoryMapList(Locale locale, String businessId, String openId) {
		return menuDao.queryOrderHistoryMapList(locale, businessId, openId);
	}

	@Override
	public Long queryBillCount(Locale locale, String businessId) {
		return menuDao.queryBillCount(locale, businessId);
	}

}