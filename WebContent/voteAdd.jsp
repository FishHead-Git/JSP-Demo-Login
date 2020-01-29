<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="top.jsp" %>
<%
	String id = request.getParameter("ID");
	String voteSQL = "update tb_Vote set Number=Number+1 where ID='"+id;
	con.executeUpdate(voteSQL);
	session.setAttribute("s1", session.getId());
	session.setMaxInactiveInterval(3600);
%>
<h4>投票成功!</h4>
<%@ include file="footer.html" %>
