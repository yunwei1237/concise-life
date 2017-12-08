<%@page import="com.tcf.constant.PageNames"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String type = PageNames.CONTACT;
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>简约人生</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@ include file="/html/bootstrap.html" %>
  </head>
  
  <body class="container">
	<%@ include file="/html/header.html" %>
	<div class="container">
		<!-- 位置 -->
		<ol class="breadcrumb">
			<li><a href="${username }/index">简约人生</a></li>
			<li class="active">联系方式</li>
		</ol>
		<table class="table table-hover">
			<h3><center>个人简介</center></h3>
			<!-- <thead>
				<tr>
					<th>名称</th>
					<th>城市</th>
				</tr>
			</thead> -->
			<tbody>
				<tr>
					<td>姓名：</td>
					<td>谭超峰</td>
				</tr>
				<tr>
					<td>英文：</td>
					<td>Archer Tan</td>
				</tr>
				<tr>
					<td>职位：</td>
					<td>Java Web 讲师</td>
				</tr>
				<!-- <tr>
					<td>就职：</td>
					<td>广州北大青鸟（科苑）</td>
				</tr>
				<tr>
					<td>产品：</td>
					<td>ACCP产品和JAVA学士后</td>
				</tr> -->
			</tbody>
		</table>
	</div>
	<%@ include file="/html/footer.html" %>
</body>
</html>
