<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<title>试题管理</title>
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=request.getContextPath() %>/img/favicon.ico" />
		<link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/jsp/css/style.css" rel="stylesheet">
		
		<link href="<%=request.getContextPath() %>/jsp/css/question-add.css" rel="stylesheet">
		<style>
			.change-property, .publish-paper, .delete-paper, .offline-paper{
				cursor:pointer;
			}
		</style>
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

						<li class="active">
							<a href="<%=request.getContextPath() %>/jsp/admin/exampaper-list.jsp">试卷管理</a>
						</li>
						<li>
							<a href="#">会员管理</a>
						</li>
						<li>
							<a href="<%=request.getContextPath() %>/jsp/admin/field-list.jsp">题库管理</a>
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
							<li class="active">
								<a href="<%=request.getContextPath() %>/jsp/admin/exampaper-list.jsp"> <i class="fa fa-list-ul"></i> 试卷管理 </a>
							</li>
							<li>
								<a href="<%=request.getContextPath() %>/jsp/admin/exampaper-add.jsp"> <i class="fa fa-file-text-o"></i> 创建新试卷 </a>
							</li>
						</ul>

					</div>
					<div class="col-xs-9">
						<div class="page-header">
							<h1><i class="fa fa-list-ul"></i> 试卷管理 </h1>
						</div>
						<div class="page-content row">

							<div id="question-filter">
								<dl id="question-filter-pagetype">
									<dt>
										分类：
									</dt>
									<dd>
										<span class="label label-info tall">全部</span>
										<span>随机组卷</span>
										<span>模拟考试</span>
										<span>专家试卷</span>
									</dd>
								</dl>
								

								
							</div>
							<div id="question-list">
								<table class="table-striped table">
									<thead>
										<tr>
											<td></td><td>ID</td><td>试卷名称</td><td>时长</td><td>类别</td><td>创建人</td><td>状态</td><td>操作</td>
										</tr>
									</thead>
									<tbody>
										
									</tbody>
									<tfoot></tfoot>
								</table>
								<div class="modal fade" id="change-property-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
													  <div class="modal-dialog">
													    <div class="modal-content">
													    	<div class="modal-header">
														        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
														        <h6 class="modal-title" id="myModalLabel">修改试卷属性</h6>
														     </div>
														     <div class="modal-body">
														     	<form id="question-add-form">
														     		<span id="add-update-exampaperid" style="display:none;"></span>
															     	<div class="form-line add-update-exampapername">
																		<span class="form-label"><span class="warning-label">*</span>试卷名称：</span>
																		<input type="text" class="df-input-narrow">
																		<span class="form-message"></span>
																	</div>
																	<div class="form-line add-update-duration">
																		<span class="form-label"><span class="warning-label">*</span>时长（分钟）：</span>
																		<input type="text" class="df-input-narrow">
																		<span class="form-message"></span>
																	</div>
														     		<div class="form-line exampaper-type" id="exampaper-type">
																		<span class="form-label"><span class="warning-label">*</span>分类：</span>
																		<select id="exampaper-type-select" class="df-input-narrow">
																			
																			<option value="1">随机组卷</option>
																			<option value="2">模拟考试</option>
																			<option value="3">专家试卷</option>
																		</select><span class="form-message"></span>
																	</div>
																</form>
														     </div>
														     <div class="modal-footer">
				        										<button type="button" class="btn btn-default" data-dismiss="modal">关闭窗口</button>
				        										<button id="update-exampaper-btn" type="button" class="btn btn-primary">确定修改</button>
				      										 </div>
													    </div>
													  </div>
								</div>
							</div>
							<div class="page-link-content">
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
		
	</body>
	<script type="text/javascript">
		$("#question-filter-pagetype dd span").click(function(){
			$("#question-filter-pagetype dd span").removeClass("label label-info");
			$(this).addClass("label label-info");
		});
	</script>
</html>