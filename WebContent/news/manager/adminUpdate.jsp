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
			String id = request.getParameter("ID");
			if(!"总管理员".equals(mark) && id == null){
		%>
		<h1>
			<%
				out.println("普通管理员不具有本权限");
			%>
		</h1>
		<%
			}else{
		%>
		<h1>
			<%
				out.println("更新管理员信息");
			%>
		</h1>
		<form name="form" method="post" action="/NewProject/UpdateManager?managerID=<%=id %>" onsubmit="return RgTest()">
		<table class="table text-center">
			<%
				ResultSet rs = con.Querysimple("select * from tb_manager where ID="+id);
				if(rs.next()){
					int tr_id = rs.getInt("ID");
					String tr_name = rs.getString("Name");
					String tr_realname = rs.getString("RealName");
					String tr_issuedate = rs.getString("issuedate");
					String tr_mark = rs.getString("mark");
			%>
			<tr>
				<td>用户名</td>
				<td><input type="text" value="<%=tr_name %>" name="name"></td>
			</tr>
			<tr>
				<td>真实姓名</td>
				<td><input type="text" value="<%=tr_realname %>" name="realname"></td>
			</tr>
			<tr>
				<td>创建日期</td>
				<td><%=tr_issuedate %></td>
			</tr>
			<tr>
				<td>管理员类别</td>
				<td><%=tr_mark %></td>
			</tr>
			<tr>
				<td><input type="submit" value="提交"></td>
				<td><input type="button" value="重置" onclick="javascript:location.reload()"></td>
			</tr>
			<%
				}else{
					%>
					<tr>
						<td>查无此人</td>
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
		$('#adminselect').addClass("active")
	}
	
	function RgTest(date){
		if(document.form.name.value == ""){
			alert("请输入管理员账号:")
			document.form.name.focus()
			return false;
		}
		

		if(document.form.realname.value == ""){
			alert("请输入管理员姓名:")
			document.form.realname.focus()
			return false;
		}
		
		return true
	}
</script>

<%@ include file="../../footer.html" %>