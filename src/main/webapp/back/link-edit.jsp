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
        <script type="text/javascript" src="<%=basePath%>back/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="<%=basePath%>back/js/xadmin.js"></script></head>
    
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form" action="<%=basePath%>link/update" id="form">
                	<input type="hidden" name="uid" value="${user.id }"/>
                	<div class="layui-form-item">
                        <label for="linkid" class="layui-form-label">
                            <span class="x-red">*</span>ID</label>
                        <div class="layui-input-inline">
                            <input type="text" id="linkid" name="id" required="" value="${link.id }" lay-verify="required" autocomplete="off" readonly="readonly" class="layui-input layui-disabled">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="linkname" class="layui-form-label">
                            <span class="x-red">*</span>连接名</label>
                        <div class="layui-input-inline">
                            <input type="text" id="linkname" name="name" value="${link.name }" required=""  lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="tagname" class="layui-form-label">
                            <span class="x-red">*</span>连接地址</label>
                        <div class="layui-input-inline">
                            <input type="text" id="linkname" name="href" value="${link.href }" required=""  lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div>
			        <div class="layui-form-item">
			            <label for="L_repass" class="layui-form-label"></label>
			            <button class="layui-btn" lay-filter="add" lay-submit="" type="button" id="sub">修改</button>
			        </div>
		        </form>
        </div>
        </div>
        <script>
        	layui.use(['form', 'layer'],function() {
               	$ = layui.jquery;
               	var form = layui.form,
               	layer = layui.layer;
               	//监听提交
               	$('#sub').click(function(){
   	            	//发异步删除数据
   	                $('#form').submit();
                      	//更新父页面
                       xadmin.father_reload();
                  		//显示信息
                  		parent.parent.layer.msg("修改成功", {icon: 6,time:1000});
                  		//关闭弹出层
                       xadmin.close();
   	            });
            });
        </script>
    </body>
</html>