/** 
 * Project Name:blog-manage-web 
 * File Name:XssFilter.java 
 * Package Name:com.itaka.blog.framework.filter 
 * Date:2018年7月19日下午2:20:35
 */
package com.itaka.blog.framework.filter.xss;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/** 
 * ClassName: XssFilter <br/> 
 * Function: XSS过滤 <br/> 
 * date: 2018年7月19日 下午2:20:35 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public class XssFilter implements Filter{

	/** 
	 * Function : 
	 * @see javax.servlet.Filter#destroy() 
	 */
	@Override
	public void destroy() {
		
	}

	/** 
	 * Function : 
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain) 
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		XssHttpServletRequestWrapper xssRequest = new XssHttpServletRequestWrapper(
				(HttpServletRequest) request);
		chain.doFilter(xssRequest, response);
	}

	/** 
	 * Function : 
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig) 
	 */
	@Override
	public void init(FilterConfig config) throws ServletException {
		
	}

	
}
