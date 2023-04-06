$(document).ready(function(){
	
	$(".form-control").click(function(){
		$.ajax({
			type		: "GET",
			url			: "/checkSession",
			dataType	: 'json',
			success		: function(response){
				if(response.ERRORMSG == "MSG17") {
					alert("MSG17: "+MSG17);
					window.location.href = "/logout";
				} else {
					$("p").hide();
				}
			}
		});
	})
	
	$(".check_button").click(function() {
		$.ajax({
			type		: "GET",
			url			: "/checkSession",
			dataType	: 'json',
			success		: function(response){
				if(response.ERRORMSG == "MSG17") {
					alert("MSG17: "+MSG17);
					window.location.href = "/logout";
				}
			}
		});
	});
	
	$(".calendar-icon").click(function() {
		$.ajax({
			type		: "GET",
			url			: "/checkSession",
			dataType	: 'json',
			success		: function(response){
				if(response.ERRORMSG == "MSG17") {
					alert("MSG17: "+MSG17);
					window.location.href = "/logout";
				}
			}
		});
	});
	
	$(".btn-lg").click(function() {
		$.ajax({
			type		: "GET",
			url			: "/checkSession",
			dataType	: 'json',
			success		: function(response){
				if(response.ERRORMSG == "MSG17") {
					alert("MSG17: "+MSG17);
					window.location.href = "/logout";
				}
			}
		});
	});
	
	$("#reset").click(function(){
		$("#employee_id").val("");
		$("#first_name").val("");
		$("#last_name").val("");
		$("#female").val("");
		$("#male").val("");
		$("#date_of_birth").val("");
		$("#address").val("");
		$("#email_id").val("");
		$("#contact_number").val("");
		$("#batch").val("");
		$("#date_of_joining").val("");
		$("#department_id").val("");
		$("#designation_id").val("");
		$("#account_number").val("");
		$("#pf_account_number").val("");
		$("#pan").val("");
	});
});

function isNumber(evt) {
	evt = (evt) ? evt : window.event;
	var charCode = (evt.which) ? evt.which : evt.keyCode;
	if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		return false;
	}
	return true;
}

$(function(){
	$("#date_icon1").datepicker({
		dateFormat: "yyyy-mm-dd",
		endDate	: '+0y +0m',
	});

	$("#date_icon1").datepicker().on("changeDate", function(e) {
	$("#date_of_birth").val($("#date_icon1").data('datepicker').getFormattedDate('yyyy-mm-dd'));
	}); 

	$("#date_icon").datepicker({
		dateFormat	: "yyyy-mm-dd",
		startDate	: '01-01-2005',
		endDate		: '+0y +0m',
	});

	$("#date_icon").datepicker().on("changeDate", function(e) {
		$("#date_of_joining").val($("#date_icon").data('datepicker').getFormattedDate('yyyy-mm-dd'));
	}); 
});
