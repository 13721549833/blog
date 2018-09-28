package com.itaka.blog.mapper;

import com.itaka.blog.pojo.Blog;
import com.itaka.blog.pojo.BlogWithBLOBs;

public interface BlogMapper {
    int deleteByPrimaryKey(String id);

    int insert(BlogWithBLOBs record);

    int insertSelective(BlogWithBLOBs record);

    BlogWithBLOBs selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(BlogWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(BlogWithBLOBs record);

    int updateByPrimaryKey(Blog record);
}