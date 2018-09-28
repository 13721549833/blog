/** 
 * Project Name:blog-manage-web 
 * File Name:XssHttpServletRequestWrapper.java 
 * Package Name:com.itaka.blog.framework.filter.xss 
 * Date:2018年7月19日下午2:43:46
 */
package com.itaka.blog.framework.filter.xss;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import org.apache.commons.lang3.StringEscapeUtils;

/** 
 * ClassName: XssHttpServletRequestWrapper <br/> 
 * Function: XSS过滤处理 <br/> 
 * date: 2018年7月19日 下午2:43:46 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public class XssHttpServletRequestWrapper extends HttpServletRequestWrapper {

	HttpServletRequest orgRequest;
	
	/** 
	 * Creates a new instance of XssHttpServletRequestWrapper. 
	 * @param request 
	 */
	public XssHttpServletRequestWrapper(HttpServletRequest request) {
		super(request);
		orgRequest = request;
	}
	
	@Override
	public String getHeader(String name) {
		return StringEscapeUtils.escapeHtml4(super.getHeader(name));
	}
	
	@Override
	public String getQueryString() {
		return StringEscapeUtils.escapeHtml4(super.getQueryString());
	}

	@Override
	public String getParameter(String name) {
		return StringEscapeUtils.escapeHtml4(super.getParameter(name));
	}

	@Override
	public String[] getParameterValues(String name) {
		String[] values = super.getParameterValues(name);
		if (values != null) {
			int length = values.length;
			String[] escapseValues = new String[length];
			for (int i = 0; i < length; i++) {
				escapseValues[i] = StringEscapeUtils.escapeHtml4(values[i]);
			}
			return escapseValues;
		}
		return super.getParameterValues(name);
	}
    
}
