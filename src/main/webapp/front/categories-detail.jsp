<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<link rel="stylesheet" type="text/css" href="<%=basePath%>front/css/archive.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>front/css/footer.css"/>
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
					<div id="archive-content" class="text-left">
						<div class="archive-counter">
							<span class="archive-cite"></span>
							<h1>
								<c:forEach begin="0" end="0" items="${data.items }" var="item">
									${item.category.name }
								</c:forEach>
								<small>分类</small>
        					</h1>
			            </div>
			            <c:forEach items="${data.items }" var="item">
			            	<article class="post post-type-normal" itemscope="" itemtype="http://schema.org/Article">
							    <div class="post-header">
							      <h2 class="post-title">
								        <time class="post-time" itemprop="dateCreated" datetime="2019-04-10T13:27:21+08:00" content="2019-04-10">
								        	<small>
								        		<fmt:formatDate value="${item.time}" pattern="MM-dd"/>
								        	</small>
								        </time>
							            <a class="post-title-link" href="<%=basePath%>article/queryById?uid=${user.id }&id=${item.id }" itemprop="url">
							                <span itemprop="name">${item.name }</span>
							            </a>
							      </h2>
							    </div>
						    </article>
			            </c:forEach>
					</div>
				</div>
			</div>
			<!-- 网页底部 -->
			<footer class="wid">
				<!-- 分页信息  -->
				<c:if test="${totalPage>1 }">
					<div class="page">
						<c:choose>
							<c:when test="${data.currentPage>1 }">
								<a class="page-number prev" href="<%=basePath%>article/queryAllByCategoryId?uid=${user.id }&categoryId=${categoryId }&currentPage=${data.currentPage-1 }"><</a>
							</c:when>
							<c:otherwise>
								<a class="page-number prev"><</a>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="1" end="${totalPage }" var="page">
							<c:choose>
								<c:when test="${page==data.currentPage }">
									<span class="page-number current">${page }</span>
								</c:when>
								<c:otherwise>
									<a class="page-number" href="<%=basePath%>article/queryAllByCategoryId?uid=${user.id }&categoryId=${categoryId }&currentPage=${page }">${page }</a>
								</c:otherwise>
							</c:choose>                            	
						</c:forEach>
						<c:choose>
							<c:when test="${data.currentPage<totalPage }">
								<a class="page-number next" href="<%=basePath%>article/queryAllByCategoryId?uid=${user.id }&categoryId=${categoryId }&currentPage=${data.currentPage+1 }">></a>
							</c:when>
							<c:otherwise>
								<a class="page-number">></a>
							</c:otherwise>
						</c:choose>
		            </div>
				</c:if>
			</footer>
		</div>
	</body>
</html>
