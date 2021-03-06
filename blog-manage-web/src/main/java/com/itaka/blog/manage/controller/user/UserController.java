/** 
 * Project Name:blog-manage-web 
 * File Name:UserController.java 
 * Package Name:com.itaka.blog.manage.controller.user 
 * Date:2018年7月13日下午4:59:47
 */
package com.itaka.blog.manage.controller.user;

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
import com.itaka.blog.dto.UserDTO;
import com.itaka.blog.manage.controller.base.BaseController;
import com.itaka.blog.page.PageInfo;
import com.itaka.blog.pojo.Role;
import com.itaka.blog.pojo.User;
import com.itaka.blog.service.RoleService;
import com.itaka.blog.service.UserService;
import com.itaka.blog.util.Result;
import com.itaka.blog.vo.UserConditionVo;

/** 
 * ClassName: UserController <br/> 
 * Function: 用户管理控制器 <br/> 
 * date: 2018年7月13日 下午4:59:47 <br/> 
 * 
 * @author Jerry
 * @version  
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController{

	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	/**
	 * 
	 * userList: 用户列表页 <br/>
	 *
	 * @author Jerry
	 * @param request
	 * @return
	 */
	@GetMapping("/userList.do")
	@RequiresPermissions("users")
	@SysLogMessage(logContent="用户列表",operatorMoudle="系统管理",operatorType="访问页面")
	public ModelAndView userList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("system/user/user_list");
		return mv;
	}
	
	/**
	 * 
	 * userListPage: 用户列表数据 <br/>
	 *
	 * @author Jerry
	 * @param request
	 * @return
	 */
	@RequestMapping("/users.do")
	@ResponseBody
	public Result userListPage(HttpServletRequest request){
		Result result = new Result();
		try {
			logger.info("======userListPage======start======");
			String username = request.getParameter("username");
			String mobile = request.getParameter("mobile");
			String status = request.getParameter("status");
			String pageNum = request.getParameter("page");
			String pageSize = request.getParameter("limit");
			UserConditionVo conditionVo = new UserConditionVo();
			conditionVo.setUsername(username);
			conditionVo.setMobile(mobile);
			conditionVo.setStatus(status);
			if (StringUtils.isEmpty(pageNum)||StringUtils.isEmpty(pageSize)) {
				conditionVo.setStartRow(Integer.parseInt(DEFAULT_PAGE_NO));
				conditionVo.setPageSize(Integer.parseInt(DEFAULT_PAGE_SIZE));
			}else{
				conditionVo.setStartRow((Integer.parseInt(pageNum) - 1)* Integer.parseInt(pageSize));
				conditionVo.setPageSize(Integer.parseInt(pageSize));
			}
			PageInfo<User> page = userService.getUserList(conditionVo);
			result.setCode(1);
			result.setMsg("请求成功！");
			result.setCount((int)page.getTotal());
			result.setData(page.getList());
			logger.info("======userListPage======end======");
		} catch (Exception e) {
			result.setCode(-1);
			result.setMsg("网络异常，请稍后重试！");
			logger.error("======userListPage======error======",e);
		}
		return result;
	}
	
	/**
	 * 
	 * personal: 个人资料页 <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	@RequestMapping("/personal.do")
	@SysLogMessage(logContent="个人资料",operatorMoudle="系统管理",operatorType="访问页面")
	public ModelAndView personal(){
		ModelAndView mv = new ModelAndView("system/user/personal_info");
		// 获取当前登录用户信息
		User user = getUser();
		mv.addObject("user", user);
		return mv;
	}
	
	/**
	 * 
	 * modifyPersonal: 修改个人资料 <br/>
	 *
	 * @author Jerry
	 * @param user 用户信息
	 * @return
	 */
	@RequestMapping("/modifyPersonal.do")
	@ResponseBody
	@SysLogMessage(logContent="个人资料",operatorMoudle="系统管理",operatorType="修改资料")
	public Result modifyPersonal(User user){
		Result result = new Result();
		try {
			logger.info("======modifyPersonal======start======");
			int count = userService.modifyPersonal(user);
			if(count>0){
				result.setCode(1);
				result.setMsg("修改成功！");
			}else{
				result.setCode(0);
				result.setMsg("修改失败！");
			}
			logger.info("======modifyPersonal======end======");
		} catch (Exception e) {
			logger.error("======modifyPersonal======error======",e);
			result.setCode(-1);
			result.setMsg("网络异常，个人资料修改失败！");
		}
		return result;
	}
	
	/**
	 * 
	 * addUser: 新增用户 <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	@GetMapping("/addUser.do")
	@RequiresPermissions("user:add")
	@SysLogMessage(logContent="新增用户",operatorMoudle="系统管理",operatorType="访问页面")
	public ModelAndView addUser(){
		ModelAndView mv = new ModelAndView("system/user/user_add");
		List<Role> roleList = roleService.getAllRoleList();
		mv.addObject("roleList", roleList);
		return mv;
	}
	
	/**
	 * 
	 * saveUser: 保存用户 <br/>
	 *
	 * @author Jerry
	 * @param request
	 * @return
	 */
	@PostMapping("/saveUser.do")
	@ResponseBody
	@SysLogMessage(logContent="保存用户",operatorMoudle="系统管理",operatorType="用户操作")
	public Result saveUser(UserDTO user){
		Result result = new Result();
		logger.info("======saveUser======start======");
		try {
			result = userService.addUser(user);
			logger.info("======saveUser======end======");
		} catch (Exception e) {
			logger.error("======saveUser======error======",e);
			result.setCode(-1);
			result.setMsg("网络异常，保存用户失败！");
		}
		return result;
	}
	
	/**
	 * 
	 * modifyUser: 编辑用户页 <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	@GetMapping("/modifyUser.do")
	@RequiresPermissions("user:edit")
	@SysLogMessage(logContent="编辑用户",operatorMoudle="系统管理",operatorType="访问页面")
	public ModelAndView modifyUser(String userId){
		ModelAndView mv = new ModelAndView();
		User user = userService.getUserInfoByUserId(userId);
		List<Role> roleList = roleService.getAllRoleList();
		mv.addObject("roleList", roleList);
		mv.addObject("user", user);
		mv.setViewName("system/user/user_edit");
		return mv;
	}	
	
	/**
	 * 
	 * editUser: 修改用户 <br/>
	 *
	 * @author Jerry
	 * @param user
	 * @return
	 */
	@PostMapping("/editUser.do")
	@ResponseBody
	@SysLogMessage(logContent="编辑用户",operatorMoudle="系统管理",operatorType="用户操作")
	public Result editUser(UserDTO user){
		Result result = new Result();
		try {
			result = userService.editUser(user);
		} catch (Exception e) {
			logger.error("======修改用户失败======error======");
			result.setCode(-1);
			result.setMsg("网络异常，修改用户失败！");
		}
		return result;
	}
	
	/**
	 * 
	 * delUser: 删除用户 <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	@PostMapping("/delUser.do")
	@ResponseBody
	@RequiresPermissions("user:delete")
	@SysLogMessage(logContent="删除用户",operatorMoudle="系统管理",operatorType="用户操作")
	public Result delUser(String userId){
		Result result = new Result();
		logger.info("======delUser======start======");
		try {
			result = userService.delUserById(userId);
			logger.info("======delUser======end======");
		} catch (Exception e) {
			logger.error("======delUser======error======",e);
			result.setCode(-1);
			result.setMsg("网络异常，删除用户失败！");
		}
		return result;
	}
	
}
