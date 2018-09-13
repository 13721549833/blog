/** 
 * Project Name:blog-manage-web 
 * File Name:MenuController.java 
 * Package Name:com.itaka.blog.manage.controller.menu 
 * Date:2018年7月1日下午5:31:11
 */
package com.itaka.blog.manage.controller.menu;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itaka.blog.aop.annotation.SysLogMessage;
import com.itaka.blog.manage.controller.base.BaseController;
import com.itaka.blog.page.PageInfo;
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
			logger.error("======getMenuListPage======error======",e);
		}
		return result;
	}
}
