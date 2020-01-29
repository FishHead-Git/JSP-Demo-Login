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
			String id = request.getParameter("ID");
			if(mark == null && id == null){
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
				out.println("修改新闻类别");
			%>
		</h1>
		<form name="form" method="post" action="/NewProject/UpdateNewsType" onsubmit="return RgTest()">
		<table class="table text-center">
			<%
				ResultSet rs = con.Querysimple("select * from tb_newstype where id="+id);
				if(rs.next()){
					int tr_id = rs.getInt("ID");
					String tr_name = rs.getString("TypeName");
					String tr_datetime = rs.getString("datetime");
			%>
			<tr>
				<td>类别ID</td>
				<td><input type="hidden" value="<%=tr_id %>" name="id"><%=tr_id %></td>
			</tr>
			<tr>
				<td>类别</td>
				<td><input type="text" value="<%=tr_name %>" name="typename"></td>
			</tr>
			<tr>
				<td>创建时间</td>
				<td><%=tr_datetime %></td>
			</tr>
			<tr>
				<td><input type="submit" value="提交"></td>
				<td><input type="reset" value="重置"></td>
			</tr>
			<%
				}else{
					%>
					<tr>
						<td>无效id</td>
					</tr>
					<%
				}
				rs.close();
				con.close();
			%>
		</table>
		</form>
		<%
			}
		%>
	</div>
</div>
<script type="text/javascript">
	onload = function() {
		$('#categoryselect').addClass("active");
	}
	function RgTest(date){	
		if(document.form.typename.value == ""){
			alert("请输入新闻类别名称:")
			document.form.typename.focus()
			return false;
		}
		
		return true
	}
</script>

<%@ include file="../../footer.html" %>