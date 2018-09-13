/** 
 * Project Name:blog-common 
 * File Name:DateSerializer.java 
 * Package Name:com.itaka.blog.serializer 
 * Date:2018年6月27日下午3:26:41
 */
package com.itaka.blog.serializer;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

/** 
 * ClassName: DateSerializer <br/> 
 * Function: 日期格式序列化 <br/> 
 * date: 2018年6月27日 下午3:26:41 <br/> 
 * 
 * @author Jerry
 * @version  
 */
public class DateSerializer extends JsonSerializer<Date> {

	/** 
	 * Function : 
	 * @see com.fasterxml.jackson.databind.JsonSerializer#serialize(java.lang.Object, com.fasterxml.jackson.core.JsonGenerator, com.fasterxml.jackson.databind.SerializerProvider) 
	 */
	@Override
	public void serialize(Date date, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        jsonGenerator.writeString(sdf.format(date));
	}

}
