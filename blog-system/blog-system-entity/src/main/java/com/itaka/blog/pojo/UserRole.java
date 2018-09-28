package com.itaka.blog.pojo;

import com.itaka.blog.base.BaseEntity;

public class UserRole extends BaseEntity {

    private String userId;

    private String roleId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

}