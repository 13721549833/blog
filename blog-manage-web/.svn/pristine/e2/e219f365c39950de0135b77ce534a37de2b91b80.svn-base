/** 
 * Project Name:blog-manage-web 
 * File Name:DruidController.java 
 * Package Name:com.itaka.blog.manage.controller.druid 
 * Date:2018年7月25日下午1:43:06
 */
package com.itaka.blog.manage.controller.druid;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itaka.blog.aop.annotation.SysLogMessage;
import com.itaka.blog.manage.controller.base.BaseController;

/** 
 * ClassName: DruidController <br/> 
 * Function: druid监控中心 <br/> 
 * date: 2018年7月25日 下午1:43:06 <br/> 
 * 
 * @author Jerry
 * @version  
 */
@Controller
public class DruidController extends BaseController{

	@RequestMapping("/druid.do")
	@SysLogMessage(logContent="监控中心",operatorMoudle="监控中心",operatorType="访问页面")
	public void druid(HttpServletRequest request,HttpServletResponse response) throws IOException{
		logger.info("======druid======start======");
		response.sendRedirect("http://127.0.0.1:8080/blog/druid/index.html");
	}
}
