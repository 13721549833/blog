/** 
 * Project Name:blog-manage-web 
 * File Name:UploadController.java 
 * Package Name:com.itaka.blog.manage.controller.base 
 * Date:2018年7月22日下午10:57:24
 */
package com.itaka.blog.manage.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itaka.blog.aop.annotation.SysLogMessage;
import com.itaka.blog.manage.controller.base.BaseController;
import com.itaka.blog.util.UploadUtil;

/** 
 * ClassName: UploadController <br/> 
 * Function: 文件上传 <br/> 
 * date: 2018年7月22日 下午10:57:24 <br/> 
 * 
 * @author Jerry
 * @version  
 */
@Controller
@RequestMapping("/web")
public class UploadController extends BaseController{

	/**
	 * 图片上传路径
	 */
	@Value("${IMAGE_SERVER_URL}")
	private String IMAGE_SERVER_URL;
	
	/**
	 * 
	 * upload: 文件上传 <br/>
	 *
	 * @author Jerry
	 * @param uploadFile 文件
	 * @return
	 */
	@RequestMapping(value="/upload.do",method=RequestMethod.POST)
	@ResponseBody
	@SysLogMessage(logContent="上传图片",operatorMoudle="图片上传",operatorType="用户操作")
	public Map<String, String> upload(@RequestParam("file") MultipartFile uploadFile){
		Map<String, String> result = new HashMap<>();
		try {
			logger.info("======upload======start======");
			// 接收上传的文件
			// 取扩展名
			String originalFilename = uploadFile.getOriginalFilename();
			String extName = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
			// 上传到图片服务器
			UploadUtil uploadUtil = new UploadUtil("classpath:properties/client.conf");
			String url = uploadUtil.uploadFile(uploadFile.getBytes(), extName);
			url = IMAGE_SERVER_URL + url;
			logger.info("======图片路径为："+url);
			result.put("code", "1");
			result.put("url", url);
			result.put("msg", "图片上传成功！");
			logger.info("======upload======end======");
		} catch (Exception e) {
			result.put("code", "-1");
			result.put("msg", "网络异常，上传失败！");
			logger.error("======upload======error======",e);
		}
		return result;
	}
}
