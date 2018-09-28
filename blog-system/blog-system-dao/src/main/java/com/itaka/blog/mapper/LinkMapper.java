package com.itaka.blog.mapper;

import com.itaka.blog.pojo.Link;

public interface LinkMapper {
    int deleteByPrimaryKey(String id);

    int insert(Link record);

    int insertSelective(Link record);

    Link selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Link record);

    int updateByPrimaryKey(Link record);
}