<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
		<title>知识点管理</title>
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
							<a href="#">网站首页</a>
						</li>
						<li>
							<a href="<%=request.getContextPath() %>/jsp/admin/question-list.jsp">试题管理</a>
						</li>

						<li>
							<a href="<%=request.getContextPath() %>/jsp/admin/exampaper-list.jsp">试卷管理</a>
						</li>
						<li>
							<a href="#">会员管理</a>
						</li>
						<li class="active">
							<a  href="<%=request.getContextPath() %>/jsp/admin/field-list.jsp">题库管理</a>
						</li>
						<li>
							<a href="#">网站设置</a>
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
							
							<li>
								<a href="<%=request.getContextPath() %>/jsp/admin/field-list.jsp"> <i class="fa icon-book"></i> 题库列表 </a>
							</li>
							
							<li>
								<a href="<%=request.getContextPath() %>/jsp/admin/add-field.jsp"> <i class="fa icon-qrcode"></i> 添加题库 </a>
							</li>
							
							<li class="active">
								<a> <i class="fa icon-sitemap"></i> 知识点列表 </a>
							</li>
							
							<li>
								<a href="<%=request.getContextPath() %>/jsp/admin/add-point.jsp"> <i class="fa icon-pencil"></i> 添加知识点 </a>
							</li>
						</ul>

					</div>
					<div class="col-xs-9">
						<div class="page-header">
							<h1> <i class="fa fa-bar-chart-o"></i> 知识点管理 </h1>
						</div>
						<div class="page-content row">
							<div id="question-filter">
								<dl id="question-filter-field">
									<dt>
										题库：
									</dt>
									<dd>	
										<span class="label label-info all">全部</span>	
									</dd>
								</dl>
								<div class="page-link-content">
									<ul class="pagination pagination-sm"></ul>
								</div>
							</div>
							
							
							<div id="field-list">
								<table class="table-striped table">
									<thead>
										<tr>
											<td></td>
											<td>ID</td>
											<td>知识点名</td>
											<td>题库名</td>
											<td>描述</td>
											<td>操作</td>
										</tr>
									</thead>
									<tbody>
									</tbody>
									<tfoot></tfoot>
								</table>
							</div>
							<div id="page-link-content">
								<nav aria-label="...">
								  <ul class="pagination">
								    <li>
								    	<span aria-label="Previous">上一页</span>
								    </li>
								    <li class="active">
								   		<a>1 </a>
								    </li>
								    <li>
								    	<a aria-label="Next">下一页</a>
								    </li>
								  </ul>
								</nav>
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

		
	</body>
	<script type="text/javascript">
		$(function(){
			//定义加载所有知识点的方法
			var getKnowledgePoint = function(){
				$("#field-list table tbody").empty();
				$.post('field/showKnowledgePoint',function(data){
				var klist = data.list;
				var fname = data.fname;
				for(var i=0;i<klist.length;i++){
					$("#field-list table tbody").append("<tr>"+
															"<td><input type='checkbox'/></td>"+
															"<td>"+klist[i].knowledeg_id+"</td>"+
															"<td>"+klist[i].knowledeg_name+"</td>"+
															"<td>"+fname[i]+"</td>"+
															"<td>"+klist[i].knowledeg_describe+"</td>"+
															"<td><a class='btn btn-danger btn-xs' href='#'>删除</a></td>"+
														+"</tr>");
					}
				},'json');
			};
			getKnowledgePoint();//页面加载完成后加载所有知识点
			
			//加载题库分类列表
			$.post('field/showField',function(data){
					for(var i=0;i<data.length;i++){
						$("#question-filter-field dd").append("<span id='fname'>"+data[i].question_name+"</span>");
					}
				},'json');
				
			//根据题库分类加载知识点
			$("#question-filter-field dd").on("click","#fname",function(){
				$("#question-filter-field dd span").removeClass("label label-info");
				$(this).addClass("label label-info");
				var fname = $(this).text();
				$.post('field/selcetPointByField',{fname:fname},function(data){
					$("#field-list table tbody").empty();
					for(var i=0;i<data.length;i++){
						$("#field-list table tbody").append("<tr>"+
																"<td><input type='checkbox'/></td>"+
																"<td>"+data[i].knowledeg_id+"</td>"+
																"<td>"+data[i].knowledeg_name+"</td>"+
																"<td>"+fname+"</td>"+
																"<td>"+data[i].knowledeg_describe+"</td>"+
																"<td><a class='btn btn-danger btn-xs' href='#'>删除</a></td>"+
															+"</tr>");
					}
				},'json');
			});
			//加载全部类别
			$("#question-filter-field dd .all").click(function(){
				$("#question-filter-field dd span").removeClass("label label-info");
				$(this).addClass("label label-info");
				getKnowledgePoint();
			});
			
			
		});
	</script>
</html>