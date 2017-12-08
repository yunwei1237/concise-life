<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String type = "talk";
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
	<script type="text/javascript" src="js/myjs/talk.js"></script>
  </head>
  <body class="container">
	<%@ include file="/html/header.html" %>
	<div class="container">
		<!-- 位置 -->
		<ol class="breadcrumb">
			<li><a href="${username }/index">简约人生</a></li>
			<li class="active">说说</li>
		</ol>
		<c:forEach begin="1" end="3">
			<div class="well well-sm" style="overflow: hidden;">
				<h4>&nbsp;</h4>
				<h4 class="text-info" style="text-indent:2em;line-height: 1.5em;">
					人生的磨难是很多的，所以我们不可对于每一件轻微的伤害都过于敏感。在生活磨难面前，精神上的坚强和无动于衷是我们抵抗罪恶和人生意外的最好武器。</h4>
				<p class="text-primary col-sx-3 col-md-3 col-sx-offset-9 col-md-offset-9">作者：<strong>archer</strong></p>
				<p class="text-primary col-sx-3 col-md-3 col-sx-offset-9 col-md-offset-9">时间：<strong>2016-12-12 12:44:33<strong></p>
			</div>
		</c:forEach>
		<div class="panel panel-default" style="margin-top:20px;">
			<div class="panel-heading">
				<h3 class="panel-title">发表说说（登录后可见）</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">发表内容</label>
						<div class="col-sm-9">
							<textarea rows="4" class="form-control" id="content"
								placeholder="请输入留言内容"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">发表</button>
							<button type="reset" class="btn btn-default">清空</button>
						</div>
					</div>
				</form>
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
