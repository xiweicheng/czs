/**
 * WeiXinServiceImpl.java
 */
package com.canzs.czs.service.impl;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.canzs.czs.base.impl.BaseServiceImpl;
import com.canzs.czs.component.ApiInvoker;
import com.canzs.czs.component.PropUtil;
import com.canzs.czs.component.SimpleMailSender;
import com.canzs.czs.component.WeiXinApiInvoker;
import com.canzs.czs.dao.IWeiXinDao;
import com.canzs.czs.pojo.constant.SysConstant;
import com.canzs.czs.pojo.entity.Business;
import com.canzs.czs.pojo.entity.BusinessConsumer;
import com.canzs.czs.pojo.entity.BusinessRole;
import com.canzs.czs.pojo.entity.Message;
import com.canzs.czs.pojo.entity.Request;
import com.canzs.czs.pojo.entity.Subscriber;
import com.canzs.czs.pojo.entity.User;
import com.canzs.czs.pojo.model.WeiXin;
import com.canzs.czs.pojo.model.WeiXinBaseMsg;
import com.canzs.czs.pojo.model.WeiXinEventKey;
import com.canzs.czs.pojo.model.WeiXinMsg;
import com.canzs.czs.pojo.model.WeiXinUserInfo;
import com.canzs.czs.pojo.vo.PageResult;
import com.canzs.czs.service.IBusinessRoleService;
import com.canzs.czs.service.IBusinessService;
import com.canzs.czs.service.ICzsUserService;
import com.canzs.czs.service.IQrcodeService;
import com.canzs.czs.service.IUserService;
import com.canzs.czs.service.IWeiXinService;
import com.canzs.czs.util.DateUtil;
import com.canzs.czs.util.NumberUtil;
import com.canzs.czs.util.StringUtil;
import com.canzs.czs.util.ThreadUtil;

