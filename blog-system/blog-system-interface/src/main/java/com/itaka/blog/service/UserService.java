/** 
 * Project Name:blog-system-interface 
 * File Name:UserService.java 
 * Package Name:com.itaka.blog.service 
 * Date:2018年6月26日下午12:11:08
 */
package com.itaka.blog.service;

import com.itaka.blog.dto.UserDTO;
import com.itaka.blog.page.PageInfo;
import com.itaka.blog.pojo.User;
import com.itaka.blog.util.Result;
import com.itaka.blog.vo.UserConditionVo;

/** 
 * ClassName: UserService <br/> 
 * Function: 用户服务接口 <br/> 
 * date: 2018年6月26日 下午12:11:08 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public interface UserService {

	/**
	 * 
	 * getUserByUsername: 根据用户名获取用户信息 <br/>
	 *
	 * @author Jerry
	 * @param username 用户名
	 * @return
	 */
	User getUserByUsername(String username);

	/** 
	 * modifyPersonal: 修改个人资料 <br/>
	 *
	 * @author Jerry
	 * @param user 用户信息
	 * @return
	 */ 
	int modifyPersonal(User user);
	
	/**
	 * 
	 * getTotalUser: 获取用户总数 <br/>
	 *
	 * @author Jerry
	 * @param conditionVo 查询对象
	 * @return
	 */
	int getTotalUser(UserConditionVo conditionVo);
	
	/**
	 * 
	 * getUserList: 获取用户列表 <br/>
	 *
	 * @author Jerry
	 * @param conditionVo 查询对象
	 * @return
	 */
	PageInfo<User> getUserList(UserConditionVo conditionVo);
	
	/**
	 * 
	 * addUser: 新增用户 <br/>
	 *
	 * @author Jerry
	 * @param user 用户对象
	 */
	Result addUser(UserDTO user);

	/** 
	 * delUserById: 删除用户 <br/>
	 *
	 * @author Jerry
	 * @param userId 用户id
	 * @return 
	 */ 
	Result delUserById(String userId);

	/** 
	 * editUserById: 修改用户 <br/>
	 *
	 * @author Jerry
	 * @param user 用户对象
	 * @return 
	 */ 
	Result editUser(UserDTO user);

	/** 
	 * getUserInfoByUserId: 根据用户id获取用户信息 <br/>
	 *
	 * @author Jerry
	 * @param userId 用户id
	 * @return 
	 */ 
	User getUserInfoByUserId(String userId);
}
