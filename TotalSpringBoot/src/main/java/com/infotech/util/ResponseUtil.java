package com.infotech.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.ResponseBody;

/*
 * Web servis isteklerine verilen cevapların bir standarda bağlanması açısından temel oluşturacak nesnemizdir.
 * 
 *  Gerekli durumlarda üzerinde deiğişiklikler yapılarak geliştirilebilir.
 *  
 * 
 */

public class ResponseUtil {

	public @ResponseBody Map<String, Object> createResponse(Object data,Boolean succes, String message) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (succes) {
			map.put("status", 200);
			map.put("message", message);
			map.put("data", data);
			map.put("succes", true);
		} else {
			map.put("status", 404);
			map.put("message", message);
			map.put("data", data);
			map.put("succes", false);
		}

		return map;
	}
	
}
