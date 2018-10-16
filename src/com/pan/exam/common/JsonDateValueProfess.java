package com.pan.exam.common;

import java.util.Date;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class JsonDateValueProfess implements JsonValueProcessor {

	@Override
	public Object processArrayValue(Object arg0, JsonConfig arg1) {
		return process(arg0);
	}

	@Override
	public Object processObjectValue(String arg0, Object arg1, JsonConfig arg2) {
		return process(arg1);
	}
	
	private String process(Object value) {
		
		if(!(value instanceof Date)) {
			return "";
		}
		Date v = (java.sql.Date)value;
		
		return String.valueOf(v.getTime());
		
		
		
		
	}

}
