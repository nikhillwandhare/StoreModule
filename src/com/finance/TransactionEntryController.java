package com.finance;

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
public class TransactionEntryController {

	@Autowired
	DBProcess dao;
	
	@RequestMapping(value="transactionEntry", method = RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> TransactionEntry(HttpServletRequest req, HttpServletResponse res)
	{
		HashMap<String,Object> data = new HashMap<String,Object>();
		data=saveTransaction(req.getParameter("operation"),
							req.getParameter("operation").equals("M") ? Integer.parseInt(req.getParameter("tranId")) : 0);
		return data;
	}
	
	public HashMap<String,Object> saveTransaction(String operation,int tranId)
	{
		HashMap<String,Object> result = new HashMap<String,Object>();
		Map<String,Object> param = new HashMap<String,Object>();
		try {
			
			result = dao.executeProcedure("", "", param);
		}catch(Exception e) {e.printStackTrace();}
		return result;
	}
}
