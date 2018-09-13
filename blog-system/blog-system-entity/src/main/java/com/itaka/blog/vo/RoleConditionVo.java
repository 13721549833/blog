/** 
 * Project Name:blog-system-entity 
 * File Name:BaseConditionVo.java 
 * Package Name:com.itaka.blog.vo.base 
 * Date:2018年6月26日下午2:53:01
 */
package com.itaka.blog.vo;

import com.itaka.blog.page.PageInfo;

/** 
 * ClassName: RoleConditionVo <br/> 
 * Function:  <br/> 
 * date: 2018年6月26日 下午2:53:01 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public class RoleConditionVo extends PageInfo{

	private String name;

	private String status;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
