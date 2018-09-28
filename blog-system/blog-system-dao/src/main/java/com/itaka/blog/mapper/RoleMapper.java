package com.itaka.blog.mapper;

import java.util.List;

import com.itaka.blog.pojo.Role;
import com.itaka.blog.vo.RoleConditionVo;

public interface RoleMapper {
    int deleteByPrimaryKey(String id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    /**
     * 
     * getRoleList: 获取角色列表 <br/>
     *
     * @author Jerry
     * @param vo 查询对象
     * @return
     */
    List<Role> getRoleList(RoleConditionVo vo);
    
    /**
     * 
     * getRoleListByUserId: 根据用户id获取角色信息 <br/>
     *
     * @author Jerry
     * @param userId 用户id
     * @return
     */
    List<Role> getRoleListByUserId(String userId);

	/** 
	 * getTotalRole: 获取角色总数 <br/>
	 *
	 * @author Jerry
	 * @param conditionVo 查询对象
	 * @return 
	 */ 
	int getTotalRole(RoleConditionVo conditionVo);
	
	/**
	 * 
	 * getAllRoleList: 获取可用角色 <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	List<Role> getAllRoleList();
}