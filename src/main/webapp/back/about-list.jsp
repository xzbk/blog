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
        <style type="text/css">
        	.w-e-text-container{
			    height: 500px !important;
			}
        </style>
    </head>
    <body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="welcome.jsp">首页</a>
            <a href="article-list.jsp">文章列表</a>
            <a href="article-add.jsp">
            	<cite>添加文章</cite>
            </a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                	<form action="<%=basePath%>about/update" id="form">
                		<input type="hidden" name="uid" value="${user.id }">
                		<input type="hidden" id="content" name="content" value="">
                		<input type="hidden" id="type" name="type" value="">
	                	<div class="layui-tab layui-tab-brief layui-card">
						  <ul class="layui-tab-title">
						    <li class="layui-this">文档格式</li>
						    <li>代码格式</li>
						  <button class="layui-btn layui-layout-right" type="button" id="sub">保存</button>
						  </ul>
						  <div class="layui-tab-content">
						    <c:choose>
						    	<c:when test="${about.type==0 }">
						    		<div class="layui-tab-item layui-show">
			                        	<div id="editor" class="content" type="0">
			                        		${about.content }
									    </div>
									</div>
								    <div class="layui-tab-item">
										<div class="layui-form-item">
										    <div class="layui-input-block">
										      <textarea name="desc" id="txt" type="1" placeholder="请输入内容" class="layui-textarea content"
										      		style="overflow:auto; width:100%;height:500px; margin-left: -100px;resize:none;"></textarea>
										    </div>
										  </div>
									</div>
						    	</c:when>
						    	<c:otherwise>
								    <div class="layui-tab-item layui-show">
										<div class="layui-form-item">
										    <div class="layui-input-block">
										      <textarea name="desc" id="txt" type="1" placeholder="请输入内容" class="layui-textarea content"
										      		style="overflow:auto; width:100%;height:500px;
														margin-left: -100px;padding: none;resize:none;">${about.content }</textarea>
										    </div>
										  </div>
									</div>
						    		<div class="layui-tab-item">
			                        	<div id="editor" class="content" type="0">
									    </div>
									</div>
						    	</c:otherwise>
						    </c:choose>
						  </div>
						</div>
					</form>
                </div>
            </div>
        </div> 
    </body>
     <!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
    <script type="text/javascript" src="<%=basePath%>back/js/wangEditor.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor;
        var editor = new E('#editor');
     	// 开启编辑功能
        //editor.$textElem.attr('contenteditable', false);
        //配置z-index
        editor.customConfig.zIndex = 0;
     	//设置文件上传的参数名称
        editor.customConfig.uploadFileName = 'file';
        // 配置服务器端地址
        editor.customConfig.uploadImgServer = '/blog/about/upload?uid='+${user.id};
        editor.create();
        layui.use(['jquery','element'], function(){
        	var $ = layui.jquery;
	        //手动提交表单
        	$('#sub').click(function(){
        		var type = $('.layui-show .content').attr('type');
        		if(type==0){
            		//手动添加内容到表单
    	        	$('#content').val(editor.txt.html());
    	        	$('#type').val('0');
        		}else{
    	        	$('#content').val($('#txt').val());
    	        	$('#type').val('1');
        		}
        		//提交
	        	$('#form').submit();
	        });
        });
    </script>
</html>