/** 
 * Project Name:blog-system-entity 
 * File Name:BaseEntity.java 
 * Package Name:com.itaka.blog 
 * Date:2018年6月27日下午1:06:51
 */
package com.itaka.blog.base;

import java.io.Serializable;

/** 
 * ClassName: BaseEntity <br/> 
 * Function: 实体基类 <br/> 
 * date: 2018年6月27日 下午1:06:51 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public class BaseEntity implements Serializable{

	/** 
	 * serialVersionUID:
	 */ 
	private static final long serialVersionUID = 1L;
	
	private String id;
	
	private String createTime;
	
	private String updateTime;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
}
