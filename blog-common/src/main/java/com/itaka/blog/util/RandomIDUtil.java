package com.itaka.blog.util;

import java.util.UUID;

/**
 * 
 * ClassName: RandomIDUtil <br/> 
 * Function: 生成UUID工具 <br/> 
 * date: 2018年6月25日 上午11:01:02 <br/> 
 * 
 * @author Jerry
 * @version
 */
public class RandomIDUtil {

	/**
	 * 
	 * getRandomID: 随机生成32位id <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	public static String getRandomID(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	public static void main(String[] args) {
		System.out.println(getRandomID());
	}
}
