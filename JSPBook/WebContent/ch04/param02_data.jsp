<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
	<h3><%= URLDecoder.decode(request.getParameter("title")) %></h3>
	<p>Today is : <%= request.getParameter("date") %></p><br />
	<%
		Enumeration<String> attrEnum = request.getAttributeNames();
		while(attrEnum.hasMoreElements()) {
			String name = attrEnum.nextElement();
			Object value = request.getAttribute(name);
			
			out.print("<b>" + name + "</b> = " + value + "<br />");
		}
	%>
</body>
</html>