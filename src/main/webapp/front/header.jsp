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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=basePath%>front/css/main.css"/>
<title>网页头</title>
</head>
<body>
	<header class="text-center">
		<a href="https://github.com/xzbk">
			<img style="position: absolute; top: 0; left: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_left_darkblue_121621.png" alt="Fork me on GitHub">
		</a>
		<div id="header_content" class="wid">
			<div id="title" class="text-center">
				${user.name }
			</div>
			<div id="signature">
				${user.signature }
			</div>
			<nav> 
				<ul class="list-inline">
					<li>
						<a href="<%=basePath%>article/frontQueryAll?uid=${user.id }">
							<span class="glyphicon glyphicon-home"></span>
							<br />
							首页
						</a>
					</li>
					<li>
						<a href="<%=basePath%>tag/frontQueryAll?uid=${user.id }">
							<span class="glyphicon glyphicon-tags"></span>
							<br />
							标签
						</a>
					</li>
					<li>
						<a href="<%=basePath%>category/frontQueryAll?uid=${user.id }">
							<span class="glyphicon glyphicon-th"></span>
							<br />
							分类
						</a>
					</li>
					<!-- <li>
						<a href="archive.jsp">
							<span class="glyphicon glyphicon-folder-close"></span>
							<br />
							归档
						</a>
					</li> -->
					<li>
						<a href="<%=basePath%>about/frontQuery?uid=${user.id }">
							<span class="glyphicon glyphicon-user"></span>
							<br />
							关于
						</a>
					</li>
					<!-- <li>
						<a href="">
							<span class="glyphicon glyphicon-search"></span>
							<br />
							搜索
						</a>
					</li> --> 
				</ul>
			</nav>
		</div>
	</header>
</body>
</html>