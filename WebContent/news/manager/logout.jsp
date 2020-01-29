<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>退出后台</title>
</head>
<body>
	<%
		session.invalidate();
		response.sendRedirect("../../index.jsp");
	%>
</body>
</html>