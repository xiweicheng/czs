package com.sizheng.afl.util;

import java.io.StringReader;
import java.lang.reflect.Method;
import java.util.Iterator;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class XmlUtil {

	public static <T> T toBean(String xml, Class<T> cls) {

		try {
			T newInstance = cls.newInstance();

			SAXReader reader = new SAXReader();
			Document document = reader.read(new StringReader(xml));

			Element rootE = document.getRootElement();

			Iterator<?> elementIterator = rootE.elementIterator();

			while (elementIterator.hasNext()) {
				Element next = (Element) elementIterator.next();

				try {
					String methodName = "set" + String.valueOf(next.getName());
					Method method = cls.getMethod(methodName, String.class);
					method.invoke(newInstance, next.getData());
				} catch (Exception e) {
					e.printStackTrace();
					continue;
				}
			}

			return newInstance;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
}
