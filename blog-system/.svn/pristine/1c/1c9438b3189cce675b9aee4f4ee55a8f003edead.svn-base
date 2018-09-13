/** 
 * Project Name:blog-system-service 
 * File Name:MenuServiceImpl.java 
 * Package Name:com.itaka.blog.service.impl 
 * Date:2018年6月26日下午5:37:41
 */
package com.itaka.blog.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itaka.blog.constant.JurisdictionConstant;
import com.itaka.blog.mapper.MenuMapper;
import com.itaka.blog.page.PageInfo;
import com.itaka.blog.pojo.SysMenu;
import com.itaka.blog.service.MenuService;
import com.itaka.blog.vo.MenuConditionVo;

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
	public List<SysMenu> getMenuListByRoleId(String roleId) {
		return menuMpper.getMenuListByRoleId(roleId);
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

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.MenuService#getCacheMenuList(org.apache.shiro.session.Session, java.lang.String, java.lang.String) 
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<SysMenu> getCacheMenuList(Session session, String userName) {
		// allmenuLt平台的所有菜单组成的列表，userRoleMenuLt：当前用户角色权限所拥有的菜单列表
		List<SysMenu> allmenuLt = new ArrayList<SysMenu>();
		List<SysMenu> userRoleMenuLt = new ArrayList<SysMenu>();
		// 已缓存在session中的用户权限所对应的菜单列表
		List<SysMenu> cachedMenuLt = (List<SysMenu>)session.getAttribute(userName + JurisdictionConstant.SESSION_ALLMENULIST);
		// 用户角色权限所对应的菜单列表已缓存至session中
		if(null == cachedMenuLt){
			// 获取所有菜单
			allmenuLt = getAllMenuList("0");
			/*if(StringUtils.isNotEmpty(jurisdiction)){
				// 根据角色权限获取本角色拥有的菜单列表
				userRoleMenuLt = getAllMenuList(allmenuLt, jurisdiction);				
			}*/
			// 菜单权限放入session中
			session.setAttribute(userName + JurisdictionConstant.SESSION_ALLMENULIST, allmenuLt);
			session.setAttribute(userName + JurisdictionConstant.SESSION_MENULIST, userRoleMenuLt);
		}else{
			// 用户角色权限所对应的菜单列表未缓存至session中
			userRoleMenuLt = cachedMenuLt;
		}
		return userRoleMenuLt;
	}

}
