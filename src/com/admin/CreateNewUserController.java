package com.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dbprocess.DBProcess;

@Controller
public class CreateNewUserController {

	@Autowired
	DBProcess dao;
	
	@RequestMapping(value="SaveUser", method = RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> saveUser(HttpServletRequest req,HttpServletResponse res)
	{
		HashMap<String,Object> data = new HashMap<String,Object>();
		data = saveUserData(req.getParameter("operation"), 
							Integer.parseInt(req.getParameter("companyId")), 
							req.getParameter("operation").equals("M") ? Integer.parseInt(req.getParameter("userId")):0,
							req.getParameter("userCode"), 
							req.getParameter("userName"), 
							req.getParameter("userPass"), 
							req.getParameter("userLevel"), 
							req.getParameter("fromDate"), 
							req.getParameter("toDate").length() == 0 ? null : req.getParameter("operation"), 
							req.getParameter("status"));
		return data;
	}
	
	
	public HashMap<String,Object> saveUserData(String operation,
												int company,
												int userId,
												String userCode,
												String userName,
												String userPass,
												String userLevel,
												String fromDate,
												String toDate,
												String status)
	{
		HashMap<String,Object> result = new HashMap<String,Object>();
		Map<String,Object> param = new HashMap<String,Object>();
		try {
			
			param.put("P_OPERATION",operation);
			param.put("P_ADUM_COMPANY",company);
			param.put("P_ADUM_USER_ID",userId);
			param.put("P_ADUM_USER_CODE",userCode);
			param.put("P_ADUM_USER_NAME",userName);
			param.put("P_ADUM_PASSWORD",userPass);
			param.put("P_ADUM_LEVEL",userLevel);
			param.put("P_ADUM_FRDT",fromDate);
			param.put("P_ADUM_TODT",toDate);
			param.put("P_ADUM_STATUS",status);
			param.put("P_ENTER_BY",userId);

			result = dao.executeProcedure("PKG_MASTERS", "TRANS_USER_MASTER", param);
			
			}catch(Exception e) {e.printStackTrace();}
		
		return result;
	}
}
