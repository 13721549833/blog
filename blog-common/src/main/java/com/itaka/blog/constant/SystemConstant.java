/** 
 * Project Name:blog-common 
 * File Name:SystemConstant.java 
 * Package Name:com.itaka.blog.constant 
 * Date:2018年8月31日上午11:31:04
 */
package com.itaka.blog.constant;

import com.itaka.blog.util.PropertiesUtils;

/** 
 * ClassName: SystemConstant <br/> 
 * Function: 系统常量 <br/> 
 * date: 2018年8月31日 上午11:31:04 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public class SystemConstant {

	/** 默认头像  */
	public static final String DEFAULT_IMG = PropertiesUtils.get("defaultImg");
	/** 默认密码  */
	public static final String DEFAULT_PWD = "123456";
	/** 超级管理员 */
	public static final String ROLE_ADMIN = "19c3fd54ef6d442a9312108316190491";
}
