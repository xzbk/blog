<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"
            +request.getServerName()+":"
            +request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>front/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>front/css/article.css"/>
		<script src="<%=basePath%>front/js/jquery-2.0.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath%>front/js/main.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<!-- 右侧菜单 -->
		<jsp:include page="rightmenu.jsp"></jsp:include>
		<!--网页部分 header body footer-->
		<div id="container">
			<!--网页头部-->
			<jsp:include page="header.jsp"></jsp:include>
			<div id="body">
				<div class="wid">
					<div class="article">
						<div class="article-title text-center">
							<span>${article.name }</span>
							<div class="article-detail">
								<span class="glyphicon glyphicon-calendar"></span> 发表于 <time>${article.time }</time> |
								<span class="glyphicon glyphicon-folder-open"></span>  分类于 <a href="">${article.category.name }</a> |
								<span class="glyphicon glyphicon-tag"></span>  ${article.tag.name }
							</div>
						</div>
						<div class="article-content">
							${article.content }
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
