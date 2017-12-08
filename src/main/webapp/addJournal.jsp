<%@page import="com.tcf.constant.PageNames"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String type = PageNames.JOURNAL;
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
	<%@ include file="/html/ckeditor.html" %>
	<script type="text/javascript" src="js/myjs/addJournal.js"></script>
  </head>
  <body class="container">
	<%@ include file="/html/header.html" %>
	<div class="container">
		<!-- 位置 -->
		<ol class="breadcrumb">
			<li><a href="${username }/index">简约人生</a></li>
			<li><a href="${username }/journal">日志</a></li>
			<li class="active">发表日志</li>
		</ol>
		<div class="panel panel-default" style="margin-top:20px;">
			<div class="panel-heading">
				<h3 class="panel-title">发表日志</h3>
			</div>
			<div class="panel-body">
				<form action="${username}/addJournal" class="form-horizontal" role="form">
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">标题</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="title" name="title"
								placeholder="请输入日志标题">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">日志内容</label>
						<div class="col-sm-9">
							<textarea class="form-control" id="content" name="content" placeholder="请输入日志内容"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button id="submit" type="submit" class="btn btn-default">发表</button>
							<button id="reset" type="button" class="btn btn-default">清空</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/html/footer.html" %>
</body>
</html>
