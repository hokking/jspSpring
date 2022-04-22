<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script type="text/javascript" src="/ckeditor/ckeditor.js" ></script>
<script type="text/javascript" src="/js/validation.js"></script>
<title>상품 등록</title>
</head>
<body>
	<fmt:setLocale value="${param.language}"/>
	<fmt:bundle basename="resourceBundle.message">
<!-- top 인클루드 시작 -->
	<jsp:include page="/ch03/top.jsp"/>
<!-- top 인클루드 끝 -->
<!-- content 시작 -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key="title"/></h1>
		</div>
	</div>
	<div class="container">
		<div class="text-right">
			<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
			<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
		</div>
	<!-- addProduct_process.jsp = common-fileupload -->
	<!-- addProduct_process2.jsp = cos.jaraddProduct_process2.jsp -->
		<form name="newProduct" action="addProduct_process2.jsp" 
			method="post" class="form-horizontal" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productId"/></label>
				<div class="col-sm-3">
					<input type="text" name="productId" id="productId" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="pname"/></label>
				<div class="col-sm-3">
					<input type="text" name="pname" id="pname" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitPrice"/></label>
				<div class="col-sm-3">
					<input type="text" name="uniPrice" id="uniPrice" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description"/></label>
				<div class="col-sm-5">
					<textarea rows="2" cols="50" class="form-control" name="description"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="manufacturer"/></label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="category"/></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitsInStock"/></label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" id="unitsInStock" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="condition"/></label>
				<div class="col-sm-5">
					<input type="radio" name="condition" id="condition1" value="new"/>
						<label for="condition1"><fmt:message key="condition_New"/></label>
					<input type="radio" name="condition" id="condition2" value="old"/>
						<label for="condition2"><fmt:message key="condition_Old"/></label>
					<input type="radio" name="condition" id="condition3" value="refurbished"/>
						<label for="condition3"><fmt:message key="condition_Refurbished"/></label>
				</div>
			</div>
			<!-- <div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>
			</div> -->
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productImage"/>(cos.jar)</label>
				<div class="col-sm-5">
					<input type="file" name="productImage2" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value='<fmt:message key="button"/>' onclick="CheckAddProduct()"/>
				</div>
			</div>
		</form>
	</div>
<!-- content 끝 -->
<script type="text/javascript">
	CKEDITOR.replace("description");
</script>
<!-- bottom 인클루드 시작 -->
	<jsp:include page="/ch03/bottom.jsp"/>
<!-- bottom 인클루드 끝 -->
	</fmt:bundle>
</body>
</html>