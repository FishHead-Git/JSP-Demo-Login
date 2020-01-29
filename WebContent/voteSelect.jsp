<%@ include file="top.jsp" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    <div class="container">
    	<div class="row">
    		<p class="page-header"><strong>查看运动员名单</strong></p>
    	<%
    		String s1 = (String)session.getAttribute("s1");
    		if(s1 == null){
    	%>
    	<table class="table table-bordered">
    		<tr>
    			<td colspan="2">运动员</td>
    			<td>简介</td>
    			<td>操作</td>
    		</tr>
    		<%
    			rs = con.Querysimple("select * from tb_Vote");
    			while(rs.next()){
    				int id = rs.getInt("ID");
    				String name = rs.getString("Name");
    				String address= rs.getString("Address");
    				String age = rs.getString("Country");
    				String job = rs.getString("Job");
    				String remark = rs.getString("Remark");
    		%>
    		<tr>
    			<td style="background: #FFFFCC">姓名</td>
    			<td style="background: #FFFFCC"><%=name %></td>
    			<td rowspan="4"><%=remark %></td>
    			<td rowspan="4">
					<form action="voteAdd.jsp?ID=<%=id %>" name="form" method="post">
						<input class="btn btn-mini btn-warning" type="submit" name="Submit" value="投票">
					</form>
				</td>
    		</tr>
    		<tr>
    			<td>
    				出生地
    			</td>
    			<td>
    				<%=address %>
    			</td>
    		</tr>
    		<tr>
    			<td>
    				年龄
    			</td>
    			<td>
    				<%=age %>
    			</td>
    		</tr>
    		<tr>
    			<td>
    				项目
    			</td>
    			<td>
    				<%=job %>
    			</td>
    		</tr>
    		<%
    			}
    			con.close();
    		%>
    	</table>
    	<%
    		}else{
    			out.print("<h5>已经投过票了</h5>");
    		}
    	%>
    	</div>
    	
    </div>
    
    
<%@ include file="footer.html" %>