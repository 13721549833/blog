/** 
 * Project Name:blog-system-service 
 * File Name:UserServiceImpl.java 
 * Package Name:com.itaka.blog.service.impl 
 * Date:2018年6月26日下午12:13:13
 */
package com.itaka.blog.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itaka.blog.constant.SystemConstant;
import com.itaka.blog.dto.UserDTO;
import com.itaka.blog.mapper.UserMapper;
import com.itaka.blog.mapper.UserRoleMapper;
import com.itaka.blog.page.PageInfo;
import com.itaka.blog.pojo.User;
import com.itaka.blog.pojo.UserRole;
import com.itaka.blog.service.UserService;
import com.itaka.blog.util.AESCryPTUtil;
import com.itaka.blog.util.DateUtil;
import com.itaka.blog.util.PropertiesUtils;
import com.itaka.blog.util.RandomIDUtil;
import com.itaka.blog.util.Result;
import com.itaka.blog.vo.UserConditionVo;

/** 
 * ClassName: UserServiceImpl <br/> 
 * Function: 用户服务接口实现类 <br/> 
 * date: 2018年6月26日 下午12:13:13 <br/> 
 * 
 * @author Jerry
 * @version  
 */
@Service
public class UserServiceImpl implements UserService {

	private Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	/**
	 * 密码加密密钥
	 */
	private String keyStr = PropertiesUtils.get("passwordStrAES");
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private UserRoleMapper userRoleMapper;
	
	/** 
	 * Function : 
	 * @see com.itaka.blog.service.UserService#getUserByUsername(java.lang.String) 
	 */
	@Override
	public User getUserByUsername(String username) {
		return userMapper.getUserByUsername(username);
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.UserService#modifyPersonal(com.itaka.blog.pojo.User) 
	 */
	@Override
	public int modifyPersonal(User user) {
		return userMapper.updateByPrimaryKeySelective(user);
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.UserService#getUserList(com.itaka.blog.vo.UserConditionVo) 
	 */
	@Override
	public PageInfo<User> getUserList(UserConditionVo conditionVo) {
		List<User> userList = userMapper.getUserList(conditionVo);
		PageInfo<User> page = new PageInfo<>();
		page.setTotal(getTotalUser(conditionVo));
		page.setList(userList);
		return page;
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.UserService#getTotalUser(com.itaka.blog.vo.UserConditionVo) 
	 */
	@Override
	public int getTotalUser(UserConditionVo conditionVo) {
		return userMapper.getTotalUser(conditionVo);
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.UserService#addUser(com.itaka.blog.pojo.User) 
	 */
	@Override
	@Transactional
	public Result addUser(UserDTO user) {
		Result result = new Result();
		User user1 = new User();
		UserRole userRole = new UserRole();
		try {
			logger.info("======UserServiceImpl.addUser()======start======");
			user1.setId(RandomIDUtil.getRandomID());
			user1.setUsername(user.getUsername());
			user1.setPassword(AESCryPTUtil.aesEncrypt(keyStr, SystemConstant.DEFAULT_PWD));
			user1.setNickname(user.getNickname());
			user1.setEmail(user.getEmail());
			user1.setMobile(user.getMobile());
			user1.setQq(user.getQq());
			if(StringUtils.isEmpty(user.getBirthday())){
				user1.setBirthday(DateUtil.getDay());
			}else{
				user1.setBirthday(user.getBirthday());
			}
			user1.setGender(user.getGender());
			user1.setCompany(user.getCompany());
			user1.setAvatar(SystemConstant.DEFAULT_IMG);
			user1.setBlog(user.getBlog());
			user1.setLocation(user.getLocation());
			user1.setStatus(user.getStatus());
			user1.setScore(0);
			user1.setExperience(0);
			user1.setCreateTime(DateUtil.getTime());
			user1.setUpdateTime(DateUtil.getTime());
			user1.setRemark(user.getRemark());
			userMapper.insert(user1);
			logger.info("======插入用户信息成功======");
			userRole.setId(RandomIDUtil.getRandomID());
			userRole.setRoleId(user.getRoleId());
			userRole.setUserId(user1.getId());
			userRole.setCreateTime(DateUtil.getTime());
			userRole.setUpdateTime(DateUtil.getTime());
			userRoleMapper.insert(userRole);
			logger.info("======插入用户角色关联信息成功======");
			result.setCode(1);
			result.setMsg("用户添加成功！");
			logger.info("======UserServiceImpl.addUser()======end======");
		} catch (Exception e) {
			logger.error("======UserServiceImpl.addUser()======error======",e);
		}
		return result;
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.UserService#delUserById(java.lang.String) 
	 */
	@Override
	public Result delUserById(String userId) {
		Result result = new Result();
		try {
			logger.info("======UserServiceImpl.delUserById()======start======");
			// 更新用户状态
			User user = new User();
			user.setId(userId);
			user.setStatus("0");
			user.setUpdateTime(DateUtil.getTime());
			userMapper.updateByPrimaryKeySelective(user);
			// 删除用户与角色之间的关系
			userRoleMapper.deleteByUserId(userId);
			result.setCode(1);
			result.setMsg("用户删除成功！");
			logger.info("======UserServiceImpl.delUserById()======end======");
		} catch (Exception e) {
			logger.error("======UserServiceImpl.delUserById()======error======",e);
		}
		return result;
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.UserService#editUserById(java.lang.String) 
	 */
	@Override
	@Transactional
	public Result editUser(UserDTO user) {
		Result result = new Result();
		User user1 = new User();
		UserRole userRole = new UserRole();
		try {
			logger.info("======UserServiceImpl.editUserById()======start======");
			// 先删除用户与角色的关系
			userRoleMapper.deleteByUserId(user.getUserId());
			logger.info("======删除用户角色关系成功======");
			// 更新用户消息
			user1.setId(user.getUserId());
			user1.setNickname(user.getNickname());
			user1.setEmail(user.getEmail());
			user1.setMobile(user.getMobile());
			user1.setQq(user.getQq());
			user1.setBirthday(user.getBirthday());
			user1.setGender(user.getGender());
			user1.setStatus(user.getStatus());
			user1.setCompany(user.getCompany());
			user1.setBlog(user.getBlog());
			user1.setLocation(user.getLocation());
			user1.setUpdateTime(DateUtil.getTime());
			user1.setRemark(user.getRemark());
			userMapper.updateByPrimaryKeySelective(user1);
			logger.info("======修改用户信息成功======");
			// 插入用户与角色的新关系
			userRole.setId(RandomIDUtil.getRandomID());
			userRole.setRoleId(user.getRoleId());
			userRole.setUserId(user1.getId());
			userRole.setCreateTime(DateUtil.getTime());
			userRole.setUpdateTime(DateUtil.getTime());
			userRoleMapper.insert(userRole);
			logger.info("======插入用户角色关联信息成功======");
			result.setCode(1);
			result.setMsg("用户修改成功！");
			logger.info("======UserServiceImpl.editUserById()======end======");
		} catch (Exception e) {
			logger.error("======UserServiceImpl.editUserById()======error======",e);
		}
		return result;
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.UserService#getUserInfoByUserId(java.lang.String) 
	 */
	@Override
	public User getUserInfoByUserId(String userId) {
		return userMapper.selectByPrimaryKey(userId);
	}

}
