package com.itaka.blog.mapper;

import com.itaka.blog.pojo.RoleMenu;

public interface RoleMenuMapper {
    int deleteByPrimaryKey(String id);

    int insert(RoleMenu record);

    int insertSelective(RoleMenu record);

    RoleMenu selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(RoleMenu record);

    int updateByPrimaryKey(RoleMenu record);

	/** 
	 * deleteByRoleId: 根据角色id删除角色菜单信息 <br/>
	 *
	 * @author Jerry
	 * @param roleId 角色id
	 */ 
	void deleteByRoleId(String roleId);

	/** 
	 * deleteByMenuId: 根据菜单id删除角色菜单信息 <br/>
	 *
	 * @author Jerry
	 * @param menuId 菜单id
	 */ 
	void deleteByMenuId(String menuId);
}