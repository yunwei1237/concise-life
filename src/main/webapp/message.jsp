<%@page import="com.tcf.constant.PageNames"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String type = PageNames.MESSAGE;
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
			<li class="active">留言</li>
		</ol>
		<div style="padding:15px;">
			<c:forEach begin="1" end="3">
				<div class="media">
					<div class="pull-left">
						<a href="#"><img class="media-object"
							src="images/64.jpg" alt="媒体对象"></a>
						<center style="margin: 5px 0px;font-weight: bolder;">archer</center>
					</div>
					<div class="media-body">
						<h4 class="media-heading">&nbsp;</h4>
						<p style="text-indent: 2em;">你好，我们是第一个认识哦，希望以后能够多多联系，嘻嘻 ^_^</p>
					</div>
				</div>
				<hr style="clear: both;" />
			</c:forEach>
			<div class="panel panel-default" style="margin-top:20px;">
				<div class="panel-heading">
					<h3 class="panel-title">请给我留言</h3>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label for="firstname" class="col-sm-2 control-label">昵称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="title"
									placeholder="请输入留言者昵称">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-2 control-label">留言内容</label>
							<div class="col-sm-10">
								<textarea rows="4" class="form-control" id="content"
									placeholder="请输入留言内容"></textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">留言</button>
								<button type="reset" class="btn btn-default">清空</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="container" style="text-align: center;">
		<ul class="pagination">
			<li><a href="#">&laquo;</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">&raquo;</a></li>
		</ul>
	</div>
	<%@ include file="/html/footer.html" %>
</body>
</html>
