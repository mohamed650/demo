<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
	<link href="${pageContext.request.contextPath}/resources/css/login/login.css" rel="stylesheet" >
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="/js/customJs/Login.js"></script>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="/css/Login.css"/>
	<title><spring:message code="ems.label.login.pageTitle"/></title>
</head>
<body>
	<div class="login-form">
		<form action="userlogin" method="POST">
			<h2 class="text-center"><spring:message code="ems.label.login.title"/></h2>
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">
								<span class="fa fa-user"></span>
							</span>	
						</div>

						<input type="text" class="form-control" id="uname" name="login_id"  required="required" autocomplete="off">
						<span id="error"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">
								<i class="fa fa-lock"></i>
							</span>
						</div>
						<input type="password" class="form-control" id="pass" name="password"  required="required">				
					</div>
				</div> 
				<div class="form-group">
					<button type="submit" class="btn btn-primary login-btn btn-block"><spring:message code="ems.button.login"/></button>
				</div>
				<b><p style="font-style: italic; color: red;">${errorMessage}</p></b>
		</form>
	</div>
</body>
</html>