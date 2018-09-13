/** 
 * Project Name:blog-system-service 
 * File Name:Test.java 
 * Package Name:com.itaka.blog.service.impl 
 * Date:2018年9月1日下午3:31:28
 */
package com.itaka.blog.service.impl;

import com.itaka.blog.util.RandomIDUtil;

/** 
 * ClassName: Test <br/> 
 * Function:  <br/> 
 * date: 2018年9月1日 下午3:31:28 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public class Test {
	public static void main(String[] args) {
		for (int i = 0; i < 5; i++) {
			System.out.println(RandomIDUtil.getRandomID());
		}
	}
}
