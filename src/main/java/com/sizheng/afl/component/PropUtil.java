package com.sizheng.afl.component;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class PropUtil {

	@Value("#{systemProperties['switch.log.reqbody']}")
	private boolean logReqbody;

	@Value("#{systemProperties['switch.event.mail.send']}")
	private boolean sendMail;

	@Value("#{systemProperties['weixin.token']}")
	private String token;

	@Value("#{systemProperties['weixin.resp.tpl.text']}")
	private String tplText;

	@Value("#{systemProperties['weixin.api.url.token.get']}")
	private String tokenGetUrl;

	@Value("#{systemProperties['weixin.api.url.menu.create']}")
	private String menuCreateUrl;

	@Value("#{systemProperties['weixin.api.url.custom.send']}")
	private String customSendUrl;

	@Value("#{systemProperties['weixin.api.client.credential.appid']}")
	private String appid;

	@Value("#{systemProperties['weixin.api.client.credential.secret']}")
	private String secret;

	@Value("#{systemProperties['weixin.api.url.user.info.get']}")
	private String userInfoGetUrl;

	@Value("#{systemProperties['weixin.api.url.menu.delete']}")
	private String menuDeleteUrl;

	@Value("#{systemProperties['weixin.api.url.connect.oauth2.authorize']}")
	private String webpageCodeGetUrl;

	@Value("#{systemProperties['weixin.api.url.drcode.create']}")
	private String qrcodeCreateUrl;

	@Value("#{systemProperties['weixin.api.url.showqrcode']}")
	private String showqrcodeUrl;

	@Value("#{systemProperties['weixin.api.url.redirect']}")
	private String redirectUrl;

	@Value("#{systemProperties['weixin.api.url.access.token.get']}")
	private String accessTokenGetUrl;

	@Value("#{systemProperties['weixin.api.url.access.token.refresh']}")
	private String accessTokenRefreshUrl;

	@Value("#{systemProperties['weixin.api.url.web.user.info.get']}")
	private String webUserInfoGetUrl;

	@Value("#{systemProperties['qrcode.use.limit.time']}")
	private String qrcodeUseLimitTime;

	@Value("#{systemProperties['path.menu.store']}")
	private String menuStorePath;

	@Value("#{systemProperties['path.qrcode.store']}")
	private String qrcodeStorePath;

	@Value("#{systemProperties['qrcode.scene.id.max']}")
	private long qrcodeSceneIdMax;

	@Value("#{systemProperties['qrcode.business.max.default']}")
	private long qrcodeBusinessMaxDefault;

	public boolean isLogReqbody() {
		return logReqbody;
	}

	public String getToken() {
		return token;
	}

	public String getTplText() {
		return tplText;
	}

	public String getTokenGetUrl() {
		return tokenGetUrl;
	}

	public String getMenuCreateUrl() {
		return menuCreateUrl;
	}

	public String getCustomSendUrl() {
		return customSendUrl;
	}

	public String getAppid() {
		return appid;
	}

	public String getSecret() {
		return secret;
	}

	public String getUserInfoGetUrl() {
		return userInfoGetUrl;
	}

	public String getMenuDeleteUrl() {
		return menuDeleteUrl;
	}

	public String getWebpageCodeGetUrl() {
		return webpageCodeGetUrl;
	}

	public String getQrcodeCreateUrl() {
		return qrcodeCreateUrl;
	}

	public String getShowqrcodeUrl() {
		return showqrcodeUrl;
	}

	public boolean isSendMail() {
		return sendMail;
	}

	public String getRedirectUrl() {
		return redirectUrl;
	}

	public String getAccessTokenGetUrl() {
		return accessTokenGetUrl;
	}

	public String getAccessTokenRefreshUrl() {
		return accessTokenRefreshUrl;
	}

	public String getWebUserInfoGetUrl() {
		return webUserInfoGetUrl;
	}

	public String getQrcodeUseLimitTime() {
		return qrcodeUseLimitTime;
	}

	public long getQrcodeSceneIdMax() {
		return qrcodeSceneIdMax;
	}

	public long getQrcodeBusinessMaxDefault() {
		return qrcodeBusinessMaxDefault;
	}

	public String getMenuStorePath() {
		return menuStorePath;
	}

	public String getQrcodeStorePath() {
		return qrcodeStorePath;
	}

}
