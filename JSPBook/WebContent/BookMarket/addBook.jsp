<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script type="text/javascript" src="/ckeditor/ckeditor.js" ></script>
<script type="text/javascript" src="/js/validationBook.js"></script>
<title>도서 등록</title>
</head>
<body>
<!-- top 인클루드 시작 -->
	<jsp:include page="/ch03/top.jsp"/>
<!-- top 인클루드 끝 -->
<!-- content 시작 -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 등록</h1>
		</div>
	</div>
	<div class="container">
	<!-- addProduct_process.jsp = common-fileupload -->
	<!-- addProduct_process2.jsp = cos.jaraddProduct_process2.jsp -->
		<form name="newBook" action="processAddBook.jsp" 
			method="post" class="form-horizontal" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">도서 코드</label>
				<div class="col-sm-3">
					<input type="text" name="bookId" id="bookId" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">도서명</label>
				<div class="col-sm-3">
					<input type="text" name="bname" id="bname" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" name="uniPrice" id="uniPrice" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">저자</label>
				<div class="col-sm-3">
					<input type="text" name="writer" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">출판사</label>
				<div class="col-sm-3">
					<input type="text" name="publisher" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">출판일</label>
				<div class="col-sm-3">
					<input type="date" name="pdate" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">총 페이지 수</label>
				<div class="col-sm-3">
					<input type="text" name="pageCnt" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세정보</label>
				<div class="col-sm-5">
					<textarea rows="2" cols="50" class="form-control" name="details"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">재고 수</label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" id="unitsInStock" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상태</label>
				<div class="col-sm-5">
					<input type="radio" name="condition" id="condition1" value="new"/>
						<label for="condition1">신규 제품</label>
					<input type="radio" name="condition" id="condition2" value="old"/>
						<label for="condition2">중고 제품</label>
					<input type="radio" name="condition" id="condition3" value="refurbished"/>
						<label for="condition3">재생 제품</label>
				</div>
			</div>
			<!-- <div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>
			</div> -->
			<div class="form-group row">
				<label class="col-sm-2">이미지(cos.jar)</label>
				<div class="col-sm-5">
					<input type="file" name="bookImage2" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="등록" onclick="CheckAddBook()"/>
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
</body>
</html>