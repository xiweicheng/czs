package com.sizheng.afl.component;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sizheng.afl.base.BaseTest;
import com.sizheng.afl.pojo.model.MailSenderInfo;

public class SimpleMailSenderTest extends BaseTest {

	@Autowired
	SimpleMailSender simpleMailSender;

	@Test
	public void testSendTextMail() {
		// 这个类主要是设置邮件
		MailSenderInfo mailInfo = new MailSenderInfo();
		mailInfo.setMailServerHost("smtp.163.com");
		mailInfo.setMailServerPort("25");
		mailInfo.setValidate(true);
		mailInfo.setUserName("xiweicheng1987@163.com");
		mailInfo.setPassword("1987826");// 您的邮箱密码
		mailInfo.setFromAddress("xiweicheng1987@163.com");
		mailInfo.setToAddress("xiweicheng@yeah.net");
		mailInfo.setSubject("设置邮箱标题");
		mailInfo.setContent("设置邮箱内容");
		// 这个类主要来发送邮件
		simpleMailSender.sendTextMail(mailInfo);// 发送文体格式
	}

	@Test
	public void testSendHtmlMail() {
		// 这个类主要是设置邮件
		MailSenderInfo mailInfo = new MailSenderInfo();
		mailInfo.setMailServerHost("smtp.163.com");
		mailInfo.setMailServerPort("25");
		mailInfo.setValidate(true);
		mailInfo.setUserName("xiweicheng1987@163.com");
		mailInfo.setPassword("1987826");// 您的邮箱密码
		mailInfo.setFromAddress("xiweicheng1987@163.com");
		mailInfo.setToAddress("xiweicheng@yeah.net");
		mailInfo.setSubject("设置邮箱标题");
		mailInfo.setContent("设置邮箱内容");
		// 这个类主要来发送邮件
		simpleMailSender.sendHtmlMail(mailInfo);// 发送html格式
	}

	@Test
	public void sendTextTest() {
		simpleMailSender.sendText("你好", "你好");
	}

	@Test
	public void sendHtmlTest() {
		simpleMailSender.sendHtml("你好", "<body><a href='http://www.baidu.com'>百度一下!</a></body>");
	}

	@Test
	public void sendMailWithAttachment() {
		assertTrue(simpleMailSender
				.sendMailWithAttachment(
						"xiweicheng@yeah.net",
						"C:\\Users\\thinkpad\\git\\afl\\src\\main\\webapp\\resources\\images\\qrcode\\gQHG7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3pFeG9rM2ZseTRTeVZHalB0bUJVAAIEUpMxUwMEAAAAAA==_2_嗯啦.jpg",
						"二维码", "xxx"));
	}

}
