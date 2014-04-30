package com.canzs.czs.component;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.canzs.czs.pojo.model.MailSenderInfo;
import com.canzs.czs.pojo.model.MyAuthenticator;
import com.canzs.czs.util.StringUtil;

/**
 * 简单邮件（不带附件的邮件）发送器
 * 
 * @creation 2014年3月21日 上午11:27:03
 * @modification 2014年3月21日 上午11:27:03
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Component
public class SimpleMailSender {

	private static Logger logger = Logger.getLogger(SimpleMailSender.class);

	@Value("#{systemProperties['java.mail.toAddress']}")
	private String toAddress;

	@Autowired
	PropUtil propUtil;

	/**
	 * 发送简单文本邮件.
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月21日 上午11:26:30
	 * @modification 2014年3月21日 上午11:26:30
	 * @param subject
	 *            标题
	 * @param content
	 *            内容
	 * @return
	 */
	public boolean sendText(String subject, String content) {
		MailSenderInfo mailInfo = new MailSenderInfo();
		mailInfo.setMailServerHost("smtp.163.com");
		mailInfo.setMailServerPort("25");
		mailInfo.setValidate(true);
		mailInfo.setUserName("xiweicheng1987@163.com");
		mailInfo.setPassword("1987826");// 您的邮箱密码
		mailInfo.setFromAddress("xiweicheng1987@163.com");
		mailInfo.setToAddress(toAddress);
		mailInfo.setSubject(subject);
		mailInfo.setContent(content);

		return sendTextMail(mailInfo);
	}

	/**
	 * 发送简单文本邮件.
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月21日 上午11:26:30
	 * @modification 2014年3月21日 上午11:26:30
	 * @param subject
	 *            标题
	 * @param content
	 *            内容
	 * @return
	 */
	public boolean sendText(String subject, String content, String toAddr) {
		MailSenderInfo mailInfo = new MailSenderInfo();
		mailInfo.setMailServerHost("smtp.163.com");
		mailInfo.setMailServerPort("25");
		mailInfo.setValidate(true);
		mailInfo.setUserName("xiweicheng1987@163.com");
		mailInfo.setPassword("1987826");// 您的邮箱密码
		mailInfo.setFromAddress("xiweicheng1987@163.com");
		mailInfo.setToAddress(toAddr);
		mailInfo.setSubject(subject);
		mailInfo.setContent(content);

		return sendTextMail(mailInfo);
	}

	/**
	 * 发送格式化简单文本邮件.
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月21日 上午11:40:13
	 * @modification 2014年3月21日 上午11:40:13
	 * @param subject
	 *            标题
	 * @param contentTpl
	 *            xxx{?1}yyyy{?2}zzz
	 * @param vals
	 * @return
	 */
	public boolean sendFormatText(String subject, String contentTpl, Object... vals) {

		// 判断配置文件是否允许发邮件.
		if (!propUtil.isSendMail()) {
			return false;
		}

		MailSenderInfo mailInfo = new MailSenderInfo();
		mailInfo.setMailServerHost("smtp.163.com");
		mailInfo.setMailServerPort("25");
		mailInfo.setValidate(true);
		mailInfo.setUserName("xiweicheng1987@163.com");
		mailInfo.setPassword("1987826");// 您的邮箱密码
		mailInfo.setFromAddress("xiweicheng1987@163.com");
		mailInfo.setToAddress(toAddress);
		mailInfo.setSubject(subject);
		mailInfo.setContent(StringUtil.replace(contentTpl, vals));

		return sendTextMail(mailInfo);
	}

	/**
	 * 发送简单Html邮件.
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月21日 上午11:27:57
	 * @modification 2014年3月21日 上午11:27:57
	 * @param subject
	 *            标题
	 * @param content
	 *            html内容
	 * @return
	 */
	public boolean sendHtml(String subject, String content) {
		MailSenderInfo mailInfo = new MailSenderInfo();
		mailInfo.setMailServerHost("smtp.163.com");
		mailInfo.setMailServerPort("25");
		mailInfo.setValidate(true);
		mailInfo.setUserName("xiweicheng1987@163.com");
		mailInfo.setPassword("1987826");// 您的邮箱密码
		mailInfo.setFromAddress("xiweicheng1987@163.com");
		mailInfo.setToAddress(toAddress);
		mailInfo.setSubject(subject);
		mailInfo.setContent(content);

		return sendHtmlMail(mailInfo);
	}

	/**
	 * 以文本格式发送邮件
	 * 
	 * @param mailInfo
	 *            待发送的邮件的信息
	 */
	public boolean sendTextMail(MailSenderInfo mailInfo) {
		// 判断是否需要身份认证
		MyAuthenticator authenticator = null;
		Properties pro = mailInfo.getProperties();
		if (mailInfo.isValidate()) {
			// 如果需要身份认证，则创建一个密码验证器
			authenticator = new MyAuthenticator(mailInfo.getUserName(), mailInfo.getPassword());
		}
		// 根据邮件会话属性和密码验证器构造一个发送邮件的session
		Session sendMailSession = Session.getInstance(pro, authenticator);
		try {
			// 根据session创建一个邮件消息
			Message mailMessage = new MimeMessage(sendMailSession);
			// 创建邮件发送者地址
			Address from = new InternetAddress(mailInfo.getFromAddress());
			// 设置邮件消息的发送者
			mailMessage.setFrom(from);
			// 创建邮件的接收者地址，并设置到邮件消息中
			Address to = new InternetAddress(mailInfo.getToAddress());
			mailMessage.setRecipient(Message.RecipientType.TO, to);
			// 设置邮件消息的主题
			mailMessage.setSubject(mailInfo.getSubject());
			// 设置邮件消息发送的时间
			mailMessage.setSentDate(new Date());
			// 设置邮件消息的主要内容
			String mailContent = mailInfo.getContent();
			mailMessage.setText(mailContent);
			// 发送邮件
			Transport.send(mailMessage);
			return true;
		} catch (MessagingException ex) {
			ex.printStackTrace();
		}
		return false;
	}

	/**
	 * 以HTML格式发送邮件
	 * 
	 * @param mailInfo
	 *            待发送的邮件信息
	 */
	public boolean sendHtmlMail(MailSenderInfo mailInfo) {
		// 判断是否需要身份认证
		MyAuthenticator authenticator = null;
		Properties pro = mailInfo.getProperties();
		// 如果需要身份认证，则创建一个密码验证器
		if (mailInfo.isValidate()) {
			authenticator = new MyAuthenticator(mailInfo.getUserName(), mailInfo.getPassword());
		}
		// 根据邮件会话属性和密码验证器构造一个发送邮件的session
		Session sendMailSession = Session.getInstance(pro, authenticator);
		try {
			// 根据session创建一个邮件消息
			Message mailMessage = new MimeMessage(sendMailSession);
			// 创建邮件发送者地址
			Address from = new InternetAddress(mailInfo.getFromAddress());
			// 设置邮件消息的发送者
			mailMessage.setFrom(from);
			// 创建邮件的接收者地址，并设置到邮件消息中
			Address to = new InternetAddress(mailInfo.getToAddress());
			// Message.RecipientType.TO属性表示接收者的类型为TO
			mailMessage.setRecipient(Message.RecipientType.TO, to);
			// 设置邮件消息的主题
			mailMessage.setSubject(mailInfo.getSubject());
			// 设置邮件消息发送的时间
			mailMessage.setSentDate(new Date());
			// MiniMultipart类是一个容器类，包含MimeBodyPart类型的对象
			Multipart mainPart = new MimeMultipart();
			// 创建一个包含HTML内容的MimeBodyPart
			BodyPart html = new MimeBodyPart();
			// 设置HTML内容
			html.setContent(mailInfo.getContent(), "text/html; charset=utf-8");
			mainPart.addBodyPart(html);
			// 将MiniMultipart对象设置为邮件内容
			mailMessage.setContent(mainPart);
			// 发送邮件
			Transport.send(mailMessage);
			return true;
		} catch (MessagingException ex) {
			ex.printStackTrace();
		}
		return false;
	}

	/**
	 * 发送带附件的邮件.
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月26日 下午3:33:23
	 * @modification 2014年3月26日 下午3:33:23
	 * @param toAddr
	 * @param filePath
	 * @param title
	 * @param content
	 *            TODO
	 * @return
	 */
	public boolean sendMailWithAttachment(String toAddr, String filePath, String title, String content) {

		try {
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.163.com");
			props.put("mail.smtp.port", String.valueOf(25));
			props.put("mail.smtp.auth", "true");

			Session session = Session.getInstance(props, null);
			Transport transport = session.getTransport("smtp");
			transport.connect("smtp.163.com", "xiweicheng1987@163.com", "1987826");

			MimeMessage msg = new MimeMessage(session);
			msg.setSentDate(new Date());
			InternetAddress fromAddress = new InternetAddress("xiweicheng1987@163.com");
			msg.setFrom(fromAddress);

			InternetAddress[] toAddress = new InternetAddress[1];
			toAddress[0] = new InternetAddress(toAddr);

			msg.setRecipients(Message.RecipientType.TO, toAddress);
			msg.setSubject(title, "UTF-8");

			MimeMultipart multi = new MimeMultipart();
			BodyPart bodyPart = new MimeBodyPart(); // 第一个BodyPart.主要写一些一般的信件内容。
			// 设置HTML内容
			// bodyPart.setContent(content, "text/html; charset=utf-8");
			bodyPart.setText(content);
			// 压入第一个BodyPart到MimeMultipart对象中。
			multi.addBodyPart(bodyPart);

			FileDataSource fds = new FileDataSource(filePath); // 必须存在的文档，否则throw异常。

			BodyPart fileBodyPart = new MimeBodyPart(); // 第二个BodyPart

			fileBodyPart.setDataHandler(new DataHandler(fds)); // 字符流形式装入文件
			try {
				fileBodyPart.setFileName(MimeUtility.encodeText(fds.getName(), "UTF-8", "B"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				logger.error(e.getMessage(), e);
			} // 设置文件名，可以不是原来的文件名。

			multi.addBodyPart(fileBodyPart);
			// MimeMultPart作为Content加入message
			msg.setContent(multi);

			msg.setFileName(filePath);
			msg.saveChanges();
			transport.sendMessage(msg, msg.getAllRecipients());

			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		}

		return false;
	}
}
