<%@ include file="top.jsp" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	String type = request.getParameter("type");
%>
<div class="container">
	<div class="row">
		<p class="page-header"><strong><%=type %> 新闻</strong></p>
		<table class="table">
			<%
				rs = con.Querysimple("select * from tb_news where Type='"+type+"' order by IssDate desc");
				while(rs.next()){
					int contentID = rs.getInt("ID");
					String title = rs.getString("Title");
					String style = rs.getString("Style");
					String issDate = (String.valueOf(rs.getString("IssDate"))).substring(0, 16);
			%>
			<tr>
				<td class="col-md-9 text-left">
					<a href="newsContent.jsp?newsID=<%=contentID %>"><%=strcut.strcut('['+style+']', 30) %></a>
				</td>
				<td class="col-md-2 text-right">
					<%=issDate %>
				</td>
			</tr>
			<%
				}
				con.close();
			%>
		</table>
	</div>
</div>
    
<%@ include file="footer.html" %>