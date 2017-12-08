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
			<li class="active">照片</li>
		</ol>
		<c:forEach begin="1" end="5">
			<div class="row">
				<c:forEach begin="1" end="4">
					<div class="col-sm-6 col-md-3">
						<div class="thumbnail">
							<a href="viewPhoto.jsp"><img src="images/kittens.jpg" class="img-rounded" alt="通用的占位符缩略图"></a>
							<div class="caption">
								<h3 style="text-align: center;">可爱小猫</h3>
								<p style="text-indent: 2em;">嘻嘻，又变美了,好喜欢呢，啦啦啦啦……</p>
								<p style="text-align: center;">
									<a href="#" class="btn btn-primary" role="button">点赞</a>
									<a href="#" class="btn btn-default" role="button">踩它</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:forEach>
		<div class="panel panel-default" style="margin-top:20px;">
			<div class="panel-heading">
				<h3 class="panel-title">发表图片</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">标题</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title"
								placeholder="请输入图片标题">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">简介</label>
						<div class="col-sm-10">
							<textarea rows="4" class="form-control" id="content"
								placeholder="请输入简介"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">图片</label>
						<div class="col-sm-10">
							<input type="file" class="form-control" id="content"
								placeholder="选择图片" />
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
