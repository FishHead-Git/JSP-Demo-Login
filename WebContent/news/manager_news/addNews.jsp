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
				out.println("新增新闻");
			%>
		</h1>
		
		<form name="form" method="post" action="/NewProject/AddNews" onsubmit="return RgTest()">
		<table class="table text-center">
			<%
				ResultSet rs = con.Querysimple("select MAX(id) from tb_news");
				if(rs.next()){
					int tr_id = rs.getInt(1) + 1;
			%>
			<tr>
				<td>id</td>
				<td><input type="hidden" value="<%=tr_id %>" name="newsID" readonly="readonly"><%=tr_id %></td>
			</tr>
			<tr>
				<td>新闻类别</td>
				<td>
					<select name="newstype">
						<%
							ResultSet newstypers = con.Querysimple("select typename from tb_newsType");
							while(newstypers.next()){
								String typename = newstypers.getString("typename");
						%>
							<option name="newstype" value="<%=typename %>"><%=typename %></option>
						<%
							}
							newstypers.close();
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td>标题</td>
				<td><input type="text" name="title" placeholder="title" maxLength="100"></td>
			</tr>
			<tr>
				<td>类别</td>
				<td>
					<select name="stylename">
						<%
							ResultSet stylers = con.Querysimple("select stylename from tb_style");
							while(stylers.next()){
								String stylename = stylers.getString("stylename");
						%>
							<option name="stylename" value="<%=stylename %>"><%=stylename %></option>
						<%
							}
							stylers.close();
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td>正文</td>
				<td class="text-right">
					<textarea name="content" placeholder="content" maxLength="200" onblur="" style="width:75%;"></textarea>
					<p id="words">255</p>
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
		$('#newsselect').addClass("active");
	}
	
	
	function RgTest(date){
		if(document.form.title.value == ""){
			alert("请输入标题:")
			document.form.title.focus()
			return false;
		}
		
		if(document.form.content.value == ""){
			alert("请输入正文:")
			document.form.content.focus()
			return false;
		}
		
		return true
	}
</script>

<%@ include file="../../footer.html" %>