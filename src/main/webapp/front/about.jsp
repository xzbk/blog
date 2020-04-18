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
			<!-- 网页主体 -->
			<div id="body">
				<div class="wid text-center">
					<div id="about-title" style="margin-bottom: 20px;">
						<h1>about</h1>
					</div>
					<div id="about-body">
						${about.content }
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
