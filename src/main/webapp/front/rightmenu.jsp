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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>front/css/right_menu.css"/>
</head>
<body>
	<span id="top"></span><!--回到顶部标签标志位置-->
	<!--右侧菜单部分-->
	<div id="pointer" >
		<a class="glyphicon glyphicon-menu-hamburger point-color"></a><!--菜单指针-->
	</div>
	<div id="rtnTop">
		<a href="#top" class="glyphicon glyphicon-arrow-up point-color"></a><!--回到顶部-->
	</div>
	<!--右侧滑动菜单-->
	<div id="right-menu">
		<div id="menu-head" class="text-center">
			<a href="<%=basePath%>pageskip/goBackIndex"><img src="<%=basePath%>${user.header }" class="menu-head-img"/></a>
			<div id="menu-name">
				${user.name }
			</div>
			<div id="menu-detail">
				<ul class="list-inline">
					<li>
						<a href="#">
							<span class="menu-detail-count">40</span><br />
							<span>日志</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span class="menu-detail-count">10</span><br />
							<span>分类</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span class="menu-detail-count">20</span><br />
							<span>标签</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<!--日志微博链接-->
		<div class="links-of-author">
	                <span class="links-of-author-item">
	                  <a href="${user.github }" target="_blank" title="GitHub">
	                      <i class="fa"></i>GitHub
	                  </a>
	              </span>
	              <span class="links-of-author-item">
	                  <a href="https://www.baidu.com" target="_blank" title="Weibo">
	                      <i class="fa fa-fw fa-weibo"></i>Weibo
	                  </a>
	              </span>
	         </div>
	          <!--自定义链接地址-->
	          <div class="links">
	          	<div class="links-title">
	           	<span class="glyphicon glyphicon-link"></span>
	           	<span>Links</span>
	          	</div>
	          	<ul class="links-list">
	          		<c:forEach items="${links }" var="item">
	          			<li class="links-list-item">
		                  <a href="${item.href }" title="59's Personal Blog" target="_blank">${item.name }</a>
		                </li>
	          		</c:forEach>
	                <li class="links-list-item">
	                  <a href="http://fnine59.top/" title="59's Personal Blog" target="_blank">59's Personal Blog</a>
	                </li>
	                <li class="links-list-item">
	                  <a href="http://www.jq22.com/" title="jQuery插件库" target="_blank">jQuery插件库</a>
	                </li>
	            </ul>
	          </div>
	</div>
</body>
</html>