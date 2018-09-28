package com.itaka.blog.service.redis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.itaka.blog.util.SerializeUtil;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class JedisClientPool implements JedisClient{

	@Autowired
	private JedisPool jedisPool;
	
	@Override
	public String get(String key) {
		Jedis jedis = jedisPool.getResource();
		String result = jedis.get(key);
		jedis.close();
		return result;
	}

	@Override
	public String set(String key, String value) {
		Jedis jedis = jedisPool.getResource();
		String result = jedis.set(key, value);
		jedis.close();
		return result;
	}

	@Override
	public String set(String key, String value, int seconds) {
		Jedis jedis = jedisPool.getResource();
		String result = jedis.set(key, value);
		jedis.expire(key, seconds);
		jedis.close();
		return result;
	}
	
	@Override
	public String hget(String key, String field) {
		Jedis jedis = jedisPool.getResource();
		String result = jedis.hget(key, field);
		jedis.close();
		return result;
	}

	@Override
	public Boolean exists(String key) {
		Jedis jedis = jedisPool.getResource();
		Boolean result = jedis.exists(key);
		jedis.close();
		return result;
	}

	@Override
	public Long hset(String key, String field, String value) {
		Jedis jedis = jedisPool.getResource();
		Long result = jedis.hset(key, field, value);
		jedis.close();
		return result;
	}

	@Override
	public Long expire(String key, int seconds) {
		Jedis jedis = jedisPool.getResource();
		Long result = jedis.expire(key, seconds);
		jedis.close();
		return result;
	}

	@Override
	public Long ttl(String key) {
		Jedis jedis = jedisPool.getResource();
		Long result = jedis.ttl(key);
		jedis.close();
		return result;
	}

	@Override
	public Long incr(String key) {
		Jedis jedis = jedisPool.getResource();
		Long result = jedis.incr(key);
		jedis.close();
		return result;
	}

	@Override
	public Long hdel(String key, String... field) {
		Jedis jedis = jedisPool.getResource();
		Long result = jedis.hdel(key, field);
		jedis.close();
		return result;
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.redis.JedisClient#delete(java.lang.String) 
	 */
	@Override
	public void delete(String key) {
		Jedis jedis = jedisPool.getResource();
		jedis.del(key);
		jedis.close();
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.redis.JedisClient#set(java.lang.String, java.lang.Object, int) 
	 */
	@Override
	public String set(String key, Object obj, int seconds) {
		String value = SerializeUtil.serialize(obj);
		Jedis jedis = jedisPool.getResource();
		String result = jedis.set(key, value);
		jedis.expire(key, seconds);
		jedis.close();
		return result;
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.redis.JedisClient#setList(java.lang.String, java.util.List, int) 
	 */
	@Override
	public void setList(String key, List<?> list, int seconds) {
		Jedis jedis = jedisPool.getResource();
		try {
            if(null == list || list.size() == 0){
            	//如果list为空,则设置一个空
                jedis.set(key.getBytes(), "".getBytes());
                jedis.expire(key.getBytes(), seconds);
            }else{
                jedis.set(key.getBytes(), SerializeUtil.serializeList(list));
                jedis.expire(key.getBytes(), seconds);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jedis.close();
        }
	}

	/** 
	 * Function : 
	 * @see com.itaka.blog.service.redis.JedisClient#getList(java.lang.String) 
	 */
	@Override
	public List<?> getList(String key) {
		Jedis jedis = jedisPool.getResource();
        if(null == jedis || !jedis.exists(key)){
            return null;
        }
        byte[] data = jedis.get(key.getBytes());        
        jedis.close();
        return SerializeUtil.unserializeList(data);
	}
	
}
