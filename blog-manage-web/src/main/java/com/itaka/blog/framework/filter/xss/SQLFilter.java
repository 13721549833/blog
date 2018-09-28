/** 
 * Project Name:blog-manage-web 
 * File Name:SQLFilter.java 
 * Package Name:com.itaka.blog.framework.filter.xss 
 * Date:2018年7月19日下午2:36:43
 */
package com.itaka.blog.framework.filter.xss;

import org.apache.commons.lang3.StringUtils;

/** 
 * ClassName: SQLFilter <br/> 
 * Function: SQL过滤 <br/> 
 * date: 2018年7月19日 下午2:36:43 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public class SQLFilter {

	/**
     * SQL注入过滤
     * @param str  待验证的字符串
     */
    public static String sqlInject(String str){
        if(StringUtils.isBlank(str)){
            return null;
        }
        //去掉'|"|;|\字符
        str = StringUtils.replace(str, "'", "");
        str = StringUtils.replace(str, "\"", "");
        str = StringUtils.replace(str, ";", "");
        str = StringUtils.replace(str, "\\", "");

        //转换成小写
        str = str.toLowerCase();

        //非法字符
        String[] keywords = {"master", "truncate", "insert", "select", "delete", "update", "declare", "alert", "drop"};

        //判断是否包含非法字符
        for(String keyword : keywords){
            if(str.indexOf(keyword) != -1){
                throw new RuntimeException("包含非法字符");
            }
        }

        return str;
    }
}
