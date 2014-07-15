/**
 * MenuBillServiceImpl.java
 */
package com.canzs.czs.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.canzs.czs.base.impl.BaseServiceImpl;
import com.canzs.czs.component.ApiInvoker;
import com.canzs.czs.dao.IMenuBillDao;
import com.canzs.czs.pojo.entity.MenuBill;
import com.canzs.czs.pojo.entity.User;
import com.canzs.czs.pojo.vo.PageResult;
import com.canzs.czs.service.IMenuBillService;
import com.canzs.czs.util.NumberUtil;
import com.canzs.czs.util.StringUtil;

/**
 * 【订单】业务逻辑实现.
 * 
 * @creation 2014年04月05日 05:02:44
 * @modification 2014年04月05日 05:02:44
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Service
@Transactional
public class MenuBillServiceImpl extends BaseServiceImpl implements IMenuBillService {

	private static Logger logger = Logger.getLogger(MenuBillServiceImpl.class);

	@Autowired
	IMenuBillDao menuBillDao;

	@Autowired
	ApiInvoker apiInvoker;

	@Override
	public boolean save(Locale locale, MenuBill menuBill) {

		logger.debug("[业务逻辑层]添加【订单】");

		// TODO
		return true;
	}

	@Override
	public boolean delete(Locale locale, MenuBill menuBill) {

		logger.debug("[业务逻辑层]删除【订单】");

		// TODO
		return true;
	}

	@Override
	public MenuBill get(Locale locale, MenuBill menuBill) {

		logger.debug("[业务逻辑层]获取【订单】");

		// TODO
		return null;
	}

	@Override
	public boolean update(Locale locale, MenuBill menuBill) {

		logger.debug("[业务逻辑层]更新【订单】");

		// TODO
		return true;
	}

	@Override
	public List<MenuBill> list(Locale locale) {

		logger.debug("[业务逻辑层]列举【订单】");

		// TODO
		return null;
	}

	@Override
	public List<MenuBill> query(Locale locale, MenuBill menuBill) {

		logger.debug("[业务逻辑层]查询【订单】(不分页)");

		// TODO
		return null;
	}

	@Override
	public PageResult paging(Locale locale, MenuBill menuBill, Long start, Long limit) {

		logger.debug("[业务逻辑层]查询【订单】(分页)");

		PageResult pageResult = new PageResult();

		// TODO
		return pageResult;
	}

	@Override
	public boolean exists(Locale locale, MenuBill menuBill) {

		logger.debug("[业务逻辑层]判断【订单】是否存在");

		// TODO
		return true;
	}

	@Override
	public List<Map<String, Object>> query4MapList(Locale locale, MenuBill menuBill) {
		return menuBillDao.query(locale, menuBill, null, null);
	}

	@Override
	public List<Map<String, Object>> query4GroupMapList(Locale locale, MenuBill menuBill) {

		List<Map<String, Object>> list = menuBillDao.queryGroup(locale, menuBill, null, null);

		Map<String, Map<String, Object>> mapMap = new HashMap<String, Map<String, Object>>();

		for (Map<String, Object> map : list) {
			String id = StringUtil.getNotNullString(map, "menu_id");

			if (!mapMap.containsKey(id)) {
				mapMap.put(id, map);
				List<Map<String, Object>> mapList = new ArrayList<>();
				map.put("menuBill", mapList);
				Map<String, Object> map2 = new HashMap<>();
				mapList.add(map2);
				map2.put("id", map.get("id"));
				map2.put("date_time", map.get("date_time"));
				map2.put("status", map.get("status"));
				map2.put("copies", map.get("copies"));
				map2.put("consumer_id", map.get("consumer_id"));
				map2.put("nickname", map.get("nickname"));
				map2.put("consume_code", map.get("consume_code"));

				if (!menuBill.getConsumeCode().equals(map.get("consume_code"))) {
					map.remove("id");
					map.remove("date_time");
					map.remove("status");
					map.remove("copies");
					map.remove("consumer_id");
					map.remove("nickname");
					map.remove("consume_code");
				}

			} else {
				Map<String, Object> map2 = mapMap.get(id);
				List<Map<String, Object>> mapList = (List<Map<String, Object>>) map2.get("menuBill");

				Map<String, Object> map3 = new HashMap<>();
				map3.put("id", map.get("id"));
				map3.put("date_time", map.get("date_time"));
				map3.put("status", map.get("status"));
				map3.put("copies", map.get("copies"));
				map3.put("consumer_id", map.get("consumer_id"));
				map3.put("nickname", map.get("nickname"));
				map3.put("consume_code", map.get("consume_code"));
				mapList.add(map3);

				if (menuBill.getConsumeCode().equals(map.get("consume_code"))) {
					map2.put("id", map.get("id"));
					map2.put("date_time", map.get("date_time"));
					map2.put("status", map.get("status"));
					map2.put("copies", map.get("copies"));
					map2.put("consumer_id", map.get("consumer_id"));
					map2.put("nickname", map.get("nickname"));
					map2.put("consume_code", map.get("consume_code"));
				}
			}
		}

		return new ArrayList<>(mapMap.values());

	}

	@Override
	public List<Map<String, Object>> query4MapList2(Locale locale, MenuBill menuBill) {
		return menuBillDao.query2(locale, menuBill, null, null);
	}

	@Override
	public List<Map<String, Object>> query4GroupMapList2(Locale locale, MenuBill menuBill) {

		// return menuBillDao.queryGroup2(locale, menuBill, null, null);

		List<Map<String, Object>> list = menuBillDao.queryGroup2(locale, menuBill, null, null);

		Map<String, Map<String, Object>> mapMap = new HashMap<String, Map<String, Object>>();

		for (Map<String, Object> map : list) {
			String id = StringUtil.getNotNullString(map, "menu_id");

			if (!mapMap.containsKey(id)) {
				mapMap.put(id, map);
				List<Map<String, Object>> mapList = new ArrayList<>();
				map.put("menuBill", mapList);
				Map<String, Object> map2 = new HashMap<>();
				mapList.add(map2);
				map2.put("id", map.get("id"));
				map2.put("date_time", map.get("date_time"));
				map2.put("sec_diff", map.get("sec_diff"));
				map2.put("status", map.get("status"));
				map2.put("copies", map.get("copies"));
				map2.put("consumer_id", map.get("consumer_id"));
				map2.put("nickname", map.get("nickname"));
				map2.put("headimgurl", map.get("headimgurl"));
				map2.put("sex", map.get("sex"));
				map2.put("nickname", map.get("nickname"));
				map2.put("consume_code", map.get("consume_code"));

				if (!menuBill.getConsumeCode().equals(map.get("consume_code"))) {
					map.remove("id");
					map.remove("date_time");
					map.remove("status");
					map.remove("consumer_id");
					map.remove("nickname");
					map.remove("consume_code");
					map.remove("headimgurl");
					map.remove("sex");
				}

			} else {
				Map<String, Object> map2 = mapMap.get(id);
				List<Map<String, Object>> mapList = (List<Map<String, Object>>) map2.get("menuBill");

				Map<String, Object> map3 = new HashMap<>();
				map3.put("id", map.get("id"));
				map3.put("date_time", map.get("date_time"));
				map3.put("sec_diff", map.get("sec_diff"));
				map3.put("status", map.get("status"));
				map3.put("copies", map.get("copies"));
				map3.put("consumer_id", map.get("consumer_id"));
				map3.put("nickname", map.get("nickname"));
				map3.put("headimgurl", map.get("headimgurl"));
				map3.put("sex", map.get("sex"));
				map3.put("consume_code", map.get("consume_code"));
				mapList.add(map3);

				if (menuBill.getConsumeCode().equals(map.get("consume_code"))) {
					map2.put("id", map.get("id"));
					map2.put("date_time", map.get("date_time"));
					map2.put("sec_diff", map.get("sec_diff"));
					map2.put("status", map.get("status"));
					map2.put("copies", map.get("copies"));
					map2.put("consumer_id", map.get("consumer_id"));
					map2.put("nickname", map.get("nickname"));
					map2.put("consume_code", map.get("consume_code"));
					map2.put("headimgurl", map.get("headimgurl"));
					map2.put("sex", map.get("sex"));
				}
			}
		}

		return new ArrayList<>(mapMap.values());

	}

	@Override
	public double[] getOwnTotalAndCopies(Locale locale, String openId) {

		double[] valArr = new double[2];
		User user = new User();
		user.setUserName(openId);

		User user2 = findOneByExample(user, User.class);

		if (user2 != null) {
			MenuBill menuBill = new MenuBill();
			menuBill.setConsumeCode(user2.getConsumeCode());

			List<Map<String, Object>> list = query4MapList(locale, menuBill);

			double total = 0;
			double count = 0;

			for (Map<String, Object> map : list) {
				Double price = NumberUtil.getDouble(map, "price");
				int copies = NumberUtil.getInteger(map, "copies");

				if (price != null) {
					total += (price * copies);
					count += copies;
				}
			}
			valArr[0] = total;
			valArr[1] = count;
		}

		return valArr;
	}
}