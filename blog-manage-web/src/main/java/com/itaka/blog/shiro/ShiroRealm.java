package com.itaka.blog.shiro;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import com.itaka.blog.pojo.Role;
import com.itaka.blog.pojo.SysMenu;
import com.itaka.blog.pojo.User;
import com.itaka.blog.service.MenuService;
import com.itaka.blog.service.RoleService;
import com.itaka.blog.service.UserService;

/**
 * 
 * ClassName: ShiroRealm <br/>
 * Function: shiro安全框架验证域 <br/>
 * date: 2018年6月25日 下午5:26:50 <br/>
 * 
 * @author Jerry
 * @version
 */
public class ShiroRealm extends AuthorizingRealm {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	/**
	 * 
	 * Function 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用,负责在应用程序中决定用户的访问控制的方法: 
	 * @see org.apache.shiro.realm.AuthorizingRealm#doGetAuthorizationInfo(org.apache.shiro.subject.PrincipalCollection)
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection collection) {
		logger.info("---class:ShiroRealm---doGetAuthorizationInfo()---start---");
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		String username = (String) SecurityUtils.getSubject().getPrincipal();
		logger.info("======用户信息为======："+username);
		User user = userService.getUserByUsername(username);
		if (null == user) {
			return info;
		}
		// 查询该用户所拥有的角色
		List<Role> roleList = roleService.getRoleListByUserId(user.getId());
		List<SysMenu> menuList = new ArrayList<>();
		for (Role role : roleList) {
			// 查询该角色所拥有的菜单权限
			menuList = menuService.getMenuListByRoleId(role.getId());
		}
		StringBuilder sb = new StringBuilder();
		String permissions = null;
		if (!CollectionUtils.isEmpty(menuList)) {
			Set<String> permissionSet = new HashSet<>();
			// 遍历菜单权限
			for (SysMenu menu : menuList) {
				String permission = null;
				if (!StringUtils.isEmpty(permission = menu.getPermission())) {
					permissionSet.addAll(Arrays.asList(permission.trim().split(",")));
				}
			}
			// 将权限添加到shiro里
			info.setStringPermissions(permissionSet);
			for (String per : permissionSet) {
				sb.append(per);
				sb.append(",");
			}
			// 这里只是为了方便查看用户权限，并无其他作用
			permissions = sb.toString();
			if (StringUtils.isNotBlank(permissions) && permissions.endsWith(",")) {
				permissions = permissions.substring(0, permissions.length() - 1);
			}
			logger.info("---用户权限---："+permissions);
		}
		logger.info("---class:ShiroRealm---doGetAuthorizationInfo()---end---");
		return info;
	}

	/**
	 * 
	 * Function 登录信息和用户验证信息验证: 
	 * @see org.apache.shiro.realm.AuthenticatingRealm#doGetAuthenticationInfo(org.apache.shiro.authc.AuthenticationToken)
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
		logger.info("---class:ShiroRealm---doGetAuthenticationInfo()---start---");
		// 取到用户名
		String userName = (String)authenticationToken.getPrincipal();
		// 取到密码
		String password = new String((char[])authenticationToken.getCredentials());
		// 校验用户名密码
		if(StringUtils.isNotEmpty(userName) && StringUtils.isNotEmpty(password)){
			logger.info("---class:ShiroRealm---doGetAuthenticationInfo()---end---");
    	    return new SimpleAuthenticationInfo(userName, password, getName());
        }else{
    	    throw new AuthenticationException();
        }
	}

}
