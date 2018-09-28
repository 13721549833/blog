package com.itaka.blog.mapper;

import com.itaka.blog.pojo.BlogTags;

public interface BlogTagsMapper {
    int deleteByPrimaryKey(String id);

    int insert(BlogTags record);

    int insertSelective(BlogTags record);

    BlogTags selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(BlogTags record);

    int updateByPrimaryKey(BlogTags record);
}