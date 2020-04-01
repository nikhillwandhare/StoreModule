/**
 Created By : Nikhil Wandhare
   On Dated : 03-Dec-2019 
 */

 $("#typeList").on("Change",function(){
	 console.log($("#typeList").val());
	 ($("#typeList").val() == "F") ? $("#jspNameGroup").attr("style","display:block") : $("#jspNameGroup").attr("style","display:none");
 });