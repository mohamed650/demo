<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title><spring:message code="ems.label.disconEmp.pageTitle"/></title>
	<jsp:include page="home.jsp"></jsp:include>
	
	<script>
		var var_id = '<spring:message code="ems.label.disconEmp.table.id" />';
		var var_empname = '<spring:message code="ems.label.disconEmp.employeeName" />';
		var var_depname = '<spring:message code="ems.label.employee.departmentName" />';
		var var_doj = '<spring:message code="ems.label.employee.dateOfJoining" />';
		var var_dor = '<spring:message code="ems.label.employee.dateOfRelieving" />';
		var var_bankaccno = '<spring:message code="ems.label.salaryslip.table.bankAccNo" />';
		var var_pfaccno = '<spring:message code="ems.label.salaryslip.table.pfAccNo" />';
		var var_contactno = '<spring:message code="ems.label.disconEmp.table.contactNo" />';
		var var_batch = '<spring:message code="ems.label.employee.batch" />';
	</script>
</head>
<body>
	<input type="hidden" value="/discontEmp" id="page_name"/>
	<h4><spring:message code="ems.label.disconEmp.tableTitle"/></h4>
	
	<div class="container" id="search_criteria">
		<div class="row" >
			<div class="col-sm-12 col-lg-12 col-md-12 col-xs-12">
				<div class="form-group row">
					<label id="emp_name_label" for="emp_name" class="col-sm-1 col-lg-1 col-md-1 col-xs-1 col-form-label text-right">
						<b><spring:message code="ems.label.disconEmp.employeeName"/>:</b>
					</label>
					<div class="col-sm-2 col-lg-2 col-md-2 col-xs-2">
						<input type="text" class="form-control" id ="emp_name" name="emp_name"/>
					</div>
					
					<label id="batch_label" for="batch" class="col-sm-1 col-lg-1 col-md-1 col-xs-1 col-form-label text-right">
						<b><spring:message code="ems.label.employee.batch"/>:</b>
					</label>
					<div class="col-sm-2 col-lg-2 col-md-2 col-xs-2" style="padding-left: 0">
						<select class="form-control" id ="batch" name="batch">
							<option></option>
							<c:forEach var = "batch" items = "${batch_list}">
								<option id='<c:out value="${batch}"></c:out>'><c:out value = "${batch}"/></option>
							</c:forEach>
						</select>
					</div>
					
					<label id="dep_name_label" for="dep_name" class="col-sm-1 col-lg-1 col-md-1 col-xs-1 col-form-label text-right" style="padding: 0px;">
						<b><spring:message code="ems.label.employee.departmentName"/>:</b>
					</label>
					<div class="col-sm-2 col-lg-2 col-md-2 col-xs-2" style="padding-left: 20px">
						<select class="form-control" id ="dep_name" name="dep_name">
							<option></option>
							<c:forEach var = "department" items = "${department_list}">
								<option id='<c:out value="${department.department_id}"></c:out>'><c:out value = "${department.department_name}"/></option>
							</c:forEach>
						</select>
					</div>
					<div class="col-sm-3 col-lg-3 col-md-3 col-xs-3">
						<div class="row" >
							<div class="col-sm-2 col-lg-2 col-md-2 col-xs-2"></div>
							<div class="col-sm-5 col-lg-5 col-md-5 col-xs-5">
								<button id="search_button" type="button" class="btn btn-secondary"><spring:message code="ems.button.search"/></button>
							</div>
							<div class="col-sm-1 col-lg-1 col-md-1 col-xs-1"></div>
							<div class="col-sm-4 col-lg-4 col-md-4 col-xs-4">
								<button id="clear_button" type="button" class="btn btn-secondary" disabled><spring:message code="ems.button.clear"/></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container" style="width: fit-content">
		<div class="row" style="margin-left: 0">
			<div class="col-sm-12 col-lg-12 col-md-12 col-xs-12" style="padding: 0;">
				<div id="discontinued_employee_table" class="employee-table"></div>
			</div>
		</div>
	</div>
</body>
	<script type="text/javascript" src="/js/customJs/discontinuedEmployee.js"></script>
</html>