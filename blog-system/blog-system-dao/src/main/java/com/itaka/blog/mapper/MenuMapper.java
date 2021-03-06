package com.itaka.blog.mapper;

import java.util.List;

import com.itaka.blog.pojo.Menu;
import com.itaka.blog.pojo.SysMenu;
import com.itaka.blog.vo.MenuConditionVo;

public interface MenuMapper {
    int deleteByPrimaryKey(String id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);
    
    /**
     * 
     * getAllFirstMenuList: 获取一级菜单 <br/>
     *
     * @author Jerry
     * @return
     */
    List<SysMenu> getAllFirstMenuList();
    
    /** 
	 * getAllSecondMenuList: 获取二级级菜单 <br/>
	 *
	 * @author Jerry
	 * @return 
	 */ 
	List<SysMenu> getAllSecondMenuList();
    
    /**
     * 
     * getAllSubMenuListByParentId: 根据父id查询上一级菜单 <br/>
     *
     * @author Jerry
     * @param parentId 父级id
     * @return
     */
    List<SysMenu> getAllSubMenuListByParentId(String parentId);
    
    /**
	 * 
	 * listMenuByUserId: 根据用户id查询菜单 <br/>
	 *
	 * @author Jerry
	 * @param userId 用户id
	 * @return
	 */
	List<SysMenu> getMenuListByUserId(String userId);
	
	/** 
	 * getMenuListByRoleId: 根据角色id查询菜单权限 <br/>
	 *
	 * @author Jerry
	 * @param roleId 角色id
	 * @return 
	 */ 
	List<SysMenu> getMenuListByRoleId(String roleId);
	
	/**
	 * 
	 * queryMenuByRoleId: 根据角色id获取菜单权限 <br/>
	 *
	 * @author Jerry
	 * @param roleId 角色id
	 * @return
	 */
	List<SysMenu> queryMenuByRoleId(String roleId);
	
	/**
	 * 
	 * getTotalMenu: 获取菜单总记录数 <br/>
	 *
	 * @author Jerry
	 * @param conditionVo 查询对象
	 * @return
	 */
	int getTotalMenu(MenuConditionVo conditionVo);
	
	/**
	 * 
	 * getMenuList: 获取所有菜单 <br/>
	 *
	 * @author Jerry
	 * @param conditionVo 查询对象
	 * @return
	 */
	List<SysMenu> getMenuList(MenuConditionVo conditionVo);

	/**
	 * 
	 * listUrlAndPermission: 获取权限及权限地址列表 <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	List<SysMenu> listUrlAndPermission();
	
	/**
	 * 
	 * getMenuMaxSort: 获取该节点下的菜单排序 <br/>
	 *
	 * @author Jerry
	 * @param parentId 父id
	 * @return
	 */
	int getMenuMaxSort(String parentId);

}