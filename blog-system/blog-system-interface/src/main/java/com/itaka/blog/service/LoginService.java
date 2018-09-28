package com.itaka.blog.service;

import com.itaka.blog.pojo.User;

/**
 * 
 * ClassName: LoginService <br/> 
 * Function: 注册、登录服务接口 <br/> 
 * date: 2018年6月20日 下午8:27:06 <br/> 
 * 
 * @author Jerry
 * @version
 */
public interface LoginService {

	/**
	 * 
	 * register: 注册 <br/>
	 *
	 * @author Jerry
	 * @param username 用户名
	 * @param regIp 注册地IP
	 * @param password 密码
	 */
	void register(String username,String regIp,String password);
	
	/**
	 * 
	 * checkUsername: 检查用户名是否存在 <br/>
	 *
	 * @author Jerry
	 * @param username 用户名
	 * @return
	 */
	boolean checkUsername(String username);
	
	/**
	 * 
	 * login: 登录 <br/>
	 *
	 * @author Jerry
	 * @param username 用户名
	 * @param password 密码
	 * @param ip ip地址
	 * @return
	 */
	User login(String username,String password,String ip);
	
	/**
	 * 
	 * updateUser: 根据用户id修改用户信息 <br/>
	 *
	 * @author Jerry
	 * @param user 用户id
	 * @param oldPwd 旧密码
	 * @param newPwd 新密码
	 * @return
	 */
	int updateUser(String userId,String oldPwd, String newPwd);
	
}