/**
 * 【微信】业务逻辑实现.
 * 
 * @creation 2014年03月22日 01:00:06
 * @modification 2014年03月22日 01:00:06
 * @company Canzs
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
	IBusinessRoleService businessRoleService;

	@Autowired
	PropUtil propUtil;

	@Autowired
	ICzsUserService czsUserService;

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

					if (userInfo != null) {

						Subscriber subscriber = new Subscriber();
						subscriber.setUserName(bean.getFromUserName());

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

		if (WeiXinEventKey.CUSTOMER_EVT_KEY_4.getValue().equals(eventKey)) {// 我要结账
			return billHandle(bean, locale);
		} else if (WeiXinEventKey.CUSTOMER_EVT_KEY_5.getValue().equals(eventKey)) {
			return StringUtil.replace("暂无其它服务项,敬请期待...");
		} else if (WeiXinEventKey.CUSTOMER_EVT_KEY_2.getValue().equals(eventKey)) {
			return StringUtil.replace("<a href='{?1}/user/free/getStowBusiness.do?consumerId={?2}'>[点击此]查看收藏商家</a>",
					propUtil.getRedirectUrl(), bean.getFromUserName());
		} else if (WeiXinEventKey.CUSTOMER_EVT_KEY_1.getValue().equals(eventKey)) {// 我的菜单
			return customerMenu(bean);
		} else if (WeiXinEventKey.CUSTOMER_EVT_KEY_3.getValue().equals(eventKey)) {// 呼叫服务请求
			return callServiceHandler(bean, locale);
		} else if (WeiXinEventKey.BUSINESS_EVT_KEY_1.getValue().equals(eventKey)) {// 商家入驻
			return businessRegister(bean, locale);
		} else if (WeiXinEventKey.BUSINESS_EVT_KEY_2.getValue().equals(eventKey)) {// 发送登录链接
			return sendLoginLink(bean, locale);
		} else if (WeiXinEventKey.BUSINESS_EVT_KEY_3.getValue().equals(eventKey)) {// 店员入口
			return businessRoleLogin(bean, locale);
		} else if (WeiXinEventKey.PLATFORM_EVT_KEY_1.getValue().equals(eventKey)) {// 关于平台
			return StringUtil.replace("<a href='{?1}/'>[点击此]进入【关于平台】</a>", propUtil.getRedirectUrl());
		} else if (WeiXinEventKey.PLATFORM_EVT_KEY_2.getValue().equals(eventKey)) {// 平台管理
			// 判断用户是否为平台管理员
			if (czsUserService.isCzsMgr(locale, bean.getFromUserName())) {
				return StringUtil.replace("<a href='{?1}/czs/login.do?openId={?2}'>[点击此]进入【平台管理】</a>",
						propUtil.getRedirectUrl(), bean.getFromUserName());
			} else {
				return "对不起,您不是平台管理员!";
			}
		} else if (WeiXinEventKey.PLATFORM_EVT_KEY_3.getValue().equals(eventKey)) {// 加盟合作
			return StringUtil.replace("<a href='{?1}/'>[点击此]进入【加盟合作】</a>", propUtil.getRedirectUrl());
		} else if (WeiXinEventKey.PLATFORM_EVT_KEY_4.getValue().equals(eventKey)) {// 建议留言
			return StringUtil.replace("<a href='{?1}/czs/free/comment.do?openId={?2}'>[点击此]进入【建议留言】</a>",
					propUtil.getRedirectUrl(), bean.getFromUserName());
		}

		return null;
	}

	/**
	 * 发送登录链接
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月28日 下午5:58:05
	 * @modification 2014年4月28日 下午5:58:05
	 * @param bean
	 * @return
	 */
	private String sendLoginLink(final WeiXinBaseMsg bean, Locale locale) {

		Business business = new Business();
		business.setOpenId(bean.getFromUserName());
		business.setStatus(SysConstant.BUSINESS_STATUS_UNDERSTANDING);

		// 判断用户已经存在并且确认通过审核
		Business business2 = businessService.get(locale, business);

		if (business2 != null) {
			String url1 = StringUtil.replace("<a href='{?1}?openId={?2}'>[点击此]发送登录链接</a>", propUtil.getRedirectUrl()
					+ "/business/free/sendLink.do", bean.getFromUserName());
			return StringUtil.replace("{?1}", url1);
		} else {
			return StringUtil.replace("您不是入驻商家或者还未审核通过!");
		}
	}

	/**
	 * 商家店员角色入口.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月22日 下午10:14:15
	 * @modification 2014年4月22日 下午10:14:15
	 * @param bean
	 * @param locale
	 * @return
	 */
	private String businessRoleLogin(final WeiXinBaseMsg bean, final Locale locale) {
		BusinessRole businessRole = new BusinessRole();
		businessRole.setIsDelete(SysConstant.SHORT_FALSE);
		businessRole.setOpenId(bean.getFromUserName());

		List<BusinessRole> list = businessRoleService.query(locale, businessRole);

		StringBuffer sb = new StringBuffer();

		for (BusinessRole businessRole2 : list) {

			if (SysConstant.ROLE_TYPE_BOSS.equals(businessRole2.getType())) {
				sb.append(
						StringUtil
								.replace(
										"<a href='{?1}/businessRole/free/bossLogin.do?openId={?2}&businessId={?3}'>[点击此]店主入口</a>",
										propUtil.getRedirectUrl(), bean.getFromUserName(),
										businessRole2.getBusinessId())).append("\n\n");
			} else if (SysConstant.ROLE_TYPE_COOK.equals(businessRole2.getType())) {
				sb.append(
						StringUtil
								.replace(
										"<a href='{?1}/businessRole/free/kitchenLogin.do?openId={?2}&businessId={?3}'>[点击此]后厨入口</a>",
										propUtil.getRedirectUrl(), bean.getFromUserName(),
										businessRole2.getBusinessId())).append("\n\n");
			} else if (SysConstant.ROLE_TYPE_PROSCENIUM.equals(businessRole2.getType())) {
				sb.append(
						StringUtil
								.replace(
										"<a href='{?1}/businessRole/free/prosceniumLogin.do?openId={?2}&businessId={?3}'>[点击此]前台入口</a>",
										propUtil.getRedirectUrl(), bean.getFromUserName(),
										businessRole2.getBusinessId())).append("\n\n");
			} else if (SysConstant.ROLE_TYPE_WAITER.equals(businessRole2.getType())) {
				sb.append(
						StringUtil
								.replace(
										"<a href='{?1}/businessRole/free/waiterLogin.do?openId={?2}&businessId={?3}'>[点击此]服务员入口</a>",
										propUtil.getRedirectUrl(), bean.getFromUserName(),
										businessRole2.getBusinessId())).append("\n\n");
			}
		}

		return sb.toString().trim();
	}

	/**
	 * 商家申请入住.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月22日 下午9:57:37
	 * @modification 2014年4月22日 下午9:57:37
	 * @param bean
	 * @param locale
	 * @return
	 */
	private String businessRegister(final WeiXinBaseMsg bean, final Locale locale) {
		Business business = new Business();
		business.setOpenId(bean.getFromUserName());

		String dynamicCode = null;

		Business business2 = businessService.get(locale, business);

		// 判断商家是否已经入驻
		if (business2 != null) {// 第一次入驻操作,保存基本信息.

			if (SysConstant.BUSINESS_STATUS_UNDERSTANDING.equals(business2.getStatus())) {// 审核通过,发送登录链接
				dynamicCode = businessService.createDynamicCode(locale, business);
				return StringUtil.replace(
						"<a href='{?1}{?2}?openId={?3}&dynamicCode={?4}&isPhone=1'>[点击此]商家管理登录</a>\n该链接只能使用一次",
						propUtil.getRedirectUrl(), "/business/verify.do", bean.getFromUserName(), dynamicCode);
			} else if (SysConstant.BUSINESS_STATUS_NEW.equals(business2.getStatus())) {// 还未审核通过
				String link = StringUtil.replace("<a href='{?1}{?2}?openId={?3}'>[点击此]完善商家信息</a>",
						propUtil.getRedirectUrl(), "/business/free/input.do", bean.getFromUserName());
				return StringUtil.replace("您入驻请求还在审核中...\n\n请通过下面链接完善自己的商家信息,以便我们的客服联系您快速完成审核!\n\n{?1}", link);
			} else {
				logger.error("未知状态,请联系系统管理员!");
				return "未知状态,请报告该问题给平台管理员!";
			}
		} else {
			business.setDateTime(DateUtil.now());
			business.setIsDeleted(SysConstant.SHORT_FALSE);
			business.setIsMailVerify(SysConstant.SHORT_FALSE);
			business.setIsPhoneVerify(SysConstant.SHORT_FALSE);
			business.setStatus(SysConstant.BUSINESS_STATUS_NEW);
			business.setDays(0L);
			business.setQrcodeLimit(0L);
			business.setLifeValue(0L);
			business.setLoginTimes(0L);

			businessService.save(locale, business);

			String link = StringUtil.replace("<a href='{?1}{?2}?openId={?3}'>[点击此]完善商家信息</a>",
					propUtil.getRedirectUrl(), "/business/free/input.do", bean.getFromUserName());
			return StringUtil.replace("您的入驻请求已经发送,等待审核中...\n\n请通过下面链接完善自己的商家信息,以便我们的客服联系您快速完成审核!\n\n{?1}", link);
		}
	}

	/**
	 * 顾客菜单.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月22日 下午9:56:47
	 * @modification 2014年4月22日 下午9:56:47
	 * @param bean
	 * @return
	 */
	private String customerMenu(final WeiXinBaseMsg bean) {
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
						return StringUtil.replace("<a href='{?1}/menu/free/list4bill.do?openId={?2}'>[点击此]开始点菜</a>",
								propUtil.getRedirectUrl(), bean.getFromUserName());
					} else {
						return "您不在消费进行状态中,无法使用该功能.";
					}
				} else {
					return "您没有消费记录!";
				}
			} else {
				return "您不在消费中,请先扫描二维码接入商家.";
			}
		} else {
			return "您的用户信息不存在!";
		}
	}

	/**
	 * 申请结账.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月22日 下午9:53:45
	 * @modification 2014年4月22日 下午9:53:45
	 * @param bean
	 * @param locale
	 * @return
	 */
	private String billHandle(final WeiXinBaseMsg bean, final Locale locale) {
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
										propUtil.getRedirectUrl() + "/user/free/billReq.do", bean.getFromUserName(),
										user2.getConsumeCode(), NumberUtil.format2Money(consume), "own");
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
										propUtil.getRedirectUrl() + "/user/free/billReq.do", bean.getFromUserName(),
										user2.getConsumeCode(), NumberUtil.format2Money(consume), "own")
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
	}

	/**
	 * 顾客呼叫服务处理.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月18日 上午9:43:28
	 * @modification 2014年4月18日 上午9:43:28
	 * @param bean
	 * @param locale
	 * @return
	 */
	private String callServiceHandler(final WeiXinBaseMsg bean, final Locale locale) {

		User user = new User();
		user.setUserName(bean.getFromUserName());

		User user2 = findOneByExample(user, User.class);

		if (user2 != null) {

			final String consumeCode = user2.getConsumeCode();

			if (!StringUtil.isEmpty(consumeCode)) {

				BusinessConsumer businessConsumer = new BusinessConsumer();
				businessConsumer.setConsumeCode(consumeCode);
				businessConsumer.setConsumerId(bean.getFromUserName());

				final BusinessConsumer businessConsumer2 = findOneByExample(businessConsumer, BusinessConsumer.class);

				if (businessConsumer2 != null) {

					String retMsg = null;
					final Serializable id;

					com.canzs.czs.pojo.entity.Service service = new com.canzs.czs.pojo.entity.Service();

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
					service.setSceneId(businessConsumer2.getSceneId());

					com.canzs.czs.pojo.entity.Service service2 = (com.canzs.czs.pojo.entity.Service) findOneByExample(service);

					if (service2 != null) {
						id = service2.getId();
						retMsg = "亲爱的顾客上帝,有点繁忙啊,我们马上哈,请稍后...";
					} else {
						service.setDateTime(DateUtil.now());
						service.setStatus(SysConstant.SERVICE_STATUS_ONGOING);
						id = hibernateTemplate.save(service);
						retMsg = "服务请求已经发出,等待处理,请稍后...";
					}

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
												"顾客[{?1}]呼叫服务\n位置:{?2}\n\n<a href='{?3}/business/free/acceptServiceReq.do?id={?4}&openId={?5}&consumerId={?6}'>[点击此]接受该服务请求</a>",
												userName, location, propUtil.getRedirectUrl(), id, openId,
												bean.getFromUserName());
								if (!weiXinApiInvoker.sendServiceMsg(openId, sendMsg)) {
									logger.error("客服消息通知服务人员失败! openId:" + openId);
								}
							}
						}
					});

					return retMsg;
				} else {
					return "您的消费信息不存在!";
				}
			} else {
				return "您不在消费中,无法使用呼叫服务功能.";
			}

		} else {
			return "您的用户信息不存在!";
		}
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
		message.setRecognition(bean.getRecognition());

		Map<String, Object> businessConsumer = userService.getBusinessConsumer(null, bean.getFromUserName());

		message.setToOpenId(StringUtil.getString(businessConsumer, "business_id"));
		message.setSceneId(NumberUtil.getLong(businessConsumer, "scene_id"));
		message.setDateTime(DateUtil.now());
		message.setStatus(SysConstant.MESSAGE_STATUS_NEW);

		return hibernateTemplate.save(message);
	}

	@Override
	public boolean view(WeiXinBaseMsg bean, Locale locale) {
		logger.debug("[业务逻辑层]跳转链接菜单单击事件");

		logger.debug(bean.getEventKey());

		return false;
	}

	@Override
	public String voice(Locale locale, WeiXinBaseMsg bean) {

		// 判断用户是不是消费中.
		String businessId = userService.getBusinessId(locale, bean.getFromUserName());

		if (StringUtil.isNotEmpty(businessId)) {
			// 如果是消费中,发送语音给服务员.
			BusinessRole businessRole = new BusinessRole();
			businessRole.setBusinessId(businessId);
			businessRole.setIsDelete(SysConstant.SHORT_FALSE);
			businessRole.setType(SysConstant.ROLE_TYPE_WAITER);

			List list4 = hibernateTemplate.findByExample(businessRole);

			for (Object object : list4) {
				String openId = ((BusinessRole) object).getOpenId();

				if (!weiXinApiInvoker.sendServiceVoice(openId, bean.getMediaId())) {
					logger.error("语音客服消息通知服务人员失败! openId:" + openId);
				}
			}
		} else {
			return "您不在消费中,发送的语音消息无法被接收处理!";
		}

		return "收到语音消息,谢谢!";
	}

}
