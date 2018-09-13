package com.itaka.blog.manage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itaka.blog.aop.annotation.SysLogMessage;
import com.itaka.blog.constant.JurisdictionConstant;
import com.itaka.blog.jurisdiction.Jurisdiction;
import com.itaka.blog.manage.controller.base.BaseController;
import com.itaka.blog.pojo.Role;
import com.itaka.blog.pojo.SysMenu;
import com.itaka.blog.pojo.User;
import com.itaka.blog.service.LoginService;
import com.itaka.blog.service.MenuService;
import com.itaka.blog.service.RoleService;
import com.itaka.blog.util.LoginUtil;
import com.itaka.blog.util.ObjectUtil;
import com.itaka.blog.util.RandomNumberUtil;
import com.itaka.blog.util.Result;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/web/")
public class LoginAndMainController extends BaseController{
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private RoleService roleService;
	
	/**
	 * 
	 * toLogin: 登录页 <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	@RequestMapping("toLogin.do")
	public String toLogin(){
		return "system/login";
	}
	
	/**
	 * 
	 * login: 登录 <br/>
	 *
	 * @author Jerry
	 * @param request
	 * @param response
	 * @param username 用户名
	 * @param password 密码
	 * @param checkCode 验证码
	 * @return
	 */
	@PostMapping(value="login.do")
	@ResponseBody
	public Result login(HttpServletRequest request,HttpServletResponse response,
			String username,String password,String checkCode){
		logger.info("=======login方法=======start=======");
		Result result = new Result();
		try {
			String code = (String) request.getSession().getAttribute(JurisdictionConstant.SESSION_SECURITY_CODE);
			if (StringUtils.isEmpty(code)) {
				logger.info("验证码已失效，请刷新后再试！");
				result.setCode(102);
				result.setMsg("验证码已失效，请刷新再试！");
			}else if (!code.equalsIgnoreCase(checkCode)) {
				logger.info("输入的验证码为======={},图片验证码为======={}", checkCode, code);
				result.setCode(101);
				result.setMsg("验证码错误，请重新输入！");
			}else{
				User user = loginService.login(username, password, request.getRemoteAddr());
				if (user!=null) {
					Jurisdiction.getSession().setAttribute(JurisdictionConstant.SESSION_USER, user);
					UsernamePasswordToken token = new UsernamePasswordToken(username,password);
					Jurisdiction.getSubject().login(token);
					LoginUtil.saveCookie(request, response, user.getUsername());
					result.setCode(200);
					result.setMsg("登录成功！");
					logger.info("=======login方法=======end=======");
				}else{
					result.setCode(100);
					result.setMsg("用户不存在或该用户已被停用！");
				}
			}
		} catch (Exception e) {
			logger.error("=======登录异常======",e);
			result.setCode(-1);
			result.setMsg("网络异常，请稍后重试！");
		}
		logger.info("=======login方法=======end=======");
		return result;
	}
	
	@RequestMapping("system/{changeMenu}")
	public ModelAndView home(@PathVariable("changeMenu") String changeMenu, HttpServletRequest request,
			HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		try {
			Object userInfo = Jurisdiction.getSession().getAttribute(JurisdictionConstant.SESSION_USER);
			if (null != userInfo && ObjectUtil.noEmpty(userInfo)) {
				JSONObject json = JSONObject.fromObject(userInfo);
				String userId = json.getString("id");
				List<Role> roleList = roleService.getRoleListByUserId(userId);
				JSONArray roleData = JSONArray.fromObject(roleList);
				Jurisdiction.getSession().setAttribute(JurisdictionConstant.SESSION_USERROLE, roleData);
				//将用户名放入session
				Jurisdiction.getSession().setAttribute(JurisdictionConstant.SESSION_USERNAME, json.getString("username"));
				System.out.println("==============================");
				System.out.println("========="+roleData+"=========");
				// 菜单处理
				List<SysMenu> menuList = menuService.getMenuListByUserId(userId);
				Jurisdiction.getSession().setAttribute(JurisdictionConstant.SESSION_MENULIST, menuList);
				JSONArray menuData = JSONArray.fromObject(menuList);
				System.out.println("========="+menuData+"=========");
				System.out.println("==============================");
				mav.addObject("user", json);
				mav.addObject("menuList", menuData);
				mav.setViewName("system/"+changeMenu);
			}else{
				mav.setViewName("system/login");
			}
		} catch (Exception e) {
			logger.error("=======进入首页异常======",e);
			mav.setViewName("system/login");
		} 
		return mav;
	}
	
