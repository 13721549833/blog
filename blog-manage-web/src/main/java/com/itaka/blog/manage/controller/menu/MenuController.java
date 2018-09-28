/** 
 * Project Name:blog-manage-web 
 * File Name:MenuController.java 
 * Package Name:com.itaka.blog.manage.controller.menu 
 * Date:2018年7月1日下午5:31:11
 */
package com.itaka.blog.manage.controller.menu;

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
import com.itaka.blog.dto.MenuDTO;
import com.itaka.blog.manage.controller.base.BaseController;
import com.itaka.blog.page.PageInfo;
import com.itaka.blog.pojo.Menu;
import com.itaka.blog.pojo.SysMenu;
import com.itaka.blog.service.MenuService;
import com.itaka.blog.util.Result;
import com.itaka.blog.vo.MenuConditionVo;

/** 
 * ClassName: MenuController <br/> 
 * Function: 菜单相关控制器 <br/> 
 * date: 2018年7月1日 下午5:31:11 <br/> 
 * 
 * @author Jerry
 * @version  
 */
@Controller
@RequestMapping("/menu")
public class MenuController extends BaseController{

	@Autowired
	private MenuService menuService;

	/**
	 * 
	 * getMenuList: 获取菜单列表页 <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	@GetMapping("/menuList.do")
	@RequiresPermissions("menus")
	@SysLogMessage(logContent="菜单列表",operatorMoudle="系统管理",operatorType="访问页面")
	public ModelAndView getMenuList(){
		ModelAndView mv = new ModelAndView("system/menu/menu_list");
		return mv;
	}
	
	/**
	 * 
	 * getMenuListPage: 获取菜单列表数据 <br/>
	 *
	 * @author Jerry
	 * @param request
	 * @return
	 */
	@RequestMapping("/menus.do")
	@ResponseBody
	public Result getMenuListPage(HttpServletRequest request){
		Result result = new Result();
		try {
			logger.info("======getMenuListPage======start======");
			String name = request.getParameter("name");
			String type = request.getParameter("type");
			String status = request.getParameter("status");
			String pageNum = request.getParameter("page");
			String pageSize = request.getParameter("limit");
			MenuConditionVo conditionVo = new MenuConditionVo();
			conditionVo.setName(name);
			conditionVo.setType(type);
			conditionVo.setStatus(status);
			if (StringUtils.isEmpty(pageNum)||StringUtils.isEmpty(pageSize)) {
				conditionVo.setStartRow(Integer.parseInt(DEFAULT_PAGE_NO));
				conditionVo.setPageSize(Integer.parseInt(DEFAULT_PAGE_SIZE));
			}else{
				conditionVo.setStartRow((Integer.parseInt(pageNum) - 1)* Integer.parseInt(pageSize));
				conditionVo.setPageSize(Integer.parseInt(pageSize));
			}
			PageInfo<SysMenu> page = menuService.getMenuList(conditionVo);
			result.setCode(1);
			result.setMsg("请求成功！");
			result.setCount((int)page.getTotal());
			result.setData(page.getList());
			logger.info("======getMenuListPage======end======");
		} catch (Exception e) {
			result.setCode(-1);
			result.setMsg("网络异常，请稍后重试！");
			logger.error("接口请求异常",e);
			logger.error("======getMenuListPage======error======");
		}
		return result;
	}
	
	/**
	 * 
	 * addMenu: 新增菜单 <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	@GetMapping("/addMenu.do")
	@RequiresPermissions("menu:add")
	@SysLogMessage(logContent="新增菜单",operatorMoudle="系统管理",operatorType="访问页面")
	public ModelAndView addMenu(){
		ModelAndView mv = new ModelAndView("system/menu/menu_add");
		return mv;
	}
	
	/**
	 * 
	 * saveMenu: 保存菜单 <br/>
	 *
	 * @author Jerry
	 * @param menu 菜单对象
	 * @return
	 */
	@PostMapping("/saveMenu.do")
	@ResponseBody
	@SysLogMessage(logContent="保存菜单",operatorMoudle="系统管理",operatorType="用户操作")
	public Result saveMenu(MenuDTO menu){
		Result result = new Result();
		try {
			logger.info("======saveMenu======start======");
			result = menuService.saveMenu(menu);
			logger.info("======saveMenu======end======");
		} catch (Exception e) {
			result.setCode(-1);
			result.setMsg("网络异常，请稍后重试！");
			logger.error("接口请求异常",e);
			logger.error("======saveMenu======error======",e);
		}
		return result;
	}
	
