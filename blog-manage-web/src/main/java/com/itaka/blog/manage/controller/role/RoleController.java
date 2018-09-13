/** 
 * Project Name:blog-manage-web 
 * File Name:RoleController.java 
 * Package Name:com.itaka.blog.manage.controller.role 
 * Date:2018年7月19日下午5:16:07
 */
package com.itaka.blog.manage.controller.role;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.itaka.blog.aop.annotation.SysLogMessage;
import com.itaka.blog.dto.RoleDTO;
import com.itaka.blog.manage.controller.base.BaseController;
import com.itaka.blog.page.PageInfo;
import com.itaka.blog.pojo.Role;
import com.itaka.blog.pojo.Tree;
import com.itaka.blog.service.RoleService;
import com.itaka.blog.util.Result;
import com.itaka.blog.vo.RoleConditionVo;

import net.sf.json.JSONArray;

/** 
 * ClassName: RoleController <br/> 
 * Function: 角色管理控制器 <br/> 
 * date: 2018年7月19日 下午5:16:07 <br/> 
 * 
 * @author Jerry
 * @version  
 */
@Controller
@RequestMapping("/role")
public class RoleController extends BaseController {

	@Autowired
	private RoleService roleService;
	
	@GetMapping("/roleList.do")
	@SysLogMessage(logContent="角色列表",operatorMoudle="系统设置",operatorType="访问页面")
	public ModelAndView roleList(){
		ModelAndView mv = new ModelAndView("system/role/role_list");
		return mv;
	}
	
	@RequestMapping("/roles.do")
	@ResponseBody
	public Result roleListPage(HttpServletRequest request){
		logger.info("===roleListPage===start===");
		Result result = new Result();
		try {
			String name = request.getParameter("name");
			String status = request.getParameter("status");
			String pageNum = request.getParameter("page");
			String pageSize = request.getParameter("limit");
			RoleConditionVo conditionVo = new RoleConditionVo();
			conditionVo.setName(name);
			conditionVo.setStatus(status);
			if (StringUtils.isEmpty(pageNum)||StringUtils.isEmpty(pageSize)) {
				conditionVo.setStartRow(Integer.parseInt(DEFAULT_PAGE_NO));
				conditionVo.setPageSize(Integer.parseInt(DEFAULT_PAGE_SIZE));
			}else{
				conditionVo.setStartRow((Integer.parseInt(pageNum) - 1)* Integer.parseInt(pageSize));
				conditionVo.setPageSize(Integer.parseInt(pageSize));
			}
			PageInfo<Role> page = roleService.getRoleList(conditionVo);
			result.setCode(1);
			result.setMsg("请求成功！");
			result.setCount((int)page.getTotal());
			result.setData(page.getList());
			logger.info("===roleListPage===end===");
		} catch (Exception e) {
			result.setCode(-1);
			result.setMsg("网络异常，请稍后重试！");
			logger.error("===roleListPage===接口请求异常===",e);
		}
		return result;
	}
	
	/**
	 * 
	 * addRole: 新增角色 <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	@GetMapping("/addRole.do")
	@RequiresPermissions("role:add")
	@SysLogMessage(logContent="新增角色",operatorMoudle="系统设置",operatorType="访问页面")
	public ModelAndView addRole(){
		ModelAndView mv = new ModelAndView("system/role/role_add");
		return mv;
	}
	
	/**
	 * 
	 * saveRole: 保存角色 <br/>
	 *
	 * @author Jerry
	 * @param role 角色信息
	 * @return
	 */
	@PostMapping("/saveRole.do")
	@ResponseBody
	@SysLogMessage(logContent="保存角色",operatorMoudle="系统设置",operatorType="用户操作")
	public Result saveRole(RoleDTO role){
		Result result = new Result();
		try {
			logger.info("======saveRole()======start======");
			result = roleService.saveRole(role);
			logger.info("======saveRole()======end======");
		} catch (Exception e) {
			logger.error("======saveRole()======error======",e);
			result.setCode(-1);
			result.setMsg("网络异常，保存角色信息失败！");
		}
		return result;
	}
	
