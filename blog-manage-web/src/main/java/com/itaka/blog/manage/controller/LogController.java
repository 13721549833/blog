/** 
 * Project Name:blog-manage-web 
 * File Name:LogController.java 
 * Package Name:com.itaka.blog.manage.controller 
 * Date:2018年8月27日下午11:25:38
 */
package com.itaka.blog.manage.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itaka.blog.aop.annotation.SysLogMessage;
import com.itaka.blog.manage.controller.base.BaseController;
import com.itaka.blog.page.PageInfo;
import com.itaka.blog.pojo.Log;
import com.itaka.blog.service.LogService;
import com.itaka.blog.util.Result;
import com.itaka.blog.vo.LogConditionVo;

/** 
 * ClassName: LogController <br/> 
 * Function:  <br/> 
 * date: 2018年8月27日 下午11:25:38 <br/> 
 * 
 * @author Jerry
 * @version  
 */
@Controller
@RequestMapping("/log")
public class LogController extends BaseController{

	@Autowired
	private LogService logService;
	
	/**
	 * 
	 * getLogList: 日志列表页 <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	@GetMapping("/logList.do")
	@RequiresPermissions("logs")
	@SysLogMessage(logContent="日志列表",operatorMoudle="系统管理",operatorType="访问页面")
	public ModelAndView getLogList(){
		ModelAndView mv = new ModelAndView("system/log/log_list");
		return mv;
	}
	
	/**
	 * 
	 * getLogListPage: 获取日志列表数据 <br/>
	 *
	 * @author Jerry
	 * @param request
	 * @return
	 */
	@RequestMapping("/logs.do")
	@ResponseBody
	public Result getLogListPage(HttpServletRequest request){
		Result result = new Result();
		try {
			String pageNum = request.getParameter("page");
			String pageSize = request.getParameter("limit");
			LogConditionVo conditionVo = new LogConditionVo();
			if (StringUtils.isEmpty(pageNum)||StringUtils.isEmpty(pageSize)) {
				conditionVo.setStartRow(Integer.parseInt(DEFAULT_PAGE_NO));
				conditionVo.setPageSize(Integer.parseInt(DEFAULT_PAGE_SIZE));
			}else{
				conditionVo.setStartRow((Integer.parseInt(pageNum) - 1)* Integer.parseInt(pageSize));
				conditionVo.setPageSize(Integer.parseInt(pageSize));
			}
			PageInfo<Log> page = logService.getLogList(conditionVo);
			result.setCode(1);
			result.setMsg("请求成功！");
			result.setCount((int)page.getTotal());
			result.setData(page.getList());
			logger.info("======getLogListPage======end======");
		} catch (Exception e) {
			result.setCode(-1);
			result.setMsg("网络异常，请稍后重试！");
			logger.error("接口请求异常",e);
			logger.error("======getLogListPage======error======");
		}
		return result;
	}
	
}
