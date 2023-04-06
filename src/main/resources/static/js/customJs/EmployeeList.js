
$(document).ready(function() {
	console.log("Employee js is ready")
	loadEmployees();
	
	$(".form-control").click(function() {
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
	
	$(".form-control1").click(function() {
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
});
var printIcon = function(cell, formatterParams) { //plain text value
	return "<button>Salary</button>";
}
var printIcon1 = function(cell, formatterParams){ //plain text value
	return "<button>Details</button>";
}

function loadEmployees() {
	var table_employees = new Tabulator("#employee_table", {
		height:"311px",
		layout:"fitColumns",
		headerFilterPlaceholder:"filter data...",
		ajaxURL:"/employeelist", 
		ajaxConfig:"GET",
	
		columns:[
			{title:emplist_id, field:"employee_id", sorter:"number", hozAlign:"center"},
			{title:emplist_empname, field:"first_name", width:150, sorter:"string"},
			{title:emplist_department, field:"department_name", width:160, sorter:"string"},
			{title:"Department ID", field:"department_id", width:160, sorter:"string" ,visible:false},
			{title:"Designation ID", field:"designation_id", width:160, sorter:"string" ,visible:false},
			{title:emplist_designation, field:"designation_name", width:160, sorter:"string"},
			{title:emplist_batch, field:"batch", width:160, sorter:"string"},
			{title:emplist_doj, field:"date_of_joining", hozAlign:"center", sorter:"number", width:150},
			{title:emplist_contactno, field:"contact_number", hozAlign:"center", sorter:"number", hozAlign:"center"},
			{title:emplist_emailId, field:"email_id", hozAlign:"center", sorter:"date", widthGrow:2, sorter:"number"},
			{title:"address", field:"address", hozAlign:"center", sorter:"string", widthGrow:2,visible:false},
			{title:"gender", field:"gender", hozAlign:"center", sorter:"string", widthGrow:2,visible:false},
			{title:"date_of_leaving", field:"date_of_leaving", hozAlign:"center", sorter:"string", widthGrow:2,visible:false},
			{title:"discontinued", field:"discontinued", hozAlign:"center", sorter:"string", widthGrow:2,visible:false},
			{title:"salary_date", field:"salary_date", hozAlign:"center", sorter:"string", widthGrow:2,visible:false},
			{title:"basic_salary", field:"basic_salary", hozAlign:"center", sorter:"string", widthGrow:2,visible:false},
			{title:"worked_days", field:"worked_days", hozAlign:"center", sorter:"string", widthGrow:2,visible:false},
			{title:"sick_leave", field:"sick_leave", hozAlign:"center", sorter:"string", widthGrow:2,visible:false},
			{title:"earned_leave", field:"earned_leave", hozAlign:"center", sorter:"string", widthGrow:2,visible:false},
			{title:"date_of_birth", field:"date_of_birth", hozAlign:"center", sorter:"string", widthGrow:2,visible:false},
			{title:"account_number", field:"account_number", hozAlign:"center", sorter:"string", widthGrow:2,visible:false},
			{title:"pan", field:"pan", hozAlign:"center", sorter:"string", widthGrow:2,visible:false},
			{title:"pf_account_number", field:"pf_account_number", hozAlign:"center", sorter:"string", widthGrow:2,visible:false},
			{title:emplist_salary,formatter:printIcon, width:50, align:"center", cellClick:function(e, cell){
				$.ajax({
					type		: "GET",
					url			: "/checkSession",
					dataType	: 'json',
					success		: function(response){
						if (response.ERRORMSG == null) {
							var re = cell.getRow(cell);
							var thenum = re.getData().employee_id;
							getRowData(thenum);
							$('#emp_id').val(cell.getRow().getData().employee_id)
						} else if(response.ERRORMSG == "MSG17") {
							alert("MSG17: "+MSG17);
							window.location.href = "/logout";
						}
					}
				});
			}},
			{title:emplist_details,formatter:printIcon1, width:40, align:"center", cellClick:function(e, cell){
				$.ajax({
					type		: "GET",
					url			: "/checkSession",
					dataType	: 'json',
					success		: function(response){
						if (response.ERRORMSG == null) {
							var re = cell.getRow(cell);
							var thenum = re.getData().employee_id;
						
							getRowData1(thenum);
							$('#id').val(cell.getRow().getData().employee_id)
							$('#first_name').val(cell.getRow().getData().first_name)
							$('#last_name').val(cell.getRow().getData().first_name)
							$('#address').val(cell.getRow().getData().address)
							if(cell.getRow().getData().gender == 'M') {
								$('#Mgender').val(cell.getRow().getData().gender).prop('checked', true)
							} else {
								$('#Fgender').val(cell.getRow().getData().gender).prop('checked', true)
							}
							$('#dob').val(cell.getRow().getData().date_of_birth)
							$('#email').val(cell.getRow().getData().email_id)
							$('#contactnum').val(cell.getRow().getData().contact_number)
							$("div#batch select ").val(cell.getRow().getData().batch)
							$('#doj').val(cell.getRow().getData().date_of_joining)
							if(cell.getRow().getData().date_of_leaving == null) {
								const nulldatereliving = "0000-00-00";
								$('#dor').val(nulldatereliving)
							} else {
								const datereliving = cell.getRow().getData().date_of_leaving;
								$('#dor').val(datereliving)
							}
							$('div#department_id select').val(cell.getRow().getData().department_id)
							$('div#designation_id select').val(cell.getRow().getData().designation_id)
							$('#accnum').val(cell.getRow().getData().account_number)
							$('#pan').val(cell.getRow().getData().pan)
							$('#pfaccnum').val(cell.getRow().getData().pf_account_number)
							$('#textbox1').val('0');
							// Returns yes or no in textbox1
							// when checked and unchecked
							$('#checkbox').click(function() {
								if ($("#checkbox").is(":checked") == true) {
									$('#textbox1').val('1');
								} else {
									$('#textbox1').val('0');
								}
							});
						} else if(response.ERRORMSG == "MSG17") {
							alert("MSG17: "+MSG17);
							window.location.href = "/logout";
						}
					}
				});
			}},
		],
	})
	
	function getRowData(thenum) { 
		$("#dialog").show();
	}
	function getRowData1(thenum) { 
		$("#dialog1").show();
	}
	$("#cancel1").click(function() {
		$.ajax({
			type		: "GET",
			url			: "/checkSession",
			dataType	: 'json',
			success		: function(response){
				if (response.ERRORMSG == null) {
					$("#dialog1").hide();
				} else if(response.ERRORMSG == "MSG17") {
					alert("MSG17: "+MSG17);
					window.location.href = "/logout";
				}
			}
		});
	});

	$("#cancel").click(function() {
		$.ajax({
			type		: "GET",
			url			: "/checkSession",
			dataType	: 'json',
			success		: function(response){
				if (response.ERRORMSG == null) {
					$("#dialog").hide();
				} else if(response.ERRORMSG == "MSG17") {
					alert("MSG17: "+MSG17);
					window.location.href = "/logout";
				}
			}
		});
	});

	$("#submit1").click(function() {
		$.ajax({
			type		: "GET",
			url			: "/checkSession",
			dataType	: 'json',
			success		: function(response){
				if (response.ERRORMSG == null) {
					var salarydate = $('#salarydate').val(); 
					var basicsalary = $('#basicsalary').val();
					var workeddays = $('#workeddays').val();
					var sickleave = $('#sickleave').val();
					var earnedleave = $('#earnedleave').val();
					if(salarydate == "" || basicsalary == ""|| workeddays == ""|| sickleave == ""|| earnedleave == "") {
						alert("MSG10: " +MSG10)
					} else {
						alert("MSG12: " +MSG12)
						$("#dialog").hide();
					}
				} else if(response.ERRORMSG == "MSG17") {
					alert("MSG17: "+MSG17);
					window.location.href = "/logout";
				}
			}
		});
	});

	$("#submit2").click(function(){
		$.ajax({
			type		: "GET",
			url			: "/checkSession",
			dataType	: 'json',
			success		: function(response){
				if (response.ERRORMSG == null) {
					var fname = $('#first_name').val(); 
					var lname = $('#last_name').val();
					var dob = $('#dob').val();
					var address = $('#address').val();
					var email = $('#email').val();
					var contactnum = $('#contactnum').val();
					var doj = $('#doj').val();
					if(fname == "" || lname == ""|| dob == ""|| address == ""|| email == ""|| contactnum == ""|| doj == "")
					{
						alert("MSG10: " +MSG10)
					}
					else
					{
						alert("MSG11: "+MSG11)
						$("#dialog1").hide();
					}
				} else if(response.ERRORMSG == "MSG17") {
					alert("MSG17: "+MSG17);
					window.location.href = "/logout";
				}
			}
		});
	});

	$("#search_button").click(function(){
		$.ajax({
			type		: "GET",
			url			: "/checkSession",
			dataType	: 'json',
			success		: function(response){
				console.log(response.ERRORMSG)
				if (response.ERRORMSG == null) {
					table_employees.setFilter([
						{field:"first_name", type:"like", value:$("#emp_name").val()}, 
						{field:"department_name", type:"like", value:$("#department").val()}, 
						{field:"batch", type:"like", value:$("#batch").val()}, 
					]);
				} else if(response.ERRORMSG == "MSG17") {
					alert("MSG17: "+MSG17);
					window.location.href = "/logout";
				}
			}
		});
	});

	$("#clear_button").click(function(){
		$.ajax({
			type		: "GET",
			url			: "/checkSession",
			dataType	: 'json',
			success		: function(response){
				console.log(response.ERRORMSG)
				if (response.ERRORMSG == null) {
					$("#emp_name").val("");
					$("#batch").val("");
					$("#department").val("");
		
					table_employees.clearFilter();
				} else if(response.ERRORMSG == "MSG17") {
					alert("MSG17: "+MSG17);
					window.location.href = "/logout";
				}
			}
		});
	});
}

function isNumber(evt) {
	evt = (evt) ? evt : window.event;
	var charCode = (evt.which) ? evt.which : evt.keyCode;
	if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		return false;
	}
	return true;
}

	$(function(){
		$("#date_icon").datepicker({
			dateFormat: "yyyy-mm-dd",
			endDate	: '+0y +0m',
		});
		$("#date_icon").datepicker().on("changeDate", function(e) {
		$("#dob").val($("#date_icon").data('datepicker').getFormattedDate('yyyy-mm-dd'));
	});

	$("#date_icon1").datepicker({
		dateFormat: "yy-mm-dd",
		startDate	: '01-01-2005',
		endDate	: '+0y +0m',
	});
	$("#date_icon1").datepicker().on("changeDate", function(e) {
	$("#doj").val($("#date_icon1").data('datepicker').getFormattedDate('yyyy-mm-dd'));
	});

	$("#date_icon2").datepicker({
		dateFormat: "yy-mm-dd",
		startDate	: '01-01-2005',
		endDate	: '+0y +0m',
	});
	$("#date_icon2").datepicker().on("changeDate", function(e) {
		$("#dor").val($("#date_icon2").data('datepicker').getFormattedDate('yyyy-mm-dd'));
	});

	$("#datepicker_icon_salary").datepicker( {
		autoclose	: true,
		format		: "mmyyyy",
		startView	: "months", 
		minViewMode	: "months",
		startDate	: '01-2005',
		endDate		: '+0y +0m',
		
	});
	$("#datepicker_icon_salary").datepicker().on("changeDate", function(e) {
		$("#salarydate").val($("#datepicker_icon_salary").data('datepicker').getFormattedDate('mmyyyy'));	
	});
	
	$("#datepicker_icon_salary").click(function() {
		$("#datepicker_icon_salary").datepicker();
	});
	
	$("#salary_check").click(function(){
		$.ajax({
			type		: "GET",
			url			: "/checkSession",
			dataType	: 'json',
			success		: function(response){
				if (response.ERRORMSG == null) {
					var params = {emp_id		: $('#emp_id').val()
					  ,month_year	: $('#salarydate').val()
					  };
					if(params.month_year == "" || params.month_year == null) {
						alert("Please enter Salary date.");
					} else {
						$.ajax ({
							type	: "POST",
							url		: "/getSalaryDetailsbyId",
							data	: params,
							dataType: 'json',
							success	: function(response) {
								if(response.ERRORMSG == null) {
									$("#basicsalary").val(response.SalaryModel.basic_salary);
									$("#workeddays").val(response.SalaryModel.worked_days);
									$("#sickleave").val(response.SalaryModel.sick_leave);
									$("#earnedleave").val(response.SalaryModel.earned_leave);
								} else if(response.ERRORMSG == "MSG9") {
									alert("MSG9: "+MSG9);
								}
							}
						});
					}
				} else if(response.ERRORMSG == "MSG17") {
					alert("MSG17: "+MSG17);
					window.location.href = "/logout";
				}
			}
		});
	});
});
