package com.admin;

import org.json.JSONArray;

public class LoginModal {
	public int userId;
	public String userCode;
	public String userName;
	public String userAddress;
	public int userCompanyId;
	public String userCompanyName;
	public String loginStatus;
	public JSONArray moduleList;
	public JSONArray formList;
	
	
	public JSONArray getModuleList() {
		return moduleList;
	}
	public void setModuleList(JSONArray moduleList) {
		this.moduleList = moduleList;
	}
	public JSONArray getFormList() {
		return formList;
	}
	public void setFormList(JSONArray formList) {
		this.formList = formList;
	}
	public String getLoginStatus() {
		return loginStatus;
	}
	public void setLoginStatus(String loginStatus) {
		this.loginStatus = loginStatus;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public int getUserCompanyId() {
		return userCompanyId;
	}
	public void setUserCompanyId(int userCompanyId) {
		this.userCompanyId = userCompanyId;
	}
	public String getUserCompanyName() {
		return userCompanyName;
	}
	public void setUserCompanyName(String userCompanyName) {
		this.userCompanyName = userCompanyName;
	}
	
}
