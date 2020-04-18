<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"
            +request.getServerName()+":"
            +request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>front/css/footer.css"/>
<link>
</head>
<body>
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
</body>
</html>