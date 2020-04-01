
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Purchase Bill</title>
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
									<div class="inbox-email-menu-list">
										<div class="compose-email">
											<a><h4>Purchase Bill Entry</h4></a>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
								
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
								<h1>All Objects</h1>
								<div class="sparkline13-outline-icon">
                                	<span class="sparkline13-collapse-link"><i class="fa fa-chevron-up"></i></span>
                                    <span><i class="fa fa-wrench"></i></span>
                                    <span class="sparkline13-collapse-close"><i class="fa fa-times"></i></span>
                                 </div>
							</div>
						</div>
						<div class="sparkline13-graph">
							<div class="datatable-dashv1-list custom-datatable-overright">
								<div class="bootstrap-table">
									<table id="dtTable" class="table dtTable table-bordered">
										<thead>
											<tr>
												<th class="center">#</th>
												<th class="center">MODULE NAME</th>
												<th class="center">FORM NAME</th>
												<th class="center">TYPE</th>
												<th class="center">FORM STATUS</th>
												<th class="center">JSP NAME</th>
												<th class="center">SRNO</th>
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
		$(function() {
			
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
					sqlMstId : 3,param : "null"
				},
				success : function(resp) {
            		var tbody="";
            		$.each(resp,function(i,row){
            			
            			tbody = tbody + '<tr><td>'+(i+1)+'<span class="whole-obj hide" id="_moduleId'+(i+1)+'">'+(row.MODULE_ID)+'</span><span class="whole-obj hide" id="_formId'+(i+1)+'">'+(row.FORM_ID)+'</span><span class="whole-obj hide" id="_formTypeId'+(i+1)+'">'+(row.FORM_TYPE)+'</span></td>'+
            			'<td id="_moduleName'+(i+1)+'" >'+(row.MODULE_NAME)+' </td>'+
            			'<td id="_formName'+(i+1)+'" >'+(row.FORM_NAME)+'</td>          '+
            			'<td id="_formType'+(i+1)+'" >'+(row.FORM_TYPE_NAME)+' </td>'+
            			'<td id="_formStatus'+(i+1)+'">'+(row.FORM_STATUS)+'</td>        '+
            			'<td id="_jspName'+(i+1)+'">'+(row.JSP_NAME)+'</td>           '+
            			'<td id="_srNo'+(i+1)+'">'+(row.FORM_SRNO)+' </td>'+
            			'<td><i class="fa small-icon fa-edit" onClick="setData('+(i+1)+')"></i><span class="whole-obj hide">'+(JSON.stringify(row))+'</span></td>'
            			'</tr>'; 
            		});
            		$(".dtTable tbody").empty().append(tbody);
					$(".dtTable").DataTable({
						destroy:true
					});
				}
			});
		});

		var moduleList = "";
		$.ajax({
			url : "${pageContext.request.contextPath}/getRecordLst",
			type : 'post',
			dataType : 'json',
			async : false,
			data : {
				sqlMstId : 2,
				param : "null"
			},
			success : function(resp) {

				$.each(resp, function(key, val) {
					moduleList = moduleList
							+ "<option value='"+resp[key].ADMM_MODULE_ID+"'>"
							+ resp[key].ADMM_MODULE_NAME + "</option>"
				});
			}
		});
		$("#menuList").append(moduleList);

		
	
		

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
					typeName : {
						required : true
					}, 
					menuName : {
						required : true
					},
					objectName : {
						required : true
					},
					jspName : {
						required : true
					},
					order : {
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
					typeName : {
						required : 'Please select type'
					},
					menuName : {
						required : 'Please select menu'
					},
					objectName : {
						required : 'Please write object name'
					},
					jspName : {
						required : 'Please write jsp name'
					},
					order : {
						required : "Please select object display order"
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
		
		
		
		
		function closeForm()
		{
			$('#PageArea').addClass('hide');
    		$('.innerDashboard').removeClass('hide');
		}
	</script>
</body>
</html>
