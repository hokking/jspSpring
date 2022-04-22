<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>File Upload</title>
</head>
<body>
<!--  
	* 파일 업로드란?
	- 웹 브라우저에서 서버로 파일을 전송하여 서버에 저장하는 것
	- 이미지 파일, binary 파일, 문서, 텍스트 파일
	- form 태그 내에 사용되어야 함. 오픈 라이브러리(common-fileupload)를 사용.
	- 서버로 파일이 업로드되면? 서버는 오청 파라미터를 분석하여 파일을 찾고 파일 저장 폴더에 저장.
		이 처리는 단순한 자바 코드로 작성 불가.
-->
	<form name="frm" method="post" action="fileupload01_process.jsp"
		enctype="multipart/form-data">
		<p>파일 : <input type="file" name="filename" /></p>
		<p><input type="submit" value="파일 올리기"></p>
	</form>
</body>
</html>