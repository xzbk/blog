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
		<link rel="stylesheet" type="text/css" href="<%=basePath%>front/css/categories.css"/>
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
					<div id="categories-title">
						<h1>categories</h1>
						<span class="count-total">目前共计&nbsp;${total }&nbsp;个分类</span>
					</div>
					<div id="categories-body">
						<div class="">
			              <ul class="category-list text-left">
			              	<c:forEach items="${data.items }" var="item">
				              	<li class="category-list-item">
				              		<a class="category-list-link" href="<%=basePath%>article/queryAllByCategoryId?uid=${user.id }&categoryId=${item.id }">${item.name }</a>
				              	</li>
			              	</c:forEach>
			              </ul>
			            </div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
