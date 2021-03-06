package com.itaka.blog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itaka.blog.pojo.User;
import com.itaka.blog.vo.UserConditionVo;

public interface UserMapper {
    int deleteByPrimaryKey(String id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    int getUserCountByUsername(@Param("username")String username);
    
    User loginByUsername(@Param("username")String username,
    		@Param("password")String password);
    
    User getUserByUsername(String username);
    
    int getUserCountByNameAndPwd(@Param("username")String username,@Param("password")String password);

	/** 
	 * getUserList: 获取用户列表 <br/>
	 *
	 * @author Jerry
	 * @param conditionVo 查询对象
	 * @return 
	 */ 
	List<User> getUserList(UserConditionVo conditionVo);

	/** 
	 * getTotalUser: 获取用户总数 <br/>
	 *
	 * @author Jerry
	 * @param conditionVo 查询对象
	 * @return 
	 */ 
	int getTotalUser(UserConditionVo conditionVo);
}