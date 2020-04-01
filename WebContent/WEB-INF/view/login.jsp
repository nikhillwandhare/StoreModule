<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <title> Welcome To CRDR</title>
	    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">
	    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	    <style>
	    .heading{
	    		text-align: center;
	    		background: coral;	
	    		font-family: fantasy;	
	    		padding-top: 20px;	
	    		padding-bottom: 20px;	
	    		font-size: x-large;
	    		}
	    .colour0{
    			padding-bottom: 50px;
    			padding-top: 50px;
	    		}
	    .colour1{
    			background: #5FEAB6;
    			padding-bottom: 20px;
    			padding-top: 20px;
    			width:80px;
	    		}
	    .colour2{
    			background: #FCEF00;
    			padding-bottom: 20px;
    			padding-top: 20px;
    			width:160px;
	    		}
	    .colour3{
    			background: #E56399;
    			padding-bottom: 20px;
    			padding-top: 20px;
    			width:240px;
	    		}
	    .colour4{
    			background: #D3A588;
    			padding-bottom: 20px;
    			padding-top: 20px;
    			width:320px;
	    		}
	    .colour5{
    			background: #ECE2D0;
    			padding-bottom: 20px;
    			padding-top: 20px;
    			width:400px;
	    		}
	    .colour6{
    			background: #FF8800;
    			padding-bottom: 20px;
    			padding-top: 20px;
    			width:480px;
	    		}
	    .colour7{
    			background: #264DFF;
    			padding-bottom: 20px;
    			padding-top: 20px;
    			width:560px;
	    		}
	    .colour8{
    			background: #FFE83D;
    			padding-bottom: 20px;
    			padding-top: 20px;
    			width:640px;
	    		}
	    .colour9{
    			background: #8700FF;
    			padding-bottom: 20px;
    			padding-top: 20px;
    			width:720px;
	    		}
	    

	    </style>  
    </head>
    <body>
        <header role="banner" class="heading" >
            <div>Enforcement Department</div>
        </header>
        <form>
            <div class="form-group">
                <div class="split left">
                    
                    <div class="colour0"></div>
                    <img src="${pageContext.request.contextPath}/resources/img/logo/cbi_1.png" style="padding-left: 150px; padding-top: 50px;"> 
                   <!--  <div class="colour1"></div>
                    <div class="colour2"></div>
                    <div class="colour3"></div>
                    <div class="colour4"></div>
                    <div class="colour5"></div>
                    <div class="colour6"></div>
                    <div class="colour7"></div>
                    <div class="colour8"></div>
                    <div class="colour9"></div>
                    <div class="colour10"></div> -->

                </div>
                <div class="split right">
                    <label class="form-label login-input" style="width:15%">Company Name</label>
                    <label class="form-label login-input _validation" id="companyLabel"></label>
                    <div class="form-group">
					    <select class="custom-select browser-default form-control login-input" id="companyList" required>
					      <option value="">Select Company</option>
					    </select>
				    </div>
                    
                    <label class="form-label login-input" style="width:15%">User Name</label>
                    <label class="form-label login-input  _validation" id="nameLabel"></label>
                    <input type="text" class="form-control login-input" id="userName">
                    <label class="login-input" style="width:20%">User Password</label>
                    <label class="form-label login-input  _validation" id="passLabel"></label>
                    <input type="password" class="form-control login-input" id="userPass">
                    <br>
                    <label class="form-label login-input  _validation" id="message"></label>
                    <div style="text-align: right; padding-right: 30%;">
                        <button type="button" class="btn btn-success" id="loginBtn" onClick="checkLogin()">Login</button>
                        <button type="button" class="btn btn-primary" onclick="openModal()">Register</button>
                    </div>
                </div>
            </div>
        </form>
        <!-- -------------------------------New Registration-------------------------------- -->
        <div class="modal" tabindex="-1" role="dialog" id="myModal">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">New Registration</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <label>User Name</label>
                <input class="form-control" id="userNameN" placeholder="User Name">
                <label>Address</label>
                <textarea class="form-control" id="userAddressN" placeholder="Address"></textarea>
                <label>Mobile No.</label>
                <input class="form-control" id="userMobileN">
                <label>E-Mail</label>
                <input type="email" class="form-control" id="userMailN">
                <label>Login Name</label>
                <input class="form-control" id="userLoginNameN">
                <label>Password</label>
                <input class="form-control" id="userPassword1N">
                <label>Confirm Password</label>
                <input type="password" class="form-control" id="userPassword2N">
                
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary">Save changes</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
        <!-- -------------------------------New Registration-------------------------------- -->      
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common.js"></script>
        <script>
        	var companyList = "";
	        $.ajax({
				url : "${pageContext.request.contextPath}/getRecordLst",
				type : 'post',
				dataType : 'json',
				async: false,
				data : {
					sqlMstId : 1,
					param : "null"
				},
				success : function(resp) {
					
	 				 $.each(resp,function(key,val){
	 					companyList = companyList + "<option value='"+resp[key].ADCM_ID+"'>"+resp[key].ADCM_NAME+"</option>";
					}); 				 
					
	 				 $("#companyList").append(companyList);
	 				 
				}
			});
        	
	        $("#companyList, #userName, #userPass").on('Change',function(){$("#message").text("");});
	        
            function checkLogin()
            {
            	$("#companyLabel").text("");
            	$("#nameLabel").text("");
            	$("#passLabel").text("");
            	$("#message").text("");
            	
            	if($("#companyList").val() == "")
            	{
            		$("#companyLabel").append("(Select Company*)");
            		$("#nameLabel").text("");
                	$("#passLabel").text("");
                	$("#message").text("");
            	}
            	else if($("#userName").val() == "")
            	{
                	$("#nameLabel").append("(Enter User Name*)");
                	$("#companyLabel").text("");
                	$("#passLabel").text("");
                	$("#message").text("");
            	}
            	else if($("#userPass").val() == ""){
            		$("#passLabel").append("(Enter User Password*)");
            		$("#companyLabel").text("");
            		$("#nameLabel").text("");
            		$("#message").text("");
            		}
            	else{
            	$.ajax({
            		url: "${pageContext.request.contextPath}/login",
                    type: 'post',
                    data: {
                        	userName : $("#userName").val(),
                        	userPass : $("#userPass").val(),
                        	userCompany : $("#companyList").val()
                    	  }, 
                    success: function (resp) {
                    	
                    	console.log('resp',resp);
                    	                    	
                    	if(resp.result.RESULT == "success"){
                    		var USER_DATAArr = resp.result.USER_DATA;

                    		  $.each(USER_DATAArr, function(i,obj){
                              	$.ajax({
                            		url: "${pageContext.request.contextPath}/setUserData",
                                    type: 'post',
                                    data: {
                                    		userCode : obj.ADUM_USER_CODE,
                                        	userName : obj.ADUM_USER_NAME,
                                        	userAddress : obj.ADCM_ADD1+", "+obj.ADCM_ADD2+", "+ obj.ADCM_ADD3,
                                        	companyId : obj.ADUM_COMPANY,
                                        	companyName : obj.ADCM_NAME
                                    	  }, 
                                    success: function (resp) {
                                    }
                              	});

                    			 
                    		}); 
                    		
                    		window.location.href = "${pageContext.request.contextPath}/HomePage";
                    	} 
                    	
                    },
                    error:function(resp){
                    	$("#message").append("Incorrect User Name or Password.");
                        //window.location.href = "${pageContext.request.contextPath}/ErrorPage";
                     }
            			
            	});
            	}
            }
            
        </script>
    </body>
</html>