	/**
	 * 
	 * verifyCode: 登录页取图片验证码 <br/>
	 *
	 * @author Jerry
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "verifyCode.do")
	public void verifyCode(HttpServletRequest request, HttpServletResponse response) {
		try {
			logger.info("=======verifyCode方法 =======start=======");
			RandomNumberUtil rdnUtil = RandomNumberUtil.Instance();
			logger.info("验证码为======={}", rdnUtil.getString());
			// 将验证码放到session
			request.getSession().setAttribute(JurisdictionConstant.SESSION_SECURITY_CODE, rdnUtil.getString());
			ServletOutputStream out = response.getOutputStream();
			rdnUtil.getImageOps().writeTo(out);
		} catch (IOException e) {
			logger.error("=======获取验证码异常======",e);
		}
		logger.info("=======verifyCode方法 =======end=======");
	}
	
	/**
	 * 
	 * logout: 注销 <br/>
	 *
	 * @author Jerry
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@GetMapping("logout.do")
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException{
		logger.info("=======logout方法 =======start=======");
		Jurisdiction.getSession().removeAttribute(JurisdictionConstant.SESSION_USER);
		Jurisdiction.getSession().removeAttribute(JurisdictionConstant.SESSION_USERROLE);
		Jurisdiction.getSession().removeAttribute(JurisdictionConstant.SESSION_USERNAME);
		Jurisdiction.getSession().removeAttribute(JurisdictionConstant.SESSION_MENULIST);
		Jurisdiction.getSubject().logout();
		LoginUtil.clearCookie(request, response);
		response.sendRedirect(request.getContextPath() + "/web/toLogin.do");
		logger.info("=======logout方法 =======end=======");
	}
	
	/**
	 * 
	 * modifyPwdPage: 修改密码页 <br/>
	 *
	 * @author Jerry
	 * @return
	 */
	@RequestMapping("/modifyPwdPage.do")
	@SysLogMessage(logContent="修改密码",operatorMoudle="个人资料",operatorType="访问页面")
	public ModelAndView modifyPwdPage(){
		ModelAndView mv = new ModelAndView("system/user/modify_pwd");
		User user = getUser();
		mv.addObject("user", user);
		return mv;
	}
	
	/**
	 * 
	 * modifyPwd: 修改密码 <br/>
	 *
	 * @author Jerry
	 * @param id 用户id
	 * @param username 用户名
	 * @param password 密码
	 * @return
	 */
	@RequestMapping("/modifyPwd.do")
	@ResponseBody
	@SysLogMessage(logContent="修改密码",operatorMoudle="安全设置",operatorType="修改密码")
	public Result modifyPwd(String id,String oldPwd,String newPwd,String chkPwd){
		Result result = new Result();
		try {
			logger.info("======modifyPwd======start======");
			if (oldPwd.equals(newPwd)) {
				result.setCode(2);
				result.setMsg("新密码与旧密码不能相同！");
			}else if(!(newPwd.equals(chkPwd))){
				result.setCode(3);
				result.setMsg("两次输入密码不一致！");
			}else{
				int count = loginService.updateUser(id,oldPwd,newPwd);
				if (count>0) {
					result.setCode(1);
					result.setMsg("修改成功！");
				}else{
					result.setCode(0);
					result.setMsg("密码错误，请重新输入！");
				}
			}
		} catch (Exception e) {
			result.setCode(-1);
			result.setMsg("网络异常，密码修改失败！");
			logger.error("======modifyPwd======error======",e);
		}
		logger.info("======modifyPwd======end======");
		return result;
	}
}
