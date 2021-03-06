package com.itaka.blog.manage.controller.base;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.itaka.blog.constant.JurisdictionConstant;
import com.itaka.blog.jurisdiction.Jurisdiction;
import com.itaka.blog.pojo.User;
import com.itaka.blog.util.ObjectUtil;

import net.sf.json.JSONObject;

/**
 * 
 * ClassName: BaseController <br/> 
 * Function: 基础控制器 <br/> 
 * date: 2018年6月21日 上午1:10:51 <br/> 
 * 
 * @author Jerry
 * @version
 */
public class BaseController {

	public Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 默认页数
	 */
	public static final String DEFAULT_PAGE_NO = "0";
	
	/**
	 * 默认每页数
	 */
	public static final String DEFAULT_PAGE_SIZE = "10";
	
	/*
	 * 获取当前登录用户
	 */
	public User getUser(){
		Object obj = Jurisdiction.getSession().getAttribute(JurisdictionConstant.SESSION_USER);
		User user = null;
		if(null!=obj&&ObjectUtil.noEmpty(obj)){
			JSONObject jsonObj = JSONObject.fromObject(obj);
			user = (User) JSONObject.toBean(jsonObj,User.class);
		}
		return user;
	}
	
	/**
	 * 
	 * getUserId: 获取用户id <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	public String getUserId(){
		User user = getUser();
		if (null!=user) {
			return user.getId();
		}
		return null;
	}
}
