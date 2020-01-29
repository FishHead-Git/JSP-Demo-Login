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
			String adminpassword = (String)session.getAttribute("admin_password");
			if(id == null){
		%>
		<h1>
			<%
				out.println("页面错误,查无此人");
			%>
		</h1>
		<%
			}else{
		%>
		<h1>
			<%
				out.println("更新管理员密码");
				
			%>
		</h1>
		<form name="form" method="post" action="/NewProject/AdminCheckPassword?managerID=<%=id %>" onsubmit="return RgTest()">
		<table class="table text-center">
			<tr>
				<td>旧密码</td>
				<td><input type="password" name="oldpassword" placeholder="old password"></td>
			</tr>
			<tr>
				<td>新密码</td>
				<td><input type="password" name="newpassword" placeholder="new password"></td>
			</tr>
			<tr>
				<td>确认密码</td>
				<td><input type="password" name="confirmpassword" placeholder="confirm"></td>
			</tr>
			<tr>
				<td><input type="submit" value="提交"></td>
				<td><input type="reset" value="重置"></td>
			</tr>
			<%
				
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
		if(document.form.oldpassword.value == ""){
			alert("请输入旧密码:")
			document.form.oldpassword.focus()
			return false;
		}
		
		if(document.form.newpassword.value == ""){
			alert("请输入新密码:")
			document.form.newpassword.focus()
			return false;
		}
		
		if(document.form.confirmpassword.value == ""){
			alert("请输入确认密码:")
			document.form.confirmpassword.focus()
			return false;
		}

		if(document.form.confirmpassword.value == document.form.newpassword.value){
			alert("两次密码不一致:")
			document.form.newpassword.value.focus()
			return false;
		}
		
		if(document.form.oldpassword.value != <%=adminpassword %>){
			alert("旧密码错误:")
			document.form.oldpassword.value.focus()
			return false;
		}
		
		return true
	}
</script>

<%@ include file="../../footer.html" %>