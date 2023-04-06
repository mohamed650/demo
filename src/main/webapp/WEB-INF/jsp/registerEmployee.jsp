<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" charset="utf-8">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
	<title><spring:message code="ems.label.registerEmp.pageTitle"/></title>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/csslib/bootstrap-datepicker.css"/>
	<script type="text/javascript" src="/js/customJs/Register.js"></script> 
	<script type="text/javascript" src="/js/plugins/bootstrap-datepicker.min.js"></script> 
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">
	<jsp:include page="home.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Register.css"/>

</head>
<body>
	<input type="hidden" value="/registerEmployee" id="page_name"/>
	<h4><spring:message code="ems.label.registerEmp.title"/></h4>
	<div class="signup-form">
		<b><p style="font-style: italic; color:blue; margin-left: 184px;">${MESSAGE}</p></b>
		<form method="POST" id="register" modelAttribute="registermodel" action="${pageContext.request.contextPath}/save-Employee">
			<div>
			<hr>
			<div class="a">
				<div class="input-group" >
					<span class="input-group-text"><spring:message code="ems.label.employee.employeeID"/></span>
					<input type="text" class="form-control" path="employee_id" name="employee_id" id="employee_id" required="required" autocomplete="off" maxlength="5">
				</div>
			
				<div class="input-group">
					<span class="input-group-text"><spring:message code="ems.label.employee.firstName"/></span>
					<input type="text" class="form-control" path="first_name" name="first_name" id="first_name" required="required" maxlength="30">
				</div>
		
				<div class="input-group">
					<span class="input-group-text"><spring:message code="ems.label.employee.lastName"/></span>
					<input type="text" class="form-control" path="last_name" name="last_name" id="last_name" maxlength="30">
				</div>
			
				<div class="input-group" style="line-height: 1;" >
					<span class="input-group-text"><spring:message code="ems.label.employee.gender"/></span>
					<input type="radio" class="check_button" path="gender"  name="gender" id="male" value="M" style="margin-left: 41px">
					<label for="male" style=" margin-top: 12px;"><spring:message code="ems.label.employee.male"/></label>
					<input type="radio" class="check_button" id="female" path="gender" name="gender" value="F" style="margin-left: 41px">
					<label for="female" style=" margin-top: 12px;"><spring:message code="ems.label.employee.female"/></label>
				</div>
				
				<div class="input-group">
					<span class="input-group-text"><spring:message code="ems.label.employee.dob"/></span>
					<input type="text" class="form-control glyphicon glyphicon-calendar" path="date_of_birth"  name="date_of_birth" id="date_of_birth" required="required" >
					<i class="glyphicon glyphicon-calendar calendar-icon" id="date_icon1" style="margin-top: -36px; margin-left: 578px;"></i> 
				</div>

				<div class="input-group">
					<span class="input-group-text"><spring:message code="ems.label.employee.address"/></span>
					<input type="text" class="form-control" path="address" name="address" id="address"  required="required" maxlength="120">
				</div>
				
				<div class="input-group">
					<span class="input-group-text"><spring:message code="ems.label.employee.emailID"/></span>
					<input type="text" class="form-control" path="email_id" name="email_id" id="email_id"  required="required" maxlength="40">
				</div>
				
				<div class="input-group">
					<span class="input-group-text"><spring:message code="ems.label.employee.contactNo"/></span>
					<input type="text" class="form-control" path="contact_number" name="contact_number" id="contact_number" required="required" onkeypress="return isNumber(event)" maxlength="10">
				</div>

				<div class="input-group">
					<span class="input-group-text"><spring:message code="ems.label.employee.batch"/></span>
					<select  path="batch" class="form-control" name="batch" id="batch" required="required">
						<option value=""></option>
						<option value="2005">2005</option>
						<option value="2006">2006</option>
						<option value="2007">2007</option>
						<option value="2008">2008</option>
						<option value="2009">2009</option>
						<option value="2010">2010</option>
						<option value="2011">2011</option>
						<option value="2012">2012</option>
						<option value="2013">2013</option>
						<option value="2014">2014</option>
						<option value="2015">2015</option>
						<option value="2016">2016</option>
						<option value="2017">2017</option>
						<option value="2018">2018</option>
						<option value="2019">2019</option>
						<option value="2020">2020</option>
						<option value="2021">2021</option>
						<option value="2022">2022</option>
					</select>
				</div>
				
				<div class="input-group">
					<span class="input-group-text"><spring:message code="ems.label.employee.dateOfJoining"/></span>
					<input type="text" class="form-control glyphicon glyphicon-calendar" path="date_of_joining" name="date_of_joining" id="date_of_joining"  required="required">
					<i class="glyphicon glyphicon-calendar calendar-icon" id="date_icon" style="margin-top: -36px; margin-left: 578px;"></i>
				</div>

				<div class="input-group">
					<span class="input-group-text"><spring:message code="ems.label.employee.departmentName"/></span>
					<select class="form-control" path="department_id" name="department_id" id="department_id">
						<c:forEach items="${DepartmentList}" var="department">
							<option value=""></option>
							<option value="${department.department_id}" >${department.department_name}</option>
						</c:forEach>
					</select>
				</div>

				<div class="input-group">
					<span class="input-group-text"><spring:message code="ems.label.employee.designation"/></span>
					<select class="form-control" path="designation_id" name="designation_id" id="designation_id">
						<c:forEach items="${DesignationList}" var="designation">
							<option value=""></option>
							<option value="${designation.designation_id}">${designation.designation_name}</option>
						</c:forEach>
					</select>
				</div>

				<div class="input-group">
					<span class="input-group-text"><spring:message code="ems.label.employee.accountNo"/></span>
					<input type="text" class="form-control" path="account_number" name="account_number" id="account_number" maxlength="15">
				</div>

				<div class="input-group">
					<span class="input-group-text"><spring:message code="ems.label.employee.pfAccNo"/></span>
					<input type="text" class="form-control" path="pf_account_number" name="pf_account_number" id="pf_account_number" maxlength="15">
				</div>
			
				<div class="input-group">
					<span class="input-group-text"><spring:message code="ems.label.employee.PAN"/></span>
					<input type="text" class="form-control" path="pan" name="pan" id="pan" maxlength="20">
				</div>
			</div>
			</div>

			<div class="form-group">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button type="submit" class="btn btn-primary btn-lg" style="margin-top: 34px;"><spring:message code="ems.button.register"/></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button"  style="margin-top: 34px;" id="reset" class="btn btn-primary btn-lg"><spring:message code="ems.button.reset"/></button>
			</div>
		</form>
	</div>
</body>
</html> 
