<%@page import="com.pan.exam.entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%-- <%@taglib uri="spring.tld" prefix="spring"%> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    	<base href="<%=basePath%>">
    
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>会员管理</title>
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=request.getContextPath() %>/imag/favicon.ico" />
		<link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/jsp/css/style.css" rel="stylesheet">
		
		<link href="<%=request.getContextPath() %>/jsp/css/exam.css" rel="stylesheet">
	</head>
	<body>
		<header>
			<div class="container">
				<div class="row">
					<div class="col-xs-5">
						<div class="logo">
							<h1><a href="#">网站管理系统</a></h1>
							<div class="hmeta">
								专注互联网在线考试解决方案
							</div>
						</div>
					</div>
					<div class="col-xs-7" id="login-info">
							<a class="btn btn-primary" href="user-register">用户注册</a>
							<a class="btn btn-success" href="user-login-page">登录</a>
					</div>
				</div>
			</div>
		</header>
		<!-- Navigation bar starts -->

		<div class="navbar bs-docs-nav" role="banner">
			<div class="container">
				<nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
					<ul class="nav navbar-nav">
						<li>
							<a href="<%=request.getContextPath() %>/jsp/admin/question-list.jsp">网站首页</a>
						</li>
						<li>
							<a href="<%=request.getContextPath() %>/jsp/admin/question-list.jsp">试题管理</a>
						</li>

						<li>
							<a href="<%=request.getContextPath() %>/jsp/admin/exampaper-list.jsp">试卷管理</a>
						</li>
						<li class="active">
							<a href="<%=request.getContextPath() %>/jsp/admin/user-show.jsp">会员管理</a>
						</li>
						<li >
							<a href="<%=request.getContextPath() %>/jsp/admin/field-list.jsp">题库管理</a>
						</li>
						<li>
							<a href="<%=request.getContextPath() %>/jsp/admin/sys-backup.jsp">网站设置</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>

		<!-- Navigation bar ends -->

		<!-- Slider starts -->

		<div>
			<!-- Slider (Flex Slider) -->

			<div class="container" style="min-height:500px;">

				<div class="row">
					<div class="col-xs-3">
						<ul class="nav default-sidenav">
							
							<li class="active">
								<a > <i class="fa icon-book"></i>会员管理 </a>
							</li>
							
							<li>
								<a href="<%=request.getContextPath() %>/jsp/admin/user-add.jsp"> <i class="fa icon-qrcode"></i> 添加会员</a>
							</li>
						</ul>

					</div>
					<div class="col-xs-9">
						<div class="page-header">
							<h1><i class="fa fa-bar-chart-o"></i>会员管理 </h1>
						</div>
						<div class="page-content row">

							<div></div>
							
							<div id="field-list">
								<table class="table-striped table">
									<thead>
										<tr>
						    				<td>　</td>
						    				<td>ID</td>
						    				<td>用户名</td>
						    				<td>邮箱</td>
						    				<td>省份</td>
						    				<td>单位</td>
						    				<td>部门</td>
						    				<td>专业</td>
						    				<td>注册时间</td>
						    				<td>状态</td>
						    				<td>操作</td>
	    								</tr>
									</thead>
									<tbody>
									 
									
									
									
									
									
										<c:forEach items="${fieldList }" var="item">
											<tr>
												<td>
													<c:if test="${item.removeable }">
														<input type="checkbox" value="${item.fieldId }">
													</c:if>
													
												</td>
												<td></td>
												<td></td>
												<td></td>
												<td>
													<c:if test="${item.removeable }">
														<button class="delete-btn" data-id="${item.fieldId }">删除</button>
													</c:if>
												</td>
											</tr>
										</c:forEach>
										
									</tbody><tfoot></tfoot>
								</table>
							</div>
							<p>
								<a href="javascript:firstPage()">首页</a>
								<a href="javascript:prePage()">上一页</a>
								<a href="javascript:nextPage()">下一页</a>
								<a href="javascript:lastPage()">尾页</a>
							</p>
							<div id="page-link-content">
								<ul class="pagination pagination-sm"></ul>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

		<footer>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="copy">
							<p>
								Exam++ Copyright © <a href="">Exam++</a> - <a href="">主页</a> | <a href="">关于我们</a> | <a href="">FAQ</a> | <a href="">联系我们</a>
							</p>
						</div>
					</div>
				</div>

			</div>
                       
		</footer>

		<!-- Slider Ends -->

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap/js/jquery-2.2.4.min.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap/js/bootstrap.min.js"></script>
		
		<script type="text/javascript">
		//声明两个全局变量
		var pageNo = 1;
		var pageSize = 3;
		var pageCount = 0;
		var userid = null;
		var b = null;
		var b2 = null;
		var d = null;
		var sss = null;
		var q = "<input type='button' value='启用' name='启用' />";
		var z = "<input type='button' value='注销'/>";
		
			$(function(){
				loadAllUsers(pageNo,pageSize);
				
			})
			function loadAllUsers(pageNo,pageSize){
				
				$.post('<%=request.getContextPath() %>/getusers',{pageNo:pageNo,pageSize:pageSize},function(data){
					var users = data.list;
					var count = data.count;
					clearTable();
					for(var i=0;i<users.length;i++){
						var c = users[i].question_name;
						d= "adsad"+users[i].user_id;
		
						var q2 = "<a href='javascript:jinyong("+users[i].user_id+")'>禁用</a>";
						var z2 = "<a href='javascript:qiyong("+users[i].user_id+")'>启用</a>";
						if(c==1){
							 b = q;
							 b2 = q2;
						}else{
							 b = z;
							 b2 = z2;
						}
						$('table').append('<tr>'+
												'<td>'+"<input type='checkbox' />"+'</td>'+
												'<td value='+d+'>'+users[i].user_id+'</td>'+
												'<td>'+users[i].user_name+'</td>'+
												'<td>'+users[i].user_email+'</td>'+
												'<td>'+users[i].user_province+'</td>'+
												'<td>'+users[i].user_company+'</td>'+
												'<td>'+users[i].user_department+'</td>'+
												'<td>'+users[i].user_state+'</td>'+
												'<td>'+users[i].user_login_time+'</td>'+
												'<td>'+b+'</td>'+
												'<td>'+b2+'</td>'+	
											'</tr>');
					}
					//计算总页数
					pageCount = Math.ceil(count*1.0/pageSize);
					
				},'json')
			}
			//下一页
		function nextPage(){
			if(pageNo==pageCount){
				alert("已经是最后一页了!");
				return;
			}
			var current_page = pageNo+1;
			loadAllUsers(current_page,pageSize);
			pageNo++;
		}
		
		//上一页
		function prePage(){
			if(pageNo==1){
				alert("已经是第一页了!");
				return;
			}
			var current_page = pageNo-1;
			loadAllUsers(current_page,pageSize);
			pageNo--;
		}
		
		//首页
		function firstPage(){
			loadAllUsers(1,pageSize);
			pageNo=1;
		}
		
		//尾页
		function lastPage(){
			loadAllUsers(pageCount,pageSize);
			pageNo=pageCount;
		}
			//清空表数据
		function clearTable(){
			$('table tr:not(:eq(0))').remove();
		}
		
		function qiyong(sss){
			var s = 1;
			$.post('updateStateQiYong',{s:s,sss:sss},function(data){
			},'json');
			window.location.reload();
			
		}
		function jinyong(sss){
			var s = 0;
			$.post('updateStateQiYong',{s:s,sss:sss},function(data){
			},'json');
			window.location.reload();
			
		}	
		</script>
	</body>
</html>