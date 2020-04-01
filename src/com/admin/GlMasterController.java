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
public class GlMasterController {

	@Autowired
	DBProcess dao;
	
	
	@RequestMapping(value="saveGL",method=RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> saveGLData(HttpServletRequest request,HttpServletResponse res)
	{
		HashMap<String,Object> data = new HashMap<String,Object>();
		 
		try {
			int _id = 0;
			if(request.getParameter("operation").equals("M"))
			_id=Integer.parseInt(request.getParameter("id").toString());
			
			data = saveData(request.getParameter("operation"),
				Integer.parseInt(request.getParameter("companyId").toString()),
				_id,
				request.getParameter("code"),
				request.getParameter("name"),
				Integer.parseInt(request.getParameter("groupId").toString()),
				Integer.parseInt(request.getParameter("subGroupId").toString()) ,
				request.getParameter("actFlag"),
				request.getParameter("glType"),
				request.getParameter("balsheetType"),
				request.getParameter("status"));
		}catch(Exception e) {e.printStackTrace();}
		System.out.println("data>>"+data);
		return data;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public HashMap<String,Object> saveData(String operation,int company,int id,String code,String name,int groupId,int subGroupId,String actFlag,
											String glType,String balsheetType,String status)
	{
		//System.out.println(operation+"~"+company+"~"+id+"~"+code+"~"+name+"~"+groupId+"~"+subGroupId+"~"+actFlag+"~"+glType+"~"+balsheetType+"~"+status);
		Map param = new HashMap<String,Object>();
		HashMap<String,Object> result = new HashMap<String,Object>(); 
		try {
		param.put("P_OPERATION",operation);		
        param.put("P_FAGM_COMPANY",company);  
        param.put("P_FAGM_ID",id);  
        param.put("P_FAGM_CODE",code);  
        param.put("P_FAGM_NAME",name);  
        param.put("P_FAGM_GROUP_ID",groupId);  
        param.put("P_FAGM_SUBGROUP_ID",subGroupId);  
        param.put("P_FAGM_ACT_FLAG",actFlag);  
        param.put("P_FAGM_GL_TYPE",glType);  
        param.put("P_BAL_SHEET_TYPE",balsheetType);  
        param.put("P_FAGM_STATUS",status);

        result = dao.executeProcedure("PKG_MASTERS", "TRANS_FA_GL_MST", param);
        System.out.println("result>>"+result);
		}catch(Exception e) {e.printStackTrace();}
		return result;
	}
}
