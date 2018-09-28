/** 
 * Project Name:blog-system-service 
 * File Name:RoleServiceImpl.java 
 * Package Name:com.itaka.blog.service.impl 
 * Date:2018年6月27日上午8:45:38
 */
package com.itaka.blog.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import com.itaka.blog.constant.JurisdictionConstant;
import com.itaka.blog.dto.RoleDTO;
import com.itaka.blog.mapper.MenuMapper;
import com.itaka.blog.mapper.RoleMapper;
import com.itaka.blog.mapper.RoleMenuMapper;
import com.itaka.blog.page.PageInfo;
import com.itaka.blog.pojo.Role;
import com.itaka.blog.pojo.RoleMenu;
import com.itaka.blog.pojo.SysMenu;
import com.itaka.blog.pojo.Tree;
import com.itaka.blog.service.RoleService;
import com.itaka.blog.service.redis.JedisClient;
import com.itaka.blog.util.DateUtil;
import com.itaka.blog.util.RandomIDUtil;
import com.itaka.blog.util.Result;
import com.itaka.blog.vo.RoleConditionVo;

import net.sf.json.JSONArray;

/** 
 * ClassName: RoleServiceImpl <br/> 
 * Function: 角色服务接口实现类 <br/> 
 * date: 2018年6月27日 上午8:45:38 <br/> 
 * 
 * @author Jerry
 * @version  
 */
@Service
public class RoleServiceImpl implements RoleService {

	private Logger logger = LoggerFactory.getLogger(RoleServiceImpl.class);
	
	@Autowired
	private RoleMapper roleMapper;
	
	@Autowired
	private MenuMapper menuMapper;
	
	@Autowired
	private RoleMenuMapper roleMenuMapper;
	
	@Autowired
	private JedisClient jedisClient;
	
