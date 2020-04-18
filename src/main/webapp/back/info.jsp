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
            <a href="info.jsp">
            	<cite>用户信息</cite>
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
                            <blockquote class="layui-elem-quote">欢迎管理员：
                                <span class="x-red">test</span>！当前时间:2018-04-25 20:50:53
                            </blockquote>
                        </div>
                    </div>
                </div>
                <!--用户头像-->
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">用户头像</div>
                        <div class="layui-card-body ">
                            <ul  style="width: 180px;" class="layui-row layui-col-space10 layui-this x-admin-carousel x-admin-backlog">
                                <li>
                                    <a  class="x-admin-backlog-body" style="width: 150px;">
                                    	<img src="<%=basePath%>${user.header }" width="150" height="150" id="header"/>
                                    </a>
                                </li>
                            </ul>
                        	<button type="button" class="layui-btn" id="uploadheader">
							  <i class="layui-icon">&#xe67c;</i>修改头像
							</button>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md12">
	                <form action="<%=basePath%>user/update" method="post" id="form">
	                    <div class="layui-card">
	                        <div class="layui-card-header">用户信息
	                        	<button class="layui-btn layui-layout-right" id="alterUser" type="button">修改</button>
	                        	<button class="layui-btn layui-layout-right" id="cancleUser" style="margin-right:50px; display: none;"  type="button">取消</button>
	                        </div>
	                        <div class="layui-card-body ">
	                            <table class="layui-table">
	                                <tbody id="show">
	                                    <tr>
	                                        <th>用户名</th>
	                                        <td>${user.name }</td>
	                                    </tr>
	                                    <tr>
	                                        <th>个性签名</th>
	                                        <td>${user.signature }</td>
	                                    </tr>
	                                    <tr>
	                                        <th>Github</th>
	                                        <td>${user.github }</td>
	                                    </tr>
	                                    <tr>
	                                        <th>Weibo</th>
	                                        <td>${user.weibo }</td>
	                                    </tr>
	                                </tbody>
	                                <tbody id="alter" style="display: none;">
	                                    <tr>
	                                        <th>用户名</th>
	                                        <td>
	                                    		<input type="hidden" name="id" value="${user.id }">
	                                        	<input type="text" name="name" value="${user.name }" required=""  lay-verify="required" class="layui-input">
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <th>密码</th>
	                                        <td>
	                                        	<input type="password" name="password" value="${user.password }" required=""  lay-verify="required" class="layui-input">
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <th>个性签名</th>
	                                        <td>
	                                        	<input type="text" name="signature" value="${user.signature }" required=""  lay-verify="required" class="layui-input">
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <th>Github</th>
	                                        <td>
	                                        	<input type="text" name="github" value="${user.github }" required=""  lay-verify="required" class="layui-input">
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <th>Weibo</th>
	                                        <td>
	                                        	<input type="text" name="weibo" value="${user.weibo }" required=""  lay-verify="required" class="layui-input">
	                                        </td>
	                                    </tr>
	                                </tbody>
	                            </table>
	                        </div>
	                    </div>
	                </form>
                </div>
                <div class="layui-col-md12">
                    <blockquote class="layui-elem-quote layui-quote-nm">感谢layui,百度Echarts,jquery,本系统由x-admin提供技术支持。</blockquote>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript">
    	layui.use(['jquery','upload'],function(){
    		var $ = layui.jquery;
    		var upload = layui.upload;
    		//修改用户信息
    		$('#alterUser').click(function(){
    			var btnTxt = $('#alterUser').text();
    			if(btnTxt=='修改'){
    				$('#show').css('display','none');
    				$('#alter').css('display','table-row-group');
    				$('#cancleUser').css('display','block');
    				$('#alterUser').text('保存');
    			}else{
    				$('#form').submit();
    			}
    		});
    		//取消修改用户信息
    		$('#cancleUser').click(function(){
				$('#show').css('display','table-row-group');
				$('#alter').hide();
				$('#cancleUser').hide();
				$('#alterUser').text('修改');
    		});
    		//修改头像
	   		  var uploadInst = upload.render({
	   		    elem: '#uploadheader' //绑定元素
	   		    ,url: '/blog/user/upload?id='+${user.id} //上传接口
	   		    ,field: 'file'
	   		    ,done: function(res){
	   		      //上传完毕回调
	   		      location.reload();
	   		    }
	   		  });
    	});
    </script>
</html>