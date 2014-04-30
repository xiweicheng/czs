/**
 * WeiXinDaoImpl.java
 */
package com.canzs.czs.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.canzs.czs.base.impl.BaseDaoImpl;
import com.canzs.czs.dao.IWeiXinDao;
import com.canzs.czs.pojo.entity.Subscriber;
import com.canzs.czs.pojo.entity.User;
import com.canzs.czs.pojo.model.WeiXin;
import com.canzs.czs.pojo.model.WeiXinUserInfo;

/**
 * 【微信】持久化实现层.
 * 
 * @creation 2014年03月22日 01:02:25
 * @modification 2014年03月22日 01:02:25
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class WeiXinDaoImpl extends BaseDaoImpl implements IWeiXinDao {

	private static Logger logger = Logger.getLogger(WeiXinDaoImpl.class);

	@Override
	public List<Map<String, Object>> query(Locale locale, WeiXin weiXin, Long start, Long limit) {

		// TODO

		return null;
	}

	@Override
	public long queryCount(Locale locale, WeiXin weiXin) {

		// TODO

		return 0L;
	}

	@Override
	public boolean saveSubscriber(String userName, String createTime) {

		logger.debug("[持久化层]保存关注者)");

		User user = new User();
		user.setUserName(userName);
		List list = hibernateTemplate.findByExample(user);

		if (list.size() == 1) {// 以前关注过,取消关注后再次关注
			logger.debug("以前关注过,取消关注后再次关注");
			User user2 = (User) list.get(0);
			user2.setCreateTime(Long.valueOf(createTime));
			user2.setTimes(user2.getTimes() + 1);
			user2.setIsDeleted((short) 0);// 恢复取消关注状态
			hibernateTemplate.update(user2);
		} else {// 第一次关注
			logger.debug("关注者第一次关注");
			user.setCreateTime(Long.valueOf(createTime));
			user.setIsDeleted((short) 0);
			user.setTimes(Integer.valueOf(1));
			hibernateTemplate.save(user);
		}
		return true;
	}

	@Override
	public boolean deleteSubscriber(final String userName, final String createTime) {

		logger.debug("[持久化层]逻辑删除关注者)");

		Integer cnt = hibernateTemplate.execute(new HibernateCallback<Integer>() {

			@Override
			public Integer doInHibernate(Session session) throws HibernateException, SQLException {
				Query createQuery = session.createQuery("update User set isDeleted=1, createTime=? where userName=?");
				int cnt = createQuery.setLong(0, Long.valueOf(createTime)).setString(1, userName).executeUpdate();
				return cnt;
			}
		});
		return Integer.valueOf(1).equals(cnt);
	}

	@Override
	public boolean saveWeiXinUserInfo(WeiXinUserInfo userInfo) {

		Subscriber subscriber = new Subscriber();
		subscriber.setCity(userInfo.getCity());
		subscriber.setCountry(userInfo.getCountry());
		subscriber.setHeadimgurl(userInfo.getHeadimgurl());
		subscriber.setLanguage(userInfo.getLanguage());
		subscriber.setNickname(userInfo.getNickname());
		subscriber.setProvince(userInfo.getProvince());
		subscriber.setSex(userInfo.getSex());
		subscriber.setUserName(userInfo.getOpenid());

		hibernateTemplate.save(subscriber);

		return true;
	}

}
