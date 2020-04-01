
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Object Master</title>
<style type="text/css">
table thead th{
	text-align: center;
    padding: 5px;
}

</style>
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
									<!-- <div class="inbox-email-menu-list">
										<div class="compose-email">
											<a><h4>Create New GL</h4></a>
										</div>
									</div> -->
									<nav class="navbar navbar-light" style="background:linear-gradient(to bottom, #ff9966 0%, #ffffff 100%); border:none !importent;">
  										<h4 style="padding-left: 30px;padding-top: 10px;">New GL</h4>
									</nav>
								</div>
							</div>
							<div class="row">
								<input type="hidden" id="operation"/>
								<input type="hidden" id="glId"/>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<label class="form-label">Type</label>
									<select id="type" name="type" class="form-control">
									</select>
								</div>
								<div class="col-lg-4">
									<label class="form-label">GL-Group</label>
									<select id="glGroup" name="glGroup" class="form-control">
									</select>
								</div>
								<div class="col-lg-4">
									<label class="form-label">Sub-Group</label>
									<select id="glSubGroup" name="glSubGroup" class="form-control">
									</select>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<label class="form-label">GL Code</label>
									<input type="text" class="form-control" id="glCode" name="glCode">
								</div>
								<div class="col-lg-8">
									<label class="form-label">GL Name</label>
									<input type="text" class="form-control" id="glName" name="glName">
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<label class="form-label">GL Type</label>
									<select class="form-control" id="glType" name="glType"></select>
								</div>
								<div class="col-lg-4">
									<div class="custom-control custom-checkbox" style="padding-top: 30px;">
									  	<input type="checkbox" class="custom-control-input" id="actFlag" value="N" name="actFlag" >
									  	<label class="custom-control-label" for="actFlag">Account Flag</label>
									</div>
								</div>
								<div class="col-lg-4">
									<label class="form-label">Status</label>
									<select class="form-control" id="glStatus" name="glStatus">
										<option value="E">Enable</option>
										<option value="D">Disable</option>
									</select>
								</div>
							</div>

							
							
							
							
							<div class="row">
								<div class="col-lg-9"></div>
								<div class="col-lg-3">
									<div class="login-button-pro">
										<button type="button" class="login-button login-button-rg"
											id="cancelBtn" onClick="closeForm()">Cancel</button>
										<button type="button" class="login-button login-button-lg"
											id="registerBtn" onClick="saveData()" disabled>Submit</button>
									</div>
								</div>
							</div>
						</div>
					</form> 
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="sparkline13-list shadow-reset">
						<div class="sparkline13-hd">
							<div class="main-sparkline13-hd">
								<nav class="navbar navbar-light" style="background:linear-gradient(to bottom, #ff9966 0%, #ffffff 100%); border:none !importent;">
  									<h4 style="padding-left: 30px;padding-top: 10px;">All GL's</h4>
								</nav>
								<!-- <div class="sparkline13-outline-icon">
                                	<span class="sparkline13-collapse-link"><i class="fa fa-chevron-up"></i></span>
                                    <span><i class="fa fa-wrench"></i></span>
                                    <span class="sparkline13-collapse-close"><i class="fa fa-times"></i></span>
                                 </div> -->
							</div>
						</div>
						<div class="sparkline13-graph">
							<div class="datatable-dashv1-list custom-datatable-overright">
								<div class="bootstrap-table">
									<table id="dtTable" class="table dtTable table-bordered">
										<thead>
											<tr>
												<th class="center">#</th>
												<th class="center">GROUP</th>
												<th class="center">SUB GROUP</th>
												<th class="center">TYPE</th>
												<th class="center">GL NAME</th>
												<th class="center">ACCOUNT FLAG</th>
												<th class="center">STATUS</th>
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
	</div>
	 		
	

	


	<!-- Register End-->
	<script type="text/javascript">
	
	var typeList = "";
	var glGroupList = "";
	var glSubGroupList = "";
	var glTypeList = "";
	
		$(function() {
			$("#operation").val("N");
			
			$('#contact-form').on('paste input change', function() {
				validateForm();
				var numOfInvalidFields = $('#contact-form').find('input.invalid').length + $('#contact-form').find('select.invalid').length + $('#contact-form').find('textarea.invalid').length;
				
				if(numOfInvalidFields==0){
					$('#registerBtn').prop('disabled',false);
				}else{
					$('#registerBtn').prop('disabled',true);
				}
			});
			
		
			
			$.ajax({
				url : "${pageContext.request.contextPath}/getRecordLst",
				type : 'post',
				dataType : 'json',
				async : false,
				data : {
					sqlMstId : 5,param : "null"
				},
				success : function(resp) {
            		var tbody="";
            		$.each(resp,function(i,row){
            			
            			tbody = tbody + '<tr><td>'+(i+1)+'<span class="whole-obj hide" id="_glId'+(i+1)+'">'+(row.FAGM_ID)+'</span><span class="whole-obj hide" id="_companyId'+(i+1)+'">'+(row.FAGM_COMPANY)+'</span><span class="whole-obj hide" id="_groupId'+(i+1)+'">'+(row.FAGM_GROUP_ID)+'</span><span class="whole-obj hide" id="_subGroupId'+(i+1)+'">'+(row.FAGM_SUBGROUP_ID)+'</span></td>'+
            			'<td id="_groupName'+(i+1)+'" >'+(row.FAGROUP_NAME)+' </td>'+
            			'<td id="_subGroupName'+(i+1)+'" >'+(row.FASGROUP_NAME)+'</td>          '+
            			'<td id="_Type'+(i+1)+'" >'+(row.BAL_SHEET_TYPE)+' </td>'+
            			'<td id="_glName'+(i+1)+'">'+(row.FAGM_NAME)+'</td>        '+
            			'<td id="_actFlag'+(i+1)+'">'+(row.FAGM_ACT_FLAG)+'</td>           '+
            			'<td id="_status'+(i+1)+'">'+(row.FAGM_STATUS)+' </td>'+
            			'<td><i class="fa small-icon fa-edit" onClick="setData('+(i+1)+')"></i><span class="whole-obj hide">'+(JSON.stringify(row))+'</span></td>'
            			'</tr>'; 
            		});
            		$(".dtTable tbody").empty().append(tbody);
					$(".dtTable").DataTable({
						destroy:true
					});
				}
			});
		
			$.ajax({
				url : "${pageContext.request.contextPath}/getRecordLst",
				type : 'post',
				dataType : 'json',
				async : false,
				data : {
					sqlMstId : 6,
					param : "null"
				},
				success : function(resp) {

					$.each(resp, function(key, val) {
						typeList = typeList
								+ "<option value='"+resp[key].CODE+"'>"
								+ resp[key].NAME + "</option>"
					});
				}
			});
			
			$("#type").append(typeList);
			
			$("#type").on('change',function(){
				$.ajax({
					url : "${pageContext.request.contextPath}/getRecordLst",
					type : 'post',
					dataType : 'json',
					async : false,
					data : {
						sqlMstId : 7,
						param : "'"+$("#type").val()+"'"
					},
					success : function(resp) {

						$.each(resp, function(key, val) {
							glGroupList = glGroupList
									+ "<option value='"+resp[key].FAGROUP_ID+"'>"
									+ resp[key].FAGROUP_NAME + "</option>"
						});
					}
				});
				$("#glGroup").empty().append(glGroupList);
				
			});
			
			
			$("#glGroup").on('change',function(){
				$.ajax({
					url : "${pageContext.request.contextPath}/getRecordLst",
					type : 'post',
					dataType : 'json',
					async : false,
					data : {
						sqlMstId : 8,
						param : $("#glGroup").val()
					},
					success : function(resp) {

						$.each(resp, function(key, val) {
							glSubGroupList = glSubGroupList
									+ "<option value='"+resp[key].FASGROUP_ID+"'>"
									+ resp[key].FASGROUP_NAME + "</option>"
						});
					}
				});
				$("#glSubGroup").empty().append(glSubGroupList);
				
			});
			
		
				$.ajax({
					url : "${pageContext.request.contextPath}/getRecordLst",
					type : 'post',
					dataType : 'json',
					async : false,
					data : {
						sqlMstId : 9,
						param : "null"
					},
					success : function(resp) {

						$.each(resp, function(key, val) {
							glTypeList = glTypeList
									+ "<option value='"+resp[key].FAGM_TYCODE+"'>"
									+ resp[key].FAGM_TYNAME + "</option>"
						});
					}
				});
				$("#glType").empty().append(glTypeList);
				
		
		});

	
		

		function validateForm() {
			$("#contact-form").validate({
				rules : {
					/* inName : {
						required : true,
						minlength : 2,
						maxlength : 100
					},
					inEmail : {
						required : true,
						email : true
					}, */
					type : {
						required : true
					}, 
					glGroup : {
						required : true
					},
					glSubGroup : {
						required : true
					},
					glCode : {
						required : true
					},
					glName : {
						required : true
					},
					glType : {
						required : true
					}
				},
				messages : {
					/* inName : {
						required : 'Please enter name',
						minlength : 'Please enter atleast 2 charachter',
						maxlength : 'Maximum 100 charachter allowed',
					},
					inEmail : {
						required : 'Please enter your email address',
						email : 'Please enter a VALID email address'
					}, */
					type : {
						required : 'Please select type'
					},
					glGroup : {
						required : 'Please select GL Group'
					},
					glSubGroup : {
						required : 'Please select Gl Sub Group'
					},
					glCode : {
						required : 'Please write GL Code'
					},
					glName : {
						required : "Please write GL Name"
					},
					glType : {
						required : "Please select GL Type"
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
					url : "${pageContext.request.contextPath}/saveGL",
					type : 'post',
					dataType : 'json',
					async : false,
					data : {
						operation: $("#operation").val(),
						id: $("#glId").val(),
						code: $("#glCode").val(),
						name: $("#glName").val(),
						groupId: $("#glGroup").val(),
						subGroupId: $("#glSubGroup").val(),
						actFlag: $("#actFlag").val(),
						glType: $("#glType").val(),
						balsheetType: $("#type").val(),
						status: $("#glStatus").val(),
						companyId:global_company_id
					},
					success : function(resp) {
						alert(resp.MESSAGE);
						 /* $.each(resp, function(key, val) {
							 alert(resp.MESSAGE);
						});  */
					}
				});
			}
		}
		
		function closeForm()
		{
			$('#PageArea').addClass('hide');
    		$('.innerDashboard').removeClass('hide');
		}
		
		function setData(key)
		{
			$("#operation").val("M");
			
		}
		
	</script>
</body>
</html>
