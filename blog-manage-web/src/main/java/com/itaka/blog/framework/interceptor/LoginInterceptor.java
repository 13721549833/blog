package com.itaka.blog.framework.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.itaka.blog.constant.JurisdictionConstant;

import net.sf.json.JSONObject;

/**
 * 
 * ClassName: LoginInterceptor <br/> 
 * Function: 登录拦截器 <br/> 
 * date: 2018年6月23日 上午2:07:12 <br/> 
 * 
 * @author Jerry
 * @version
 */
public class LoginInterceptor implements HandlerInterceptor{

	private static Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object obj, Exception ex)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object obj, ModelAndView mav)
			throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		logger.info("=======class-LoginInterceptor: preHandle() --- start=======");
		// 如果是登录的相关请求，直接返回
        if(request.getRequestURI().indexOf("toLogin.do") > -1 
                || request.getRequestURI().indexOf("verifyCode.do") > -1 
                || request.getRequestURI().indexOf("login.do") > -1 
                || request.getRequestURI().endsWith("blog")
                || request.getRequestURI().endsWith("blog/")){
            return true;
        }
        
		JSONObject user = null;
        Subject subject = SecurityUtils.getSubject();
        Object userObj = subject.getSession().getAttribute(JurisdictionConstant.SESSION_USER);
        if(!StringUtils.isEmpty(userObj)){
            user = JSONObject.fromObject(userObj);
            logger.info("SESSION["+user.getString("username")+"]");
        }
        if (null == user || user.isNullObject() || user.isEmpty()) {
            response.sendRedirect("/blog/web/toLogin.do");
            return false;
        }
        logger.info("=======class-LoginInterceptor: preHandle() --- end=======");
        return true;
	}
	
	
}
