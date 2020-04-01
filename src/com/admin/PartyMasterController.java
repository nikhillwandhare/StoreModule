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
public class PartyMasterController {

	@Autowired
	DBProcess dao;
	
	@RequestMapping(value="saveParty",method=RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> NewPartyTransaction(HttpServletRequest req,HttpServletResponse res)
	{
		HashMap<String,Object> data = new HashMap<String,Object>();
		
		
		  data = savePartyData(req.getParameter("operation"),
				  			  req.getParameter("operation").equals("M")?Integer.parseInt(req.getParameter("id")):0, 
				  			  req.getParameter("code"), req.getParameter("name"),
							  req.getParameter("address"), 
							  Integer.parseInt(req.getParameter("state")),
							  req.getParameter("contact_1"), 
							  req.getParameter("contact_2"),
							  req.getParameter("email"), 
							  Integer.parseInt(req.getParameter("partyType")),
							  req.getParameter("panNo"), 
							  req.getParameter("bankName_1"),
							  req.getParameter("accountNo_1"), 
							  req.getParameter("bankName_2"),
							  req.getParameter("accountNo_2"), 
							  Integer.parseInt(req.getParameter("gl")),
							  req.getParameter("status"),
							  Integer.parseInt(req.getParameter("companyId")),
							  req.getParameter("gstin_no"));
		 
		 
		 
		return data;
	}
	
	@SuppressWarnings("unchecked")
	public HashMap<String,Object> savePartyData(String operation,int id,String code,String name,String address,int state,String contact_1,String contact_2,
											    String email,int partyType,String panNo,String bankName_1,String accountNo_1,
											    String bankName_2,String accountNo_2,int gl,String status,int company,String gstin_no)
	{
		HashMap<String,Object> result = new HashMap<String,Object>();
		Map<String,Object> param = new HashMap<String,Object>();
		try {
			 param.put("P_OPERATION",operation);
			 param.put("P_ID",id);            
			 param.put("P_CODE",code);          
			 param.put("P_NAME",name);          
			 param.put("P_ADDRESS",address);       
			 param.put("P_STATE_ID",state);      
			 param.put("P_CONTACT_1",contact_1);     
			 param.put("P_CONTACT_2",contact_2 );    
			 param.put("P_EMAIL",email);         
			 param.put("P_PARTY_TYPE_ID",partyType); 
			 param.put("P_PAN_NO",panNo);        
			 param.put("P_BANK_NAME_1",bankName_1);   
			 param.put("P_ACCOUNT_NO_1",accountNo_1);  
			 param.put("P_BANK_NAME_2",bankName_2);   
			 param.put("P_ACCOUNT_NO_2",accountNo_2); 
			 param.put("P_GL",gl);            
			 param.put("P_STATUS",status);        
			 param.put("P_COMPANY",company);      
			 param.put("P_GSTIN_NO",gstin_no);      
          

			result = dao.executeProcedure("PKG_MASTERS", "TRANS_FA_ACT_MST", param);
			}catch(Exception e) {e.printStackTrace();}
		
		return result;
	}
	
}
