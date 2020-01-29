<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="managerheader.jsp" %>
<%@ include file="TaskMenu.jsp" %>
<%
	if(session.getAttribute("admin_name")==null)
		response.sendRedirect("managerCheck.jsp");
%>
<div class="col-md-9 col-sm-8 text-center" style="border:2px solid black;margin:10px 10px;height:100%">
	<h1>操作成功</h1>
	<div class="row"><a href="manager_main.jsp" class="btn btn-default">返回主页</a></div>
</div>
</div>
<%@ include file="../../footer.html" %>