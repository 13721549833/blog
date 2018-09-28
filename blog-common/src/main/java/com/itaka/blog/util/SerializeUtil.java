/** 
 * Project Name:blog-common 
 * File Name:SerializeUtil.java 
 * Package Name:com.itaka.blog.util 
 * Date:2018年9月14日上午9:55:40
 */
package com.itaka.blog.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.codec.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/** 
 * ClassName: SerializeUtil <br/> 
 * Function: 序列化工具 <br/> 
 * date: 2018年9月14日 上午9:55:40 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public class SerializeUtil {
	
	private static Logger logger = LoggerFactory.getLogger(SerializeUtil.class);

	/**
	 * 反序列化
	 * @param str 待序列化的字符串
	 * @return
	 */
	public static Object deserialize(String str) {
		ByteArrayInputStream bis = null;
		ObjectInputStream ois = null;
		try {
			if (StringUtils.isEmpty(str)) {
				return  null;
			}
			bis = new ByteArrayInputStream(Base64.decode(str));
			ois = new ObjectInputStream(bis);
			return ois.readObject();
		} catch (Exception e) {
			throw new RuntimeException("deserialize session error", e);
		} finally {
			try {
				if(ois != null) {
					ois.close();
				}
				if (bis != null) {
					bis.close();
				}
			} catch (IOException e) {
				logger.error("反序列化字符串异常",e);
			}

		}
	}

	/**
	 * 对象序列化
	 * @param obj 待序列化的对象
	 * @return
	 */
	public static String serialize(Object obj) {
		ByteArrayOutputStream bos = null;
		ObjectOutputStream oos = null;
		try {
			bos = new ByteArrayOutputStream();
			oos = new ObjectOutputStream(bos);
			oos.writeObject(obj);
			return Base64.encodeToString(bos.toByteArray());
		} catch (Exception e) {
			throw new RuntimeException("serialize session error", e);
		} finally {
			try {
				oos.close();
				bos.close();
			} catch (IOException e) {
				logger.error("序列化字符串异常",e);
			}

		}
	}
	
	/**
	 * 
	 * serializeList: 序列化list集合 <br/>
	 *
	 * @author Jerry
	 * @param list
	 * @return
	 */
	public static byte[] serializeList(List<?> list) {
        if (list == null || list.size() == 0) {
            return null;
        }
        ObjectOutputStream oos = null;
        ByteArrayOutputStream baos = null;
        byte[] bytes = null;
        try {
            baos = new ByteArrayOutputStream();
            oos = new ObjectOutputStream(baos);
            for (Object obj : list) {
                oos.writeObject(obj);
            }
            bytes = baos.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(oos);
            close(baos);
        }
        return bytes;
    }
	
	/**
	 * 
	 * unserializeList: 反序列化list集合 <br/>
	 *
	 * @author Jerry
	 * @param bytes
	 * @return
	 */
	public static List<?> unserializeList(byte[] bytes) {
        if (bytes == null) {
            return null;
        }
        List<Object> list = new ArrayList<Object>();
        ByteArrayInputStream bais = null;
        ObjectInputStream ois = null;
        try {
            // 反序列化
            bais = new ByteArrayInputStream(bytes);
            ois = new ObjectInputStream(bais);
            while (bais.available() > 0) {
                Object obj = (Object) ois.readObject();
                if (obj == null) {
                    break;
                }
                list.add(obj);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(bais);
            close(ois);
        }
        return list;
    }
	
	/**
	 * 
	 * close: 关闭io流 <br/>
	 *
	 * @author Jerry
	 * @param closeable
	 */
	public static void close(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
	
}
