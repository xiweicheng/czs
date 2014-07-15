package com.canzs.czs.util;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.junit.Test;

import com.canzs.czs.pojo.model.WeiXinBaseMsg;

public class XmlUtilTest {

	@Test
	public void testXml2Json() throws DocumentException {

		SAXReader reader = new SAXReader();

		Document document = reader.read(XmlUtilTest.class.getResourceAsStream("/com/canzs.czs/util/xml.xml"));

		Element rootE = document.getRootElement();

		Element toUserNameE = rootE.element("ToUserName");

		// toUserNameE = (Element) rootE.selectSingleNode("ToUserName");

		System.out.println(toUserNameE.getData());

		// List<Element> nodeList = rootE.selectNodes("trigger");
		//
		// System.out.println(nodeList);
		//
		// nodeList = rootE.selectNodes("templates");
		//
		// System.out.println(nodeList.get(0).getName());
		// System.out.println(nodeList.size());
		//
		// System.out.println(rootE.elements().size());
		//
		// System.out.println(rootE.elementText("version").trim());
		//
		// nodeList = rootE.selectNodes("/allmoni_export/*");
		//
		// System.out.println(nodeList.size());

		// Element templatesE = (Element) rootE.selectSingleNode("templates");
		//
//		List<Element> templateElemList = templatesE.selectNodes("template");
//
//		System.out.println(templateElemList.size());
//
//		System.out.println(rootE.selectNodes("templates/template/groups/group/name").size());
//
//		System.out.println(((Element) rootE.selectSingleNode("templates/template/groups/group")).elementText("name"));
//
//		System.out.println(rootE.matches("templates/template/groups/group"));
//		System.out.println(rootE.matches("templates/template/groups/group_"));
//
//		System.out.println(rootE.element("fff"));

	}

	@Test
	public void toBeanTest() {
		String xml = "<xml><ToUserName><![CDATA[gh_b401b0f3d9a6]]></ToUserName><FromUserName><![CDATA[o_gy-uDW8XJuRMZRzTOLEWVDJBok]]></FromUserName><CreateTime>1395291909</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[哈哈哈]]></Content><MsgId>5992733117728498379</MsgId></xml>";
		WeiXinBaseMsg bean = XmlUtil.toBean(xml, WeiXinBaseMsg.class);

		System.out.println(bean);
	}

}
