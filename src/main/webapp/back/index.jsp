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
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>后台登录-X-admin2.2</title>
        <link rel="stylesheet" href="<%=basePath%>back/css/font.css">
        <link rel="stylesheet" href="<%=basePath%>back/css/xadmin.css">
        <script src="<%=basePath%>back/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="<%=basePath%>back/js/xadmin.js"></script>
        <script>
            // 是否开启刷新记忆tab功能
            // var is_remember = false;
        </script>
    </head>
    <body class="index">
        <!-- 顶部开始 -->
        <div class="container">
        	<!--用户名-->
            <div class="logo">
                <a href="./index.jsp">Blog</a>
            </div>
            <!--左侧菜单展开与否控制按钮-->
            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>
            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item to-index">
                    <a href="<%=basePath%>article/frontQueryAll?uid=${user.id }">前台首页</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">${user.name }</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a href="<%=basePath%>user/logout">退出</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                	<li>
                        <a href="<%=basePath%>back/info.jsp" target="x-frame">
                            <i class="iconfont left-nav-li" lay-tips="用户信息">&#xe726;</i>
                            <cite>用户信息</cite>
                        </a>
                   	</li>
                   <!-- 文章分类管理   -->
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="文章相关管理">&#xe6ce;</i>
                            <cite>文章相关管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a href="<%=basePath%>link/backQueryAll?uid=${user.id }" target="x-frame">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>连接信息</cite></a>
                            </li>
                            <li>
                                <a href="<%=basePath%>tag/backQueryAll?uid=${user.id }" target="x-frame">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>标签信息</cite></a>
                            </li>
                            <li>
                                <a href="<%=basePath%>category/backQueryAll?uid=${user.id }" target="x-frame">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>分类信息</cite></a>
                            </li>
                            <li>
                                <a href="<%=basePath%>about/backQuery?uid=${user.id }" target="x-frame">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>个人关于页面</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="文章管理">&#xe723;</i>
                            <cite>文章管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a href="<%=basePath%>article/backQueryAll?uid=${user.id }" target="x-frame">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>文章信息</cite></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- <div class="x-slide_left"></div> -->
        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
        <div class="page-content">
            <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe src='<%=basePath%>back/welcome.jsp' name="x-frame" frameborder="0" scrolling="yes"></iframe>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-content-bg"></div>
        <style id="theme_style"></style>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->
        <script>//百度统计可去掉
            var _hmt = _hmt || []; (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();</script>
    </body>

</html>