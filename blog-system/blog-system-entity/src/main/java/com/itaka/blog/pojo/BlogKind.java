package com.itaka.blog.pojo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.itaka.blog.base.BaseEntity;
import com.itaka.blog.serializer.DateSerializer;

public class BlogKind extends BaseEntity {

	private String blogId;

    private String userId;

    private String userIp;

    private Long type;

    @JsonSerialize(using = DateSerializer.class)
    private Date lookTime;

    public String getBlogId() {
        return blogId;
    }

    public void setBlogId(String blogId) {
        this.blogId = blogId == null ? null : blogId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getUserIp() {
        return userIp;
    }

    public void setUserIp(String userIp) {
        this.userIp = userIp == null ? null : userIp.trim();
    }

    public Long getType() {
        return type;
    }

    public void setType(Long type) {
        this.type = type;
    }

    public Date getLookTime() {
        return lookTime;
    }

    public void setLookTime(Date lookTime) {
        this.lookTime = lookTime;
    }

}