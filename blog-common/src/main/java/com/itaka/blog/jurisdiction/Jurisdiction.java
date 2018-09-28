/** 
 * Project Name:blog-common 
 * File Name:Jurisdiction.java 
 * Package Name:com.itaka.blog.jurisdiction 
 * Date:2018年6月27日下午12:42:05
 */
package com.itaka.blog.jurisdiction;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

/** 
 * ClassName: Jurisdiction <br/> 
 * Function: 权限操作工具类 <br/> 
 * date: 2018年6月27日 下午12:42:05 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public class Jurisdiction {

	/**
	 * 
	 * getSession: 获取session <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	public static Session getSession(){
		return getSubject().getSession();
	}
	
	/**
	 * 
	 * getSubject: 获取subject <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	public static Subject getSubject(){
		return SecurityUtils.getSubject();
	}
}
