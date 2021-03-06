package com.itaka.blog.framework.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * ClassName: AdminLoginFilter <br/> 
 * Function: 登录拦截器 <br/> 
 * date: 2018年6月23日 上午2:50:20 <br/> 
 * 
 * @author Jerry
 * @version
 */
public class AdminLoginFilter implements Filter{

	private static Logger logger = LoggerFactory.getLogger(AdminLoginFilter.class);
	
	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		logger.info("=======class-AdminLoginFilter: doFilter() --- start=======");
		req.setCharacterEncoding("utf-8");
		String method = req.getParameter("method");
		String uri = req.getRequestURI();
		if (StringUtils.isNotEmpty(method)) {
			uri += "?method=" + method;
		}
		String reqUrl = uri;
		System.out.println("你正在请求服务：========= " + reqUrl);
		chain.doFilter(req, res);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
	}

}
