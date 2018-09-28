/** 
 * Project Name:blog-system-interface 
 * File Name:RoleService.java 
 * Package Name:com.itaka.blog.service 
 * Date:2018年6月26日下午2:01:30
 */
package com.itaka.blog.service;

import java.util.List;

import com.itaka.blog.dto.RoleDTO;
import com.itaka.blog.page.PageInfo;
import com.itaka.blog.pojo.Role;
import com.itaka.blog.pojo.Tree;
import com.itaka.blog.util.Result;
import com.itaka.blog.vo.RoleConditionVo;

/** 
 * ClassName: RoleService <br/> 
 * Function: 角色服务接口 <br/> 
 * date: 2018年6月26日 下午2:01:30 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public interface RoleService {

	/**
	 * 
	 * getRoleListByUserId: 根据用户id获取角色信息 <br/>
	 *
	 * @author Jerry
	 * @param userId 用户id
	 * @return
	 */
	List<Role> getRoleListByUserId(String userId);
	
	/**
	 * 
	 * queryMenuByRoleId: 根据角色id获取菜单权限  <br/>
	 *
	 * @author Jerry
	 * @param roleId 角色id
	 * @return
	 */
	List<Tree> queryMenuByRoleId(String roleId); 
	
	/**
	 * 
	 * getTotalRole: 获取角色总数 <br/>
	 *
	 * @author Jerry
	 * @param conditionVo
	 * @return
	 */
	int getTotalRole(RoleConditionVo conditionVo);
	
	/**
	 * 
	 * getRoleList: 获取所有角色列表 <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	PageInfo<Role> getRoleList(RoleConditionVo conditionVo);
	
	/**
	 * 
	 * getAllRoleList: 获取所有可用角色 <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	List<Role> getAllRoleList();

	/** 
	 * saveRole: 保存角色信息 <br/>
	 *
	 * @author Jerry
	 * @param role 角色信息
	 */ 
	Result saveRole(RoleDTO role);

	/** 
	 * getRoleById: 根据id获取角色信息 <br/>
	 *
	 * @author Jerry
	 * @param roleId 角色id
	 * @return 
	 */ 
	Role getRoleById(String roleId);

	/** 
	 * editRole: 修改角色 <br/>
	 *
	 * @author Jerry
	 * @param role 角色信息
	 * @return 
	 */ 
	Result editRole(RoleDTO role);

	/** 
	 * delRole: 删除角色 <br/>
	 *
	 * @author Jerry
	 * @param roleId 角色id
	 * @return 
	 */ 
	Result delRole(String roleId);

	/** 
	 * saveRoleMenu: 保存角色菜单信息 <br/>
	 *
	 * @author Jerry
	 * @param treeJson treeJson
	 * @param roleId 角色id
	 * @return 
	 */ 
	Result saveRoleMenu(String treeJson, String roleId);
}
