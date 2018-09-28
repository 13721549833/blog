package com.itaka.blog.mapper;

import com.itaka.blog.pojo.SysConfig;

public interface SysConfigMapper {
    int deleteByPrimaryKey(String id);

    int insert(SysConfig record);

    int insertSelective(SysConfig record);

    SysConfig selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysConfig record);

    int updateByPrimaryKey(SysConfig record);
}