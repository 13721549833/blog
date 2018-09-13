/** 
 * Project Name:blog-system-entity 
 * File Name:SysMenu.java 
 * Package Name:com.itaka.blog.pojo 
 * Date:2018年6月26日下午3:20:24
 */
package com.itaka.blog.pojo;

import java.io.Serializable;
import java.util.List;

/** 
 * ClassName: SysMenu <br/> 
 * Function:  <br/> 
 * date: 2018年6月26日 下午3:20:24 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public class SysMenu implements Serializable{

	private String id;
	private String name;
    private String type;
    private String url;
    private String permission;
    private String parentId;
    private Integer sort;
    private Boolean external;
    private String status;
    private String icon;
    private List<SysMenu> subMenu;
    private boolean checked;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public Boolean getExternal() {
		return external;
	}
	public void setExternal(Boolean external) {
		this.external = external;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public List<SysMenu> getSubMenu() {
		return subMenu;
	}
	public void setSubMenu(List<SysMenu> subMenu) {
		this.subMenu = subMenu;
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
    
}
