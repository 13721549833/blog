package com.itaka.blog.pojo;

import java.io.Serializable;

public class BlogWithBLOBs extends Blog implements Serializable {
    private String content;

    private String contentMd;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getContentMd() {
        return contentMd;
    }

    public void setContentMd(String contentMd) {
        this.contentMd = contentMd == null ? null : contentMd.trim();
    }
}