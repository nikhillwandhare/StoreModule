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
public class CreateNewFormController {

	
	@Autowired
	DBProcess dao;
	
	@SuppressWarnings({ "unchecked", "null", "rawtypes" })
	@RequestMapping(value="saveNewForm",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> saveNewForm(HttpServletRequest req,HttpServletResponse res)
	{
		
			
			LoginModal modal = new LoginModal();
			Map<String,Object> param = new HashMap();
			Map<String,Object> result = new HashMap<String,Object>();
			
			try {
			String operation;
				
			if(req.getParameter("formId").length() == 0)
			{
				operation = "N";
				}
			else {
				operation = "M";
			}
			
			int formId;
			if(req.getParameter("formId").length() != 0)
			{
				formId = Integer.parseInt(req.getParameter("formId"));
			}else {formId = 0;}
			
			String formType = req.getParameter("formType");
			int menuId   = req.getParameter("menuId").length() == 0? null : Integer.parseInt(req.getParameter("menuId"));
			String formName = req.getParameter("formName");
			String jspName  = req.getParameter("jspName");
			int order    = req.getParameter("order").length() == 0? null : Integer.parseInt(req.getParameter("order"));
			String status	= req.getParameter("formStatus");
			
			int userId		= modal.getUserId();
			
			
			param.put("P_OPERATION","N");
			param.put("P_ID",formId);   
			param.put("P_NAME",formName);   
			param.put("P_PARENT",menuId);   
			param.put("P_TYPE",formType);   
			param.put("P_STATUS",status);   
			param.put("P_SRNO",order);   
			param.put("P_JSP_NAME",jspName);   
			param.put("P_USER_ID",modal.getUserId());   
			param.put("P_ICON_CLASS","");

			result = dao.executeProcedure("PKG_MASTERS", "TRANS_OBJECT_MASTER", param);
			
			}catch(Exception e) {e.printStackTrace();}
			
		return result;
	}
	
	
	
}


                