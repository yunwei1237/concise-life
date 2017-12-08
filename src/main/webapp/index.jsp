<%@page import="com.tcf.constant.PageNames"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String type = PageNames.INDEX;
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
			<li class="active">首页</li>
		</ol>
		<!-- 显示最近的4个日志 -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title text-primary">日志</h3>
			</div>
			<div class="panel-body">
				<c:forEach begin="1" end="3">
					<div class="list-group">
						<h4 class="list-group-item bg-info" style="background: #DEEFF7;">如何安装myeclise 10</h4>
						<a href="viewJournal.jsp" class="list-group-item"> 第一步，下载jdk……</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 显示最近的4张照片 -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title ">照片</h3>
			</div>
			<div class="panel-body">
				<div class="row">
					<c:forEach begin="1" end="4">
						<div class="col-sm-6 col-md-3">
							<div class="thumbnail">
								<img src="images/kittens.jpg" class="img-rounded"
									alt="通用的占位符缩略图">
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
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title text-primary">说说</h3>
			</div>
			<div class="panel-body">
				<c:forEach begin="1" end="3">
					<div class="well well-sm" style="overflow: hidden;">
						<h4>&nbsp;</h4>
						<h4 class="text-info" style="text-indent:2em;line-height: 1.5em;">
							人生的磨难是很多的，所以我们不可对于每一件轻微的伤害都过于敏感。在生活磨难面前，精神上的坚强和无动于衷是我们抵抗罪恶和人生意外的最好武器。
							—— 洛克</h4>
						<p
							class="text-primary col-sx-3 col-md-3 col-sx-offset-9 col-md-offset-9">
							作者：<strong>archer</strong>
						</p>
						<p
							class="text-primary col-sx-3 col-md-3 col-sx-offset-9 col-md-offset-9">
							时间：<strong>2016-12-12 12:44:33<strong>
						</p>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title text-primary">留言</h3>
			</div>
			<div class="panel-body">
				<c:forEach begin="1" end="3">
					<div class="media">
						<a class="pull-left" href="#"> <img class="media-object"
							src="images/64.jpg" alt="媒体对象"> </a>
						<div class="media-body">
							<h4 class="media-heading">初次认识</h4>
							<p style="text-indent: 2em;">你好，我们是第一个认识哦，希望以后能够多多联系，嘻嘻 ^_^</p>
						</div>
					</div>
					<hr />
				</c:forEach>
			</div>
		</div>
	</div>
	<%@ include file="/html/footer.html" %>
</body>
</html>
