/** 
 * Project Name:blog-system-service 
 * File Name:MenuServiceImpl.java 
 * Package Name:com.itaka.blog.service.impl 
 * Date:2018年6月26日下午5:37:41
 */
package com.itaka.blog.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itaka.blog.constant.JurisdictionConstant;
import com.itaka.blog.mapper.MenuMapper;
import com.itaka.blog.page.PageInfo;
import com.itaka.blog.pojo.SysMenu;
import com.itaka.blog.service.MenuService;
import com.itaka.blog.service.redis.JedisClient;
import com.itaka.blog.vo.MenuConditionVo;

import net.sf.json.JSONArray;

/** 
 * ClassName: MenuServiceImpl <br/> 
 * Function: 菜单服务接口实现类 <br/> 
 * date: 2018年6月26日 下午5:37:41 <br/> 
 * 
 * @author Jerry
 * @version  
 */
@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuMapper menuMpper;
	
	@Autowired
	private JedisClient jedisClient;
	
	/** 
	 * Function : 
	 * @see com.itaka.blog.service.MenuService#getMenuListByUserId(long) 
	 */
	@Override
	public List<SysMenu> getMenuListByUserId(String userId) {
		return menuMpper.getMenuListByUserId(userId);
	}
	
	/** 
	 * Function : 
	 * @see com.itaka.blog.service.MenuService#getMenuListByRoleId(java.lang.String) 
	 */
	@Override
	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<SysMenu> getMenuListByRoleId(String roleId) {
		String MenuJson = jedisClient.get(JurisdictionConstant.REDIS_USER_MENU_LIST + roleId);
		List<SysMenu> menuList = new ArrayList<>();
		if (StringUtils.isEmpty(MenuJson)) {
			menuList = menuMpper.getMenuListByRoleId(roleId);
			jedisClient.set(JurisdictionConstant.REDIS_USER_MENU_LIST + roleId,JSONArray.fromObject(menuList).toString(),24*3600);
		}else{
			JSONArray json = JSONArray.fromObject(MenuJson);
			menuList = JSONArray.toList(json, SysMenu.class);
		}
		return menuList;
	}
	
	/** 
	 * Function : 
	 * @see com.itaka.blog.service.MenuService#getSubMenuListByParentId(java.lang.Long) 
	 */
	@Override
	public List<SysMenu> getSubMenuListByParentId(String parentId) {
		return menuMpper.getAllSubMenuListByParentId(parentId);
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.MenuService#getAllMenuList(java.lang.Long) 
	 */
	@Override
	public List<SysMenu> getAllMenuList(String parentId) {
		List<SysMenu> menuLt = this.getSubMenuListByParentId(parentId);
		if (menuLt.size() > 0) {
			for(SysMenu menu : menuLt){
				menu.setSubMenu(this.getAllMenuList(menu.getId()));
			}
		}
		return menuLt;
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.MenuService#getFirstMenuList() 
	 */
	@Override
	public List<SysMenu> getFirstMenuList() {
		return menuMpper.getAllFirstMenuList();
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.MenuService#getTotalMenu() 
	 */
	@Override
	public int getTotalMenu(MenuConditionVo conditionVo){
		return menuMpper.getTotalMenu(conditionVo);
	}
	
	/** 
	 * Function : 
	 * @see com.itaka.blog.service.MenuService#getMenuList() 
	 */
	@Override
	public PageInfo<SysMenu> getMenuList(MenuConditionVo conditionVo) {
		List<SysMenu> menuList = menuMpper.getMenuList(conditionVo);
		PageInfo<SysMenu> page = new PageInfo<>();
		page.setTotal(getTotalMenu(conditionVo));
		page.setList(menuList);
		return page;
	}

}
