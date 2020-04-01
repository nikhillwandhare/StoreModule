function check_user_name(){
    alert("User Name can not be blank.");
}


function openModal(){
    $('#myModal').modal('toggle');
}


$('#myModal').on('shown.bs.modal', function () {
    $('#userName').focus();
});

$('#loginBtn').on('Click',function(){
	console.log("1");
	
	if($("#companyList").val() == "")
	{
		$("#companyLabel").append("(Select Company*)");
		$("#nameLabel").text("");
    	$("#passLabel").text("");
	}
	else if($("#userName").val() == "")
	{
    	$("#nameLabel").append("(Enter User Name*)");
    	$("#companyLabel").text("");
    	$("#passLabel").text("");
	}
	else if($("#userPass").val() == ""){
		$("#passLabel").append("(Enter User Password*)");
		$("#companyLabel").text("");
		$("#nameLabel").text("");
		}
	else{
		checkLogin();
		}
});

