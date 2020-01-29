<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../manager/managerheader.jsp" %>
<%@ include file="../manager/TaskMenu.jsp" %>
<%
	if(session.getAttribute("admin_name")==null)
		response.sendRedirect("../manager/managerCheck.jsp");
%>
	<div class="col-md-9 col-sm-8 text-center" style="border:2px solid black;margin:10px 10px;height:100%">
		<%
			String mark = (String)session.getAttribute("mark");
			if(mark == null){
		%>
		<h1>
			<%
				out.println("管理员权限出现问题");
			%>
		</h1>
		<%
			}else{
		%>
		<h1>
			<%
				out.println("新闻管理");
			%>
		</h1>
		<span class="row"><a href="addNews.jsp" class="btn btn-info pull-right">新增</a></span>
		<table class="table text-center">
			<thead>
				<td>新闻ID</td>
				<td>标题</td>
				<td>正文</td>
				<td>类别</td>
				<td>风格</td>
				<td>创建时间</td>
				<td>操作</td>
			</thead>
			<%
				ResultSet rs = con.Querysimple("select * from tb_news");
				while(rs.next()){
					int tr_id = rs.getInt("ID");
					String tr_title = strcut.strcut(rs.getString("Title"), 10);
					String tr_content = strcut.strcut(rs.getString("content"), 10);
					String tr_type = rs.getString("Type");
					String tr_style = rs.getString("Style");
					String tr_issdate = rs.getString("IssDate");
			%>
			<tr>
				<td><%=tr_id %></td>
				<td><%=tr_title %></td>
				<td><%=tr_content %></td>
				<td><%=tr_type %></td>
				<td><%=tr_style %></td>
				<td><%=tr_issdate %></td>
				<td><a href="updateNewsType.jsp?ID=<%=tr_id %>">修改</a> <a href="javascript:projectDelete('<%=tr_id %>')">删除</a></td>
			</tr>
			<%
				}
				rs.close();
				con.close();
			%>
		</table>
		<%
			}
		
		%>
		
	</div>
</div>
<script type="text/javascript">
	onload = function() {
		$('#newsselect').addClass("active");
	}
	
	function projectDelete(date){
		if(confirm('确定删除此类别'))
			window.location="/NewProject/DeleteNewsType?ID="+date;
	}
</script>

<%@ include file="../../footer.html" %>