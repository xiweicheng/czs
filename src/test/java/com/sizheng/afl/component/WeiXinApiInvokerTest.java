package com.sizheng.afl.component;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSONObject;
import com.sizheng.afl.base.BaseTest;
import com.sizheng.afl.pojo.model.WeiXinActionInfo;
import com.sizheng.afl.pojo.model.WeiXinQrcodeCreateParam;
import com.sizheng.afl.pojo.model.WeiXinScene;
import com.sizheng.afl.pojo.model.WeiXinUserInfo;
import com.sizheng.afl.util.StringUtil;

public class WeiXinApiInvokerTest extends BaseTest {

	@Autowired
	WeiXinApiInvoker weiXinApiInvoker;

	@Autowired
	PropUtil propUtil;

	@Test
	public void accessTokenInitTest() {
		assertTrue(weiXinApiInvoker.initAccessToken());
	}

	@Test
	public void menuCreateTest() {
		assertTrue(weiXinApiInvoker.createMenu());
	}

	@Test
	public void deleteMenuTest() {
		assertTrue(weiXinApiInvoker.deleteMenu());
	}

	@Test
	public void sendServiceMsgTest() {
		assertTrue(weiXinApiInvoker.sendServiceMsg("okPUDtzjrogWsWdsI_Fz39VNbgBc", "这是一条客服消息!"));
	}

	@Test
	public void getWebpageCode() {
		assertNotNull(weiXinApiInvoker.getWebpageCode());
	}

	@Test
	public void getUserInfo() {
		WeiXinUserInfo userInfo = weiXinApiInvoker.getUserInfo("okPUDtzjrogWsWdsI_Fz39VNbgBc");
		assertNotNull(userInfo);
	}

	@Test
	public void getTicket() {
		WeiXinQrcodeCreateParam param = new WeiXinQrcodeCreateParam("1800", "QR_SCENE", new WeiXinActionInfo(
				new WeiXinScene("123")));
		JSONObject ticket = weiXinApiInvoker.getTicket(param);
		assertNotNull(ticket.getString("ticket"));

		System.out.println(StringUtil.replaceByKV(propUtil.getShowqrcodeUrl(), "ticket", ticket.getString("ticket")));
	}

	@Test
	public void getQrcodeUrl() {
		WeiXinQrcodeCreateParam param = new WeiXinQrcodeCreateParam("1800", "QR_SCENE", new WeiXinActionInfo(
				new WeiXinScene("123")));
		String url = weiXinApiInvoker.getQrcodeUrl(param);
		assertNotNull(url);

		System.out.println(url);
	}

	@Test
	public void downQrcodeImage() {
		WeiXinQrcodeCreateParam param = new WeiXinQrcodeCreateParam("1800", "QR_SCENE", new WeiXinActionInfo(
				new WeiXinScene("123")));
		assertTrue(weiXinApiInvoker.downQrcodeImage(param, "D:/qrcode-img"));
	}

}
