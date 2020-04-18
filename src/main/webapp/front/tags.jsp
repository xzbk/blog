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
		<link rel="stylesheet" type="text/css" href="<%=basePath%>front/css/tags.css"/>
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
					<div id="tags-title">
						<h1>tags</h1>
						<span class="count-total">目前共计&nbsp;${total }&nbsp;个标签</span>
					</div>
					<div id="tags-body">
						<div class="tag-cloud-tags">
							<c:forEach items="${data.items }" var="item" varStatus="status">
								<c:choose>
									<c:when test="${(status.index+1)%9!=0 }">
										<a href="<%=basePath%>article/queryAllByTagId?uid=${user.id }&tagId=${item.id }" style="font-size: 12px; color: #ccc">${item.name }</a>
									</c:when>
									<c:otherwise>
										<a href="<%=basePath%>article/queryAllByTagId?uid=${user.id }&tagId=${item.id }" style="font-size: 12px; color: #ccc">${item.name }</a>
										<br>
									</c:otherwise>
								</c:choose>
							</c:forEach>
			            </div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
