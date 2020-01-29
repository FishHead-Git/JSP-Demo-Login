<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="managerheader.jsp" %>
<%@ include file="TaskMenu.jsp" %>
<%
	if(session.getAttribute("admin_name")==null)
		response.sendRedirect("managerCheck.jsp");
%>
	<div class="col-md-9 col-sm-8 text-center" style="border:2px solid black;margin:10px 10px;height:100%">
		<%
			String mark = (String)session.getAttribute("mark");
		%>
		<h1>
			<%
				out.println("普通管理员信息");
			%>
		</h1>
		
		<table class="table text-center">
			<thead>
				<td>数据库ID</td>
				<td>账号</td>
				<td>真实姓名</td>
				<td>注册时间</td>
				<td>管理员类别</td>
				<td>操作</td>
			</thead>
			<%
				ResultSet rs = con.Querysimple("select * from tb_manager");
				while(rs.next()){
					int tr_id = rs.getInt("ID");
					String tr_name = rs.getString("Name");
					String tr_realname = rs.getString("RealName");
					String tr_issuedate = rs.getString("issuedate");
					String tr_mark = rs.getString("mark");
					if(!"总管理员".equals(tr_mark)){
			%>
			<tr>
				<td><%=tr_id %></td>
				<td><%=tr_name %></td>
				<td><%=tr_realname %></td>
				<td><%=tr_issuedate %></td>
				<td><%=tr_mark %></td>
				<td><a href="changerPassword.jsp?ID=<%=tr_id %>">修改密码</a>
			<%
					}
				}
				rs.close();
				con.close();
			%>
		</table>
	</div>
</div>
<script type="text/javascript">
	onload = function() {
		$('#commonadminselect').addClass("active");
	}
	
</script>

<%@ include file="../../footer.html" %>