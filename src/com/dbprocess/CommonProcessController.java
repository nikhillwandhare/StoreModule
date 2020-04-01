package com.dbprocess;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommonProcessController {

	@Autowired
	CommonProcessDAO commonProcessDAO;
	
	public void setCommonProcessDAO(CommonProcessDAO commonProcessDAO) {
		this.commonProcessDAO = commonProcessDAO;
	}



	@RequestMapping(value = "/getRecordLst", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public @ResponseBody String getRecordList(HttpServletRequest request, HttpServletResponse res) {
		ModelAndView model = new ModelAndView();

		String sqlMstId = request.getParameter("sqlMstId");
		System.out.println("sqlMstId:::"+sqlMstId);
		String param = request.getParameter("param");

		System.out.println("Param:::"+param);

		String result = commonProcessDAO.getRecordList(sqlMstId, param);

		return result;

	}
}
