package com.itaka.blog.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginUtil {

	public static String COOKIE_NAME = "CookieUserName";
	
	/**
	 * 
	 * saveCookie: 保存cookie <br/>
	 *
	 * @author Jerry
	 * @param request
	 * @param response
	 * @param loginName
	 */
	public static void saveCookie(HttpServletRequest request, HttpServletResponse response, String loginName) {
        // 把用户登录信息存到cookie中
        Cookie cookieSessionId = new Cookie(COOKIE_NAME, loginName);
        cookieSessionId.setMaxAge(30 * 60); // cookies失效时间为半小时
        cookieSessionId.setPath("/");
        response.addCookie(cookieSessionId);
    }
	
	/**
	 * 
	 * clearCookie: 清除cookie <br/>
	 *
	 * @author Jerry
	 * @param request
	 * @param response
	 */
	public static void clearCookie(HttpServletRequest request, HttpServletResponse response){
		Cookie cookie = new Cookie(COOKIE_NAME, null);
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
	}
}
