/** 
 * Project Name:blog-system-interface 
 * File Name:MenuService.java 
 * Package Name:com.itaka.blog.service 
 * Date:2018年6月26日下午3:10:41
 */
package com.itaka.blog.service;

import java.util.List;

import com.itaka.blog.dto.MenuDTO;
import com.itaka.blog.page.PageInfo;
import com.itaka.blog.pojo.Menu;
import com.itaka.blog.pojo.SysMenu;
import com.itaka.blog.util.Result;
import com.itaka.blog.vo.MenuConditionVo;

/** 
 * ClassName: MenuService <br/> 
 * Function: 菜单服务接口 <br/> 
 * date: 2018年6月26日 下午3:10:41 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public interface MenuService {

	/**
	 * 
	 * getMenuListByUserId: 根据用户id查询菜单信息 <br/>
	 *
	 * @author Jerry
	 * @param userId 用户id
	 * @return
	 */
	List<SysMenu> getMenuListByUserId(String userId);
	
	/**
	 * 
	 * getMenuListByRoleId: 根据角色id查询菜单信息 <br/>
	 *
	 * @author Jerry
	 * @param roleId 角色id
	 * @return
	 */
	List<SysMenu> getMenuListByRoleId(String roleId);
	
	/**
	 * 
	 * getSubMenuListByParentId: 获取当前菜单的子菜单列表 <br/>
	 *
	 * @author Jerry
	 * @param parentId
	 * @return
	 */
	List<SysMenu> getSubMenuListByParentId(String parentId);

	/**
	 * 
	 * getAllSecondMenuList: 获取二级菜单列表 <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	List<SysMenu> getAllSecondMenuList();
	
	/**
	 * 
	 * getFirstMenuList: 获取所有菜单 <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	List<SysMenu> getAllMenuList(String parentId);
	
	/**
	 * 
	 * getFirstMenuList: 获取一级菜单 <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	List<SysMenu> getFirstMenuList();
	
	/**
	 * 
	 * getTotalMenu: 获取菜单总记录数 <br/>
	 *
	 * @author Jerry
	 * @param conditionVo
	 * @return
	 */
	int getTotalMenu(MenuConditionVo conditionVo);
	
	/**
	 * 
	 * getMenuList: 获取所有菜单 <br/>
	 *
	 * @author Jerry
	 * @param conditionVo查询对象
	 * @return
	 */
	PageInfo<SysMenu> getMenuList(MenuConditionVo conditionVo);
	
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
	 * saveMenu: 保存菜单 <br/>
	 *
	 * @author Jerry
	 * @param menu 菜单对象
	 * @return
	 */
	Result saveMenu(MenuDTO menu);

	/** 
	 * deleteMenu: 删除菜单 <br/>
	 *
	 * @author Jerry
	 * @param menuId 菜单id
	 */ 
	Result deleteMenu(String menuIds);

	/** 
	 * getMenuById: 根据id查询菜单信息 <br/>
	 *
	 * @author Jerry
	 * @param menuId 菜单id
	 * @return 
	 */ 
	Menu getMenuById(String menuId);

	/** 
	 * editMenu: 修改菜单 <br/>
	 *
	 * @author Jerry
	 * @param menu 菜单对象
	 * @return 
	 */ 
	Result editMenu(MenuDTO menu);
}
