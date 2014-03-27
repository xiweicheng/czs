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
import com.sizheng.afl.component.PropUtil;
import com.sizheng.afl.component.SimpleMailSender;
import com.sizheng.afl.component.WeiXinApiInvoker;
import com.sizheng.afl.dao.IWeiXinDao;
import com.sizheng.afl.pojo.entity.Message;
import com.sizheng.afl.pojo.entity.Qrcode;
import com.sizheng.afl.pojo.entity.Subscriber;
import com.sizheng.afl.pojo.entity.User;
import com.sizheng.afl.pojo.model.Business;
import com.sizheng.afl.pojo.model.WeiXin;
import com.sizheng.afl.pojo.model.WeiXinBaseMsg;
import com.sizheng.afl.pojo.model.WeiXinEventKey;
import com.sizheng.afl.pojo.model.WeiXinMsg;
import com.sizheng.afl.pojo.model.WeiXinUserInfo;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.service.IBusinessService;
import com.sizheng.afl.service.IQrcodeService;
import com.sizheng.afl.service.IWeiXinService;
import com.sizheng.afl.util.StringUtil;

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

	@Autowired
	IBusinessService businessService;

	@Autowired
	IQrcodeService qrcodeService;

	@Autowired
	PropUtil propUtil;

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
	public String click(WeiXinBaseMsg bean, Locale locale) {
		logger.debug("[业务逻辑层]菜单单击事件");

		// 菜单项对应的键值
		String eventKey = bean.getEventKey();

		if (WeiXinEventKey.EVT_KEY_01.getValue().equals(eventKey)) {

			User user = new User();
			user.setUserName(bean.getFromUserName());

			List list = hibernateTemplate.findByExample(user);

			if (list.size() > 0) {
				User user2 = (User) list.get(0);

				if (StringUtil.isEmpty(user2.getConsumeCode())) {
					return "您没有消费记录!";
				} else {
					// TODO 结账
					return StringUtil.replace("<a href='{?1}?openId={?2}&consumeCode={?3}'>[点击此]确认结账</a>",
							propUtil.getRedirectUrl() + "/consumer/bill.do", bean.getFromUserName(),
							user2.getConsumeCode());
				}
			} else {
				return null;
			}

		} else if (WeiXinEventKey.EVT_KEY_02.getValue().equals(eventKey)) {
			String url1 = StringUtil.replace("<a href='{?1}?openId={?2}'>[点击此]消费记录</a>", propUtil.getRedirectUrl()
					+ "/consumer/record.do", bean.getFromUserName());
			String url2 = StringUtil.replace("<a href='{?1}?openId={?2}'>[点击此]呼叫服务</a>", propUtil.getRedirectUrl()
					+ "/consumer/call.do", bean.getFromUserName());
			String url3 = StringUtil.replace("<a href='{?1}?openId={?2}'>[点击此]菜单一览</a>", propUtil.getRedirectUrl()
					+ "/consumer/list.do", bean.getFromUserName());

			return StringUtil.replace("{?1}\n\n{?2}\n\n{?3}", url1, url2, url3);
		} else if (WeiXinEventKey.EVT_KEY_03.getValue().equals(eventKey)) {// 商家入驻

			Business business = new Business();
			business.setOpenId(bean.getFromUserName());

			// 判断商家是否已经入驻
			if (businessService.exists(locale, business)) {
				// 已经入驻,发送信息提示,和完善商家信息链接.
				// 这里有商家入驻->取消->再次入驻 的情况
				String url = weiXinApiInvoker.getWebpageCodeUrl(
						StringUtil.replaceByKV("business/input.do?openid={openId}", "openId", bean.getFromUserName()),
						bean.getFromUserName());
				return StringUtil.replace("您已经是入驻商家!您可以点击下面链接去修改或者完善自己的商家信息!\n\n<a href='{?1}'>{?2}</a>", url,
						"[点击此]完善商家信息");
			} else {
				// 未入驻,发送确认入驻链接.
				return StringUtil.replace("入驻为商家后,即可享受我们平台提供的便捷顾客与商家之间的优质桥梁服务!\n\n<a href='{?1}'>{?2}</a>",
						weiXinApiInvoker.getWebpageCodeUrl("business/add.do", bean.getFromUserName()), "[点击此]确认入驻");
			}

		} else if (WeiXinEventKey.EVT_KEY_04.getValue().equals(eventKey)) {

			Business business = new Business();
			business.setOpenId(bean.getFromUserName());

			Business business2 = businessService.get(locale, business);

			if (business2 == null) {
				return StringUtil.replace("您还不是入驻商家,确认要入驻吗?\n\n<a href='{?1}'>{?2}</a>",
						weiXinApiInvoker.getWebpageCodeUrl("business/add.do", bean.getFromUserName()), "[点击此]确认入驻");
			} else {

				// 判断二维码使用的数量
				List<Qrcode> list = qrcodeService.queryByOpenId(locale, bean.getFromUserName());

				if (list.size() >= business2.getQrcodeLimit()) {
					return StringUtil.replace("您可使用的二维码达到最大限制[{?3}],您可以点击下面链接进行购买!\n\n<a href='{?1}'>{?2}</a>",
							weiXinApiInvoker.getWebpageCodeUrl("qrcode/buy.do", bean.getFromUserName()), "[点击此]进入购买界面",
							business2.getQrcodeLimit());
				}

				return StringUtil.replace("<a href='{?1}'>{?2}</a>",
						weiXinApiInvoker.getWebpageCodeUrl("qrcode/input.do", bean.getFromUserName()), "[点击此]进入配置界面");
			}
		}

		return null;
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
	public String getWebpageCodeUrl(String reqMapping, String state) {
		return weiXinApiInvoker.getWebpageCodeUrl(reqMapping, state);
	}

	@Override
	public Serializable saveMessage(WeiXinBaseMsg bean) {

		Message message = new Message();
		message.setFromUserName(bean.getFromUserName());
		message.setCreateTime(bean.getCreateTime() == null ? null : Long.valueOf(bean.getCreateTime()));
		message.setMsgType(bean.getMsgType());
		message.setContent(bean.getContent());
		message.setMsgId(bean.getMsgId() == null ? null : Long.valueOf(bean.getMsgId()));
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