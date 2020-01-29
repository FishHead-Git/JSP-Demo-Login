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
				out.println("新闻类别");
			%>
		</h1>
		
		<form name="form" method="post" action="/NewProject/AddNewsType" onsubmit="return RgTest()">
		<table class="table text-center">
			<%
				ResultSet rs = con.Querysimple("select MAX(id) from tb_newstype");
				if(rs.next()){
					int tr_id = rs.getInt(1) + 1;
			%>
			<tr>
				<td>id</td>
				<td><input type="hidden" value="<%=tr_id %>" name="newsTypeID" readonly="readonly"><%=tr_id %></td>
			</tr>
			<tr>
				<td>新闻类别</td>
				<td><input type="text" name="newsType"></td>
			</tr>
			<tr>
				<td><input type="submit" value="提交"></td>
				<td><input type="button" value="重置" onclick="javascript:location.reload()"></td>
			</tr>
			<%
				}else{
					%>
					<tr>
						<td>数据出错</td>
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
	
	function projectDelete(date){
		if(confirm('确定删除此类别'))
			window.location="/NewProject/DeleteNewsType?ID="+date;
	}
	
	function RgTest(date){
		if(document.form.newsType.value == ""){
			alert("请输入类别:")
			document.form.newsType.focus()
			return false;
		}
		return true
	}
</script>

<%@ include file="../../footer.html" %>