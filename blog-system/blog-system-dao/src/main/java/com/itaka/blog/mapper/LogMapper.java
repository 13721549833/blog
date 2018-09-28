package com.itaka.blog.mapper;

import java.util.List;

import com.itaka.blog.pojo.Log;
import com.itaka.blog.vo.LogConditionVo;

public interface LogMapper {
    int deleteByPrimaryKey(String id);

    int insert(Log record);

    int insertSelective(Log record);

    Log selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Log record);

    int updateByPrimaryKey(Log record);
    
    int getLogTotal();
    
    /**
     * 
     * getLogList: 获取日志列表 <br/>
     *
     * @author Jerry
     * @param log 日志查询对象
     * @return
     */
    List<Log> getLogList(LogConditionVo log);
}