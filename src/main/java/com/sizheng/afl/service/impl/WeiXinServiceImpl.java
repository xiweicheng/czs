/**
 * WeiXinServiceImpl.java
 */
package com.sizheng.afl.service.impl;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sizheng.afl.base.impl.BaseServiceImpl;
import com.sizheng.afl.component.ApiInvoker;
import com.sizheng.afl.component.SimpleMailSender;
import com.sizheng.afl.component.WeiXinApiInvoker;
import com.sizheng.afl.dao.IWeiXinDao;
import com.sizheng.afl.pojo.entity.Message;
import com.sizheng.afl.pojo.entity.Subscriber;
import com.sizheng.afl.pojo.entity.User;
import com.sizheng.afl.pojo.model.WeiXin;
import com.sizheng.afl.pojo.model.WeiXinBaseMsg;
import com.sizheng.afl.pojo.model.WeiXinEventKey;
import com.sizheng.afl.pojo.model.WeiXinMsg;
import com.sizheng.afl.pojo.model.WeiXinUserInfo;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.service.IWeiXinService;

/**
 * 【微信】业务逻辑实现.
 * 
 * @creation 2014年03月22日 01:00:06
 * @modification 2014年03月22日 01:00:06
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Service
@Transactional
public class WeiXinServiceImpl extends BaseServiceImpl implements IWeiXinService {

	private static Logger logger = Logger.getLogger(WeiXinServiceImpl.class);

	@Autowired
	IWeiXinDao weiXinDao;

	@Autowired
	ApiInvoker apiInvoker;

	@Autowired
	WeiXinApiInvoker weiXinApiInvoker;

	@Autowired
	SimpleMailSender simpleMailSender;

	@Override
	public boolean save(Locale locale, WeiXin weiXin) {

		logger.debug("[业务逻辑层]添加【微信】");

		// TODO
		return true;
	}

	@Override
	public boolean delete(Locale locale, WeiXin weiXin) {

		logger.debug("[业务逻辑层]删除【微信】");

		// TODO
		return true;
	}

	@Override
	public WeiXin get(Locale locale, WeiXin weiXin) {

		logger.debug("[业务逻辑层]获取【微信】");

		// TODO
		return null;
	}

	@Override
	public boolean update(Locale locale, WeiXin weiXin) {

		logger.debug("[业务逻辑层]更新【微信】");

		// TODO
		return true;
	}

	@Override
	public List<WeiXin> list(Locale locale) {

		logger.debug("[业务逻辑层]列举【微信】");

		// TODO
		return null;
	}

	@Override
	public List<Map<String, Object>> query(Locale locale, WeiXin weiXin) {

		logger.debug("[业务逻辑层]查询【微信】(不分页)");

		// TODO
		return null;
	}

	@Override
	public PageResult paging(Locale locale, WeiXin weiXin, Long start, Long limit) {

		logger.debug("[业务逻辑层]查询【微信】(分页)");

		PageResult pageResult = new PageResult();

		// TODO
		return pageResult;
	}

	@Override
	public boolean exists(Locale locale, WeiXin weiXin) {

		logger.debug("[业务逻辑层]判断【微信】是否存在");

		// TODO
		return true;
	}

	@Override
	public boolean subscribe(WeiXinBaseMsg bean, Locale locale) {
		logger.debug("[业务逻辑层]新用户关注");
		simpleMailSender.sendFormatText("新用户关注!", "关注者[{?1}]", bean.getFromUserName());
		// 保存关注者信息.
		if (weiXinDao.saveSubscriber(bean.getFromUserName(), bean.getCreateTime())) {
			WeiXinUserInfo userInfo = weiXinApiInvoker.getUserInfo(bean.getFromUserName());

			Subscriber subscriber = new Subscriber();
			subscriber.setUserName(userInfo.getOpenid());

			List list = hibernateTemplate.findByExample(subscriber);

			if (list.size() == 0) {
				logger.debug("微信用户不存在,第一次获取保存");
				return weiXinDao.saveWeiXinUserInfo(userInfo);
			} else {
				logger.debug("微信用户存在,更新用户信息");
				Subscriber subscriber2 = (Subscriber) list.get(0);
				subscriber2.setCity(userInfo.getCity());
				subscriber2.setCountry(userInfo.getCountry());
				subscriber2.setHeadimgurl(userInfo.getHeadimgurl());
				subscriber2.setLanguage(userInfo.getLanguage());
				subscriber2.setNickname(userInfo.getNickname());
				subscriber2.setProvince(userInfo.getProvince());
				subscriber2.setSex(userInfo.getSex());

				hibernateTemplate.update(subscriber2);

				return true;
			}
		}
		return false;
	}

	@Override
	public boolean unsubscribe(WeiXinBaseMsg bean, Locale locale) {
		logger.debug("[业务逻辑层]用户取消关注");
		simpleMailSender.sendFormatText("用户取消关注!", "关注者[{?1}]", bean.getFromUserName());
		// 逻辑删除关注者信息.
		return weiXinDao.deleteSubscriber(bean.getFromUserName(), bean.getCreateTime());
	}

	@Override
	public boolean verifyFail(WeiXinMsg bean, Locale locale) {
		logger.debug("[业务逻辑层]验证[消息来自微信服务器]没有通过");
		return simpleMailSender.sendFormatText("验证[消息来自微信服务器]没有通过!", "验证参数[{?1}]", bean.toString());
	}

	@Override
	public boolean handleMsgTypeFail(WeiXinBaseMsg bean, Locale locale) {
		logger.debug("[业务逻辑层]未识别消息类型[" + bean.getMsgType() + "]");
		return simpleMailSender.sendFormatText("未识别消息类型[" + bean.getMsgType() + "]", "微信参数[{?1}]", bean.toString());
	}

	@Override
	public boolean click(WeiXinBaseMsg bean, Locale locale) {
		logger.debug("[业务逻辑层]菜单单击事件");

		// 菜单项对应的键值
		String eventKey = bean.getEventKey();

		if (WeiXinEventKey.EVT_KEY_01.getValue().equals(eventKey)) {
			// weiXinService.click(bean, locale);
		} else if (WeiXinEventKey.EVT_KEY_02.getValue().equals(eventKey)) {
			// weiXinService.click(bean, locale);
		}

		return false;
	}

	@Override
	public boolean location(WeiXinBaseMsg bean, Locale locale) {
		logger.debug("[业务逻辑层]地理位置上报事件");
		logger.debug(bean);

		User user = new User();
		user.setUserName(bean.getFromUserName());

		List list = hibernateTemplate.findByExample(user);

		if (list.size() == 1) {
			User user2 = (User) list.get(0);
			user2.setLatitude(new BigDecimal(bean.getLatitude()));
			user2.setLongitude(new BigDecimal(bean.getLongitude()));
			user2.setPrecision(new BigDecimal(bean.getPrecision()));

			hibernateTemplate.update(user2);

			return true;
		} else {
			logger.debug("用户信息还未创建!");
		}

		return false;
	}

	@Override
	public String getWebpageCodeUrl() {
		return weiXinApiInvoker.getWebpageCodeUrl();
	}

	@Override
	public Serializable saveMessage(WeiXinBaseMsg bean) {

		Message message = new Message();
		message.setFromUserName(bean.getFromUserName());
		message.setCreateTime(Long.valueOf(bean.getCreateTime()));
		message.setMsgType(bean.getMsgType());
		message.setContent(bean.getContent());
		message.setMsgId(Long.valueOf(bean.getMsgId()));
		message.setPicUrl(bean.getPicUrl());
		message.setMediaId(bean.getMediaId());
		message.setFormat(bean.getFormat());
		message.setThumbMediaId(bean.getThumbMediaId());
		message.setLocationX(bean.getLocation_X() == null ? BigDecimal.ZERO : new BigDecimal(bean.getLocation_X()));
		message.setLocationY(bean.getLocation_Y() == null ? BigDecimal.ZERO : new BigDecimal(bean.getLocation_Y()));
		message.setScale(bean.getScale() == null ? BigDecimal.ZERO : new BigDecimal(bean.getScale()));
		message.setLabel(bean.getLabel());
		message.setTitle(bean.getTitle());
		message.setDescription(bean.getDescription());
		message.setUrl(bean.getUrl());
		message.setEvent(bean.getEvent());
		message.setEventKey(bean.getEventKey());
		message.setLatitude(bean.getLatitude() == null ? BigDecimal.ZERO : new BigDecimal(bean.getLatitude()));
		message.setLongitude(bean.getLongitude() == null ? BigDecimal.ZERO : new BigDecimal(bean.getLongitude()));
		message.setPrecision(bean.getPrecision() == null ? BigDecimal.ZERO : new BigDecimal(bean.getPrecision()));
		message.setTicket(bean.getTicket());

		return hibernateTemplate.save(message);
	}

	@Override
	public boolean view(WeiXinBaseMsg bean, Locale locale) {
		logger.debug("[业务逻辑层]跳转链接菜单单击事件");

		logger.debug(bean.getEventKey());

		return false;
	}

}