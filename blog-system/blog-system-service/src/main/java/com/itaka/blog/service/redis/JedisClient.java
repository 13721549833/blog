package com.itaka.blog.service.redis;

/**
 * 
 * ClassName: JedisClient <br/> 
 * Function: redis客户端接口 <br/> 
 * date: 2018年5月19日 下午4:30:09 <br/> 
 * 
 * @author Jerry
 * @version
 */
public interface JedisClient {

	/**
	 * 
	 * get: 返回key对应的value <br/>
	 *
	 * @author Jerry
	 * @param key
	 * @return
	 */
	String get(String key);
	
	/**
	 * 
	 * set: 将键key设定为指定的“字符串”值   <br/>
	 *
	 * @author Jerry
	 * @param key
	 * @param value
	 * @return
	 */
	String set(String key, String value);
	
	/**
	 * 
	 * set: 将键key设定为指定的“字符串”值,并设置失效时间 <br/>
	 *
	 * @author Jerry
	 * @param key
	 * @param value
	 * @param seconds
	 * @return
	 */
	String set(String key, String value, int seconds);
	
	/**
	 * 
	 * delete: 将键key从redis中移除 <br/>
	 *
	 * @author Jerry
	 * @param key
	 */
	void delete(String key);
	
	String hget(String key, String field);
	
	/**
	 * 
	 * exists: key是否存在 <br/>
	 *
	 * @author Jerry
	 * @param key
	 * @return
	 */
	Boolean exists(String key);
	
	Long hset(String key, String field, String value);
	
	/**
	 * 
	 * expire: 设置过期时间 <br/>
	 *
	 * @author Jerry
	 * @param key
	 * @param seconds
	 * @return
	 */
	Long expire(String key, int seconds);
	
	Long ttl(String key);
	
	Long incr(String key);
	
	Long hdel(String key, String... field);
}
