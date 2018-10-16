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
							
							<li>
								<a href="<%=request.getContextPath() %>/jsp/admin/user-show.jsp"> <i class="fa fa-list-ul"></i>会员管理 </a>
							</li>
							
							<li class="active">
								<a > <i class="fa fa-list-ul"></i> 添加会员</a>
							</li>
						</ul>

					</div>
					<div class="col-xs-9">
						<div class="page-header">
							<h1><i class="fa fa-list-ul"></i>添加会员 </h1>
						</div>
						<div class="page-content row">
							<form id="user-add-form" style="margin-top:40px;"  action="adduser">
								
								<div class="form-line form-name" style="display: block;">
									<span class="form-label"><span class="warning-label"></span>默认题库：</span>
										<select id="job-type-input-select" class="df-input-narrow" name="questionname">
											<option value="-1" id="tikuxx">--请选择-- </option>
									</select>
									<span class="form-message"></span>
									<br>
								</div>
								
								<div class="form-line form-username" style="display: block;">
									<span class="form-label"><span class="warning-label"></span>用户名：</span>
										<input type="text"  class="df-input-narrow" id="memo" name="username"><span class="form-message"></span>
									<br>
								</div>
								
								<div class="form-line form-password" style="display:block;">
									<span class="form-label"><span class="warning-label"></span>密码：</span>
										<input type="text"  class="df-input-narrow" id="password" name="password"><span class="form-message"></span>
									<br>
								</div>
								
								<div class="form-line form-province" style="display:block;">
										<span class="form-label"><span class="warning-label"></span>省份：</span>
									<select id="province" name="province">
										<option value="北京">北京市</option>
										<option value="浙江省">浙江省</option>
										<option value="天津市">天津市</option>
										<option value="安徽省">北京市</option>
										<option value="上海市">上海市</option>
										<option value="福建省">福建省</option>
										<option value="重庆市">重庆市</option>
										<option value="江西省">江西省</option>
										<option value="河南省">河南省</option>
										<option value="湖北省">湖北省</option>
										<option value="湖南省">湖南省</option>
										<option value="广东省">广东省</option>
										<option value="海南省">海南省</option>
										<option value="江西省">江西省</option>
										<option value="青海省">青海省</option>
										<option value="江苏省">江苏省</option>
										<option value="辽宁省">辽宁省</option>
										<option value="吉林省">吉林省</option>
										<option value="台湾省">台湾省</option>
										<option value="河北省">河北省</option>
										<option value="贵州省">贵州省</option>
										<option value="四川省" selected="selected">四川省</option>
										<option value="云南省">云南省</option>
										<option value="陕西省">陕西省</option>
										<option value="甘肃省">甘肃省</option>
										<option value="黑龙江省">黑龙江省</option>
										<option value="香港特别行政区">香港特别行政区</option>
										<option value="澳门特别行政区">澳门特别行政区</option>
										<option value="广西壮族自治区">广西壮族自治区</option>
										<option value="宁夏回族自治区">宁夏回族自治区</option>
										<option value="新疆维吾尔自治区">新疆维吾尔自治区</option>
										<option value="内蒙古自治区">内蒙古自治区</option>
										<option value="西藏自治区">西藏自治区</option>
									</select>	<span class="form-message"></span>
									<br>
								</div>
								<div class="form-line form-company" style="display: block;">
									<span class="form-label"><span class="warning-label"></span>单位：</span>
										<input type="text"  class="df-input-narrow" id="name" name="company"><span class="form-message"></span>
									<br>
								</div>
								<div class="form-line form-department" style="display:block;">
									<span class="form-label"><span class="warning-label"></span>部门：</span>
										<input type="text"  class="df-input-narrow" id="name" name="department"><span class="form-message"></span>
									<br>
								</div>
								<div class="form-line">
									<input id="btn-save" value="确认添加" type="submit" class="df-submit">
								</div>
							</form>
							<p>${tjsb}</p><p>${tjcg}</p>
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
			
		$(function(){
				$.post('<%=request.getContextPath() %>/addqustion_name',function(data){
			for(var i=0;i<data.length;i++){
				$('#job-type-input-select').append("<option value="+data[i].question_id+">"+data[i].question_name+"</option>");
			}
				},'json');
			})
		</script>
	</body>
</html>