	/** 
	 * Function : 
	 * @see com.itaka.blog.service.RoleService#getRoleListByUserId(java.lang.Long) 
	 */
	@Override
	public List<Role> getRoleListByUserId(String userId) {
		return roleMapper.getRoleListByUserId(userId);
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.RoleService#queryMenuByRoleId(java.lang.String) 
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Tree> queryMenuByRoleId(String roleId) {
		List<Tree> newTreeList = new ArrayList<>();
		try {
			// 先从缓存取角色菜单权限，如果取不到，再从数据库查
			List<Tree> treeList = (List<Tree>) jedisClient.getList(JurisdictionConstant.REDIS_ROLE_MENU_KEY + roleId);
			if (CollectionUtils.isEmpty(treeList)) {
				List<SysMenu> menuList = menuMapper.queryMenuByRoleId(roleId);
		        if (CollectionUtils.isEmpty(menuList)) {
		            return null;
		        }
		        // 将菜单转为ztree形式
		        for (SysMenu menu : menuList) {
		        	Tree tree = new Tree();
		        	tree.setId(menu.getId());
		        	tree.setpId(menu.getParentId());
		        	tree.setChecked(menu.isChecked());
		        	tree.setName(menu.getName());
		        	tree.setType(menu.getType());
		        	newTreeList.add(tree);
		        }
		        jedisClient.setList(JurisdictionConstant.REDIS_ROLE_MENU_KEY + roleId, newTreeList, 24*3600);
			}else{
				return treeList;
			}
		} catch (Exception e) {
			logger.error("======RoleServiceImpl.queryMenuByRoleId()======error======",e);
		}
        return newTreeList;
	}
	
	/** 
	 * Function : 
	 * @see com.itaka.blog.service.RoleService#getTotalRole(com.itaka.blog.vo.RoleConditionVo) 
	 */
	@Override
	public int getTotalRole(RoleConditionVo conditionVo) {
		return roleMapper.getTotalRole(conditionVo);
	}
	
	/** 
	 * Function : 
	 * @see com.itaka.blog.service.RoleService#getRoleList() 
	 */
	@Override
	public PageInfo<Role> getRoleList(RoleConditionVo conditionVo) {
		List<Role> roleList = roleMapper.getRoleList(conditionVo);
		PageInfo<Role> page = new PageInfo<>();
		page.setTotal(getTotalRole(conditionVo));
		page.setList(roleList);
		return page;
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.RoleService#getAllRoleList() 
	 */
	@Override
	public List<Role> getAllRoleList() {
		return roleMapper.getAllRoleList();
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.RoleService#saveRole(com.itaka.blog.dto.RoleDTO) 
	 */
	@Override
	public Result saveRole(RoleDTO role) {
		Result result = new Result();
		Role record = new Role();
		try {
			logger.info("======RoleServiceImpl.saveRole()======start======");
			record.setId(RandomIDUtil.getRandomID());
			record.setName(role.getRoleName());
			record.setStatus(role.getStatus());
			record.setDescription(role.getDescription());
			record.setCreateTime(DateUtil.getTime());
			record.setUpdateTime(DateUtil.getTime());
			roleMapper.insert(record);
			result.setCode(1);
			result.setMsg("角色添加成功！");
			logger.info("======RoleServiceImpl.saveRole()======end======");
		} catch (Exception e) {
			logger.error("======RoleServiceImpl.saveRole()======error======",e);
		}
		return result;
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.RoleService#getRoleById(java.lang.String) 
	 */
	@Override
	public Role getRoleById(String roleId) {
		return roleMapper.selectByPrimaryKey(roleId);
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.RoleService#editRole(com.itaka.blog.dto.RoleDTO) 
	 */
	@Override
	public Result editRole(RoleDTO role) {
		Result result = new Result();
		Role record = new Role();
		try {
			logger.info("======RoleServiceImpl.editRole()======start======");
			record.setId(role.getRoleId());
			record.setName(role.getRoleName());
			record.setStatus(role.getStatus());
			record.setDescription(role.getDescription());
			record.setCreateTime(DateUtil.getTime());
			record.setUpdateTime(DateUtil.getTime());
			roleMapper.updateByPrimaryKeySelective(record);
			result.setCode(1);
			result.setMsg("修改角色成功！");
			logger.info("======RoleServiceImpl.editRole()======end======");
		} catch (Exception e) {
			logger.error("======RoleServiceImpl.editRole()======error======",e);
		}
		return result;
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.RoleService#delRole(java.lang.String) 
	 */
	@Override
	public Result delRole(String roleId) {
		Result result = new Result();
		try {
			logger.info("======RoleServiceImpl.delRole()======start======");
			Role role = new Role();
			role.setId(roleId);
			role.setStatus("0");
			role.setUpdateTime(DateUtil.getTime());
			roleMapper.updateByPrimaryKeySelective(role);
			result.setCode(1);
			result.setMsg("角色删除成功！");
			logger.info("======RoleServiceImpl.delRole()======end======");
		} catch (Exception e) {
			logger.error("======RoleServiceImpl.delRole()======error======",e);
		}
		return result;
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.RoleService#saveRoleMenu(java.lang.String, java.lang.String) 
	 */
	@SuppressWarnings({"unchecked","deprecation"})
	@Override
	@Transactional
	public Result saveRoleMenu(String treeJson, String roleId) {
		Result result = new Result();
		try {
			logger.info("======RoleServiceImpl.saveRoleMenu()======end======");
			if (StringUtils.isEmpty(roleId)) {
				result.setCode(0);
				result.setMsg("角色id不能为空！");
			}
			// 先删除角色与菜单之前的关系
			roleMenuMapper.deleteByRoleId(roleId);
			// 清除缓存
			jedisClient.delete(JurisdictionConstant.REDIS_USER_MENU_LIST + roleId);
			jedisClient.delete(JurisdictionConstant.REDIS_ROLE_MENU_KEY + roleId);
			logger.info("======删除之前的角色与菜单关系成功======");
			if (StringUtils.isNotEmpty(treeJson)) {
				treeJson = treeJson.replaceAll("&quot;", "\"");
				// 将数据转为json数组
				JSONArray jsonArray = JSONArray.fromObject(treeJson);
				List<Tree> trees = JSONArray.toList(jsonArray, Tree.class);
			    // 判断权限信息是否为空
			    if (null != trees && trees.size() > 0) {
			    	List<String> menuIdList = new ArrayList<>();
			        // 将角色编码和权限关联起来
			        for (Tree tree : trees) {
			        	// 取到所有菜单id
			        	menuIdList.add(tree.getId());
			        }
			        // 遍历所有菜单id
		        	if (null != menuIdList && menuIdList.size() > 0) {
		        		for (int i = 0; i < menuIdList.size(); i++) {
		        			RoleMenu roleMenu = new RoleMenu();
		                	roleMenu.setId(RandomIDUtil.getRandomID());
		                	roleMenu.setMenuId(menuIdList.get(i));
		                    roleMenu.setRoleId(roleId);
		                    roleMenu.setCreateTime(DateUtil.getTime());
		                    roleMenu.setUpdateTime(DateUtil.getTime());
		                    roleMenuMapper.insert(roleMenu);
		                    logger.info("======插入新的角色与菜单关系成功======");
		                    logger.info("======RoleServiceImpl.saveRoleMenu()======end======");
						}
					}
			    }
			}
			result.setCode(1);
			result.setMsg("角色授权成功！");
		} catch (Exception e) {
			logger.error("======RoleServiceImpl.saveRoleMenu()======error======",e);
		}
		return result;
	}

}
