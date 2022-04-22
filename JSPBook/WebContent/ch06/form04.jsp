<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<form name="frm" method="post" action="form04_process.jsp">
		<label for="fr1">오렌지</label> 
		<input type="checkbox" id="fr1" name="fr" value="Orange">
		<label for="fr2">사과</label> 
		<input type="checkbox" id="fr2" name="fr" value="Apple">
		<label for="fr3">바나나</label> 
		<input type="checkbox" id="fr3" name="fr" value="Banana">
		<input type="submit" value="전송">
	</form>
</body>
</html>