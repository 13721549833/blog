package com.itaka.blog.util;

import java.io.IOException;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PropertiesUtils {

	private static Logger logger = LoggerFactory.getLogger(PropertiesUtils.class);
	
	public static Properties p = null;
	
	public static String get(String key){
		if (p == null) {
			init();
		}
		return p.getProperty(key, null);
	}
	
	private static void init(){
		p = new Properties();
		try {
			p.load(PropertiesUtils.class.getClassLoader().getResourceAsStream("properties/config.properties"));
		} catch (IOException e) {
			logger.error(e.getMessage());
		}
	}
}
