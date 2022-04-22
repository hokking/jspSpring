<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>숫자 형식 맞춰 화면 출력</title>
</head>
<body>
	<p>숫자 : <fmt:formatNumber value="3200100"/></p>
	<p>
		설정된 숫자를 숫자 형식으로 표현 : 
		<fmt:formatNumber value="3200100" type="number"/>
	</p>
	<p>
		천 단위 구분기호(,)없이 표현 : 
		<fmt:formatNumber value="3200100" type="number" groupingUsed="false"/>
	</p>
	<p>
		천 단위 구분기호(,)있고, 통화 형식으로 표현  : 
		<fmt:formatNumber value="3200100" type="currency" groupingUsed="true"/>
	</p>
	<p>
		천 단위 구분기호(,)있고, 통화 형식으로 표현  : 
		<fmt:formatNumber value="3200100" type="currency" currencySymbol="&"/>
	</p>
	<p>
		퍼센트 형식  : 
		<fmt:formatNumber value="0.45" type="percent"/>
	</p>
	<p>
		소수점 자리 표현(최대 10자리, 소수점 둘째 자리) : 
		<fmt:formatNumber value="3200100" minIntegerDigits="10" minFractionDigits="2"/>
	</p>
	<p>
		패턴 지정 : 
		<fmt:formatNumber value="3200100.45" pattern=".000"/>
	</p>
	<p>
		패턴 지정 : 
		<fmt:formatNumber value="3200100.456" pattern="#,#00.0#"/>
	</p>
</body>
</html>