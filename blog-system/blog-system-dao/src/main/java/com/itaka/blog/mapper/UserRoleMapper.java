package com.itaka.blog.mapper;

import com.itaka.blog.pojo.UserRole;

public interface UserRoleMapper {
    int deleteByPrimaryKey(String id);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);

	/** 
	 * deleteByUserId: 根据用户id删除 <br/>
	 *
	 * @author Jerry
	 * @param userId 用户id
	 */ 
	int deleteByUserId(String userId);
}