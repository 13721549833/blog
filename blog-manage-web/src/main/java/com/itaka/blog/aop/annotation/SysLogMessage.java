/** 
 * Project Name:blog-manage-web 
 * File Name:SysLogMessage.java 
 * Package Name:com.itaka.blog.aop 
 * Date:2018年8月3日下午11:23:22
 */
package com.itaka.blog.aop.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/** 
 * ClassName: SysLogMessage <br/> 
 * Function:  <br/> 
 * date: 2018年8月3日 下午11:23:22 <br/> 
 * 
 * @author Jerry
 * @version  
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface SysLogMessage {

	/**
     * 日志内容
     */
    String logContent() default "";

    /**
     * 操作模块
     */
    String operatorMoudle() default "";

    /**
     * 操作类型：登陆/访问/操作
     */
    String operatorType() default "";
}
