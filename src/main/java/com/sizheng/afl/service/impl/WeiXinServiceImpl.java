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
import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.pojo.entity.Business;
import com.sizheng.afl.pojo.entity.BusinessConsumer;
import com.sizheng.afl.pojo.entity.BusinessRole;
import com.sizheng.afl.pojo.entity.Message;
import com.sizheng.afl.pojo.entity.Request;
import com.sizheng.afl.pojo.entity.Subscriber;
import com.sizheng.afl.pojo.entity.User;
import com.sizheng.afl.pojo.model.WeiXin;
import com.sizheng.afl.pojo.model.WeiXinBaseMsg;
import com.sizheng.afl.pojo.model.WeiXinEventKey;
import com.sizheng.afl.pojo.model.WeiXinMsg;
import com.sizheng.afl.pojo.model.WeiXinUserInfo;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.service.IBusinessService;
import com.sizheng.afl.service.IQrcodeService;
import com.sizheng.afl.service.IUserService;
import com.sizheng.afl.service.IWeiXinService;
import com.sizheng.afl.util.DateUtil;
import com.sizheng.afl.util.NumberUtil;
import com.sizheng.afl.util.StringUtil;
import com.sizheng.afl.util.ThreadUtil;

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
	IUserService userService;

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
	public boolean subscribe(final WeiXinBaseMsg bean, Locale locale) {
		logger.debug("[业务逻辑层]新用户关注");
		simpleMailSender.sendFormatText("新用户关注!", "关注者[{?1}]", bean.getFromUserName());
		// 保存关注者信息.
		if (weiXinDao.saveSubscriber(bean.getFromUserName(), bean.getCreateTime())) {

			ThreadUtil.exec(new Runnable() {
				public void run() {
					WeiXinUserInfo userInfo = weiXinApiInvoker.getUserInfo(bean.getFromUserName());

					Subscriber subscriber = new Subscriber();
					subscriber.setUserName(userInfo.getOpenid());

					List list = hibernateTemplate.findByExample(subscriber);

					if (list.size() == 0) {
						logger.debug("微信用户不存在,第一次获取保存");
						weiXinDao.saveWeiXinUserInfo(userInfo);
					} else {
						logger.debug("微信用户存在,更新用户信息");
						Subscriber subscriber2 = (Subscriber) list.get(0);
						subscriber2.setCity(userInfo.getCity());
						subscriber2.setCountry(userInfo.getCountry());
						// 用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空
						subscriber2.setHeadimgurl(StringUtil.isEmpty(userInfo.getHeadimgurl()) ? null : userInfo
								.getHeadimgurl().substring(0, userInfo.getHeadimgurl().length() - 2));
						subscriber2.setLanguage(userInfo.getLanguage());
						subscriber2.setNickname(userInfo.getNickname());
						subscriber2.setProvince(userInfo.getProvince());
						subscriber2.setSex(userInfo.getSex());

						hibernateTemplate.update(subscriber2);
					}
				}
			});

			return true;
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
	public String click(final WeiXinBaseMsg bean, final Locale locale) {
		logger.debug("[业务逻辑层]菜单单击事件");

		// 菜单项对应的键值
		String eventKey = bean.getEventKey();

		if (WeiXinEventKey.CUSTOMER_EVT_KEY_4.getValue().equals(eventKey)) {

			User user = new User();
			user.setUserName(bean.getFromUserName());

			List list = hibernateTemplate.findByExample(user);

			if (list.size() > 0) {
				User user2 = (User) list.get(0);

				if (StringUtil.isEmpty(user2.getConsumeCode())) {
					return "您没有消费记录!";
				} else {

					long size = businessService.getGroupSize(locale, user2.getConsumeCode());

					if (size == 1) {
						double consume = businessService.getConsume(locale, user2.getConsumeCode(), "own");

						if (consume > 0) {
							return StringUtil
									.replace(
											"您个人消费[{?4}]元\n\n<a href='{?1}?openId={?2}&consumeCode={?3}&type={?5}'>[点击此]申请个人结账</a>",
											propUtil.getRedirectUrl() + "/user/free/billReq.do",
											bean.getFromUserName(), user2.getConsumeCode(),
											NumberUtil.format2Money(consume), "own");
						} else {
							return StringUtil.replace(
									"您没有消费记录,\n\n<a href='{?1}?openId={?2}&consumeCode={?3}'>[点击此]结束消费状态</a>",
									propUtil.getRedirectUrl() + "/user/free/checkout.do", bean.getFromUserName(),
									user2.getConsumeCode());
						}
					} else if (size > 1) {
						double consume = businessService.getConsume(locale, user2.getConsumeCode(), "own");
						double totalConsume = businessService.getConsume(locale, user2.getConsumeCode(), "group");

						if (consume > 0) {
							return StringUtil
									.replace(
											"您个人消费[{?4}]元\n\n<a href='{?1}?openId={?2}&consumeCode={?3}&type={?5}'>[点击此]申请个人结账</a>",
											propUtil.getRedirectUrl() + "/user/free/billReq.do",
											bean.getFromUserName(), user2.getConsumeCode(),
											NumberUtil.format2Money(consume), "own")
									+ StringUtil
											.replace(
													"\n\n集体消费[{?4}]元\n\n<a href='{?1}?openId={?2}&consumeCode={?3}&type={?5}'>[点击此]申请集体结账</a>",
													propUtil.getRedirectUrl() + "/user/free/billReq.do",
													bean.getFromUserName(), user2.getConsumeCode(),
													NumberUtil.format2Money(totalConsume), "group");
						} else {
							return StringUtil.replace(
									"您没有消费记录,\n\n<a href='{?1}?openId={?2}&consumeCode={?3}'>[点击此]结束消费状态</a>",
									propUtil.getRedirectUrl() + "/user/free/checkout.do", bean.getFromUserName(),
									user2.getConsumeCode())
									+ StringUtil
											.replace(
													"\n\n集体消费[{?4}]元\n\n<a href='{?1}?openId={?2}&consumeCode={?3}&type={?5}'>[点击此]申请集体结账</a>",
													propUtil.getRedirectUrl() + "/user/free/billReq.do",
													bean.getFromUserName(), user2.getConsumeCode(),
													NumberUtil.format2Money(totalConsume), "group");
						}
					} else {
						return "您的信息不存在!";
					}
				}
			} else {
				logger.error("用户信息不存在!");
				return "您的信息不存在!";
			}

		} else if (WeiXinEventKey.CUSTOMER_EVT_KEY_5.getValue().equals(eventKey)) {
			return StringUtil.replace("暂无其它服务项,敬请期待...");
		} else if (WeiXinEventKey.CUSTOMER_EVT_KEY_2.getValue().equals(eventKey)) {
			return StringUtil.replace("功能开发设计中,敬请期待...");
		} else if (WeiXinEventKey.CUSTOMER_EVT_KEY_1.getValue().equals(eventKey)) { // 顾客我的菜单

			User user = new User();
			user.setUserName(bean.getFromUserName());

			List list = hibernateTemplate.findByExample(user);

			if (list.size() > 0) {
				String consumeCode = ((User) list.get(0)).getConsumeCode();
				if (!StringUtil.isEmpty(consumeCode)) {

					BusinessConsumer businessConsumer = new BusinessConsumer();
					businessConsumer.setConsumeCode(consumeCode);
					businessConsumer.setConsumerId(bean.getFromUserName());

					List list2 = hibernateTemplate.findByExample(businessConsumer);

					if (list2.size() > 0) {
						if (SysConstant.CONSUME_STATUS_ONGOING.equals(((BusinessConsumer) list2.get(0)).getStatus())) {
							return StringUtil.replace(
									"<a href='{?1}/menu/free/list4bill.do?openId={?2}'>[点击此]开始点菜</a>",
									propUtil.getRedirectUrl(), bean.getFromUserName());
						} else {
							return "您不在消费进行状态中,无法使用该功能.";
						}
					}
				} else {
					return "您不在消费中,请先扫描二维码接入商家.";
				}
			} else {
				return "您的用户信息不存在!";
			}

		} else if (WeiXinEventKey.CUSTOMER_EVT_KEY_3.getValue().equals(eventKey)) {// 顾客呼叫服务

			User user = new User();
			user.setUserName(bean.getFromUserName());

			List list = hibernateTemplate.findByExample(user);

			if (list.size() > 0) {

				final String consumeCode = ((User) list.get(0)).getConsumeCode();

				if (!StringUtil.isEmpty(consumeCode)) {

					BusinessConsumer businessConsumer = new BusinessConsumer();
					businessConsumer.setConsumeCode(consumeCode);
					businessConsumer.setConsumerId(bean.getFromUserName());

					List list2 = hibernateTemplate.findByExample(businessConsumer);

					if (list2.size() > 0) {

						com.sizheng.afl.pojo.entity.Service service = new com.sizheng.afl.pojo.entity.Service();

						final BusinessConsumer businessConsumer2 = (BusinessConsumer) list2.get(0);

						ThreadUtil.exec(new Runnable() {

							@Override
							public void run() {
								Request request = new Request();
								request.setBusinessId(businessConsumer2.getBusinessId());
								request.setConsumeCode(consumeCode);
								request.setConsumerId(bean.getFromUserName());
								request.setDateTime(DateUtil.now());
								request.setIsDelete(SysConstant.SHORT_FALSE);
								request.setName("呼叫服务请求");
								request.setSceneId(businessConsumer2.getSceneId());
								request.setStatus(SysConstant.REQUEST_STATUS_ONGOING);
								request.setType(SysConstant.REQUEST_TYPE_SERVICE_CALL);

								hibernateTemplate.save(request);
							}
						});

						service.setBusinessId(businessConsumer2.getBusinessId());
						service.setConsumerId(bean.getFromUserName());
						service.setType(SysConstant.SERVICE_TYPE_CALL);
						service.setIsDelete(SysConstant.SHORT_FALSE);
						service.setStatus(SysConstant.SERVICE_STATUS_ONGOING);

						if (findOneByExample(service) != null) {
							return "亲爱的顾客上帝,有点繁忙啊,我们马上哈,请稍后...";
						}

						service.setDateTime(DateUtil.now());
						service.setStatus(SysConstant.SERVICE_STATUS_ONGOING);
						final Serializable id = hibernateTemplate.save(service);

						ThreadUtil.exec(new Runnable() {

							@Override
							public void run() {
								String userName = null;
								String location = null;

								// 获取呼叫服务顾客信息.
								List<Map<String, Object>> userInfo = userService.getInfo(locale, bean.getFromUserName());

								if (userInfo.size() > 0) {
									Map<String, Object> map = userInfo.get(0);
									userName = StringUtil.isEmpty(map.get("nickname")) ? bean.getFromUserName()
											: StringUtil.getNotNullString(map, "nickname");
									location = StringUtil.getNotNullString(map, "description");
								}

								// 通知服务人员.
								BusinessRole businessRole = new BusinessRole();
								businessRole.setBusinessId(businessConsumer2.getBusinessId());
								businessRole.setIsDelete(SysConstant.SHORT_FALSE);
								businessRole.setType(SysConstant.ROLE_TYPE_WAITER);

								List list4 = hibernateTemplate.findByExample(businessRole);

								for (Object object : list4) {
									String openId = ((BusinessRole) object).getOpenId();
									String sendMsg = StringUtil
											.replace(
													"顾客[{?1}]呼叫服务\n位置:{?2}\n\n<a href='{?3}/business/free/acceptServiceReq.do?id={?4}&openId={?5}'>[点击此]接受该服务请求</a>",
													userName, location, propUtil.getRedirectUrl(), id, openId);
									if (!weiXinApiInvoker.sendServiceMsg(openId, sendMsg)) {
										logger.error("客服消息通知服务人员失败! openId:" + openId);
									}
								}
							}
						});

						return "服务请求已经发出,等待处理,请稍后...";
					} else {
						return "您的消费信息不存在!";
					}
				} else {
					return "您不在消费中,无法使用呼叫服务功能.";
				}

			} else {
				return "您的用户信息不存在!";
			}

		} else if (WeiXinEventKey.BUSINESS_EVT_KEY_1.getValue().equals(eventKey)) {// 商家入驻

			Business business = new Business();
			business.setOpenId(bean.getFromUserName());

			String dynamicCode = null;

			// 判断商家是否已经入驻
			if (!businessService.exists(locale, business)) {
				dynamicCode = NumberUtil.random(6);
				business.setDynamicCode(dynamicCode);

				businessService.save(locale, business);
			} else {
				dynamicCode = businessService.createDynamicCode(locale, business);
			}

			return StringUtil.replace("<a href='{?1}{?2}?openId={?3}&dynamicCode={?4}&isPhone=1'>[点击此]入驻登录</a>",
					propUtil.getRedirectUrl(), "/business/verify.do", bean.getFromUserName(), dynamicCode);

		} else if (WeiXinEventKey.BUSINESS_EVT_KEY_2.getValue().equals(eventKey)) {

			String url1 = StringUtil.replace("<a href='{?1}?openId={?2}'>[点击此]发送登录链接</a>", propUtil.getRedirectUrl()
					+ "/business/sendLink.do", bean.getFromUserName());

			return StringUtil.replace("{?1}", url1);
		} else if (WeiXinEventKey.PLATFORM_EVT_KEY_1.getValue().equals(eventKey)) {
			return StringUtil.replace("功能开发设计中,敬请期待...");
		} else if (WeiXinEventKey.PLATFORM_EVT_KEY_2.getValue().equals(eventKey)) {
			return StringUtil.replace("功能开发设计中,敬请期待...");
		} else if (WeiXinEventKey.PLATFORM_EVT_KEY_3.getValue().equals(eventKey)) {
			return StringUtil.replace("功能开发设计中,敬请期待...");
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
