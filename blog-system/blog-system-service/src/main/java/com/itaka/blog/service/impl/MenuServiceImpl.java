/** 
 * Project Name:blog-system-service 
 * File Name:MenuServiceImpl.java 
 * Package Name:com.itaka.blog.service.impl 
 * Date:2018年6月26日下午5:37:41
 */
package com.itaka.blog.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.itaka.blog.constant.JurisdictionConstant;
import com.itaka.blog.dto.MenuDTO;
import com.itaka.blog.mapper.MenuMapper;
import com.itaka.blog.mapper.RoleMenuMapper;
import com.itaka.blog.page.PageInfo;
import com.itaka.blog.pojo.Menu;
import com.itaka.blog.pojo.SysMenu;
import com.itaka.blog.service.MenuService;
import com.itaka.blog.service.redis.JedisClient;
import com.itaka.blog.util.DateUtil;
import com.itaka.blog.util.RandomIDUtil;
import com.itaka.blog.util.Result;
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

	private Logger logger = LoggerFactory.getLogger(MenuServiceImpl.class);
	
	@Autowired
	private MenuMapper menuMapper;
	
	@Autowired
	private RoleMenuMapper roleMenuMapper;
	
	@Autowired
	private JedisClient jedisClient;
	
	/** 
	 * Function : 
	 * @see com.itaka.blog.service.MenuService#getMenuListByUserId(long) 
	 */
	@Override
	public List<SysMenu> getMenuListByUserId(String userId) {
		return menuMapper.getMenuListByUserId(userId);
	}
	
	/** 
	 * Function : 
	 * @see com.itaka.blog.service.MenuService#getMenuListByRoleId(java.lang.String) 
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<SysMenu> getMenuListByRoleId(String roleId) {
		List<SysMenu> menuList = new ArrayList<>();
		try {
			logger.info("======MenuServiceImpl.getMenuListByRoleId()======start======");
			menuList = (List<SysMenu>) jedisClient.getList(JurisdictionConstant.REDIS_USER_MENU_LIST + roleId);
			if (CollectionUtils.isEmpty(menuList)) {
				menuList = menuMapper.getMenuListByRoleId(roleId);
				jedisClient.setList(JurisdictionConstant.REDIS_USER_MENU_LIST + roleId, menuList, 24*3600);
			}
			logger.info("======MenuServiceImpl.getMenuListByRoleId()======end======");
		} catch (Exception e) {
			logger.error("======MenuServiceImpl.getMenuListByRoleId()======error======",e);
		}
		return menuList;
	}
	
	/** 
	 * Function : 
	 * @see com.itaka.blog.service.MenuService#getSubMenuListByParentId(java.lang.Long) 
	 */
	@Override
	public List<SysMenu> getSubMenuListByParentId(String parentId) {
		return menuMapper.getAllSubMenuListByParentId(parentId);
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
		return menuMapper.getAllFirstMenuList();
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.MenuService#getAllSecondMenuList() 
	 */
	@Override
	public List<SysMenu> getAllSecondMenuList() {
		return menuMapper.getAllSecondMenuList();
	}
	
	/** 
	 * Function : 
	 * @see com.itaka.blog.service.MenuService#getTotalMenu() 
	 */
	@Override
	public int getTotalMenu(MenuConditionVo conditionVo){
		return menuMapper.getTotalMenu(conditionVo);
	}
	
	/** 
	 * Function : 
	 * @see com.itaka.blog.service.MenuService#getMenuList() 
	 */
	@Override
	public PageInfo<SysMenu> getMenuList(MenuConditionVo conditionVo) {
		List<SysMenu> menuList = menuMapper.getMenuList(conditionVo);
		PageInfo<SysMenu> page = new PageInfo<>();
		page.setTotal(getTotalMenu(conditionVo));
		page.setList(menuList);
		return page;
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.MenuService#listUrlAndPermission() 
	 */
	@Override
	public List<SysMenu> listUrlAndPermission() {
		return menuMapper.listUrlAndPermission();
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.MenuService#saveMenu(com.itaka.blog.pojo.Menu) 
	 */
	@Override
	@Transactional
	public Result saveMenu(MenuDTO menu) {
		Result result = new Result();
		Menu record = new Menu();
		try {
			logger.info("======MenuServiceImpl.saveMenu()======start======");
			int sort = menuMapper.getMenuMaxSort(menu.getParentId());
			record.setId(RandomIDUtil.getRandomID());
			record.setName(menu.getName());
			record.setType(menu.getType());
			record.setParentId(menu.getParentId());
			record.setUrl(menu.getUrl());
			record.setPermission(menu.getPermission());
			record.setSort(sort+1);
			record.setStatus(menu.getStatus());
			record.setExternal(Integer.parseInt(menu.getExternal()));
			record.setIcon(menu.getIcon());
			record.setCreateTime(DateUtil.getTime());
			record.setUpdateTime(DateUtil.getTime());
			menuMapper.insertSelective(record);
			result.setCode(1);
			result.setMsg("菜单添加成功！");
			logger.info("======菜单信息插入成功======");
			logger.info("======MenuServiceImpl.saveMenu()======end======");
		} catch (Exception e) {
			result.setCode(-1);
			result.setMsg("网络异常，请稍后重试！");
			logger.error("接口请求异常",e);
			logger.error("======MenuServiceImpl.saveMenu()======error======",e);
		}
		return result;
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.MenuService#deleteMenu(java.lang.String) 
	 */
	@Override
	@Transactional
	public Result deleteMenu(String menuIds) {
		Result result = new Result();
		boolean flag = true;// 用于校验是否能进行删除操作
		try {
			logger.info("======MenuServiceImpl.deleteMenu()======start======");
			String[] batchMenuIds = menuIds.split(",");
			if (null != batchMenuIds && batchMenuIds.length>0) {
				flag = deleteStatus(batchMenuIds);
				if (!flag) {
					result.setCode(0);
					result.setMsg("被选中菜单下还有子菜单，不能进行删除操作");
				}else{
					for (String menuId : batchMenuIds) {
						menuMapper.deleteByPrimaryKey(menuId);
						roleMenuMapper.deleteByMenuId(menuId);
					}
					result.setCode(1);
					result.setMsg("菜单删除成功！");
				}
			}
			logger.info("======MenuServiceImpl.deleteMenu()======end======");
		} catch (Exception e) {
			result.setCode(-1);
			result.setMsg("网络异常，请稍后重试！");
			logger.error("接口请求异常",e);
			logger.error("======MenuServiceImpl.deleteMenu()======error======",e);
		}
		return result;
	}

	/**
	 * 
	 * deleteStatus: 校验是否符合删除操作 <br/>
	 *
	 * @author Jerry
	 * @param menuIds 菜单id集
	 * @return
	 */
	private boolean deleteStatus(String[] menuIds){
		boolean flag = true;
		List<SysMenu> allSubMenuList = new ArrayList<>();
		// 循环查询该菜单下是否有子菜单
		for (String menuId : menuIds) {
			List<SysMenu> subMenuList = menuMapper.getAllSubMenuListByParentId(menuId);
			allSubMenuList.addAll(subMenuList);
		}
		// 如果有子菜单，不能删除
		if (allSubMenuList.size()>0) {
			flag = false;
		}else{
			flag = true;
		}
		return flag;
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.MenuService#getMenuById(java.lang.String) 
	 */
	@Override
	public Menu getMenuById(String menuId) {
		return menuMapper.selectByPrimaryKey(menuId);
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.MenuService#editMenu(com.itaka.blog.dto.MenuDTO) 
	 */
	@Override
	public Result editMenu(MenuDTO menu) {
		Result result = new Result();
		Menu record = new Menu();
		try {
			logger.info("======MenuServiceImpl.editMenu()======start======");
			int sort = menuMapper.getMenuMaxSort(menu.getParentId());
			record.setId(menu.getMenuId());
			record.setName(menu.getName());
			record.setType(menu.getType());
			record.setParentId(menu.getParentId());
			record.setUrl(menu.getUrl());
			record.setPermission(menu.getPermission());
			record.setSort(sort+1);
			record.setStatus(menu.getStatus());
			record.setExternal(Integer.parseInt(menu.getExternal()));
			record.setIcon(menu.getIcon());
			record.setUpdateTime(DateUtil.getTime());
			menuMapper.updateByPrimaryKeySelective(record);
			result.setCode(1);
			result.setMsg("菜单修改成功！");
			logger.info("======菜单信息更新成功======");
			logger.info("======MenuServiceImpl.editMenu()======end======");
		} catch (Exception e) {
			result.setCode(-1);
			result.setMsg("网络异常，请稍后重试！");
			logger.error("接口请求异常",e);
			logger.error("======MenuServiceImpl.editMenu()======error======",e);
		}
		return result;
	}
	
}
