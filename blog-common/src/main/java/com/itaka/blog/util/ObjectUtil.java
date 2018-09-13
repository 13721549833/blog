/** 
 * Project Name:blog-common 
 * File Name:ObjectUtil.java 
 * Package Name:com.itaka.blog.util 
 * Date:2018年6月27日上午11:14:51
 */
package com.itaka.blog.util;

/** 
 * ClassName: ObjectUtil <br/> 
 * Function: 对象工具类 <br/> 
 * date: 2018年6月27日 上午11:14:51 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public class ObjectUtil {

	/**
	 * 
	 * isEmpty: 判断对象是否为空("null",null ,长度为0) <br/>
	 *
	 * @author Jerry
	 * @param o
	 * @return
	 */
	public static boolean isEmpty(Object o) {
		return null == o || o.toString().trim().length() == 0
				|| "null".equalsIgnoreCase(o.toString());
	}
	
	/**
	 * 
	 * noEmpty: 判断对象不为空("null",null ,长度为0) <br/>
	 *
	 * @author Jerry
	 * @param o
	 * @return
	 */
	public static boolean noEmpty(Object o) {
		return !(null == o || o.toString().trim().length() == 0 || "null"
				.equalsIgnoreCase(o.toString()));
	}
	
}
