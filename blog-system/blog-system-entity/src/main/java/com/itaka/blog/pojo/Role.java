package com.itaka.blog.pojo;

import com.itaka.blog.base.BaseEntity;

public class Role extends BaseEntity {

    private String name;

    private String description;

    private String status;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}