/** 
 * Project Name:blog-system-interface 
 * File Name:LogService.java 
 * Package Name:com.itaka.blog.service 
 * Date:2018年8月7日下午2:39:11
 */
package com.itaka.blog.service;

import com.itaka.blog.page.PageInfo;
import com.itaka.blog.pojo.Log;
import com.itaka.blog.vo.LogConditionVo;

/** 
 * ClassName: LogService <br/> 
 * Function: 日志服务接口 <br/> 
 * date: 2018年8月7日 下午2:39:11 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public interface LogService {

	/** 
	 * save: 保存日志 <br/>
	 *
	 * @author Jerry
	 * @param log 日志信息对象 
	 */ 
	void save(Log log);

	/**
	 * 
	 * getLogList: 获取日志列表 <br/>
	 *
	 * @author Jerry
	 * @param log 日志查询对象
	 * @return
	 */
	PageInfo<Log> getLogList(LogConditionVo log);
}
