package com.itaka.blog.pojo;

import java.io.Serializable;

public class SysConfig implements Serializable {
    private String id;

    private String homeDesc;

    private String homeKeywords;

    private String domain;

    private String siteUrl;

    private String siteName;

    private String siteDesc;

    private String siteFavicon;

    private String staticWebSite;

    private String authorName;

    private String authorEmail;

    private String qq;

    private String weibo;

    private Boolean comment;

    private String createTime;

    private String updateTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getHomeDesc() {
        return homeDesc;
    }

    public void setHomeDesc(String homeDesc) {
        this.homeDesc = homeDesc == null ? null : homeDesc.trim();
    }

    public String getHomeKeywords() {
        return homeKeywords;
    }

    public void setHomeKeywords(String homeKeywords) {
        this.homeKeywords = homeKeywords == null ? null : homeKeywords.trim();
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain == null ? null : domain.trim();
    }

    public String getSiteUrl() {
        return siteUrl;
    }

    public void setSiteUrl(String siteUrl) {
        this.siteUrl = siteUrl == null ? null : siteUrl.trim();
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName == null ? null : siteName.trim();
    }

    public String getSiteDesc() {
        return siteDesc;
    }

    public void setSiteDesc(String siteDesc) {
        this.siteDesc = siteDesc == null ? null : siteDesc.trim();
    }

    public String getSiteFavicon() {
        return siteFavicon;
    }

    public void setSiteFavicon(String siteFavicon) {
        this.siteFavicon = siteFavicon == null ? null : siteFavicon.trim();
    }

    public String getStaticWebSite() {
        return staticWebSite;
    }

    public void setStaticWebSite(String staticWebSite) {
        this.staticWebSite = staticWebSite == null ? null : staticWebSite.trim();
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName == null ? null : authorName.trim();
    }

    public String getAuthorEmail() {
        return authorEmail;
    }

    public void setAuthorEmail(String authorEmail) {
        this.authorEmail = authorEmail == null ? null : authorEmail.trim();
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getWeibo() {
        return weibo;
    }

    public void setWeibo(String weibo) {
        this.weibo = weibo == null ? null : weibo.trim();
    }

    public Boolean getComment() {
        return comment;
    }

    public void setComment(Boolean comment) {
        this.comment = comment;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }
}