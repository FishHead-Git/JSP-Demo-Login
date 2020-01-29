<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="top.jsp" %>

<%!
	int tot_num=0;
	int tmp_num=0;
%>
	<div class="container">
		<p class="page-header"><strong>查看运动员票数</strong></p>
		<table class="table">
			<%
				String[] color = {"info", "warning", "success"};
				int c=0;
				ResultSet tmpRs = con.executeQuery("select sum(Number) as totalnum from tb_Vote");
				tmpRs.next();
				tot_num = tmpRs.getInt("totalnum");
				tmpRs.close();
				rs = con.executeQuery("select * from tb_Vote");
				int i = 1;
				while(rs.next()){			
			%>
			<tr class="<%=color[c]  %>">
				<td colspan="3" class="text-right">选项<%=i %>:<%=rs.getString("Name") %></td>
			</tr>
			<tr>
				<td>
					投票率:
				</td>
				<td>
					<%tmp_num = rs.getInt("Number"); %>
					<div class="progress progress-<%=color[c] %>">
						<div class="bar"></div>
					</div>
				</td>
				<td>
					<%=Math.floor(tmp_num*100/tot_num) %>[ 得: <%=tmp_num %>票 共: <%=tot_num %> 票 ]
				</td>
			</tr>
			<%
					i++;
					c++;
					if(c==3){
						c=0;
					}
				}
			%>
		</table>
		<%
			con.close();
		%>
	</div>
<%@ include file="footer.html" %>