/**
 * 
 */
$(document).ready(function() {
	$(".form-control").click(function(e) {
		$.ajax({
			type		: "GET",
			url			: "/checkSession",
			dataType	: 'json',
			async		: false,
			success		: function(response){
				if(response.ERRORMSG == "MSG17") {
					alert("MSG17: "+MSG17);
					window.location.href = "/logout";
				}
			}
		});
	});
	
	$.ajax ({
		type	: "GET",
		url		: "/getEmployeeIdsList",
		success	: function(response) {
			//console.log(response);
			if (response != '') {
				$("#emp_id_search").append('<option value=""></option>');
				// Loop through each of the results and append the option to the dropdown
				$.each(response, function(key, value) {
					$("#emp_id_search").append('<option value="' + key + '">' + key +' - '+ value + '</option>');
				});
			}
		}
	});
	
	$("#emp_id_search").change(function(){
		$("#retrieve_button").attr("disabled", false);
	});

	$("#datepicker_icon").datepicker( {
		autoclose	: true,
		format		: "mm-yyyy",
		startView	: "months", 
		minViewMode	: "months",
		startDate	: '01-2005',
		endDate		: '+0y +0m',
	});
			
	$("#datepicker_icon").click(function() {
		$.ajax({
			type		: "GET",
			url			: "/checkSession",
			dataType	: 'json',
			success		: function(response){
				if(response.ERRORMSG == null) {
					//$("#datepicker_icon").datepicker();
				} else if(response.ERRORMSG == "MSG17") {
					alert("MSG17: "+MSG17);
					console.log(response.ERRORMSG)
					window.location.href = "/logout";
				}
			}
		});
	});
	
	$("#datepicker_icon").datepicker().on("changeDate", function(e) {
		$("#datepicker_val").val($("#datepicker_icon").data('datepicker').getFormattedDate('mm/yyyy'));
		$("#retrieve_button").attr("disabled", false);
	});
	
	$("#retrieve_button").click(function() {
		$.ajax({
			type		: "GET",
			url			: "/checkSession",
			dataType	: 'json',
			async		: false,
			success		: function(response){
				if (response.ERRORMSG == null) {
					$("#retrieve_button").attr("disabled", true);
					$("#salary_table_div").css("display", "none");
					
					var params = {emp_id		: $('#emp_id_search').val()
								  ,month_year	: $('#datepicker_val').val()
								  };
					if (params.emp_id == "" && params.month_year =="") {
						alert("MSG6: "+MSG6);
					} else if(params.emp_id == "") {
						alert("MSG7: "+MSG7);
					} else if(params.month_year == "") {
						alert("MSG8: "+MSG8);
					} else {
						$.ajax({
							type		: "POST",
							url			: "/getRetrieveSalaryDetailsById",
							data		: params,
							dataType	: 'json',
							success		: function(response){
								//console.log(response.ERRORMSG)
								if(response.ERRORMSG == null) {
									$("#payslip_date").html(params.month_year);
									$("#emp_name").html(response.EmployeeModel.first_name);
									$("#bank_name").html("NA");
									$("#days_worked").html("AA");
									$("#emp_id").html(response.EmployeeModel.employee_id);
									$("#account_no").html(response.EmployeeModel.account_number);
									$("#el").html("XX");
									$("#department_name").html(response.EmployeeModel.department_name);
									$("#pf_account_no").html(response.EmployeeModel.pf_account_number);
									$("#sl").html("YY");
									$("#designation_name").html(response.EmployeeModel.designation_name);
									$("#pan_no").html(response.EmployeeModel.pan);
									$("#days_worked").html(response.SalaryModel.worked_days);
									$("#el").html(response.SalaryModel.earned_leave);
									$("#sl").html(response.SalaryModel.sick_leave);
									$("#basic_salary").html(response.SalaryModel.basic_salary);
									$("#medical_reimbursement").html(response.SalaryModel.medical_reimbursement);
									$("#lta_reimbursement").html(response.SalaryModel.lta_reimbursement);
									$("#el_reimbursement").html(response.SalaryModel.el_reimbursement);
									
									var basic_salary = response.SalaryModel.basic_salary
									//console.log((basic_salary * response.SalaryCalculations.pf)/100);
									$("#dpa").html((basic_salary * response.SalaryCalculations.dpa)/100);
									$("#hra").html((basic_salary * response.SalaryCalculations.hra)/100);
									$("#pf").html((basic_salary * response.SalaryCalculations.pf)/100);
									$("#esi").html((basic_salary * response.SalaryCalculations.esi)/100);
									if(basic_salary < 10000) {
										$("#professionTax").html(response.SalaryCalculations.profession_tax1);
									} else if((basic_salary > 10000) && (basic_salary<15000)) {
										$("#professionTax").html(response.SalaryCalculations.profession_tax2);
									} else {
										$("#professionTax").html(response.SalaryCalculations.profession_tax3);
									}
									$("#income_tax").html((basic_salary * response.SalaryCalculations.income_tax)/100);
									$("#staff_welfare").html(response.SalaryCalculations.staff_welfare);
									$("#column_a_others").html(response.SalaryCalculations.column_A_Others);
									$("#column_b_others").html(response.SalaryCalculations.column_B_Others);
									$("#column_c_others").html(response.SalaryCalculations.column_C_Others);
									// Calculating total_a, total_b, and total_c
									var total = parseInt($("#basic_salary").html()) + 
												parseInt($("#dpa").html()) + 
												parseInt($("#hra").html()) + 
												parseInt($("#column_a_others").html());
									$("#total_a").html(total);
									total = parseInt($("#pf").html()) + 
												parseInt($("#esi").html()) + 
												parseInt($("#professionTax").html()) + 
												parseInt($("#income_tax").html()) +
												parseInt($("#staff_welfare").html()) + 
												parseInt($("#column_b_others").html());
									$("#total_b").html(total);
									total = parseInt($("#medical_reimbursement").html()) + 
												parseInt($("#lta_reimbursement").html()) + 
												parseInt($("#el_reimbursement").html()) + 
												parseInt($("#column_c_others").html());
									$("#total_c").html(total);
									// Calculating total amount paid to the employee(total_a - total_b + total_c)
									total = parseInt($("#total_a").html()) - 
												parseInt($("#total_b").html()) + 
												parseInt($("#total_c").html());
									$("#total_amount").html(total);
			
									$("#salary_table_div").css("display", "block");
								} else {
									if(response.ERRORMSG == "MSG9") {
										alert("MSG9: "+MSG9);
									}
								}
							},
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