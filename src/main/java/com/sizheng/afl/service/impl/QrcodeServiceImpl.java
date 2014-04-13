/**
 * QrcodeServiceImpl.java
 */
package com.sizheng.afl.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sizheng.afl.base.impl.BaseServiceImpl;
import com.sizheng.afl.component.ApiInvoker;
import com.sizheng.afl.component.PropUtil;
import com.sizheng.afl.component.SimpleMailSender;
import com.sizheng.afl.component.WeiXinApiInvoker;
import com.sizheng.afl.dao.IQrcodeDao;
import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.pojo.entity.Category;
import com.sizheng.afl.pojo.entity.Qrcode;
import com.sizheng.afl.pojo.model.WeiXinActionInfo;
import com.sizheng.afl.pojo.model.WeiXinQrcode;
import com.sizheng.afl.pojo.model.WeiXinQrcodeCreateParam;
import com.sizheng.afl.pojo.model.WeiXinScene;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.service.IBusinessService;
import com.sizheng.afl.service.ICategoryService;
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

	/** sceneUsedSet [Set<Integer>] 已经使用的sceneid */
	private static Set<Long> sceneUsedSet = new HashSet<>();

	private static Logger logger = Logger.getLogger(QrcodeServiceImpl.class);

	@Autowired
	IQrcodeDao qrcodeDao;

	@Autowired
	ApiInvoker apiInvoker;

	@Autowired
	WeiXinApiInvoker weiXinApiInvoker;

	@Autowired
	PropUtil propUtil;

	@Autowired
	SimpleMailSender simpleMailSender;

	@Autowired
	IBusinessService businessService;

	@Autowired
	ICategoryService categoryService;

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
	public com.sizheng.afl.pojo.entity.Qrcode get(Locale locale, com.sizheng.afl.pojo.entity.Qrcode qrcode) {

		logger.debug("[业务逻辑层]获取【二维码】");

		List list = hibernateTemplate.findByExample(qrcode);

		return (com.sizheng.afl.pojo.entity.Qrcode) (list.size() > 0 ? list.get(0) : null);
	}

	@Override
	public boolean update(Locale locale, Qrcode qrcode) {

		logger.debug("[业务逻辑层]更新【二维码】");

		Qrcode qrcode2 = get(Qrcode.class, qrcode.getId());

		if (qrcode2 != null) {
			qrcode2.setDescription(qrcode.getDescription());

			hibernateTemplate.update(qrcode2);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<Qrcode> list(Locale locale, String openId) {

		logger.debug("[业务逻辑层]列举【二维码】");

		Qrcode qrcode = new Qrcode();
		qrcode.setOpenId(openId);

		return hibernateTemplate.findByExample(qrcode);
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

	/**
	 * 获取可用的sceneId.
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月26日 下午4:37:03
	 * @modification 2014年3月26日 下午4:37:03
	 * @return
	 */
	private synchronized Long getUseableSceneId() {

		if (sceneUsedSet.size() == 0) {// TODO 这里有个问题,就是当系统启动后,怎么与数据库同步scene
										// id使用情况.
			List list = hibernateTemplate.find("select sceneId from Qrcode");

			if (list.size() > 0) {
				for (Object sceneId : list) {
					sceneUsedSet.add((Long) sceneId);
				}
			}
		}

		for (int i = 1; i <= propUtil.getQrcodeSceneIdMax(); i++) {
			if (!sceneUsedSet.contains(Long.valueOf(i))) {
				sceneUsedSet.add(Long.valueOf(i));
				return Long.valueOf(i);
			}
		}

		return null;
	}

	@Override
	public WeiXinQrcode create(Qrcode qrcode, String realPath, String serverBaseUrl) {

		logger.debug("[业务逻辑层]创建【二维码】");

		// 设置scene id.
		qrcode.setSceneId(getUseableSceneId());

		realPath = realPath.replace("\\", "/");

		if (!realPath.endsWith("/")) {
			realPath += "/";
		}

		// scene id生产策略, scene id[1-100000],资源有限.scene需要自己的管理配置界面.
		// 当收回scene id时,需要通知使用商家.

		String filePath = StringUtil.replaceByKV("resources/images/qrcode/{ticket}_{sceneId}_{description}.jpg",
				"sceneId", qrcode.getSceneId(), "description", qrcode.getDescription());

		WeiXinQrcode weiXinQrcode = weiXinApiInvoker.downQrcodeImage(new WeiXinQrcodeCreateParam("QR_LIMIT_SCENE",
				new WeiXinActionInfo(new WeiXinScene(String.valueOf(qrcode.getSceneId())))), filePath, realPath);

		if (weiXinQrcode != null && StringUtil.isNotEmpty(weiXinQrcode.getUrl())) {

			weiXinQrcode.setMyUrl(serverBaseUrl + "/" + weiXinQrcode.getPath());
			weiXinQrcode.setDescription(qrcode.getDescription());

			// 检查设置 sceneid 的二维码是否已经生产.
			com.sizheng.afl.pojo.entity.Qrcode qrcode1 = new com.sizheng.afl.pojo.entity.Qrcode();
			qrcode1.setSceneId(Long.valueOf(qrcode.getSceneId()));
			qrcode1.setTicket(weiXinQrcode.getTicket());
			qrcode1.setType(SysConstant.QR_LIMIT_SCENE);

			List list = hibernateTemplate.findByExample(qrcode1);

			if (list.size() > 0) {
				logger.debug("该二维码已经生成过!");
			} else {

				// 记录二维码信息
				com.sizheng.afl.pojo.entity.Qrcode qrcode2 = new com.sizheng.afl.pojo.entity.Qrcode();
				qrcode2.setCategoryId(qrcode.getCategoryId());
				qrcode2.setOpenId(qrcode.getOpenId());
				qrcode2.setSceneId(Long.valueOf(qrcode.getSceneId()));
				if (SysConstant.CATEGORY_ID_JS.equals(qrcode.getCategoryId())) {
					qrcode2.setUseLimit(Long.valueOf(100000));
				} else {
					qrcode2.setUseLimit(Long.valueOf(propUtil.getQrcodeUseLimitTime()));
				}
				qrcode2.setUseTimes(Long.valueOf(0));
				qrcode2.setTicket(weiXinQrcode.getTicket());
				qrcode2.setUrl(weiXinQrcode.getUrl());
				qrcode2.setFilePath(weiXinQrcode.getPath());
				qrcode2.setType(SysConstant.QR_LIMIT_SCENE);
				qrcode2.setMyUrl(weiXinQrcode.getMyUrl());
				qrcode2.setDescription(qrcode.getDescription());

				hibernateTemplate.save(qrcode2);
				logger.error("二维码创建成功!");
			}

		} else {
			logger.error("二维码创建失败!");
		}

		return weiXinQrcode;
	}

	@Override
	public boolean sendMail(String filePath, String url, String ticket, String toAddr) {

		logger.debug("[业务逻辑层]邮件发送【二维码】");

		return simpleMailSender.sendMailWithAttachment(toAddr, filePath, "二维码[" + ticket + "]",
				StringUtil.replace("附件为二维码文件, 直接链接地址: {?1}", url));
	}

	@Override
	public boolean sendMail(String filePath, String toAddr) {

		logger.debug("[业务逻辑层]邮件发送打包【二维码】");

		return simpleMailSender.sendMailWithAttachment(toAddr, filePath, "二维码打包发送", "附件为打包二维码!");
	}

	@Override
	public List<com.sizheng.afl.pojo.entity.Qrcode> queryByOpenId(Locale locale, String openId) {

		logger.debug("[业务逻辑层]根据openid查询【二维码】");

		com.sizheng.afl.pojo.entity.Qrcode qrcode = new com.sizheng.afl.pojo.entity.Qrcode();
		qrcode.setOpenId(openId);

		return hibernateTemplate.findByExample(qrcode);
	}

	@Override
	public String getQrCodeType(Locale locale, String sceneId) {

		logger.debug("[业务逻辑层]获取类型【二维码】");

		com.sizheng.afl.pojo.entity.Qrcode qrcode = new com.sizheng.afl.pojo.entity.Qrcode();
		qrcode.setSceneId(Long.valueOf(sceneId));

		List list = hibernateTemplate.findByExample(qrcode);

		if (list.size() > 0) {
			Long categoryId = ((com.sizheng.afl.pojo.entity.Qrcode) list.get(0)).getCategoryId();
			Category category = categoryService.getBycategoryId(categoryId);

			if (category != null) {
				return category.getValue();
			} else {
				logger.error("该二维码对应的分类不存在!");
			}
		}

		return null;
	}

	@Override
	public boolean isExistsJSQrcode(Locale locale, Qrcode qrcode) {

		Qrcode qrcode2 = new Qrcode();
		qrcode2.setOpenId(qrcode.getOpenId());
		qrcode2.setCategoryId(qrcode.getCategoryId());

		return hibernateTemplate.findByExample(qrcode2).size() > 0;
	}

}