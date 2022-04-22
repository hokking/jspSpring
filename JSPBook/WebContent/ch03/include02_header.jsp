<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	int pageCount = 27;
	void addCount() {
		pageCount++;
	}
%>

<%
	addCount();
%>
<p>태영이의 나이는 <%= pageCount %>살 입니다.</p>