/** 
 * Project Name:blog-manage-web 
 * File Name:TaskDemo.java 
 * Package Name:com.itaka.blog.task 
 * Date:2018年8月3日下午11:12:04
 */
package com.itaka.blog.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/** 
 * ClassName: TaskDemo <br/> 
 * Function:  <br/> 
 * date: 2018年8月3日 下午11:12:04 <br/> 
 * 
 * @author Jerry
 * @version  
 */
@Component
public class TaskDemo {

	//@Scheduled(cron="0/5 * *  * * ? ")
	public void test(){
		//System.out.println("===定时任务执行了===");
	}
}
