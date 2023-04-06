<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><spring:message code="ems.label.empList.pageTitle"/></title>
	
	<link rel="stylesheet" href="/css/EmployeeList.css"/>
	<link rel="stylesheet" href="/csslib/bootstrap.css"/>
	<link rel="stylesheet" href="/csslib/bootstrap.min.css"/>
	<link rel="stylesheet" href="/tabulator-5.3/dist/css/tabulator.min.css"/>
	<link rel="stylesheet" href="/csslib/bootstrap-datepicker.css"/>
	<script type="text/javascript" src="/js/plugins/jquery.min.js"></script>
	<script type="text/javascript" src="/tabulator-5.3/dist/js/tabulator.min.js"></script>
	<script type="text/javascript" src="/js/customJs/EmployeeList.js"></script>  
	<script type="text/javascript" src="/js/plugins/bootstrap-datepicker.min.js"></script>
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css"> 
	<jsp:include page="home.jsp"></jsp:include>

	<script>
		var emplist_id = '<spring:message code="ems.label.disconEmp.table.id" />';
		var emplist_empname = '<spring:message code="ems.label.disconEmp.employeeName" />';
		var emplist_department = '<spring:message code="ems.label.salaryslip.table.dep" />';
		var emplist_designation = '<spring:message code="ems.label.employee.designation" />';
		var emplist_batch = '<spring:message code="ems.label.employee.batch" />';
		var emplist_doj = '<spring:message code="ems.label.employee.dateOfJoining" />';
		var emplist_contactno = '<spring:message code="ems.label.disconEmp.table.contactNo" />';
		var emplist_emailId = '<spring:message code="ems.label.employee.emailID" />';
		var emplist_salary = '<spring:message code="ems.label.empList.table.salary" />';
		var emplist_details = '<spring:message code="ems.label.empList.table.details" />';
	</script>