	/**
	 * 
	 * modifyRole: 编辑角色页面 <br/>
	 *
	 * @author Jerry
	 * @param roleId 角色id
	 * @return
	 */
	@GetMapping("/modifyRole.do")
	@RequiresPermissions("role:edit")
	@SysLogMessage(logContent="编辑角色",operatorMoudle="系统设置",operatorType="访问页面")
	public ModelAndView modifyRole(String roleId){
		ModelAndView mv = new ModelAndView("system/role/role_edit");
		Role role = roleService.getRoleById(roleId);
		mv.addObject("role", role);
		return mv;
	}
	
	/**
	 * 
	 * editRole: 修改角色 <br/>
	 *
	 * @author Jerry
	 * @param role 角色信息
	 * @return
	 */
	@PostMapping("/editRole.do")
	@ResponseBody
	@SysLogMessage(logContent="修改角色",operatorMoudle="系统设置",operatorType="用户操作")
	public Result editRole(RoleDTO role){
		Result result = new Result();
		try {
			logger.info("======saveRole()======start======");
			result = roleService.editRole(role);
			logger.info("======saveRole()======end======");
		} catch (Exception e) {
			logger.error("======saveRole()======error======",e);
			result.setCode(-1);
			result.setMsg("网络异常，修改角色信息失败！");
		}
		return result;
	}
	
	/**
	 * 
	 * delRole: 删除角色 <br/>
	 *
	 * @author Jerry
	 * @param roleId 角色id
	 * @return
	 */
	@PostMapping("/delRole.do")
	@ResponseBody
	@RequiresPermissions("role:delete")
	@SysLogMessage(logContent="删除角色",operatorMoudle="系统设置",operatorType="用户操作")
	public Result delRole(String roleId){
		Result result = new Result();
		try {
			logger.info("======delRole()======start======");
			result = roleService.delRole(roleId);
			logger.info("======delRole()======end======");
		} catch (Exception e) {
			logger.error("======delRole()======error======",e);
			result.setCode(-1);
			result.setMsg("网络异常，删除角色信息失败！");
		}
		return result;
	}
	
	/**
	 * 
	 * modifyRoleMenus: 角色授权 <br/>
	 *
	 * @author Jerry
	 * @param roleId 角色id
	 * @return
	 */
	@PostMapping("/modifyRoleMenus.do")
	@ResponseBody
	@RequiresPermissions("role:authorize")
	@SysLogMessage(logContent="授权角色",operatorMoudle="系统设置",operatorType="用户操作")
	public Result modifyRoleMenus(String roleId){
		Result result = new Result();
		JSONArray jsonArray = new JSONArray();
		try {
			logger.info("======modifyRoleMenus()======start======");
			List<Tree> roleMenuList = roleService.queryMenuByRoleId(roleId);
			jsonArray = JSONArray.fromObject(roleMenuList);
			logger.info("===授权角色菜单===："+jsonArray);
			result.setCode(1);
			result.setData(jsonArray);
			logger.info("======modifyRoleMenus()======end======");
		} catch (Exception e) {
			logger.error("======modifyRoleMenus()======error======",e);
			result.setCode(-1);
			result.setMsg("网络异常，删除角色信息失败！");
		}
		return result;
	}
	
	/**
	 * 
	 * saveRoleMenus: 保存角色授权信息 <br/>
	 *
	 * @author Jerry
	 * @param treeJson
	 * @param roleId
	 * @return
	 */
	@PostMapping("/saveRoleMenus.do")
	@ResponseBody
	@SysLogMessage(logContent="保存角色授权",operatorMoudle="系统设置",operatorType="用户操作")
	public Result saveRoleMenus(String treeJson, String roleId){
		Result result = new Result();
		try {
			logger.info("======saveRoleMenus()======start======");
			result = roleService.saveRoleMenu(treeJson,roleId);
			logger.info("======保存角色授权结果======"+result);
			logger.info("======saveRoleMenus()======end======");
		} catch (Exception e) {
			logger.error("======saveRoleMenus()======error======",e);
			result.setCode(-1);
			result.setMsg("网络异常，保存角色授权信息失败！");
		}
		return result;
	}
	
}
