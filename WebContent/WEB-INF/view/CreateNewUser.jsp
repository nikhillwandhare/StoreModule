<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Master</title>
</head>
<body>
	<div class="login-form-area mg-t-30 mg-b-15">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<form id="contact-form" class="contact-form">                            	
						<div class="login-bg">
							<div class="row">
								<div class="col-lg-12">
									<nav class="navbar navbar-light" style="background:linear-gradient(to bottom, #ff9966 0%, #ffffff 100%); border:none !importent;">
  										<h4 style="padding-left: 30px;padding-top: 10px;">New User</h4>
									</nav>
								</div>
							</div>
							<div class="row">
								<input type="hidden" id="user_id">
								<input type="hidden" id="operation">
							</div>
							<div class="row">
								<div class="col-lg-6">
									<label>User Code</label>
									<input type="text" class="form-control" name="userCode" id="userCode"/>
								</div>
								<div class="col-lg-6">
									<label>User Name</label>
									<input type="text" class="form-control" name="userName" id="userName"/>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<label class="form-label">Password</label>
									<input type="password" class="form-control" name="userPass" id="userPass"/>
								</div>
								<div class="col-lg-6">
									<label class="form-label">Status</label>
									<select class="form-control" id="status" name="status">
										<option value="E">Enable</option>
										<option value="D">Disable</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<label>From Date</label>
									<div class="login-input-area"> 
										<input type="text" id="fromDate" name="fromDate" class="hasDatepicker">
										<i class="fa fa-calendar login-user" aria-hidden="true"></i>
									</div>
								</div>
								<div class="col-lg-6">
									<label>To Date</label>
									<div class="login-input-area"> 
										<input type="text" id="toDate" name="toDate" class="hasDatepicker">
										<i class="fa fa-calendar login-user" aria-hidden="true"></i>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-9">
								</div>
								<div class="col-lg-3">
									<div class="login-button-pro">
										<button type="button" class="login-button login-button-rg" id="cancelBtn" name="cancelBtn" onClick="closeForm()">Cancel</button>
										<button type="button" class="login-button login-button-lg" id="registerBtn" name="registerBtn" disabled>Submit</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
						<div class="sparkline13-hd">
							<div class="main-sparkline13-hd">
								<nav class="navbar navbar-light" style="background:linear-gradient(to bottom, #ff9966 0%, #ffffff 100%); border:none !importent;">
  									<h4 style="padding-left: 30px;padding-top: 10px;">All Users</h4>
								</nav>
							</div>
						</div>
					<div class="sparkline13-graph">
						<div class="datatable-dashv1-list custom-datatable-overright">
							<div class="bootstrap-table">
								<table id="dtTable" class="table dtTable table-bordered">
									<thead>
										<tr>
											<th class="center">#</th>
											<th class="center">USER CODE</th>
											<th class="center">USER NAME</th>
											<th class="center">STATUS</th>
											<th class="center">PASSWORD</th>
											<th class="center">FROM DATE</th>
											<th class="center">TO DATE</th>
											<th class="center">#</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	$(function(){
		$("#fromDate").datepicker();
		$("#toDate").datepicker();
		
			$.ajax({
				url : "${pageContext.request.contextPath}/getRecordLst",
				type : 'post',
				dataType : 'json',
				async : false,
				data : {
					sqlMstId : 4,param : "null"
				},
				success : function(resp) {
					//console.log('resp tbl :',resp);
		    		var tbody="";
		    		$.each(resp,function(i,row){
		    			//console.log('i,row',i,row);
		    			tbody = tbody + '<tr><td>'+(i+1)+'<span class="whole-obj hide" id="userId'+(i+1)+'">'+(row.ADUM_USER_ID)+'</span></td>'+
		    			'<td id="userCode'+(i+1)+'">'+(row.ADUM_USER_CODE)+'</td>          '+
		    			'<td id="userName'+(i+1)+'">'+(row.ADUM_USER_NAME)+'</td>        '+
		    			'<td id="userStatus'+(i+1)+'">'+(row.ADUM_STATUS)+'</td>           '+
		    			'<td id="userPassword'+(i+1)+'">'+(row.ADUM_PASSWORD)+'</td> ' +
		    			'<td id="userFromDate'+(i+1)+'">'+(row.ADUM_FRDT)+'</td> ' +
		    			'<td id="userToDate'+(i+1)+'">'+(row.ADUM_TODT)+'</td> ' +
		    			'<td><i class="fa small-icon fa-edit" id="editBtn" onClick="setData('+(i+1)+')"></i><span class="whole-obj hide">'+(JSON.stringify(row))+'</span></td>'
		    			'</tr>'; 
		    		
		    		});
		    		$(".dtTable tbody").empty().append(tbody);
					$(".dtTable").DataTable({
						destroy:true
					});
				}
				});
			
			$('#contact-form').on('paste input change', function() {
				
				validateForm();
				var numOfInvalidFields = $('#contact-form').find('input.invalid').length + $('#contact-form').find('select.invalid').length + $('#contact-form').find('textarea.invalid').length;
				
				if(numOfInvalidFields==0){
					$('#registerBtn').prop('disabled',false);
				}else{
					$('#registerBtn').prop('disabled',true);
				}
			});
	});
	
	
	function validateForm() {
		
		
		$("#contact-form").validate({
			rules : {
				inName : {
					required : true,
					minlength : 2,
					maxlength : 100
				},
				inEmail : {
					required : true,
					email : true
				},
				userCode : {
					required : true
				}, 
				userName : {
					required : true
				},
				userPass : {
					required : true
				},
				status : {
					required : true
				},
				fromDate : {
					required : true
				},
			},
			messages : {
				inName : {
					required : 'Please enter name',
					minlength : 'Please enter atleast 2 charachter',
					maxlength : 'Maximum 100 charachter allowed',
				},
				inEmail : {
					required : 'Please enter your email address',
					email : 'Please enter a VALID email address'
				},
				userCode : {
					required : 'Please Enter Login User Code'
				},
				userName : {
					required : 'Please Enter User Name'
				},
				userPass : {
					required : 'Please Enter User Password'
				},
				status : {
					required : 'Please Select User Status'
				},
				fromDate : {
					required : "Please Select Login From Date"
				}
			},
			errorPlacement : function(error, element) {
				//console.log('element',element)
				$(element).closest('.form-group').find('small').html(error)
				//error.insertAfter(element.closest('.form-group').find('small'));
			},
			highlight: function(element, errorClass, validClass) {
			    $(element).addClass(errorClass).removeClass(validClass);
			    $(element.form).find("label[for=" + element.id + "]")
			      .addClass(errorClass);
			},
			unhighlight: function(element, errorClass, validClass) {
			    $(element).removeClass(errorClass).addClass(validClass);
			    $(element.form).find("label[for=" + element.id + "]")
			      .removeClass(errorClass);
			}
		}).form();
	}
	
	function saveData()
	{
		if(document.getElementById("registerBtn").enabled = true)
		{
			$.ajax({
				url : "${pageContext.request.contextPath}/SaveUser",
				type : 'post',
				dataType : 'json',
				async : false,
				data : {
					operation : $("#operation").val(),
					userId 	  : $("#user_id").val(),
					userCode  : $("#userCode").val(),
					userName  : $("#userName").val(),
					userPass  : $("#userPass").val(),
					userLevel : $("#userLevel").val(),
					fromDate  : $("#fromDate").val(),
					toDate    : $("#toDate").val(),
					status    : $("#status").val(),
					companyId : global_company_id
				},
				success : function(resp) {
					alert(resp.MESSAGE);
					 
				}
			});
		}
	}
	
	function setData(id)
	{
		$("#user_id").val($("#userId"+id).text());
		$("#userCode").val($("#userCode"+id).text());
		$("#userName").val($("#userName"+id).text());
		$("#userPass").val($("#userPassword"+id).text());
		$("#status").val($("#userStatus"+id).text());
		$("#fromDate").val($("#userFromDate"+id).text());
		$("#toDate").val($("#userToDate"+id).text());
		

	}
	
	function closeForm()
	{
		$('#PageArea').addClass('hide');
		$('.innerDashboard').removeClass('hide');
	}	

	
	</script>
	
</body>
</html>