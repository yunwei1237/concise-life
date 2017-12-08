<%@page import="com.tcf.constant.PageNames"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String type = PageNames.PHOTO;
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
			<li><a href="${username }/photo">照片</a></li>
			<li class="active">查看图片</li>
		</ol>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title text-primary" style="text-align: center;">可爱小猫</h3>
			</div>
			<div class="panel-body">
				<div>
					<!-- <img src="images/snow.jpg" class="img-rounded img-responsive" style="border:1px #CCC solid;margin:0px auto;"></img> -->
					<img src="images/kittens.jpg" class="img-rounded img-responsive" style="border:1px #CCC solid;margin:0px auto;"></img>
				</div>
				<div class="well well-sm" style="text-align: center;padding: 15px 0px 5px">
					<p>嘻嘻，又变美了,好喜欢呢，啦啦啦啦……</p>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/html/footer.html" %>
</body>
</html>
