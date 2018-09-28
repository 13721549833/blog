/** 
 * Project Name:blog-system-service 
 * File Name:LogServiceImpl.java 
 * Package Name:com.itaka.blog.service.impl 
 * Date:2018年8月7日下午2:41:33
 */
package com.itaka.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itaka.blog.mapper.LogMapper;
import com.itaka.blog.page.PageInfo;
import com.itaka.blog.pojo.Log;
import com.itaka.blog.service.LogService;
import com.itaka.blog.vo.LogConditionVo;

/** 
 * ClassName: LogServiceImpl <br/> 
 * Function: 日志服务接口实现 <br/> 
 * date: 2018年8月7日 下午2:41:33 <br/> 
 * 
 * @author Jerry
 * @version  
 */
@Service
public class LogServiceImpl implements LogService {

	@Autowired
	private LogMapper logMapper;
	
	/** 
	 * Function : 
	 * @see com.itaka.blog.service.LogService#save(com.itaka.blog.vo.SysLogVo) 
	 */
	@Override
	public void save(Log log) {
		logMapper.insert(log);
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.LogService#getLogList(com.itaka.blog.vo.LogConditionVo) 
	 */
	@Override
	public PageInfo<Log> getLogList(LogConditionVo log) {
		List<Log> logList = logMapper.getLogList(log);
		PageInfo<Log> page = new PageInfo<>();
		page.setTotal(logMapper.getLogTotal());
		page.setList(logList);
		return page;
	}

}
