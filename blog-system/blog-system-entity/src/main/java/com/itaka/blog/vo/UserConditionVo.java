/** 
 * Project Name:blog-system-entity 
 * File Name:UserConditionVo.java 
 * Package Name:com.itaka.blog.vo 
 * Date:2018年8月1日下午2:05:06
 */
package com.itaka.blog.vo;

import com.itaka.blog.page.PageInfo;

/** 
 * ClassName: UserConditionVo <br/> 
 * Function:  <br/> 
 * date: 2018年8月1日 下午2:05:06 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public class UserConditionVo extends PageInfo{

	private String username;
	private String mobile;
	private String status;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
