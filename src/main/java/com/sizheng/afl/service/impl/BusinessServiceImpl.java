/**
 * BusinessServiceImpl.java
 */
package com.sizheng.afl.service.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sizheng.afl.base.impl.BaseServiceImpl;
import com.sizheng.afl.component.ApiInvoker;
import com.sizheng.afl.component.PropUtil;
import com.sizheng.afl.component.WeiXinApiInvoker;
import com.sizheng.afl.dao.IBusinessDao;
import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.pojo.entity.BusinessConsumer;
import com.sizheng.afl.pojo.entity.Qrcode;
import com.sizheng.afl.pojo.entity.Subscriber;
import com.sizheng.afl.pojo.entity.User;
import com.sizheng.afl.pojo.model.Business;
import com.sizheng.afl.pojo.model.WeiXinBaseMsg;
import com.sizheng.afl.pojo.model.WeiXinEventType;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.service.IBusinessService;
import com.sizheng.afl.service.IQrcodeService;
import com.sizheng.afl.util.DateUtil;
import com.sizheng.afl.util.StringUtil;

/**
 * 【商家】业务逻辑实现.
 * 
 * @creation 2014年03月25日 02:46:32
 * @modification 2014年03月25日 02:46:32
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Service
@Transactional
public class BusinessServiceImpl extends BaseServiceImpl implements IBusinessService {

	private static Logger logger = Logger.getLogger(BusinessServiceImpl.class);

	@Autowired
	IBusinessDao businessDao;

	@Autowired
	ApiInvoker apiInvoker;

	@Autowired
	PropUtil propUtil;

	@Autowired
	IQrcodeService qrcodeService;

	@Autowired
	WeiXinApiInvoker weiXinApiInvoker;

	@Override
	public boolean save(Locale locale, Business business) {

		logger.debug("[业务逻辑层]添加【商家】");

		com.sizheng.afl.pojo.entity.Business business2 = new com.sizheng.afl.pojo.entity.Business();
		business2.setOpenId(business.getOpenId());
		business2.setIsDeleted((short) 0);
		business2.setQrcodeLimit(propUtil.getQrcodeBusinessMaxDefault());

		hibernateTemplate.save(business2);

		return true;
	}

	@Override
	public boolean delete(Locale locale, Business business) {

		logger.debug("[业务逻辑层]删除【商家】");

		// TODO
		return true;
	}

	@Override
	public Business get(Locale locale, Business business) {

		logger.debug("[业务逻辑层]获取【商家】");

		com.sizheng.afl.pojo.entity.Business business2 = new com.sizheng.afl.pojo.entity.Business();
		business2.setOpenId(business.getOpenId());
		List list = hibernateTemplate.findByExample(business2);

		if (list.size() > 0) {
			com.sizheng.afl.pojo.entity.Business business3 = (com.sizheng.afl.pojo.entity.Business) list.get(0);

			Business business4 = new Business();
			BeanUtils.copyProperties(business3, business4);

			return business4;
		} else {
			logger.debug("没有获取到商家信息:openid[" + business.getOpenId() + "]");
		}

		return null;
	}

	@Override
	public boolean update(Locale locale, Business business) {

		logger.debug("[业务逻辑层]更新【商家】");

		com.sizheng.afl.pojo.entity.Business business2 = new com.sizheng.afl.pojo.entity.Business();
		business2.setOpenId(business.getOpenId());

		List list = hibernateTemplate.findByExample(business2);

		if (list.size() > 0) {
			business2 = (com.sizheng.afl.pojo.entity.Business) list.get(0);
			BeanUtils.copyProperties(business, business2, "qrcodeLimit");
			hibernateTemplate.update(business2);
		} else {
			BeanUtils.copyProperties(business, business2);
			business2.setQrcodeLimit(propUtil.getQrcodeBusinessMaxDefault());
			business2.setIsDeleted((short) 0);

			hibernateTemplate.save(business2);
		}

		return true;
	}

	@Override
	public List<Business> list(Locale locale) {

		logger.debug("[业务逻辑层]列举【商家】");

		// TODO
		return null;
	}

	@Override
	public List<Map<String, Object>> query(Locale locale, Business business) {

		logger.debug("[业务逻辑层]查询【商家】(不分页)");

		// TODO
		return null;
	}

	@Override
	public PageResult paging(Locale locale, Business business, Long start, Long limit) {

		logger.debug("[业务逻辑层]查询【商家】(分页)");

		PageResult pageResult = new PageResult();

		// TODO
		return pageResult;
	}

	@Override
	public boolean exists(Locale locale, Business business) {

		logger.debug("[业务逻辑层]判断【商家】是否存在");

		com.sizheng.afl.pojo.entity.Business business2 = new com.sizheng.afl.pojo.entity.Business();
		business2.setOpenId(business.getOpenId());

		List list = hibernateTemplate.findByExample(business2);

		return list.size() > 0;

	}

	@Override
	public boolean isQrcodeLimited(Locale locale, String openId) {

		Business business = new Business();
		business.setOpenId(openId);

		return qrcodeService.queryByOpenId(locale, openId).size() >= get(locale, business).getQrcodeLimit();
	}

	@Override
	public String addConsumer(Locale locale, WeiXinBaseMsg bean) {

		String event = bean.getEvent();
		String qrsceneId = null;
		String ticket = bean.getTicket();

		if (WeiXinEventType.SUBSCRIBE.getValue().equals(event)) {
			qrsceneId = bean.getEventKey().split(SysConstant.UNDERLINE)[1];// qrscene_123123
		} else if (WeiXinEventType.SCAN.getValue().equals(event)) {
			qrsceneId = bean.getEventKey();
		}

		Qrcode qrcode = new Qrcode();
		qrcode.setSceneId(Long.valueOf(qrsceneId));
		qrcode.setTicket(ticket);
		Qrcode qrcode2 = qrcodeService.get(locale, qrcode);

		if (qrcode2 == null) {
			logger.error(StringUtil
					.replace("该二维码没有被登记过,或者失效已被删除!二维码信息: scene id->{?1} ticket->{?2}", qrsceneId, ticket));
			return "该二维码已经失效!";
		}

		Subscriber subscriber = new Subscriber();
		subscriber.setUserName(bean.getFromUserName());

		List list2 = hibernateTemplate.findByExample(subscriber);

		String nickName = null;

		if (list2.size() > 0) {
			nickName = ((Subscriber) list2.get(0)).getNickname();
		} else {
			nickName = bean.getFromUserName();
		}

		// 获取商家信息.
		com.sizheng.afl.pojo.entity.Business business = new com.sizheng.afl.pojo.entity.Business();
		business.setOpenId(qrcode2.getOpenId());

		List list3 = hibernateTemplate.findByExample(business);

		String businessName = null;

		if (list3.size() > 0) {
			businessName = ((com.sizheng.afl.pojo.entity.Business) list3.get(0)).getName();
		}

		if (StringUtil.isEmpty(businessName)) {
			businessName = "本店";
		} else {
			businessName = businessName;
		}
		
		businessName = StringUtil.replace("<a href='{?1}?openId={?3}'>{?2}</a>", propUtil.getRedirectUrl()
				+ "/business/info.do", businessName,
				qrcode2.getOpenId());
		
		// 在user表中记录对应的商家id
		User user = new User();
		user.setUserName(bean.getFromUserName());

		List list4 = hibernateTemplate.findByExample(user);

		// 判断是否存在对该商家的消费记录.
		BusinessConsumer businessConsumer1 = new BusinessConsumer();
		businessConsumer1.setBusinessId(qrcode2.getOpenId());
		businessConsumer1.setConsumerId(bean.getFromUserName());

		List list = hibernateTemplate.findByExample(businessConsumer1);

		if (list.size() > 0) {

			// 回头客 告知消费者&商家,消费了多少次,最后消费时间.
			BusinessConsumer businessConsumer = (BusinessConsumer) list.get(0);

			if (businessConsumer.getStatus() != null && businessConsumer.getStatus() == 1) {
				return StringUtil.replace("您已经扫描过该二维码,还未结束消费,处于消费中...\n\n结账消费码: {?1}", businessConsumer.getSceneId());
			}

			if (businessConsumer.getStatus() != null && businessConsumer.getStatus() == 2) {
				return "您处于禁止扫描状态!";
			}

			businessConsumer.setConsumeCode(UUID.randomUUID().toString());
			businessConsumer.setConsumeTimes(businessConsumer.getConsumeTimes() + 1);
			businessConsumer.setLastConsumeTime(DateUtil.now());
			businessConsumer.setSceneId(Long.valueOf(qrsceneId));
			businessConsumer.setStatus(SysConstant.CONSUME_STATUS_ONGOING);// 消费中

			hibernateTemplate.update(businessConsumer);

			if (list4.size() > 0) {
				User user2 = (User) list4.get(0);
				user2.setConsumeCode(businessConsumer.getConsumeCode());

				hibernateTemplate.update(user2);
			}

			// 通知商家
			weiXinApiInvoker.sendServiceMsg(
					qrcode2.getOpenId(),
					StringUtil.replace("顾客[{?1}]第[{?2}]次光顾!\n\n结账消费码:{?3}", nickName,
							businessConsumer.getConsumeTimes(), qrsceneId));

			return StringUtil.replace("这是您第[{?1}]次光顾{?3}店!谢谢您的亲睐!\n\n您的结账消费码: {?2}",
					businessConsumer.getConsumeTimes(), qrsceneId, businessName);
		} else {
			// 第一次来此商家消费 新顾客 告知消费者&商家
			BusinessConsumer businessConsumer = new BusinessConsumer();
			businessConsumer.setBusinessId(qrcode2.getOpenId());
			businessConsumer.setConsumerId(bean.getFromUserName());
			businessConsumer.setConsumeTimes(Long.valueOf(1));// 第一次记录为1
			businessConsumer.setLastConsumeTime(DateUtil.now());
			businessConsumer.setConsumeCode(UUID.randomUUID().toString());// 区别消费个人
			businessConsumer.setSceneId(Long.valueOf(qrsceneId));// 区别消费群体
			businessConsumer.setStatus(SysConstant.CONSUME_STATUS_ONGOING);// 消费中

			hibernateTemplate.save(businessConsumer);

			if (list4.size() > 0) {
				User user2 = (User) list4.get(0);
				user2.setConsumeCode(businessConsumer.getConsumeCode());

				hibernateTemplate.update(user2);
			}

			// 通知商家
			weiXinApiInvoker.sendServiceMsg(qrcode2.getOpenId(),
					StringUtil.replace("顾客[{?1}]首次光顾!\n\n结账消费码:{?2}", nickName, qrsceneId));

			return StringUtil.replace("这是您[首次]光顾{?2}店!谢谢您的亲睐!\n\n您的结账消费码: {?1}", qrsceneId, businessName);
		}
	}

}