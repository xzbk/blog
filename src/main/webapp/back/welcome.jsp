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
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-X-admin2.2</title>
        <link rel="stylesheet" href="<%=basePath%>back/css/font.css">
        <link rel="stylesheet" href="<%=basePath%>back/css/xadmin.css">
        <script src="<%=basePath%>back/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="<%=basePath%>back/js/xadmin.js"></script>
    </head>
    <body>
    	<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="welcome.jsp">
            	<cite>首页</cite>
            </a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                            <blockquote class="layui-elem-quote">欢迎：
                                <span class="x-red">${user.name }</span>！当前时间:2018-04-25 20:50:53
                            </blockquote>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">数据统计</div>
                        <div class="layui-card-body ">
                            <ul class="layui-row layui-col-space10 layui-this x-admin-carousel x-admin-backlog">
                                <li class="layui-col-md3 layui-col-xs6">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>文章数</h3>
                                        <p>
                                            <cite>66</cite>
                                        </p>
                                    </a>
                                </li>
                                <li class="layui-col-md3 layui-col-xs6">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>文章标签数</h3>
                                        <p>
                                            <cite>12</cite>
                                        </p>
                                    </a>
                                </li>
                                <li class="layui-col-md3 layui-col-xs6">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>文章分类数</h3>
                                        <p>
                                        	<cite>99</cite>
                                        </p>
                                    </a>
                                </li>
                                <li class="layui-col-md3 layui-col-xs6">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>文档归档年份数</h3>
                                        <p>
                                        	<cite>67</cite>
                                        </p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">系统信息</div>
                        <div class="layui-card-body ">
                            <table class="layui-table">
                                <tbody>
                                    <tr>
                                        <th>xxx版本</th>
                                        <td>1.0.180420</td></tr>
                                    <tr>
                                        <th>服务器地址</th>
                                        <td>x.xuebingsi.com</td></tr>
                                    <tr>
                                        <th>操作系统</th>
                                        <td>WINNT</td></tr>
                                    <tr>
                                        <th>运行环境</th>
                                        <td>Apache/2.4.23 (Win32) OpenSSL/1.0.2j mod_fcgid/2.3.9</td></tr>
                                    <tr>
                                        <th>PHP版本</th>
                                        <td>5.6.27</td></tr>
                                    <tr>
                                        <th>PHP运行方式</th>
                                        <td>cgi-fcgi</td></tr>
                                    <tr>
                                        <th>MYSQL版本</th>
                                        <td>5.5.53</td></tr>
                                    <tr>
                                        <th>ThinkPHP</th>
                                        <td>5.0.18</td></tr>
                                    <tr>
                                        <th>上传附件限制</th>
                                        <td>2M</td></tr>
                                    <tr>
                                        <th>执行时间限制</th>
                                        <td>30s</td></tr>
                                    <tr>
                                        <th>剩余空间</th>
                                        <td>86015.2M</td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md12">
                    <blockquote class="layui-elem-quote layui-quote-nm">感谢layui,百度Echarts,jquery,本系统由x-admin提供技术支持。</blockquote>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>