/** 
 * Project Name:blog-system-entity 
 * File Name:Tree.java 
 * Package Name:com.itaka.blog.pojo 
 * Date:2018年9月8日下午10:48:46
 */
package com.itaka.blog.pojo;

import java.io.Serializable;

/** 
 * ClassName: Tree <br/> 
 * Function: 树形菜单 <br/> 
 * date: 2018年9月8日 下午10:48:46 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public class Tree implements Serializable{

	private String id;//id
	private String pId;//父id
	private String type;//类型
	private boolean checked;//是否打开
	private String name;//名称
	/** 
	 * id. 
	 * @return  the id
	 */
	public String getId() {
		return id;
	}
	/** 
	 * id. 
	 * @param   id    the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/** 
	 * pId. 
	 * @return  the pId
	 */
	public String getpId() {
		return pId;
	}
	/** 
	 * pId. 
	 * @param   pId    the pId to set
	 */
	public void setpId(String pId) {
		this.pId = pId;
	}
	/** 
	 * type. 
	 * @return  the type
	 */
	public String getType() {
		return type;
	}
	/** 
	 * type. 
	 * @param   type    the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}
	/** 
	 * checked. 
	 * @return  the checked
	 */
	public boolean isChecked() {
		return checked;
	}
	/** 
	 * checked. 
	 * @param   checked    the checked to set
	 */
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	/** 
	 * name. 
	 * @return  the name
	 */
	public String getName() {
		return name;
	}
	/** 
	 * name. 
	 * @param   name    the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
}
