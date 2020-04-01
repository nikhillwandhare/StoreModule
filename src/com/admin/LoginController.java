package com.admin;


import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;

import com.dbprocess.DBProcess;
import com.google.gson.Gson;




@Controller
public class LoginController {

	@Autowired
	DBProcess dao;

	LoginModal modal = new LoginModal();
	Map<String, Object> data2;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> checklogin(HttpServletRequest request, HttpServletResponse response) {

		String userName = request.getParameter("userName");
		String userPass = request.getParameter("userPass");
		int userCompany = Integer.parseInt(request.getParameter("userCompany"));
		
		
		@SuppressWarnings("rawtypes")
		Map map = new HashMap();
		map.put("P_USER_NAME", userName);
		map.put("P_PASSWORD", userPass);
		map.put("P_COMPANY", userCompany);
		
		Map<String, Object> returnMap =  new HashMap<>();
		
		returnMap.put("result", dao.executeProcedure("", "PR_CHECK_USER_LOGIN", map));
		
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.putAll((Map<? extends String, ? extends Object>) returnMap.get("result"));
		
		Object retObj = resultMap.get("USER_DATA");
		Gson gson  = new Gson();
		gson.toJson(resultMap);
		
		System.out.println("gson"+gson);

		String _id = resultMap.get("USER_ID").toString();
		modal.setUserId(Integer.parseInt(_id));
		
				
		return returnMap;

	}

	
	@RequestMapping(value="setUserData", method = RequestMethod.POST)
	public @ResponseBody void setUserData(HttpServletRequest req,HttpServletResponse res)
	{
		modal.setUserCode(req.getParameter("userCode"));
		modal.setUserName(req.getParameter("userName"));
		modal.setUserCompanyId(Integer.parseInt(req.getParameter("companyId")));
		modal.setUserCompanyName(req.getParameter("companyName"));
		modal.setUserAddress(req.getParameter("userAddress"));
	}
	
	
	@RequestMapping(value="UserInfo", method=RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> userInfo()
	{
		HashMap<String,Object> userData = new HashMap<String,Object>();
		userData.put("userId", modal.getUserId());
		userData.put("userName", modal.getUserName());
		userData.put("companyId",modal.getUserCompanyId());
		userData.put("companyName",modal.getUserCompanyName());
		userData.put("userAddress",modal.getUserAddress());
		
		return userData;
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="HomePageData", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> callHome(HttpServletRequest req,HttpServletResponse res) throws JSONException {

		Map<String,Object> returnMap = new HashMap<>();
		Map<String,Object> map = new HashMap();
		//System.out.println("userId>"+modal.getUserId());
		map.put("P_USER_ID", modal.getUserId());
		returnMap.put("result", dao.executeProcedure("PKG_DASHBOARD","PR_DASHBOARD",map));
		returnMap.put("userInfo", modal);
		//System.out.println("Map>"+returnMap);
		
		return returnMap;
	}
	
	@RequestMapping("HomePage")
	public ModelAndView callHomePage() {
		ModelAndView obj = new ModelAndView();
		obj.setViewName("HomePage");
		obj.setView(modal);
		return obj;
	}
	
	@RequestMapping("ErrorPage")
	public ModelAndView callError() {
		ModelAndView obj = new ModelAndView();
		obj.setViewName("ErrorPage");
		return obj;
	}
	
	
	
}
