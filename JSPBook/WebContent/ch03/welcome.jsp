<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>
<!-- top.jsp 시작 -->
<%@ include file="top.jsp" %>
<!-- top.jsp 끝 -->
	<div class="jumbotron">
		<div class="container">
			<h3 class="display-3">
				Welcome to ${param.name}Shop
			</h3>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3>Welcome to ${param.name}Mart</h3>
		</div>
	</div>
<!-- bottom.jsp 시작 -->
<%@ include file="bottom.jsp" %>
<!-- bottom.jsp 끝 -->
</body>
</html>