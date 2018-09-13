package com.itaka.blog.pojo;

import java.io.Serializable;
import java.util.Date;

public class Log implements Serializable {
	/** id */
	private String id;
	/** 操作人 */
	private String operator;
	/** 日志内容 */
	private String content;
	/** 操作模块 */
	private String moudle;
	/** 操作类型 */
	private String type;
	/** 操作ip */
	private String ip;
	/** 增加日期 */
	private String addTime;
	
	public Log(){}
    public Log(String id,String operator, String content, String moudle, String type, String ip, String addTime) {
		super();
		this.id = id;
		this.operator = operator;
		this.content = content;
		this.type = type;
		this.ip = ip;
		this.addTime = addTime;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMoudle() {
		return moudle;
	}

	public void setMoudle(String moudle) {
		this.moudle = moudle;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getAddTime() {
		return addTime;
	}

	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}

}