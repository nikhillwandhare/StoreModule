package com.admin;

import java.util.HashMap;
import java.util.Map;

import javax.json.Json;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;

import com.google.gson.JsonObject;

@Controller
public class Dashboard {

	
	@RequestMapping("login")
	public ModelAndView callError() {
		ModelAndView obj = new ModelAndView();
		obj.setViewName("login");
		return obj;
	}
	
	@RequestMapping("CreateNewForm")
	public ModelAndView callObjectMaster() {
		ModelAndView obj = new ModelAndView();
		obj.setViewName("CreateNewForm");
		return obj;
	}

	@RequestMapping("CreateNewUser")
	public ModelAndView callUserMaster() {
		ModelAndView obj = new ModelAndView();
		obj.setViewName("CreateNewUser");
		return obj;
	}

	@RequestMapping("GlGroupMaster")
	public ModelAndView callGlGroupMaster() {
		ModelAndView obj = new ModelAndView();
		obj.setViewName("GlGroupMaster");
		return obj;
	}
	
	@RequestMapping("GlSubGroupMaster")
	public ModelAndView callGlSubGroupMaster() {
		ModelAndView obj = new ModelAndView();
		obj.setViewName("GlSubGroupMaster");
		return obj;
	}
	
	@RequestMapping("GlMaster")
	public ModelAndView callGlMaster() {
		ModelAndView obj = new ModelAndView();
		obj.setViewName("GlMaster");
		return obj;
	}
	
	@RequestMapping("AccountMaster")
	public ModelAndView callAccountMaster() {
		ModelAndView obj = new ModelAndView();
		obj.setViewName("AccountMaster");
		return obj;
	}
	
	@RequestMapping("PurchaseBill")
	public ModelAndView callPurchaseBill() {
		ModelAndView obj = new ModelAndView();
		obj.setViewName("PurchaseBill");
		return obj;
	}
	
	@RequestMapping("SaleBill")
	public ModelAndView callSaleBill() {
		ModelAndView obj = new ModelAndView();
		obj.setViewName("SaleBill");
		return obj;
	}
	
	@RequestMapping("TransactionEntry")
	public ModelAndView callTransactionEntry() {
		ModelAndView obj = new ModelAndView();
		obj.setViewName("TransactionEntry");
		return obj;
	}
}
