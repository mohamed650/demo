<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title><spring:message code="ems.label.home.pageTitle"/></title>
	
	<link rel="stylesheet" href="/csslib/bootstrap.min.css"/>
	<link rel="stylesheet" href="/csslib/bootstrap-datepicker.css"/>
	<link rel="stylesheet" href="/tabulator-5.3/dist/css/tabulator.min.css"/>
	<link rel="stylesheet" href="/css/common.css"/>
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">
	
	<script type="text/javascript" src="/js/plugins/jquery.min.js"></script>
	<script type="text/javascript" src="/js/plugins/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/plugins/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="/tabulator-5.3/dist/js/tabulator.min.js"></script>
	<script type="text/javascript" src="/js/customJs/home.js"></script>
	<script type="text/javascript">
		<c:set var="errorKey" value="MSG"></c:set>
		<c:forEach begin="01" end="17" var="i">
			var <c:out value="${errorKey.concat(i)}"></c:out>= "<spring:message code="${errorKey.concat(i)}" />";
		</c:forEach>
	</script>

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-1 col-lg-1 col-md-1 col-xs-1" >
				<a href="#" title="logo" rel="home">
					<img src="${pageContext.request.contextPath}/images/logo.png" id="img-logo">
				</a>
			</div><!-- Close col sm1-->
			
			<div class="col-sm-10 col-lg-10 col-md-10 col-xs-10">
				<h3><b><spring:message code="ems.label.home.projectTitle"/></b></h3><br>
			</div><!--.col-sm-10 page-header-top-right-->
		</div><!--.row -->
	</div>
	<div class="row main-navigation" style="height: 45px;">
		<div class="col-sm-5 col-lg-5 col-md-5 col-xs-5"></div>
		<div class="col-sm-7 col-lg-7 col-md-7 col-xs-7">
			<ul id="menu-main-menu" class="nav navbar-nav" >
				<li id="emplyoeeList"><a href="/employeeList" title="Get Employee list"><i class="glyphicon glyphicon-th-list"></i> <spring:message code="ems.label.home.employeeList"/></a></li>
				<li id="register"><a href="/registerEmployee" title="Register New Employee"><i class="glyphicon glyphicon-edit"></i> <spring:message code="ems.label.home.register"/></a></li>
				<li id="salaryRetrieval"><a href="/salary" title="Get Salary details"><i class="glyphicon glyphicon-usd"></i> <spring:message code="ems.label.home.retrieveSalary"/></a></li>
				<li id="discontinuedList"><a href="/discontEmp" title="Get Discont. List"><i class="glyphicon glyphicon-user"></i> <spring:message code="ems.label.home.discontinuedEmployees"/></a></li>
				<li id="logout"><a href="/logout" title="Logout"><i class="glyphicon glyphicon-log-out"></i></a></li>
			</ul>
		</div><!-- closing col-md-6 -->
	</div><!--.main-navigation-->
</body>
</html>