<%@page import="com.tcf.constant.PageNames"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	
  </head>
  
  <body class="container">
	<%@ include file="/html/header.html" %>
	<div class="container">
		<!-- 位置 -->
		<ol class="breadcrumb">
			<li><a href="${username }/index">简约人生</a>
			</li>
			<li class="active">日志</li>
		</ol>
		<c:choose>
			<c:when test="${fn:length(journals) >0 }">
				<c:forEach items="${journals }" var="journal" >
					<div class="list-group">
						<h4 class="list-group-item bg-info" style="background: #DEEFF7;">${journal.title }</h4>
						<!-- ${fn:substring(journal.content,0,15) }…… -->
						<a href="${username }/viewJournal?id=${journal.id }" class="list-group-item">摘要：${fn:substring(journal.content,0,15) }……</a>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="list-group">
						<h4 class="list-group-item bg-info" style="background: #DEEFF7;">系统提示</h4>
						<a href="viewJournal.jsp" class="list-group-item">该用户没有日志信息</a>
					</div>
			</c:otherwise>
		</c:choose>

		<!-- <button type="button" data-toggle="tooltip" style="position:fixed;top: 150px;right: 30px;z-index: 9999" class="btn btn-default btn-lg" onclick="window.location='addJournal';" title="进入发表日志">
			<img src="images/icon_edit.jpg" class="img-responsive" width="50px" height="50px"></img>
		</button> -->
		<img src="images/icon_edit.jpg" data-toggle="tooltip"
			style="position:fixed;bottom: 150px;right: 30px;z-index: 9999;cursor: pointer;"
			onclick="window.location='${username }/editJournal';" title="进入发表日志"
			class="img-responsive img-rounded" width="50px" height="50px"></img>
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
