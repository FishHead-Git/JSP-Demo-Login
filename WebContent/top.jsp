<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="javafx.scene.input.DataFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>	
	<meta charset="utf-8">
	<title>新闻管理系统</title>
	<link href="css/bootstrap.css" type="text/css" rel="stylesheet" />
	<!-- <link href="css/layout.css" type="text/css" rel="stylesheet" /> -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script language="javascript">
		$(document).ready(function(e){
			$("#nav>li").mousemove(function(e){
				$(this).addClass("active");
				$(this).siblings().removeClass("active");
			});
			$("#nav>li").mouseout(function(e){
				$(this).removeClass("active");
			});
			Timeshow()
		});
	</script>
	
	<style>
		#link td,#vote td{
			text-align: center;
		}
		
		.text-color-white{
			color: white;
		}
	</style>
	
	</head>
	<body>
		<jsp:useBean id="con" class="news.DBconn" scope="request" />
		<jsp:useBean id="strcut" class="Convert.StrCut" scope="request" />
		<div class="container" style="background:url(images/banner.jpg);height:10%;">
			<div class="row" style="padding-top:70px;">
				<div id="TimeDiv" class="col-md-6 text-color-white">
				</div>
				<div  class="col-md-6 text-right">
					<a href="news/manager/managerCheck.jsp" target="_parent" onClick="alert('确定要进入网页的后台吗！'); return true">进入后台</a>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="navbar">
				<div class="navbar-inner">
					<ul class="nav nav-pills col-md-5" id="nav">
						<li class="nav-item">
						<a href="index.jsp">首页</a>
						</li>
						<%
							ResultSet rs = null;
							rs = con.Querysimple("select ID, TypeName from tb_newsType");
							while(rs.next()){
								int id = rs.getInt("ID");
								String typeName = rs.getString("TypeName").trim();
						%>
						<li class="nav-item">
							<a href="type.jsp?type=<%=typeName %>"><%=typeName %></a>
						</li>
						<%
							}
							con.close();
						%>
					</ul>
					<form class="navbar-form pull-right" onSubmit="retrun RgTest()" name="form" method="post" action="keySeack.jsp" target="main">
						<input type="text" class="span2" name="key" />
						<select style="width:150px;" name="TypeName" >
							<option selected="selected">搜索类型</option>
							<%
								rs = con.Querysimple("Select TypeName from tb_newsType");
								while(rs.next()){
									String typeName = rs.getString("TypeName");
							%>
							<option value="<%=typeName %>"><%=typeName %></option>
							<%
								}
								con.close();
							%>
						</select>
						<button type="submit" class="btn">搜索</button>	
					</form>
				</div>
			</div>
			<div class="container col-md-3">
				<div class="row">
					<div class="well" style="width:200px;">
						<table class="table" id="vote">
							<thead>
								<tr>
									<th>
										<center>投票</center>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<a href="voteSelect.jsp" target="main">中国奥运金牌运动员</a>
									</td>
								</tr>
								<tr>
									<td>
										<a href="voteView.jsp" target="main">金牌运动员甄选结果</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="row" style="width:200px">
						<table class="table" id="link">
							<thead>
								<tr>
									<th>
										<center>友情连接</center>
									</th>
								</tr>
							</thead>
							<tbody>
								<%
									ResultSet rs2 = con.executeQuery("select * from tb_Link");
									while(rs2.next()){
										String UName = rs2.getString("Name");
										String UAddress = rs2.getString("Address");
								%>
								<tr>
									<td>
										<a href="<%=UAddress %>" target="_parent"><%=UName %></a>
									</td>
								</tr>
								<%
									}
									con.close();
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		<script type="text/javascript">
		function RgTest(){
			if(document.form.key.value==""){
				window.alert("请输入新闻关键字!")
				document.form.key.focus();
				return false;
			}
			if(document.form.type.value==""){
				window.alert("请选择新闻类型！")
				document.form.type.focus();
				return false;
			}
			return true;
		}
		
		function Timeshow(){
			var date = new Date()
			var years = date.getFullYear()
			var months = date.getMonth() + 1
			var day = date.getDay()
			var hour = date.getHours()
			var minutes = date.getMinutes()
			var seconds = date.getSeconds()
			document.getElementById("TimeDiv").innerText = years+"年"+months+"月"+day+"日 "+hour+":"+minutes+":"+seconds
			setTimeout(Timeshow, 1000);
		}
	</script>