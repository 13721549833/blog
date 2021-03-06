package com.itaka.blog.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itaka.blog.mapper.LogMapper;
import com.itaka.blog.mapper.UserMapper;
import com.itaka.blog.pojo.Log;
import com.itaka.blog.pojo.User;
import com.itaka.blog.service.LoginService;
import com.itaka.blog.service.redis.JedisClient;
import com.itaka.blog.util.AESCryPTUtil;
import com.itaka.blog.util.DateUtil;
import com.itaka.blog.util.PropertiesUtils;
import com.itaka.blog.util.RandomIDUtil;

/**
 * 
 * ClassName: LoginServiceImpl <br/> 
 * Function: 注册、登录服务接口实现类 <br/> 
 * date: 2018年6月20日 下午9:13:39 <br/> 
 * 
 * @author Jerry
 * @version
 */
@Service
public class LoginServiceImpl implements LoginService{

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private LogMapper logMapper;
	
	@Autowired
	private JedisClient jedisClient;
	
	/**
	 * 密码加密密钥
	 */
	private String keyStr = PropertiesUtils.get("passwordStrAES");
	
	@Override
	@Transactional
	public void register(String username,String regIp,String password) {
		try {
			logger.info("======register======start======");
			int count = userMapper.getUserCountByUsername(username);
			if (count<=0) {
				User user = new User();
				user.setCreateTime(DateUtil.getTime());
				user.setUsername(username);
				user.setPassword(AESCryPTUtil.aesEncrypt(keyStr, password));
				user.setStatus("1");
				user.setRegIp(regIp);
				userMapper.insert(user);
			}else{
				logger.info("用户名已存在！");
				throw new RuntimeException("用户名已存在！");
			}
			logger.info("======register======end======");
		} catch (Exception e) {
			logger.error("======register======error======",e);
		}
	}

	@Override
	public boolean checkUsername(String username) {
		return this.userMapper.getUserCountByUsername(username)<=0;
	}

	@Override
	@Transactional
	public User login(String username, String password, String ip) {
		User user = null;
		try {
			logger.info("======login======start======");
			user = this.userMapper.loginByUsername(username,AESCryPTUtil.aesEncrypt(keyStr, password));
			if (user!=null) {
				Log log = new Log();
				log.setId(RandomIDUtil.getRandomID());
				log.setContent("用户登录");
				log.setMoudle("登录模块");
				log.setOperator(username);
				log.setIp(ip);
				log.setType("用户登录");
				log.setAddTime(DateUtil.getTime());
				logMapper.insert(log);
				//首次登陆，设置经验+10
				if (StringUtils.isEmpty(user.getLastLoginTime())) {
					user.setExperience(10);
				}
				user.setLastLoginIp(ip);
				user.setLastLoginTime(DateUtil.getTime());
				user.setUpdateTime(DateUtil.getTime());
				//首次登陆，设置登陆次数为1
				if (null == user.getLoginCount()){
					user.setLoginCount(1);
				}else{//否则先获取登陆次数，再加1
					user.setLoginCount(user.getLoginCount()+1);
				}
				// 更新用户登录信息
				userMapper.updateByPrimaryKeySelective(user);
				// 将用户信息放进缓存
				jedisClient.set("user_"+user.getUsername(), user,3600);
			}else{
				logger.info("用户名或密码错误！");
				throw new RuntimeException("用户名或密码错误！");
			}
		} catch (Exception e) {
			logger.error("======login======error======",e);
		}
		logger.info("======login======end======");
		return user;
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.LoginService#updatePasswordById(java.lang.String) 
	 */
	@Override
	@Transactional
	public int updateUser(String userId,String oldPwd, String newPwd) {
		User user = userMapper.selectByPrimaryKey(userId);
		int count = 0;
		try {
			if (null != user) {
				int result = userMapper.getUserCountByNameAndPwd(user.getUsername(), AESCryPTUtil.aesEncrypt(keyStr, oldPwd));
				if(result>0){
					logger.info("======updateUser======start======");
					user.setId(userId);
					user.setPassword(AESCryPTUtil.aesEncrypt(keyStr, newPwd));
					user.setUpdateTime(DateUtil.getTime());
					count = userMapper.updateByPrimaryKeySelective(user);
				}else{
					return count;
				}
				logger.info("======updateUser======end======");
			}
		} catch (Exception e) {
			logger.error("======updateUser======error======",e);
		}
		return count;
	}

}
