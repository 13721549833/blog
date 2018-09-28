package com.itaka.blog.util;

import java.io.Serializable;

/**
 * 
 * ClassName: Result <br/> 
 * Function: 返回结果工具类 <br/> 
 * date: 2018年6月20日 下午7:47:56 <br/> 
 * 
 * @author Jerry
 * @version @param <T>
 */
public class Result implements Serializable {

	/**
	 * serialVersionUID:
	 */
	private static final long serialVersionUID = -6637559235820394488L;

	/** 返回码  */
	private int code = 0;
	/** 提示信息  */
	private String msg;
	private int count;
	/** 数据  */
	private Object data;
	
	public Result(){}
	public Result(int code){
		this.code = code;
	}
	public Result(int code,String msg){
		this.code = code;
		this.msg = msg;
	}

	public static Result Success(Object data) {
		Result result = new Result(); 
		result.setCode(200);
		result.setMsg("成功！");
		return result;
	}
	
	public static Result Success() {
		return Success(null);
	}
	
	public static Result fail(int code, String msg) {
		Result result = new Result(); 
		result.setCode(100);
		result.setMsg(msg);
		return result;
	}
	
	public Result(int code, String msg, Object data) {
		this.code = code;
		this.msg = msg;
		this.data = data;
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}

}
