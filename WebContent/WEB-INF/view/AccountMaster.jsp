
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
									<nav class="navbar navbar-light" style="background:linear-gradient(to bottom, #ff9966 0%, #ffffff 100%); border:none !importent;">
  										<h4 style="padding-left: 30px;padding-top: 10px;">New Account</h4>
									</nav>
								</div>
							</div>
							<div class="row">
								<input type="hidden" id="operation">
								<input type="hidden" id="partyId">
							</div>
							<div class="row">
								<div class="col-lg-4">
									<label class="form-label">Party Type</label>
									<select id="partyType" name="partyType" class="form-control"> </select>
								</div>
								<div class="col-lg-8">
									<label class="form-label">Under GL</label>
									<select id="gl" name="gl" class="form-control"> </select>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<label class="form-label">Party Code</label>
									<input id="code" name="code" class="form-control"> 
								</div>
								<div class="col-lg-8">
									<label class="form-label">Party Name</label>
									<input id="name" name="name" class="form-control"> 
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<label class="form-label">State</label>
									<select id="state" name="state" class="form-control"> </select>
								</div>
								<div class="col-lg-8">
									<label class="form-label">Address</label>
									<textarea rows="2" cols="50" id="address" name="address" class="form-control"></textarea>
								</div>
							</div>
							
							<div class="row">
								<div class="col-lg-4">
									<label class="form-label">Bank Name - 1</label>
									<input id="bankName_1" name="bankName_1" class="form-control"> 
								</div>
								<div class="col-lg-8">
									<label class="form-label">Account Number</label>
									<input id="accountNo_1" name="accountNo_1" class="form-control"> 
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<label class="form-label">Bank Name - 2</label>
									<input id="bankName_2" name="bankName_2" class="form-control"> 
								</div>
								<div class="col-lg-8">
									<label class="form-label">Account Number</label>
									<input id="accountNo_2" name="accountNo_2" class="form-control"> 
								</div>
							</div>
							
							<div class="row">
								<div class="col-lg-4">
									<label class="form-label">Contact No. - 1</label>
									<div class="login-input-area">
                                    	<input type="text" name="contactNo_1" id="contactNo_1">
                                        <i class="fa fa-phone login-user" aria-hidden="true"></i>
                                    </div> 
								</div>
								<div class="col-lg-4">
									<label class="form-label">Contact No. - 2</label>
									<div class="login-input-area">
                                    	<input type="text" id="contactNo_2" name="contactNo_2">
                                        <i class="fa fa-phone login-user" aria-hidden="true"></i>
                                    </div> 
								</div>
								<div class="col-lg-4">
									<label class="form-label">Email</label>
									<div class="login-input-area">
										<input type="email" id="email" name="email">
										<i class="fa fa-envelope login-user" aria-hidden="true"></i>
									</div> 
								</div>
							</div>
							
							<div class="row">
								<div class="col-lg-4">
									<label class="form-label">PAN No.</label>
									<input id="panNo" name="panNo" class="form-control"> 
								</div>
								<div class="col-lg-4">
									<label class="form-label">GSTIN No.</label>
									<input id="gstinNo" name="gstinNo" class="form-control"> 
								</div>
								<div class="col-lg-4">
									<label class="form-label">Status</label>
									<select id="status" name="status" class="form-control">
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
  									<h4 style="padding-left: 30px;padding-top: 10px;">All Accounts</h4>
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
												<th class="center">Party Type</th>
												<th class="center">Party Code</th>
												<th class="center">Party Name</th>
												<th class="center">GL</th>
												<th class="center">State</th>
												<th class="center">GSTIN</th>
												<th class="center">Status</th>
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
		
		var partyTypeList = "";
		var glList = "";
		var stateList = "";
		
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
					sqlMstId : 11,param : "null"
				},
				success : function(resp) {
            		var tbody="";
            		$.each(resp,function(i,row){
            			
            			tbody = tbody + '<tr><td>'+(i+1)+'<span class="whole-obj hide" id="_id'+(i+1)+'">'+(row.ID)+'</span>'+
            											 '<span class="whole-obj hide" id="_glid'+(i+1)+'" val="'+(row.GL_ID)+'"></span>'+
            											 '<span class="whole-obj hide" id="_state'+(i+1)+'" val="'+row.STATE_ID+'"></span>'+
            											 '<span class="whole-obj hide" id="_partyType'+(i+1)+'" val="'+row.PARTY_TYPE_ID+'"></span>'+
            						            			'<span class="whole-obj hide" id="_email'+(i+1)+'" val="'+(row.EMAIL)+'"></span>'+
            						            			'<span class="whole-obj hide" id="_panNo'+(i+1)+'" val="'+(row.PAN_NO)+'"></span>'+
            						            			'<span class="whole-obj hide" id="_bankName_1'+(i+1)+'" val="'+(row.BANK_NAME_1)+'"></span>'+
            						            			'<span class="whole-obj hide" id="_accountNo_1'+(i+1)+'" val="'+(row.ACCOUNT_NO_1)+'"></span>'+
            						            			'<span class="whole-obj hide" id="_bankName_2'+(i+1)+'" val="'+(row.BANK_NAME_2)+'"></span>'+
            						            			'<span class="whole-obj hide" id="_accountNo_2'+(i+1)+'" val="'+(row.ACCOUNT_NO_2)+'"></span>'+
            						            			'<span class="whole-obj hide" id="_contact_1'+(i+1)+'" val="'+(row.CONTACT_1)+'"></span>'+
            						            			'<span class="whole-obj hide" id="_contact_2'+(i+1)+'" val="'+(row.CONTACT_2)+'"></span>'+
            						            			'<span class="whole-obj hide" id="_address'+(i+1)+'" val="'+(row.ADDRESS)+'"></span>'+
            								'</td>'+
            			'<td id="_partyTypeName'+(i+1)+'" >'+(row.PARTY_TYPE_NAME)+' </td>'+
            			'<td id="_code'+(i+1)+'" >'+(row.CODE)+' </td>'+
            			'<td id="_name'+(i+1)+'" >'+(row.NAME)+'</td>          '+
            			'<td id="_glName'+(i+1)+'" >'+(row.GL_NAME)+' </td>'+
            			'<td id="_stateName'+(i+1)+'">'+(row.STATE_NAME)+'</td>        '+
            			'<td id="_gstin_no'+(i+1)+'">'+(row.GSTIN_NO)+'</td>           '+
            			'<td id="_status'+(i+1)+'">'+(row.STATUS)+'</td>'+
            			'<td><i class="fa small-icon fa-edit" id="editBtn" onClick="setData('+(i+1)+')"></i><span class="whole-obj hide">'+(JSON.stringify(row))+'</span></td>'
            			'</tr>'; 
            		});
            		$(".dtTable tbody").empty().append(tbody);
					$(".dtTable").DataTable({
						destroy:true
					});
				}
			});
			

			
			$("#editBtn").on('click',function(){$("#operation").val("M");});
			
			$.ajax({
				url : "${pageContext.request.contextPath}/getRecordLst",
				type : 'post',
				dataType : 'json',
				async : false,
				data : {
					sqlMstId : 10,
					param : "null"
				},
				success : function(resp) {

					$.each(resp, function(key, val) {
						partyTypeList = partyTypeList
								+ "<option value='"+resp[key].ID+"'>"
								+ resp[key].NAME + "</option>"
					});
				}
			});
			$("#partyType").append(partyTypeList);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/getRecordLst",
				type : 'post',
				dataType : 'json',
				async : false,
				data : {
					sqlMstId : 5,
					param : "null"
				},
				success : function(resp) {

					$.each(resp, function(key, val) {
						glList = glList
								+ "<option value='"+resp[key].FAGM_ID+"'>"
								+ resp[key].FAGM_NAME + "</option>"
					});
				}
			});
			$("#gl").append(glList);
			
			
			$.ajax({
				url : "${pageContext.request.contextPath}/getRecordLst",
				type : 'post',
				dataType : 'json',
				async : false,
				data : {
					sqlMstId : 12,
					param : "null"
				},
				success : function(resp) {

					$.each(resp, function(key, val) {
						stateList = stateList
								+ "<option value='"+resp[key].GSTIN_STATE_ID+"'>"
								+ resp[key].GSTIN_STATE_NAME + "</option>"
					});
				}
			});
			$("#state").append(stateList);
		});

		function setData(key)
		{
			$("#gl").val($("#_glid"+key).attr('val'));
			$("#partyType").val($("#_partyType"+key).attr('val'));
			
			$("#partyId").val($("#_id"+key).text());
			$("#code").val($("#_code"+key).text());
			$("#name").val($("#_name"+key).text());
			
			$("#state").val($("#_state"+key).attr('val'));
			$("#address").val($("#_address"+key).attr('val'));
			
			$("#email").val($("#_email"+key).attr('val'));
			$("#panNo").val($("#_panNo"+key).attr('val'));
			$("#gstinNo").val($("#_gstin_no"+key).text());
			
			$("#bankName_1").val($("#_bankName_1"+key).attr('val'));
			$("#accountNo_1").val($("#_accountNo_1"+key).attr('val'));
			
			$("#bankName_2").val($("#_bankName_2"+key).attr('val'));
			$("#accountNo_2").val($("#_accountNo_2"+key).attr('val'));
			
			$("#contactNo_1").val($("#_contact_1"+key).attr('val'));
			$("#contactNo_2").val($("#_contact_2"+key).attr('val'));
			$("#status").val($("#_status"+key).text());
			
		}
		function validateForm() {
			$("#contact-form").validate({
				rules : {
					/* inName : {
						required : true,
						minlength : 2,
						maxlength : 100
					},*/ 
					email : {
						required : true,
						email : true
					},
					partyType : {
						required : true
					}, 
					gl : {
						required : true
					},
					code : {
						required : true
					},
					name : {
						required : true
					},
					state : {
						required : true
					},
					address : {
						required : true
					},
					panNo : {
						required : true
					},
					/* gstinNo : {
						required : true
					}, */
					contactNo_1 : {
						required : true
					},
					status : {
						required : true
					},
				},
				messages : {
					/* inName : {
						required : 'Please enter name',
						minlength : 'Please enter atleast 2 charachter',
						maxlength : 'Maximum 100 charachter allowed',
					}, */
					email : {
						required : 'Please enter your email address',
						email : 'Please enter a VALID email address'
					},
					partyType : {
						required : 'Please select party type'
					},
					gl : {
						required : 'Please select party GL'
					},
					code : {
						required : 'Please enter party code'
					},
					name : {
						required : 'Please enter party name'
					},
					state : {
						required : "Please select party state"
					},
					address : {
						required : "Please enter party address"
					},
					panNo : {
						required : "Please enter PAN number of party"
					},
					/* gstinNo : {
						required : "Please select party state"
					}, */
					contactNo_1 : {
						required : "Please enter contact number"
					},
					status : {
						required : "Please select party status"
					}
				},
				errorPlacement : function(error, element) {
					
					$(element).closest('.form-group').find('small').html(error)
					
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
					url : "${pageContext.request.contextPath}/saveParty",
					type : 'post',
					dataType : 'json',
					async : false,
					data : {
						operation:  $("#operation").val(),
						id:$("#partyId").val(),
						code:$("#code").val(),
						name:$("#name").val(),
						address:$("#address").val(),
						state:$("#state").val(),
						contact_1:$("#contactNo_1").val().length == 0 ? null : $("#contactNo_1").val(),
						contact_2:$("#contactNo_2").val().length == 0 ? null : $("#contactNo_2").val(),
						email:$("#email").val().length == 0 ? null : $("#email").val(),
						partyType:$("#partyType").val(),
						panNo:$("#panNo").val(),
						bankName_1:$("#bankName_1").val(),
						accountNo_1:$("#accountNo_1").val(),
						bankName_2:$("#bankName_2").val(),
						accountNo_2:$("#accountNo_2").val(),
						gl:$("#gl").val(),
						status:$("#status").val(),
						gstin_no:$("#gstinNo").val(),
						companyId:global_company_id
					},
					success : function(resp) {
						alert(resp.MESSAGE);
						 
					}
				});
			}
		}
		

		function closeForm()
		{
			$('#PageArea').addClass('hide');
    		$('.innerDashboard').removeClass('hide');
		}
	</script>
</body>
</html>
