<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<%
	
	// 파일이 저장되는 경로
	String path = "C:\\upload";
	
	DiskFileUpload upload = new DiskFileUpload();
	// 업로드 할 파일의 최대 크기(1M)
	upload.setSizeMax(1000000);
	// 메모리상에 저장할 최대 크기
	upload.setSizeThreshold(4096);
	// 업로드된 파일을 임시 저장
	upload.setRepositoryPath(path);
	// 파싱 : 구문분석 + 의미분석
	// items 안에는 파일객체 + 폼 데이터가 섞여있음
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	// 폼 페이지에서 전송된 요청 파라미터가 없을 때까지 반복
	while (params.hasNext()) {
		// 전송된 요청 파라미터의 이름을 가져오도록 Iterator 객체 타입의 next() 메소드 사용
		FileItem item = (FileItem)params.next();
		// 요청 파라미터가 일반 데이터(text, checkbox, radio, textarea...)
		if (item.isFormField()) { 
			// id = a001
			String name = item.getFieldName(); // id
			String value = item.getString("utf-8"); // a001
			
			out.print(name + "=" + value + "<br />");
		} else { // 폼 페이지에서 전송된 요청 파라미터가 파일(input type='file')
			// 요청 파라미터 이름
			String fileFieldName = item.getFieldName();
			// 저장 파일 이름
			String fileName = item.getName();
			// 파일 콘텐츠 유형
			String contentType = item.getContentType();
			
			out.print(fileFieldName + "=" + fileName + "(" + contentType + ")");
			
			// 펭귄.jpg 가 됨
			fileName.substring(fileName.lastIndexOf("\\") + 1);
			long fileSize = item.getSize();
			
			// java.id.File -> 파일 객체 생성
			File file = new File(path + "/" + fileName);
			// 여기서 실제로 파일 생성(복사 완료)
			item.write(file);
		}
	}
%>
</body>
</html>