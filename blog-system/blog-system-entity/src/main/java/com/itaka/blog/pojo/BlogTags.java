package com.itaka.blog.pojo;

import com.itaka.blog.base.BaseEntity;

public class BlogTags extends BaseEntity {

    private String tagId;

    private String blogId;

    public String getTagId() {
        return tagId;
    }

    public void setTagId(String tagId) {
        this.tagId = tagId;
    }

    public String getBlogId() {
        return blogId;
    }

    public void setBlogId(String blogId) {
        this.blogId = blogId;
    }

}