</head>
	<input type="hidden" value="/employeeList" id="page_name"/>
	<h4><spring:message code="ems.label.empList.title"/></h4>
	<div class="container">
		<div class="row" >
			<div class="col-sm-12 col-lg-12 col-md-12 col-xs-12">
				<div class="form-group row">
					<label id="emp_name_label"  class="col-md-1 col-form-label text-right">
						<b><spring:message code="ems.label.disconEmp.employeeName"/>:</b>
					</label>
					<div class="col-md-2">
						<input type="text" class="form-control" id ="emp_name" name="name" required/>
					</div>	
					<label id="batch_label"  class="col-md-1 col-form-label text-right">
						<b><spring:message code="ems.label.employee.batch"/>:</b>
					</label>
					<div class="col-md-2" style="padding-left: 0">
						<select class="form-control" id ="batch" name="batch" required>
							<option></option>
							<option>2005</option>
							<option>2006</option>
							<option>2007</option>
							<option>2008</option>
							<option>2009</option>
							<option>2010</option>
							<option>2011</option>
							<option>2012</option>
							<option>2013</option>
							<option>2014</option>
							<option>2015</option>
							<option>2016</option>
							<option>2017</option>
							<option>2018</option>
							<option>2019</option>
							<option>2020</option>
							<option>2021</option>
							<option>2022</option>
						</select>
					</div>

					<label id="dep_name_label"  class="col-md-1 col-form-label text-right" style="padding: 0px;">
						<b><spring:message code="ems.label.salaryslip.table.dep"/>:</b>
					</label>
					<div class="col-md-2" style="padding-left: 20px">
						<select class="form-control" path="department_name" name="department_name" id="department">
							<c:forEach items="${DepartmentList}" var="department">
								<option value=""></option>
								<option value="${department.department_name}" >${department.department_name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-2" style="padding-left: 0">
						<button id="search_button" type="button" class="btn btn-secondary"><spring:message code="ems.button.search"/></button>
					</div>
					<div class="col-md-2" style="padding-left: 0">
						<button id="clear_button" type="button" class="btn btn-secondary"><spring:message code="ems.button.clear"/></button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row" style="margin-left: 0">
			<div class="col-sm-12 col-lg-12 col-md-12 col-xs-12" style="padding: 0;">
				<div id="employee_table" ></div>  
			</div>
			
			<!-- Salary popup -->
			<div id="dialog" hidden="hidden" class="modal fade in" style="margin-top:1%; overflow: auto; " data-backdrop="static">
				<div class="modal-dialog login1" style="width:685px;height:555px;margin-top:55px;">
					<form method="POST" id="updatesalary" modelAttribute="salarymodel" action="${pageContext.request.contextPath}/update-Salary">
						<div>
							<div class="a">
								<h3 style="margin-left: 19px"> <spring:message code="ems.label.empList.table.salary.title"/></h3>
								<div class="input-group">
									<span class="input-group-text" ><spring:message code="ems.label.employee.employeeID"/></span>
									<input type="text" class="form-control1 " path="employee_id" name="employee_id" id="emp_id"  required="required" readonly style="background-color: #ddd;">
								</div>
								
								<div class="input-group" >
									<span class="input-group-text"><spring:message code="ems.label.empList.table.salary.salaryDate"/></span>
									<input class="form-control1" type="text"  path="salary_date" name="salary_date" id="salarydate" maxlength="6" style=" width: 161px;  background-color: #ddd;">
									<i class="glyphicon glyphicon-calendar calendar-icon" id="datepicker_icon_salary" style="margin-top: -29px;margin-left: 401px;"></i>
									<button type="button" style="margin-top: -26px;margin-left: 86%;" id="salary_check" ><spring:message code="ems.button.check"/></button>
									<!-- <input type="text" class="form-control1" path="salary_date" name="salary_date" id="salarydate" required="required" maxlength="6"> -->
								</div>
	
								<div class="input-group">
									<span class="input-group-text"><spring:message code="ems.label.empList.table.salary.basicSalary"/></span>
									<input type="text" class="form-control1" path="basic_salary" name="basic_salary" id="basicsalary" required="required"> 
								</div>
	
								<div class="input-group">
									<span class="input-group-text"><spring:message code="ems.label.salaryslip.table.workedDays"/></span>
									<input type="text" class="form-control1" path="worked_days" name="worked_days" id="workeddays" required="required">
								</div>
	
								<div class="input-group">
									<span class="input-group-text"><spring:message code="ems.label.salaryslip.table.sickLeave"/></span>
									<input type="text" class="form-control1" path="sick_leave" name="sick_leave" id="sickleave" required="required">
								</div>
	
								<div class="input-group">
									<span class="input-group-text"><spring:message code="ems.label.salaryslip.table.earnedLeave"/></span>
									<input type="text" class="form-control1" path="earned_leave" name="earned_leave" id="earnedleave" required="required">
								</div>
				
								<button type="submit" style="margin-top: 22px;margin-left: 37%;" OnClick="onSubmit1()" id="submit1" ><spring:message code="ems.button.save"/></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" value="cancel" id="cancel"><spring:message code="ems.button.cancel"/></button>
							</div>
						</div>
					</form>
				</div>
			</div>
	
			<!-- Details popup  -->
			<div id="dialog1" hidden="hidden" class="modal fade in" style="margin-top:1%; overflow: auto; " data-backdrop="static">
				<div class="modal-dialog login1" style="width:685px;height:555px;margin-top:55px;">
					<form method="POST" id="updateemployee" modelAttribute="registermodel" action="${pageContext.request.contextPath}/update-Employee">	
						<div class="update">
							<h3 style="margin-left: 19px"> <spring:message code="ems.label.empList.table.details.title"/></h3>
							<div class="input-group" >
								<span class="input-group-text"><spring:message code="ems.label.employee.employeeID"/></span>
								<input type="text" class="form-control1 aa" path="employee_id" name="employee_id" id="id" readonly style="background-color: #ddd;">
							</div>
		
							<div class="input-group" >
								<span class="input-group-text"><spring:message code="ems.label.employee.firstName"/></span>
								<input type="text" class="form-control1" path="first_name" name="first_name" id="first_name" maxlength="30" required>
							</div>
							<div class="input-group">
								<span class="input-group-text"><spring:message code="ems.label.employee.lastName"/></span>
								<input type="text" class="form-control1" path="last_name" name="last_name" id="last_name"  maxlength="30" required>
							</div>
		
							<div class="input-group">
								<span class="input-group-text"><spring:message code="ems.label.employee.gender"/></span>
								<input type="radio" class="check_button" path="gender" name="gender" id="Mgender" value="M" style="margin-left: 41px">
								<label style=" margin-top: 12px;"><spring:message code="ems.label.employee.male"/></label>
								<input type="radio" class="check_button" path="gender" name="gender" id="Fgender" value="F" style="margin-left: 41px">
								<label style=" margin-top: 12px;"><spring:message code="ems.label.employee.female"/></label>
							</div>
		
							<div class="input-group">
								<span class="input-group-text"><spring:message code="ems.label.employee.dob"/></span>
								<input type="text" class="form-control1 " path="date_of_birth"  name="date_of_birth" id="dob" style="background-color: #ddd;" required>
								<i class="glyphicon glyphicon-calendar calendar-icon" id="date_icon" style="margin-top: -29px; margin-left: 489px; background-color: none; background: rgb(255 255 255 / 15%); border: 0px solid #ccc;"></i> 
							</div>
		
							<div class="input-group">
								<span class="input-group-text"><spring:message code="ems.label.employee.address"/></span>
								<input type="text" class="form-control1" path="address" name="address" id="address" maxlength="120" required>
							</div>
						
							<div class="input-group">
								<span class="input-group-text"><spring:message code="ems.label.employee.emailID"/></span>
								<input type="text" class="form-control1" path="email_id" name="email_id" id="email" maxlength="40" required>
							</div>
					
							<div class="input-group">
								<span class="input-group-text"><spring:message code="ems.label.employee.contactNo"/></span>
								<input type="text" class="form-control1" path="contact_number" name="contact_number" id="contactnum" onkeypress="return isNumber(event)" maxlength="10" required>
							</div>
							
							<div class="input-group">
								<span class="input-group-text"><spring:message code="ems.label.employee.batch"/></span>
								<div id="batch">
									<select  path="batch" class="form-control1" name="batch">
										<option value=""> </option>
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
							</div>
					
							<div class="input-group">
								<span class="input-group-text"><spring:message code="ems.label.employee.dateOfJoining"/></span>
								<input type="text"  class="form-control1 glyphicon glyphicon-calendar"  path="date_of_joining" name="date_of_joining" id="doj" required style="background-color: #ddd;" >
								<i class="glyphicon glyphicon-calendar calendar-icon" id="date_icon1" style="margin-top: -27px;
																											margin-left: 489px;
																											background-color: none;
																											background: rgb(255 255 255 / 15%);
																											border: 0px solid #ccc;"></i> 
							</div>
					
							<div class="input-group">
								<span class="input-group-text"><spring:message code="ems.label.employee.dateOfRelieving"/></span>
								<input type="text"  class="form-control1 glyphicon glyphicon-calendar" path="date_of_leaving" name="date_of_leaving" id="dor" style="background-color: #ddd;">
								<i class="glyphicon glyphicon-calendar calendar-icon" id="date_icon2" style="margin-top: -27px;
																											margin-left: 489px;
																											background-color: none;
																											background: rgb(255 255 255 / 15%);
																											border: 0px solid #ccc;"></i> 
							</div>
					
							<div class="input-group">
								<span class="input-group-text"><spring:message code="ems.label.employee.departmentName"/></span>
								<div id="department_id">
									<select class="form-control1" path="department_id" name="department_id" >
										<c:forEach items="${DepartmentList}" var="department">
											<option value=""></option>
											<option value="${department.department_id}" >${department.department_name} </option>
										</c:forEach>
									</select>
								</div>
							</div>
					
							<div class="input-group">
								<span class="input-group-text"><spring:message code="ems.label.employee.designation"/></span>
								<div id="designation_id">
									<select class="form-control1" path="designation_id" name="designation_id" >
										<c:forEach items="${DesignationList}" var="designation">
										<option value=""></option>
										<option value="${designation.designation_id}">${designation.designation_name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
					
							<div class="input-group">
								<span class="input-group-text"><spring:message code="ems.label.employee.accountNo"/></span>
								<input type="text" class="form-control1" path="account_number" name="account_number" id="accnum"  maxlength="15">
							</div>
						
							<div class="input-group">
								<span class="input-group-text"><spring:message code="ems.label.employee.pfAccNo"/></span>
								<input type="text" class="form-control1" path="pf_account_number" name="pf_account_number" id="pfaccnum"  maxlength="15">
							</div>
						
							<div class="input-group">
								<span class="input-group-text"><spring:message code="ems.label.employee.PAN"/></span>
								<input type="text" class="form-control1" path="pan" name="pan" id="pan"  maxlength="20">
							</div>
					
							<div class="input-group">
								<span class="input-group-text"><spring:message code="ems.label.employee.discontinued"/></span>
								<input type="hidden" path="discontinued" name="discontinued" id="textbox1"/>
								<input type="checkbox" class="check_button" id="checkbox"/>
							</div>
					
							<button type="submit" style="margin-top: 30px; margin-left: 35%;"  id="submit2"><spring:message code="ems.button.update"/></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" value="cancel" id="cancel1" ><spring:message code="ems.button.cancel"/></button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>