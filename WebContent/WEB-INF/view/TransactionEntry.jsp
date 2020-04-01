
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction Entry</title>
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
  										<h4 style="padding-left: 30px;padding-top: 10px;">Transaction Entry</h4>
									</nav>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<label class="form-label">Payment Mode</label>
									<select id="payMode" name="payMode" class="form-control">
										<option value="CP">Cash Payment</option>
										<option value="BP">Bank Payment</option>
										<option value="JV">Journal Voucher</option>
										<option value="CR">Cash Receipt</option>
										<option value="BR">Bank Receipt</option>
										<option value="CT">Contra Voucher</option>
									</select>
								</div>
								<div class="col-lg-4">
									<label class="form-label">Voucher Date</label>
									<input type="text" id="voucherDate" name="voucherDate" style="text-align:center;"  class="form-control">
								</div>
								<div class="col-lg-4">
									<label class="form-label">Voucher No.</label>
									<input type="text" id="voucherNumber" name="voucherNumber" style="text-align:center;" class="form-control">
								</div>
							</div>
							<br>
							<div class="row">
								<table class="table sparkle-table detailTable">
									<thead>
										<tr>
											<th>SrNo</th>
											<th>GL /Account Name</th>
											<th>Credit Amount</th>
											<th>Debit Amount</th>
											<th>Cheque / DD</th>
											<th>Cheque No.</th>
											<th>Cheque Date</th>
											<th>#</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
							</div>
							
							<div class="row">
								<div class="col-lg-9">
								</div>
								<div class="col-lg-3">
									<div class="login-button-pro">
										<button type="button" class="login-button login-button-rg" id="cancelBtn" name="cancelBtn" onClick="closeForm()">Cancel</button>
										<button type="button" class="login-button login-button-lg" id="registerBtn" name="registerBtn" disabled>Submit</button>
										<!-- <div class="modal-area-button">
										<a class="Danger danger-color" href="#" data-toggle="modal" data-target="#DangerModalalert">Danger</a>
										</div> -->
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
  									<h4 style="padding-left: 30px;padding-top: 10px;">All Transactions</h4>
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
												<th class="center">Transaction Type</th>
												<th class="center">Bill No.</th>
												<th class="center">Bill Date</th>
												<th class="center">Bill Amount</th>
												<th class="center">Entered By</th>
												<th class="center">Entered Date</th>
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
    <div id="DangerModalalert" class="modal modal-adminpro-general FullColor-popup-DangerModal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-close-area modal-close-df">
                    <a class="close" data-dismiss="modal" href="#"><i class="fa fa-close"></i></a>
                </div>
                <div class="modal-body">
                    <div class="row">
                    	<div class="col-lg-12">
                    		<input type="hidden" id="d_accid">
                    		<input type="hidden" id="d_glid">
                    		<label class="form-label">TDS on Account</label>
                    		<input type="text" id="d_glacname" class="form-control" disabled>
                    	</div>
                    </div>
                    <div class="row">
                    	<div class="col-lg-6">
                    		<label class="form-label">TDS on Amount</label>
                    		<input type="text" class="form-control" id="d_tdsonamount" style="text-align:center;" placeholder="00.00">
                    	</div>
                    	<div class="col-lg-6">
                    		<label class="form-label">TDS Percentage</label>
                    		<input type="text" class="form-control" id="d_tdspercent" style="text-align:center;" placeholder="00.00">
                    	</div>
                    </div>
                    <div class="row">
                    	<div class="col-lg-12">
                    		<span id="d_tdsamount">TDS Amount : 00.00</span>
                    	</div>
                    </div>
                </div>
                <div class="modal-footer">
                    <a data-dismiss="modal" href="#">Cancel</a>
                    <a href="#">Process</a>
                </div>
            </div>
        </div>
    </div>	 		
	

	


	<!-- Register End-->
	<script type="text/javascript">
	
		var gl_acc_list="";
		var tableRow;
		var cheque_dd_list ="<option id='C'>Cheque</option>"+
							"<option id='D'>DD</option>"+
							"<option id='T'>Transfer</option>"+
							"<option id='R'>RTGS</option>"+
							"<option id='N'>Receipt No.</option>"+
							"<option id='P'>Purchase Sr. No.</option>";
		
		
		$(function() {
			$("#voucherDate").datepicker();
			$(".chequeDatePicker").datepicker();
			
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
					sqlMstId : 14,param : global_company_id
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
			
			$.ajax({
				url : "${pageContext.request.contextPath}/getRecordLst",
				type : 'post',
				dataType : 'json',
				async : false,
				data : {
					sqlMstId : 13,param : global_company_id+"~"+global_company_id
				},
				success : function(resp) {
            		
            		$.each(resp,function(i,row){
            			
            			gl_acc_list = gl_acc_list + "<option data-glId='"+row.GL_ID+"' data-accId='"+row.PARTY_ID+"'>"+row.NAME+"</option>";
            		});
            		
				}
			});
			
			/* ------------------Loading Default Table----------------------------------- */
			
								
		
			for(var i=1;i<=5;i++)
				{
				
				tableRow = tableRow + "<tr>"+
						   "<td style='text-align:center'>"+i+"</td>"+
						   "<td><select class='form-control GlAcList' id='glId"+i+"'>"+gl_acc_list+"</select></td>"+
						   "<td><input type='text' class='form-control' id='cramt"+i+"' style='text-align:right'></td>"+
						   "<td><input type='text' class='form-control' id='dramt"+i+"' style='text-align:right'></td>"+
						   "<td><select class='form-control' id='instType"+i+"'>"+cheque_dd_list+"</select></td>"+
						   "<td><input type='text' class='form-control' id='chequeNo"+i+"'></td>"+
						   "<td><input type='text' class='form-control chequeDatePicker' id='chequeDate"+i+"'></td>"+
						   "<td><span class='input-group-btn dropdown-segmented'><button type='button' class='btn btn-white TDSBtn' id='tdsBtn"+i+"' onClick='setAccountName("+i+")' data-toggle='modal' data-target='#DangerModalalert' disabled>TDS</button></span></td>"+
						   "</tr>";
				
				}
							
			$(".detailTable tbody").empty().append(tableRow);
		    
			/* ------------------End of Loading Default Table---------------------------- */

			/* $(".GlAcList").on("change",function(){
				$(this).find(":selected").data("accid").length > 0 ? $(this).find(":selected").prop("disabled",false):null;	
			}); */
			 
		});
		
		$(".detailTable > tbody > tr").on('change',function(index,tr){
			console.log(index);
			//console.log($(this).parents('tr').find("#glId"+index+1).val());
			/* if($(this).parents('tr').find(".GlAcList").data("accid").length > 0)
				{
					$(this).parents('tr').find(".TDSBtn").prop("disabled",false);
				}
			 */
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
		
		function setAccountName(key)
		{
			$("#d_accid").val($("#glId"+key).find(":selected").data("accid"));
			$("#d_glid").val($("#glId"+key).find(":selected").data("glid"));
			$("#d_glacname").val($("#glId"+key).val());
		}
		
		/*
		$('#paymentOfTaxTable tbody tr').each(function() {
				if ($(this).index() == 0) {
					orcpbi = $(this).find('td:eq(1)').find('input').val();
					itititc = $(this).find('td:eq(2)').find('input').val();
					itctitc = $(this).find('td:eq(3)').find('input').val();
					itstitc = $(this).find('td:eq(4)').find('input').val();
					$(this).find('td:eq(5)').find('input').val();
					orcpci = $(this).find('td:eq(6)').find('input').val();
					$(this).find('td:eq(7)').find('input').val();
					rcpci = $(this).find('td:eq(8)').find('input').val();
					$(this).find('td:eq(9)').find('input').val();
					ipci = $(this).find('td:eq(10)').find('input').val();
					$(this).find('td:eq(11)').find('input').val();
					$(this).find('td:eq(12)').find('input').val();
					$(this).find('td:eq(13)').find('input').val();
					acri = $(this).find('td:eq(14)').find('input').val();
				}
				
				*/
	</script>
</body>
</html>
