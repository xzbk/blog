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
		<style type="text/css">
			.page {
			    margin: 120px 0;
			    text-align: center;
			    border-top: 1px solid #eee;
			    opacity: 1;
				display: block;
			}
			.page a{
			    text-decoration: none;
			}
			.page a:hover{
			    border-top: 1px solid black;
			}
			.page-number {
			    border-bottom: 0;
    			border-top: 1px solid #eee;
    			display: inline-block;
			    position: relative;
			    top: -1px; 
			    margin: 0 10px;
			    padding: 3px 10px; 
			}
			.current {
			    color: #fff;
			    background: #ccc;
			    border-top-color: #ccc;
			}
		</style>
	</head>
	<body>
		<!-- 右侧菜单 -->
		<jsp:include page="rightmenu.jsp"></jsp:include>
		<!--网页部分 header body footer-->
		<div id="container">
			<!--网页头部-->
			<jsp:include page="header.jsp"></jsp:include>
			<!--网页主体-->
			<div id="body">
				<div class="wid">
					<!-- 文章展示 -->
					<c:forEach items="${data.items }" var="item" varStatus="status">
						<div class="article text-center">
							<div class="article-title">
								<a href="">${item.name }</a>
								<div class="article-detail">
									<span class="glyphicon glyphicon-calendar"></span> 发表于
										<time>${item.time }</time> |
									<span class="glyphicon glyphicon-folder-open"></span>  分类于 
										<a href="<%=basePath%>article/queryAllByCategoryId?uid=${user.id }&tagId=${item.category.id }">${item.category.name }</a> |
									<span class="glyphicon glyphicon-tag"></span>  
										<a href="<%=basePath%>article/queryAllByTagId?uid=${user.id }&tagId=${item.tag.id }">${item.tag.name }</a>
								</div>
							</div>
							<div class="article-content text-left">
								<p class="article-description">1This success, coupled with later research showing that memory itself is not genetically determined, led Ericsson to conclude that the act of memorizi ...</p>
								<div class="text-center">
									<a href="<%=basePath%>article/queryById?uid=${user.id}&id=${item.id }" class="article-btn">阅读全文 »</a>
								</div>
							</div>
							<div class="article-footer">
	    						<div class="article-eof"></div>
							</div>
						</div>					
					</c:forEach>
				</div>
			</div>
			<!-- 网页底部 -->
			<footer class="wid">
				<!-- 分页信息  -->
				<c:if test="${totalPage>1 }">
					<div class="page">
						<c:choose>
							<c:when test="${data.currentPage>1 }">
								<a class="page-number prev" href="<%=basePath%>article/frontQueryAll?uid=${user.id }&currentPage=${data.currentPage-1 }"><</a>
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
									<a class="page-number" href="<%=basePath%>article/frontQueryAll?uid=${user.id }&currentPage=${page }">${page }</a>
								</c:otherwise>
							</c:choose>                            	
						</c:forEach>
						<c:choose>
							<c:when test="${data.currentPage<totalPage }">
								<a class="page-number next" href="<%=basePath%>article/frontQueryAll?uid=${user.id }&currentPage=${data.currentPage+1 }">></a>
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
