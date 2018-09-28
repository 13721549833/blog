package com.itaka.blog.mapper;

import com.itaka.blog.pojo.BlogKind;

public interface BlogKindMapper {
    int deleteByPrimaryKey(String id);

    int insert(BlogKind record);

    int insertSelective(BlogKind record);

    BlogKind selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(BlogKind record);

    int updateByPrimaryKey(BlogKind record);
}