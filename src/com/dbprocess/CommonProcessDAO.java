package com.dbprocess;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.dbprocess.ObjectMapperWrapper;

@Repository
public class CommonProcessDAO {

	@Autowired
	DBProcess dbProcess;
	
	
	public void setDbProcess(DBProcess dbProcess) {
		this.dbProcess = dbProcess;
	}



	public String getRecordList(String sqlMstId, String param) {
		ArrayList<String> resultList = new ArrayList<String>();
		JSONArray array = new JSONArray();
		String retMsg = "";
		String values = "";
		String result = "";
		String retResult = "";
		ObjectMapper om = ObjectMapperWrapper.getObjectMapper();
		//ArrayList list = new ArrayList();
		HashMap inputParaList = new HashMap<>();
		inputParaList.put("Pi_Sql_Mst_Id", sqlMstId);
		inputParaList.put("Pi_Sql_Param", param);
		
		System.out.println("inputParaList"+inputParaList);
		@SuppressWarnings("unchecked")
		HashMap<String, Object> cst = dbProcess.executeProcedure("", "Pr_Exec_Sql", inputParaList);
		Set outResult = cst.entrySet();
		//System.out.println("cst SIZE " + cst.size()+" & CST "+cst);
		Iterator resItr = outResult.iterator();

		while (resItr.hasNext()) {
			Map.Entry me = (Map.Entry) resItr.next();
			String getKey = me.getKey().toString();
			 
			
			if (getKey.equalsIgnoreCase("Po_Error")) {
				retMsg = (null == me.getValue()) ? "" : me.getValue().toString();
			}
			if (getKey.equalsIgnoreCase("Po_Msg")) {
				retMsg = (null == me.getValue()) ? "" : me.getValue().toString();
			}
			if (getKey.equalsIgnoreCase("poc_sql_result")) {

				List list = (List) me.getValue();
				System.out.println("List------------"+list);
				try {
					//System.out.println("ls "+om.writeValueAsString(list));
					return om.writeValueAsString(list);
				} catch (JsonProcessingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
		return array.toString();
}
}
