/** 
 * Project Name:blog-manage-web 
 * File Name:SysLogAspect.java 
 * Package Name:com.itaka.blog.aop.annotation 
 * Date:2018年8月3日下午11:24:52
 */
package com.itaka.blog.aop;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.itaka.blog.aop.annotation.SysLogMessage;
import com.itaka.blog.constant.JurisdictionConstant;
import com.itaka.blog.jurisdiction.Jurisdiction;
import com.itaka.blog.pojo.Log;
import com.itaka.blog.pojo.User;
import com.itaka.blog.service.LogService;
import com.itaka.blog.util.DateUtil;
import com.itaka.blog.util.ObjectUtil;
import com.itaka.blog.util.RandomIDUtil;
import net.sf.json.JSONObject;

/** 
 * ClassName: SysLogAspect <br/> 
 * Function:  <br/> 
 * date: 2018年8月3日 下午11:24:52 <br/> 
 * 
 * @author Jerry
 * @version  
 */
@Aspect
@Component
public class SysLogAspect {

	private static final Logger logger = LoggerFactory.getLogger(SysLogAspect.class);

	@Autowired
	private LogService logService;
	
	@Autowired
    private HttpServletRequest request;
	
	/**
	 * 
	 * pointcut: 定义切入点 <br/>
	 *
	 * @author Jerry
	 */
	@Pointcut("execution(@com.itaka.blog.aop.annotation.SysLogMessage * com.itaka.blog.manage.controller..*.*(..))")
    public void pointcut() {
		logger.info("======SysLogAspect.pointcut()======start======");
    }
	
	/**
	 * 
	 * addSysLog: 通过切点添加日志 <br/>
	 *
	 * @author Jerry
	 * @param point
	 */
	@After("pointcut()")
	public void addSysLog(JoinPoint point) {
		try {
			logger.info("======SysLogAspect.addSysLog()======start======");
			// 获取当前登录用户信息
			User user = getUser();
			MethodSignature signature = (MethodSignature) point.getSignature();
			Method method = signature.getMethod();
			SysLogMessage log = method.getAnnotation(SysLogMessage.class);
			Log logVo = new Log();
			logVo.setId(RandomIDUtil.getRandomID());
			logVo.setOperator(user.getUsername());
			logVo.setContent(log.logContent());
			logVo.setMoudle(log.operatorMoudle());
			logVo.setType(log.operatorType());
			logVo.setIp(request.getRemoteHost());
			logVo.setAddTime(DateUtil.getTime());
			logService.save(logVo);
			logger.info("======SysLogAspect.addSysLog()======end======");
		} catch (Exception e) {
			logger.error("======SysLogAspect.addSysLog()======error======",e);
		}
	}
	
	/**
	 * 
	 * getUser: 获取登录用户信息 <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	private User getUser(){
		Object obj = Jurisdiction.getSession().getAttribute(JurisdictionConstant.SESSION_USER);
		User user = null;
		if(null!=obj&&ObjectUtil.noEmpty(obj)){
			JSONObject jsonObj = JSONObject.fromObject(obj);
			user = (User) JSONObject.toBean(jsonObj,User.class);
		}
		return user;
	}
}
