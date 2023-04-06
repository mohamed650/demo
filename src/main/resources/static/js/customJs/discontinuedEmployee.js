/**
 * 
 */
var table_employees;
$(document).ready(function() {
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
	
	$("#search_button").click(function() {
		$.ajax({
			type		: "GET",
			url			: "/checkSession",
			dataType	: 'json',
			success		: function(response){
				if (response.ERRORMSG == null) {
					var emp_name = $("#emp_name").val();
					var batch = $("#batch").val();
					var dep_name = $("#dep_name").val();
					
					if (emp_name == "" && batch == "" && dep_name == "") {
						alert("MSG4: "+MSG4);
					} else {
						table_employees.setFilter([
							{field:"first_name", type:"like", value:emp_name}, //filter by employee name
							{field:"batch", type:"like", value:batch}, //and by batch
							{field:"department_name", type:"like", value:dep_name}, //and by department name
						]);
						$("#clear_button").attr("disabled", false);
					}
				} else if(response.ERRORMSG == "MSG17") {
					alert("MSG17: "+MSG17);
					window.location.href = "/logout";
				}
			}
		});
	});
	
	$("#clear_button").click(function() {
		$.ajax({
			type		: "GET",
			url			: "/checkSession",
			dataType	: 'json',
			success		: function(response){
				if (response.ERRORMSG == null) {
					$("#clear_button").attr("disabled", true);
					$("#emp_name").val("");
					$("#batch").val("");
					$("#dep_name").val("");
					table_employees.clearFilter();
				} else if(response.ERRORMSG == "MSG17") {
					alert("MSG17: "+MSG17);
					window.location.href = "/logout";
				}
			}
		});
	});
});

function loadEmployees() {
	var deleteButton = function(cell, formatterParams, onRendered){ 
		onRendered(function(){
			$(cell.getElement()).css({"font-family": "system-ui"
									, "font-size": "13px"
									});
		});
		return "<button>Delete</button>";
	};
	
	table_employees = new Tabulator("#discontinued_employee_table", {
		placeholder				: "No Data Available", //display message to user on empty table
		height					: "360px",
		layout					: "fitColumns",
		pagination				: "local",
		paginationSize			: 10,
		paginationSizeSelector	: [3, 6, 8, 10],
		paginationCounter		: "rows",
		initialSort				: [{column:"employee_id", dir:"asc"}], //sort by this initial
		ajaxConfig				: "get",
		ajaxURL					: "/getDiscontEmployeeList",
		columns	: [
			{title: var_id,			field:"employee_id",		width:50,	sorter:"number", hozAlign:"center"},
			{title: var_empname,	field:"first_name",			width:150,	sorter:"string"},
			{title: var_depname,	field:"department_name",	width:160,	sorter:"string"},
			{title: var_doj,		field:"date_of_joining",	width:150,	sorter:"date",	 hozAlign:"center"},
			{title: var_dor,		field:"date_of_leaving",	width:150,	sorter:"date",	 hozAlign:"center"},
			{title: var_bankaccno,	field:"account_number",		width:160,	sorter:"number", hozAlign:"center"},
			{title: var_pfaccno,	field:"pf_account_number",	width:150,	sorter:"number", hozAlign:"center"},
			{title: var_contactno,	field:"contact_number",		width:120,	sorter:"number", hozAlign:"center"},
			{title: var_batch,		field:"batch",				visible: false},
			{formatter:deleteButton,		width:66, cellClick:function(e, cell) {
				$.ajax({
					type		: "GET",
					async		: false,
					url			: "/checkSession",
					dataType	: 'json',
					success		: function(response) {
						console.log(response.ERRORMSG)
						if (response.ERRORMSG == "MSG17") {
							alert("MSG17: "+MSG17);
							window.location.href = "/logout";
						} else {
							if(confirm("MSG5: "+MSG5)) {
								$.ajax ({
									url: "/deleteEmployee",
									data: { emp_id: cell.getRow().getData().employee_id }
								})
								.success(function( data ) {
									//console.log( "Ajax request success:" +data);
									cell.getRow().delete(); 
								});
							}
						}
					}
				});
			}},
		],
	})
}