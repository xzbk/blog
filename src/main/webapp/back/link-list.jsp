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
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="<%=basePath%>back/css/font.css">
        <link rel="stylesheet" href="<%=basePath%>back/css/xadmin.css">
        <script src="<%=basePath%>back/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="<%=basePath%>back/js/xadmin.js"></script>
        <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="welcome.jsp">首页</a>
            <a href="tag-list.jsp">
            	<cite>标签</cite>
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
                            <form class="layui-form layui-col-space5" action="<%=basePath%>link/backQueryAll">
                                <div class="layui-inline layui-show-xs-block">
                                	<input type="hidden" name="uid" value="${user.id }">
                                    <input type="text" name="key" value="${key }" placeholder="请输入连接名" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                                    <a class="layui-btn" href="<%=basePath%>link/backQueryAll?uid=${user.id }">查看所有</a>
                                </div>
                            </form>
                        </div>
                        <div class="layui-card-header">
                            <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
                            <button class="layui-btn" onclick="xadmin.open('添加标签','<%=basePath%>pageskip/goLinkAdd',460,300)"><i class="layui-icon"></i>添加</button>
                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
                                <thead>
                                  <tr>
                                    <th>
                                      <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                                    </th>
                                    <th>ID</th>
                                    <th>连接名</th>
                                    <th>连接地址</th>
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
		                                    <td>${item.href }</td>
		                                    <td class="td-manage">
		                                      <a onclick="xadmin.open('修改','<%=basePath%>link/queryById?id=${item.id }',600,400)" title="修改" href="javascript:;">
		                                        <i class="layui-icon">&#xe631;</i>
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
	                           			<c:when test="${not empty key }">
	                           				<c:choose>
			                            		<c:when test="${data.currentPage>1 }">
			                                  		<a class="prev" href="<%=basePath%>link/backQueryAll?uid=${user.id }&key=${key }">首页</a>
			                                  		<a class="prev" href="<%=basePath%>link/backQueryAll?uid=${user.id }&currentPage=${data.currentPage-1 }&key=${key }">上一页</a>
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
				                                 		<a class="num" href="<%=basePath%>link/backQueryAll?uid=${user.id }&currentPage=${page }&key=${key }">${page }</a>
													</c:otherwise>
												</c:choose>                            	
				                           	</c:forEach>
				                           	<c:choose>
			                            		<c:when test="${data.currentPage<totalPage }">
			                                  		<a class="next" href="<%=basePath%>link/backQueryAll?uid=${user.id }&currentPage=${data.currentPage+1 }&key=${key }">下一页</a>
			                                  		<a class="next" href="<%=basePath%>link/backQueryAll?uid=${user.id }&currentPage=${totalPage }&key=${key }">尾页</a>
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
			                                  		<a class="prev" href="<%=basePath%>link/backQueryAll?uid=${user.id }">首页</a>
			                                  		<a class="prev" href="<%=basePath%>link/backQueryAll?uid=${user.id }&currentPage=${data.currentPage-1 }">上一页</a>
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
				                                 		<a class="num" href="<%=basePath%>link/backQueryAll?uid=${user.id }&currentPage=${page }">${page }</a>
													</c:otherwise>
												</c:choose>                            	
				                           	</c:forEach>
				                           	<c:choose>
			                            		<c:when test="${data.currentPage<totalPage }">
			                                  		<a class="next" href="<%=basePath%>link/backQueryAll?uid=${user.id }&currentPage=${data.currentPage+1 }">下一页</a>
			                                  		<a class="next" href="<%=basePath%>link/backQueryAll?uid=${user.id }&currentPage=${totalPage }">尾页</a>
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
      layui.use(['form'], function(){
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


      });

      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $.ajax({
            	  url: '/blog/link/delete',
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
              	  url: '/blog/link/deleteAll',
              	  type: 'post',
              	  data: {
              		  ids: ids.toString()
              	  },
              	  success: function(){
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