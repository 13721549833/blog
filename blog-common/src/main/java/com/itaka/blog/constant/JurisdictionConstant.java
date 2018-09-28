/** 
 * Project Name:blog-common 
 * File Name:JurisdictionConstant.java 
 * Package Name:com.itaka.blog.constant 
 * Date:2018年6月26日下午6:05:19
 */
package com.itaka.blog.constant;

/** 
 * ClassName: JurisdictionConstant <br/> 
 * Function:  <br/> 
 * date: 2018年6月26日 下午6:05:19 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public class JurisdictionConstant {

	/** 
	 * SESSION_USERNAME:当前会话用户的用户名
	 */ 
	public static final String SESSION_USERNAME = "username";
	
	/** 
	 * SESSION_USERROLE:用户角色key
	 */ 
	public static final String SESSION_USERROLE = "user_role";
	
	/** 
	 * SESSION_SECURITY_CODE:验证码
	 */ 
	public static final String SESSION_SECURITY_CODE = "checkCode";
	
	/** 
	 * SESSION_USER:session用户key
	 */ 
	public static final String SESSION_USER = "sessionUser";
	
	/** 
	 * SESSION_ALLMENULIST:所有的菜单列表
	 */ 
	public static final String SESSION_ALLMENULIST = "allmenuList";
	
	/** 
	 * SESSION_MENULIST:当前菜单
	 */ 
	public static final String SESSION_MENULIST = "menuList";
	
	/**
	 * REDIS_ROLE_MENU_KEY:角色菜单redis键
	 */
	public static final String REDIS_ROLE_MENU_KEY = "roleMenuKey";
	
	/**
	 * REDIS_SAVE_ROLE_MENU_KEY：保存角色菜单redis键
	 */
	public static final String REDIS_SAVE_ROLE_MENU_KEY = "saveRoleMenuKey";
	
	/**
	 * REDIS_USER_MENU_LIST:用户菜单权限redis键
	 */
	public static final String REDIS_USER_MENU_LIST = "userMenuList";
	
}
