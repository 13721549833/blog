package com.itaka.blog.mapper;

import com.itaka.blog.pojo.Notice;

public interface NoticeMapper {
    int deleteByPrimaryKey(String id);

    int insert(Notice record);

    int insertSelective(Notice record);

    Notice selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Notice record);

    int updateByPrimaryKey(Notice record);
}