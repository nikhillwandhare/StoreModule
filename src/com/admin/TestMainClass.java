package com.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.ObjectMapper;

public class TestMainClass {

	public static void main(String[] args) throws Exception {
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("USER_DATA", "[{ADUM_COMPANY=11, ADCM_NAME=Niks Enterprises, ADCM_ADD1=Ayodhya Nagar, ADCM_ADD2=Nagpur, ADCM_ADD3=Maharashtra, ADCM_ADD4=null, ADUM_USER_ID=1, ADUM_USER_CODE=NIKS, ADUM_USER_NAME=Niks, ADUM_LEVEL=1, ADUM_FRDT=2019-04-01 00:00:00.0, ADUM_TODT=null}]");
		System.out.println(resultMap.get("USER_DATA").toString().replace("[", "").replace("]", "").replace("=", ":"));
		JSONObject arr = new JSONObject(resultMap.get("USER_DATA").toString().replace("[", "").replace("]", ""));
		System.out.println("jrr:"+arr);
		
		
	}

}
