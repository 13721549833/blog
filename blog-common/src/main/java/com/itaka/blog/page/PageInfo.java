/** 
 * Project Name:blog-common 
 * File Name:PageInfo.java 
 * Package Name:com.itaka.blog.page 
 * Date:2018年6月26日下午2:54:29
 */
package com.itaka.blog.page;

import java.io.Serializable;
import java.util.List;

/** 
 * ClassName: PageInfo <br/> 
 * Function: 分页对象 <br/> 
 * date: 2018年6月26日 下午2:54:29 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public class PageInfo<E> implements Serializable{

	/** 
	 * serialVersionUID:
	 */ 
	private static final long serialVersionUID = 1L;
	//当前页
	private int pageNum;
	//每页的数量
    private int pageSize;
    //当前页的数量
    private int size;
    //当前页面第一个元素在数据库中的行号
    private int startRow;
    //当前页面最后一个元素在数据库中的行号
    private int endRow;
    //总记录数
    private int total;
    //总页数
    private int pages;
    //结果集
    private List<E> list;

    public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageSize() {
        return pageSize;
    }

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	public List<E> getList() {
		return list;
	}

	public void setList(List<E> list) {
		this.list = list;
	}

}
