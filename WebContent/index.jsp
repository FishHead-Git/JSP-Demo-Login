<%@include file="top.jsp" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div class="container col-md-9">
	<table class="table">
		<%
			String[] color = {"info", "warning", "success", "error"};
			int c=0;
			String sql1 = "select * from tb_newsType";
			ResultSet rs1 = con.Querysimple(sql1);
			while(rs1.next()){
				int id = rs1.getInt("ID");
				String typeName = rs1.getString("TypeName");		
		%>
		<tr class="<%=color[c] %>">
			<td><strong><%=typeName %></strong></td>
			<td style="text-align:right"><a href="type.jsp?type=<%=typeName %>" target="_blank"></a></td>
		</tr>
		<tr>
			<td colspan="2">
				<table>
					<%
						String sql2 = "select * from tb_news where Type='"+typeName+"' order by IssDate desc";
						rs2 = con.Querysimple(sql2);
						while(rs2.next()){
							int contentID = rs2.getInt("ID");
							String title = rs2.getString("Title");
							String content = rs2.getString("Content");
							String style = rs2.getString("Style");
							String issDate = (String.valueOf(rs2.getString("IssDate")));
					%>
					<tr>
						<td style="width:500px">
							<a href="newsContent.jsp?newsID=<%=contentID %>"><%=strcut.strcut('['+style+']'+title, 25) %></a>
						</td>
						<td>
							<%=issDate %>
						</td>
						<%
							c++;
							if(c == 4){
								c=0;
							}
						}
						%>
					</tr>
				</table>
			</td>
		</tr>
		<%
			}
			con.close();
		%>
	</table>
</div>
</div>
<%@include file="footer.html" %>