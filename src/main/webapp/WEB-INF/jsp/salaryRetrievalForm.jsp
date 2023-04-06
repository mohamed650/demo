<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
	<title><spring:message code="ems.label.salaryslip.pageTitle"/></title>
	<jsp:include page="home.jsp"></jsp:include>
</head>

<body>
	<input type="hidden" value="/salary" id="page_name"/>
	<h4><spring:message code="ems.label.salaryslip.title"/></h4>
	<div class="container" style="width: 976px; margin-left: 202px;">
		<div class="row" >
			<div class="col-sm-12 col-lg-12 col-md-12 col-xs-12">
				<div class="form-group row">
					<div class="col-sm-5 col-lg-5 col-md-5 col-xs-5">
						<label id="emp_id_label" for="emp_id" class="col-sm-4 col-lg-4 col-md-4 col-xs-4 col-form-label ">
							<b><spring:message code="ems.label.employee.employeeID"/></b>
						</label>
						<div class="col-sm-8 col-lg-8 col-md-8 col-xs-8">
							<select class="form-control" data-bs-toggle="dropdown" id="emp_id_search" name="emp_id_search" style="width: 165px;">
							</select>
						</div>
					</div>
					<div class="col-sm-5 col-lg-5 col-md-5 col-xs-5">
						<label id="month_label" for="month" class="col-sm-6 col-lg-6 col-md-6 col-xs-6 col-form-label text-right">
							<b><spring:message code="ems.label.salaryslip.salaryDate"/></b>
						</label>
						<div class="col-sm-6 col-lg-6 col-md-6 col-xs-6">
							<div style="display: flex;">
								<input class="form-control" type="text" name="datepicker_salary" id="datepicker_val" disabled>
								<i class="glyphicon glyphicon-calendar calendar-icon" id="datepicker_icon"></i>
	 						 </div>
						</div>
					</div>
					<div class="col-sm-2 col-lg-2 col-md-2 col-xs-2 text-center">
						<button id="retrieve_button" type="submit" class="btn btn-secondary" disabled><spring:message code="ems.button.retrieve"/></button>
					</div>
				</div>
			</div>
		</div>
	</div><!-- closing container -->
	<div id="salary_table_div" style="margin-left: 220px;">
		<table id="salary_table" class="table" style="width: 85%;">
			<tbody>
				<tr>
					<td colspan="6" class="text-center"><b><spring:message code="ems.label.salaryslip.table.title1"/></b><br>
						<spring:message code="ems.label.salaryslip.table.title2"/><br>
						<p style="text-align: end;"><b><spring:message code="ems.label.salaryslip.table.payDate"/> </b><span id="payslip_date">XX/XXXX</span></p>
					</td>
				</tr>
				<tr>
					<th><spring:message code="ems.label.salaryslip.table.empNo"/></th><td id="emp_id"></td>
					<th><spring:message code="ems.label.salaryslip.table.bankName"/></th><td id="bank_name"></td>
					<th><spring:message code="ems.label.salaryslip.table.workedDays"/></th><td id="days_worked"></td>
				</tr>
				<tr>
					<th><spring:message code="ems.label.salaryslip.table.name"/></th><td id="emp_name"> </td>
					<th><spring:message code="ems.label.salaryslip.table.bankAccNo"/></th><td id="account_no"></td>
					<th><spring:message code="ems.label.salaryslip.table.earnedLeave"/></th><td id="el"></td>
				</tr>
				<tr>
					<th><spring:message code="ems.label.salaryslip.table.dep"/></th><td id="department_name"></td>
					<th><spring:message code="ems.label.salaryslip.table.pfAccNo"/></th><td id="pf_account_no"></td>
					<th><spring:message code="ems.label.salaryslip.table.sickLeave"/></th><td id="sl"></td>
				</tr>
				<tr>
					<th><spring:message code="ems.label.employee.designation"/></th><td id="designation_name"></td>
					<th><spring:message code="ems.label.salaryslip.table.pan"/></th><td id="pan_no"></td>
					<td></td><td id=""></td>
				</tr>
				<tr>
					<td colspan="6">
						<table class="table" style="margin-top: 20px;">
							<tbody>
								<tr>
									<th colspan="3" class="text-center"><spring:message code="ems.label.salaryslip.table.earnings"/></th>
									<th colspan="3" class="text-center"><spring:message code="ems.label.salaryslip.table.deductions"/></th>
									<th colspan="3" class="text-center"><spring:message code="ems.label.salaryslip.table.reimbursement"/></th>
								</tr>
								<tr>
									<td class="index">1</td><th><spring:message code="ems.label.salaryslip.table.basic"/></th><td id="basic_salary"></td>
									<td class="index">1</td><th><spring:message code="ems.label.salaryslip.table.pf"/></th><td id="pf"></td>
									<td class="index">1</td><th><spring:message code="ems.label.salaryslip.table.medicalReimbursement"/></th><td id="medical_reimbursement"></td>
								</tr>
								<tr>
									<td class="index">2</td><th><spring:message code="ems.label.salaryslip.table.dpa"/></th><td id="dpa"></td>
									<td class="index">2</td><th><spring:message code="ems.label.salaryslip.table.esi"/></th><td id="esi"></td>
									<td class="index">2</td><th><spring:message code="ems.label.salaryslip.table.ltaReimbursement"/></th><td id="lta_reimbursement"></td>
								</tr>
								<tr>
									<td class="index">3</td><th><spring:message code="ems.label.salaryslip.table.hra"/></th><td id="hra"></td>
									<td class="index">3</td><th><spring:message code="ems.label.salaryslip.table.profTax"/></th><td id="professionTax"></td>
									<td class="index">3</td><th><spring:message code="ems.label.salaryslip.table.elReimbursement"/></th><td id="el_reimbursement"></td>
								</tr>
								<tr>
									<td class="index">4</td><th>--</th><td></td>
									<td class="index">4</td><th><spring:message code="ems.label.salaryslip.table.incomeTax"/></th><td id="income_tax"></td>
									<td class="index">4</td><th>--</th><td></td>
								</tr>
								<tr>
									<td class="index">5</td><th>--</th><td></td>
									<td class="index">5</td><th><spring:message code="ems.label.salaryslip.table.staffWelfare"/></th><td id="staff_welfare"></td>
									<td class="index">5</td><th>--</th><td></td>
								</tr>
								<tr>
									<td class="index">6</td><th>--</th><td></td>
									<td class="index">6</td><th></th><td></td>
									<td class="index">6</td><th></th><td></td>
								</tr>
								<tr>
									<td class="index">7</td><th><spring:message code="ems.label.salaryslip.table.column_a_others"/></th><td id="column_a_others"></td>
									<td class="index">7</td><th><spring:message code="ems.label.salaryslip.table.column_b_others"/></th><td id="column_b_others"></td>
									<td class="index">7</td><th><spring:message code="ems.label.salaryslip.table.column_c_others"/></th><td id="column_c_others"></td>
								</tr>
								<tr>
									<td class="index"></td><th><spring:message code="ems.label.salaryslip.table.totalA"/></th><td id="total_a"></td>
									<td class="index"></td><th><spring:message code="ems.label.salaryslip.table.totalB"/></th><td id="total_b"></td>
									<td class="index"></td><th><spring:message code="ems.label.salaryslip.table.totalC"/></th><td id="total_c"></td>
								</tr>
								<tr>
									<th colspan="2" ><spring:message code="ems.label.salaryslip.table.totalPaid"/></th><td id="total_amount"></td>
									<td colspan="9"></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
	<script type="text/javascript" src="/js/customJs/salaryRetrieval.js"></script>
</html>