	/**
	 * 
	 * modifyMenu: 编辑菜单页 <br/>
	 *
	 * @author Jerry
	 * @param menuId 菜单id
	 * @return
	 */
	@GetMapping("/modifyMenu.do")
	@RequiresPermissions("menu:edit")
	@SysLogMessage(logContent="修改菜单",operatorMoudle="系统管理",operatorType="访问页面")
	public ModelAndView modifyMenu(String menuId){
		ModelAndView mv = new ModelAndView("system/menu/menu_edit");
		Menu menu = menuService.getMenuById(menuId);
		mv.addObject("menu", menu);
		return mv;
	}
	
	/**
	 * 
	 * editMenu: 修改菜单 <br/>
	 *
	 * @author Jerry
	 * @param menu 菜单对象
	 * @return
	 */
	@PostMapping("/editMenu.do")
	@ResponseBody
	@SysLogMessage(logContent="编辑菜单",operatorMoudle="系统管理",operatorType="用户操作")
	public Result editMenu(MenuDTO menu){
		Result result = new Result();
		try {
			result = menuService.editMenu(menu);
		} catch (Exception e) {
			logger.error("======修改菜单失败======error======");
			result.setCode(-1);
			result.setMsg("网络异常，修改菜单失败！");
		}
		return result;
	}
	
	/**
	 * 
	 * delMenu: 删除菜单 <br/>
	 *
	 * @author Jerry
	 * @param menuIds 菜单id
	 * @return
	 */
	@PostMapping("/delMenu.do")
	@ResponseBody
	@SysLogMessage(logContent="删除菜单",operatorMoudle="系统管理",operatorType="用户操作")
	public Result delMenu(String menuIds){
		Result result = new Result();
		try {
			logger.info("======delMenu======start======");
			result = menuService.deleteMenu(menuIds);
			logger.info("======delMenu======end======");
		} catch (Exception e) {
			result.setCode(-1);
			result.setMsg("网络异常，请稍后重试！");
			logger.error("接口请求异常",e);
			logger.error("======delMenu======error======",e);
		}
		return result;
	}
	
	/**
	 * 
	 * firstMenu: 获取一级菜单列表 <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	@PostMapping("/firstMenu.do")
	@ResponseBody
	@SysLogMessage(logContent="获取一级菜单",operatorMoudle="系统管理",operatorType="用户操作")
	public Result firstMenu(){
		Result result = new Result();
		try {
			logger.info("======firstMenu======start======");
			List<SysMenu> menuList = menuService.getFirstMenuList();
			result.setCode(1);
			result.setData(menuList);
			logger.info("======firstMenu======end======");
		} catch (Exception e) {
			result.setCode(-1);
			result.setMsg("网络异常，请稍后重试！");
			logger.error("接口请求异常",e);
			logger.error("======firstMenu======error======");
		}
		return result;
	}
	
	/**
	 * 
	 * secondMenu: 获取二级菜单列表 <br/>
	 *
	 * @author Jerry
	 * @param menuId
	 * @return
	 */
	@PostMapping("/secondMenu.do")
	@ResponseBody
	@SysLogMessage(logContent="获取二级菜单",operatorMoudle="系统管理",operatorType="用户操作")
	public Result secondMenu(String menuId){
		Result result = new Result();
		try {
			logger.info("======secondMenu======start======");
			List<SysMenu> menuList = menuService.getAllSecondMenuList();
			result.setCode(1);
			result.setData(menuList);
			logger.info("======secondMenu======end======");
		} catch (Exception e) {
			result.setCode(-1);
			result.setMsg("网络异常，请稍后重试！");
			logger.error("接口请求异常",e);
			logger.error("======secondMenu======error======");
		}
		return result;
	}
}
