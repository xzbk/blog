<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"
            +request.getServerName()+":"
            +request.getServerPort()+path+"/";
%>
<!doctype html>
<html  class="x-admin-sm">
<head>
	<meta charset="UTF-8">
	<title>后台登录-X-admin2.2</title>
    <link rel="stylesheet" href="<%=basePath%>back/css/login.css">
    <script src="<%=basePath%>back/lib/layui/layui.js" charset="utf-8"></script>
</head>
<body class="login-bg">
    <div class="login layui-anim-up">
        <div class="message">用户登录</div>
        <div id="darkbannerwrap"></div>
        <form method="post" class="layui-form" action="<%=basePath%>user/login">
            <input name="name" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input value="登录" style="width:100%;" type="submit">
        </form>
    </div>
</body>
</html>