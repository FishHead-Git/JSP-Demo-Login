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
		<form name="form" method="post" action="/NewProject/AddManager" onsubmit="return RgTest()">
		<table class="table text-center">
			<%
				ResultSet rs = con.Querysimple("select MAX(id) from tb_manager");
				if(rs.next()){
					int tr_id = rs.getInt(1) + 1;
			%>
			<tr>
				<td>id</td>
				<td><input type="number" value="<%=tr_id %>" name="managerID" readonly="readonly"></td>
			</tr>
			<tr>
				<td>用户名</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>真实姓名</td>
				<td><input type="text" name="realname"></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>确认密码</td>
				<td><input type="password" name="confirm"></td>
			</tr>
			<tr>
				<td>创建管理员权限</td>
				<td>
					<select name="mark">
						<option name="mark" value="普通管理员">普通管理员</option>
						<option name="mark" value="总管理员">总管理员</option>
					</select>
				</td>
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
		
		if(document.form.password.value == ""){
			alert("请输入管理员密码:")
			document.form.password.focus()
			return false;
		}
		
		if(document.form.confirm.value == ""){
			alert("请输入管理员确认密码:")
			document.form.confirm.focus()
			return false;
		}
		
		if(document.form.password.value != ocument.form.confirm.value){
			alert("两次密码不一致")
			document.form.realname.focus()
			return false;
		}
		
		return true
	}
</script>

<%@ include file="../../footer.html" %>