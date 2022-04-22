<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please Sign in</h3>
			<c:if test="${param.error eq '1'}">
				<div class="alert alert-danger">
					아이디와 비밀번호를 확인해주세요.
				</div>
			</c:if>
		</div>
		<!-- j_security_check, j_username, j_password : 폼 기반 인증 처리 -->
		<form class="form-signin" method="post" action="j_security_check">
			<div class="form-group">
				<label for="inputUserName" class="sr-only">User Name</label>
				<input type="text" class="form-control" placeholder="ID" name="j_username" required autofocus/>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="sr-only">Password</label>
				<input type="password" class="form-control" placeholder="Password" name="j_password" required autofocus/>
			</div>
			<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
		</form>
	</div>
</body>
</html>