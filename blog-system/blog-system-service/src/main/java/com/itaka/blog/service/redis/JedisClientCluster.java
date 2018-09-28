package com.itaka.blog.service.redis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.itaka.blog.util.SerializeUtil;

import redis.clients.jedis.JedisCluster;

public class JedisClientCluster implements JedisClient{

	@Autowired
	private JedisCluster jedisCluster;
	
	@Override
	public String get(String key) {
		return jedisCluster.get(key);
	}

	@Override
	public String set(String key, String value) {
		return jedisCluster.set(key, value);
	}

	@Override
	public String set(String key, String value, int seconds) {
		String result = jedisCluster.set(key, value);
		jedisCluster.expire(key, seconds);
		return result;
	}
	
	@Override
	public String hget(String key, String field) {
		return jedisCluster.hget(key, field);
	}

	@Override
	public Boolean exists(String key) {
		return jedisCluster.exists(key);
	}

	@Override
	public Long hset(String key, String field, String value) {
		return jedisCluster.hset(key, field, value);
	}

	@Override
	public Long expire(String key, int seconds) {
		return jedisCluster.expire(key, seconds);
	}

	@Override
	public Long ttl(String key) {
		return jedisCluster.ttl(key);
	}

	@Override
	public Long incr(String key) {
		return jedisCluster.incr(key);
	}

	@Override
	public Long hdel(String key, String... field) {
		return jedisCluster.hdel(key, field);
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.redis.JedisClient#delete(java.lang.String) 
	 */
	@Override
	public void delete(String key) {
		jedisCluster.del(key);
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.redis.JedisClient#set(java.lang.String, java.lang.Object, int) 
	 */
	@Override
	public String set(String key, Object obj, int seconds) {
		String value = SerializeUtil.serialize(obj);
		String result = jedisCluster.set(key, value);
		jedisCluster.expire(key, seconds);
		return result;
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.redis.JedisClient#setList(java.lang.String, java.util.List, int) 
	 */
	@Override
	public void setList(String key, List<?> list, int seconds) {
		// TODO Auto-generated method stub
		
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.redis.JedisClient#getList(java.lang.String) 
	 */
	@Override
	public List<?> getList(String key) {
		// TODO Auto-generated method stub
		return null;
	}

}
