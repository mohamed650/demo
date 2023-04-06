/**
 * 
 */
 
$(document).ready(function() {
	var page = $("#page_name").val();
	if (page === "/employeeList") {
		$("#emplyoeeList").addClass("disabled");
		$("#register").removeClass("disabled");
		$("#salaryRetrieval").removeClass("disabled");
		$("#discontinuedList").removeClass("disabled");
		
	} else if(page === "/registerEmployee") {
		$("#emplyoeeList").removeClass("disabled");
		$("#register").addClass("disabled");
		$("#salaryRetrieval").removeClass("disabled");
		$("#discontinuedList").removeClass("disabled");
		
	} else if(page === "/salary") {
		$("#emplyoeeList").removeClass("disabled");
		$("#register").removeClass("disabled");
		$("#salaryRetrieval").addClass("disabled");
		$("#discontinuedList").removeClass("disabled");
	} else if(page === "/discontEmp") {
		$("#emplyoeeList").removeClass("disabled");
		$("#register").removeClass("disabled");
		$("#salaryRetrieval").removeClass("disabled");
		$("#discontinuedList").addClass("disabled");
	} 
	
	$('#menu-main-menu a').click(function(e) {
		e.preventDefault();
		console.log("$(this): "+$(this).attr("href"))
		var page = $(this).attr("href");
		$.ajax({
			type		: "GET",
			url			: "/checkSession",
			dataType	: 'json',
			success		: function(response){
				if (response.ERRORMSG == null) {
					//console.log("page: "+page)
					window.location.href = page;
				} else if(response.ERRORMSG == "MSG17") {
					alert("MSG17: "+MSG17);
					window.location.href = "/logout";
				}
			}
		});
	});
});