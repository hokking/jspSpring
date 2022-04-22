<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 구글 차트를 호출하기 위한 js 파일 라이브러리 -->
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<title>상품별 판매금액 합계 차트</title>
<script type="text/javascript">
	// 구글 차트 라이브러리 로딩
	google.load("visualization", "1", {
		"packages": ["corechart"]
	});
	
	google.setOnLoadCallback(drawChart);
	
	function drawChart() {
		var jsonData = $.ajax({
			url: "/chart/chart02_money",
			dataType: "json",
			async: false
		}).responseText;
		
		console.log("jsonData : " + jsonData);
		
		var data = new google.visualization.DataTable(jsonData);
		
		var chart = new google.visualization.ColumnChart(document.getElementById("chart_div"));

		chart.draw(data, {
			title: "상품별 판매 금액 합계 차트",
			curveType: "function",
			width: 600,
			height: 440
		});
	}
</script>
</head>
<body>
	<div id="chart_div"></div>
</body>
</html>