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
                    <div class="layui-card">
                    	<!--类别选择-->
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5" lay-filter="form" action="<%=basePath%>article/update" id="form">
                                <input type="hidden" name="id" value="${article.id }" />
                                <input type="hidden" name="uid" value="${user.id }" />
                                <input type="hidden" name="content" id="content" value="" />
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" name="name" value="${article.name }" id="name" placeholder="请输入文章名" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <select name="tag.id" id="tag">
                                    	<c:forEach items="${tags }" var="item" varStatus="status">
 											<c:choose>
 												<c:when test="${article.tag.id==item.id }">
 													<option value="${item.id }" selected="selected">${item.name }</option>      
 												</c:when>
 												<c:otherwise>
 													<option value="${item.id }" >${item.name }</option>  
 												</c:otherwise>
 											</c:choose>                             		
                                    	</c:forEach>
                                    </select>
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <select name="category.id" id="category">
                                    	<c:forEach items="${categories }" var="item" varStatus="status">
 											<c:choose>
 												<c:when test="${article.category.id==item.id }">
 													<option value="${item.id }" selected="selected">${item.name }</option>      
 												</c:when>
 												<c:otherwise>
 													<option value="${item.id }" >${item.name }</option>  
 												</c:otherwise>
 											</c:choose>                             		
                                    	</c:forEach>
                                    </select>
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn" id="sub"  type="button" >修改文章</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="layui-card">
                        <!--文章富文本编辑器-->
                        <div class="layui-card-body ">
                        	<div id="editor">
						        ${article.content }
						    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </body>
     <!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
    <script type="text/javascript" src="<%=basePath%>back/js/wangEditor.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor;
        var editor = new E('#editor');
        //配置z-index
        editor.customConfig.zIndex = 0;
     	//设置文件上传的参数名称
        editor.customConfig.uploadFileName = 'file';
        // 配置服务器端地址
        editor.customConfig.uploadImgServer = '/blog/article/upload?uid='+${user.id};
        editor.create();
        layui.use(['jquery','form'], function(){
        	var $ = layui.jquery;
        	var form = layui.form;
	        //手动提交表单
        	$('#sub').click(function(){
        		//手动谈价内容到表单
	        	$('#content').val(editor.txt.html());
        		//提交
	        	$('#form').submit();
	        });
        });
    </script>
</html>