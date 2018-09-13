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
		response.sendRedirect("http://127.0.0.1/blog/druid/index.html");
	}
	
	public String getRemoteAddr(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getRemoteAddr();
		}
		return ip;
	}
	
}
