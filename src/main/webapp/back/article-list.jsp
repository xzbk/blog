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
            <a href="welcome.jsp">首页</a>
            <a href="">
            	<cite>文章列表</cite>
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
                            <form class="layui-form layui-col-space5" action="<%=basePath%>article/backQueryAll">
                                <input type="hidden" name="uid" value="${user.id }">
                                <!-- <div class="layui-inline layui-show-xs-block">
                                    <input class="layui-input"  autocomplete="off" placeholder="开始日" name="start" id="start">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <input class="layui-input"  autocomplete="off" placeholder="截止日" name="end" id="end">
                                </div> -->
                                <c:choose>
                                	<c:when test="${not empty tagId }">
                                		<div class="layui-input-inline layui-show-xs-block">
		                                    <select name="tagId">
		                                    	<c:forEach items="${tags }" var="item" varStatus="status">
		 											<c:choose>
		 												<c:when test="${item.id==tagId }">
		 													<option value="${item.id }" selected="selected">${item.name }</option>      
		 												</c:when>
		 												<c:otherwise>
		 													<option value="${item.id }" >${item.name }</option>  
		 												</c:otherwise>
		 											</c:choose>                             		
		                                    	</c:forEach>
		                                    </select>
		                                </div>
		                                <div class="layui-input-inline layui-show-xs-block">
		                                    <select name="categoryId">
		                                    	<c:forEach items="${categories }" var="item" varStatus="status">
		 											<c:choose>
		 												<c:when test="${item.id==categoryId }">
		 													<option value="${item.id }" selected="selected">${item.name }</option>      
		 												</c:when>
		 												<c:otherwise>
		 													<option value="${item.id }" >${item.name }</option>  
		 												</c:otherwise>
		 											</c:choose>                             		
		                                    	</c:forEach>
		                                    </select>
		                                </div>
                                	</c:when>
                                	<c:otherwise>
                                		<div class="layui-input-inline layui-show-xs-block">
		                                    <select name="tagId">
		                                    	<c:forEach items="${tags }" var="item" varStatus="status">
		 											<c:choose>
		 												<c:when test="${status.index==0 }">
		 													<option value="${item.id }" selected="selected">${item.name }</option>      
		 												</c:when>
		 												<c:otherwise>
		 													<option value="${item.id }" >${item.name }</option>  
		 												</c:otherwise>
		 											</c:choose>                             		
		                                    	</c:forEach>
		                                    </select>
		                                </div>
		                                <div class="layui-input-inline layui-show-xs-block">
		                                    <select name="categoryId">
		                                    	<c:forEach items="${categories }" var="item" varStatus="status">
		 											<c:choose>
		 												<c:when test="${status.index==0 }">
		 													<option value="${item.id }" selected="selected">${item.name }</option>      
		 												</c:when>
		 												<c:otherwise>
		 													<option value="${item.id }" >${item.name }</option>  
		 												</c:otherwise>
		 											</c:choose>                             		
		                                    	</c:forEach>
		                                    </select>
		                                </div>
                                	</c:otherwise>
                                </c:choose>
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" name="key" value="${key }"  placeholder="请输入文章名" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                                    <a class="layui-btn" href="<%=basePath%>article/backQueryAll?uid=${user.id }">查看所有</a>
                                </div>
                            </form>
                        </div>
                        <div class="layui-card-header">
                            <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
                            <a class="layui-btn" href="<%=basePath%>pageskip/goArticleAdd?uid=${user.id }"><i class="layui-icon"></i>添加</a>
                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
                                <thead>
                                  <tr>
                                    <th>
                                      <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                                    </th>
                                    <th>ID</th>
                                    <th>文章名</th>
                                    <th>标签</th>
                                    <th>类别</th>
                                    <th>时间</th>
                                    <th>操作</th></tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${data.items }" var="item" varStatus="status">
                                		<tr>
		                                    <td>
		                                      <input type="checkbox" name="id" value="${item.id }"   lay-skin="primary"> 
		                                    </td>
		                                    <td>${status.index+1 }</td>
		                                    <td>${item.name }</td>
		                                    <td>${item.tag.name }</td>
		                                    <td>${item.category.name }</td>
		                                    <td>
		                                    	<fmt:formatDate value="${item.time}" pattern="yyyy-MM-dd"/>
		                                    </td>
		                                    <td class="td-manage">
		                                      <a title="编辑"  href="<%=basePath%>pageskip/goArticleEdit?id=${item.id }&uid=${user.id}">
		                                        <i class="layui-icon">&#xe642;</i>
		                                      </a>
		                                      <a title="删除" onclick="member_del(this,${item.id})" href="javascript:;">
		                                        <i class="layui-icon">&#xe640;</i>
		                                      </a>
		                                    </td>
		                                  </tr>
                                	</c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="layui-card-body ">
                            <div class="page">
                            	<div>
	                           		<c:choose>
	                           			<c:when test="${not empty tagId }">
	                           				<c:choose>
			                            		<c:when test="${data.currentPage>1 }">
			                                  		<a class="prev" href="<%=basePath%>article/backQueryAll?uid=${user.id }&key=${key }&tagId=${tagId}&categoryId=${categoryId}">首页</a>
			                                  		<a class="prev" href="<%=basePath%>article/backQueryAll?uid=${user.id }&currentPage=${data.currentPage-1 }&key=${key }&tagId=${tagId}&categoryId=${categoryId}">上一页</a>
			                            		</c:when>
			                            		<c:otherwise>
			                            			<a class="prev layui-btn-disabled">首页</a>
			                            			<a class="prev layui-btn-disabled">上一页 </a>
			                            		</c:otherwise>
			                            	</c:choose>
				                            <c:forEach begin="1" end="${totalPage }" var="page">
												<c:choose>
													<c:when test="${page==data.currentPage }">
				                                 		<span class="current">${page }</span>
													</c:when>
													<c:otherwise>
				                                 		<a class="num" href="<%=basePath%>article/backQueryAll?uid=${user.id }&currentPage=${page }&key=${key }&tagId=${tagId}&categoryId=${categoryId}">${page }</a>
													</c:otherwise>
												</c:choose>                            	
				                           	</c:forEach>
				                           	<c:choose>
			                            		<c:when test="${data.currentPage<totalPage }">
			                                  		<a class="next" href="<%=basePath%>article/backQueryAll?uid=${user.id }&currentPage=${data.currentPage+1 }&key=${key }&tagId=${tagId}&categoryId=${categoryId}">下一页</a>
			                                  		<a class="next" href="<%=basePath%>article/backQueryAll?uid=${user.id }&currentPage=${totalPage }&key=${key }&tagId=${tagId}&categoryId=${categoryId}">尾页</a>
			                            		</c:when>
			                            		<c:otherwise>
			                            			<a class="next layui-btn-disabled">下一页</a>
			                            			<a class="next layui-btn-disabled">尾页</a>
			                            		</c:otherwise>
			                            	</c:choose>
	                           			</c:when>
	                           			<c:otherwise>
	                           				<c:choose>
			                            		<c:when test="${data.currentPage>1 }">
			                                  		<a class="prev" href="<%=basePath%>article/backQueryAll?uid=${user.id }">首页</a>
			                                  		<a class="prev" href="<%=basePath%>article/backQueryAll?uid=${user.id }&currentPage=${data.currentPage-1 }">上一页</a>
			                            		</c:when>
			                            		<c:otherwise>
			                            			<a class="prev layui-btn-disabled">首页</a>
			                            			<a class="prev layui-btn-disabled">上一页 </a>
			                            		</c:otherwise>
			                            	</c:choose>
				                            <c:forEach begin="1" end="${totalPage }" var="page">
												<c:choose>
													<c:when test="${page==data.currentPage }">
				                                 		<span class="current">${page }</span>
													</c:when>
													<c:otherwise>
				                                 		<a class="num" href="<%=basePath%>article/backQueryAll?uid=${user.id }&currentPage=${page }">${page }</a>
													</c:otherwise>
												</c:choose>                            	
				                           	</c:forEach>
				                           	<c:choose>
			                            		<c:when test="${data.currentPage<totalPage }">
			                                  		<a class="next" href="<%=basePath%>article/backQueryAll?uid=${user.id }&currentPage=${data.currentPage+1 }">下一页</a>
			                                  		<a class="next" href="<%=basePath%>article/backQueryAll?uid=${user.id }&currentPage=${totalPage }">尾页</a>
			                            		</c:when>
			                            		<c:otherwise>
			                            			<a class="next layui-btn-disabled">下一页</a>
			                            			<a class="next layui-btn-disabled">尾页</a>
			                            		</c:otherwise>
			                            	</c:choose>
	                           			</c:otherwise>
	                           		</c:choose>
                            	</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </body>
    <script>
      layui.use(['laydate','form'], function(){
        var laydate = layui.laydate;
        var  form = layui.form;


        // 监听全选
        form.on('checkbox(checkall)', function(data){

          if(data.elem.checked){
            $('tbody input').prop('checked',true);
          }else{
            $('tbody input').prop('checked',false);
          }
          form.render('checkbox');
        }); 
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });


      });

      /*用户-删除*/
      function member_del(obj,id){
    	  layer.confirm('确认要删除吗？',function(index){
          	//发异步删除数据
              $.ajax({
            	  url: '/blog/article/delete',
            	  type: 'post',
            	  data: {
            		  id: id
            	  }
              });
              location.reload();//刷新页面
              parent.layer.msg('已删除!',{icon:1,time:1000});
    	  });
      }



      function delAll (argument) {
        var ids = [];

        // 获取选中的id 
        $('tbody input').each(function(index, el) {
            if($(this).prop('checked')){
               ids.push($(this).val())
            }
        });
  
        layer.confirm('确认要删除吗？'+ids.toString(),function(index){
        	if(ids.length>0){
            	//捉到所有被选中的，发异步进行删除
                $.ajax({
              	  url: '/blog/article/deleteAll',
              	  type: 'post',
              	  data: {
              		  ids: ids.toString()
              	  },
              	  success: function(){
              		//刷新页面
              		location.reload();//刷新页面
                    parent.layer.msg('删除成功', {icon: 1,time:1000});
              	  }
                });
            }else{
                layer.msg('请选择至少一条数据', {icon: 7,time:1000});
            }
        });
      }
    </script>
</html>