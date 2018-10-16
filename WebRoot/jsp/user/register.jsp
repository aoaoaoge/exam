<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<!--
        	设置网页IE浏览器用当前最高标准模式解析页面 
        -->
		<meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
		<!--
        	设置浏览器可视区域的宽度为满屏，初始化的缩放级别为按实际尺寸显示
        	h5 移动端优先,为了使得pc端能够正常显示,建议添加此设置
        -->
		<meta name="viewport" ontent="width=device-width,initial-scale=1">
		<title>Exam++</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css" />
		<style type="text/css">
			.container{
				width: 900px;
				padding:5px;
				
			}
			
			header{
				border-top: 3px solid #1BA1E2;
			}
			nav{
				border-bottom:1px solid #eee;
				border-top:1px solid #eee;
				background-color: #FAFAFA;
			}
			nav ul>li{
				float: left;
				cursor: pointer;
				
				
			}
			nav a{
				
				color: #5A5C5D;
				font-size: 15px;
				font-weight: 600;

			}
			nav ul>li.active{
				border-bottom: 3px solid #E47327;
			}
			
			#main h3{
				color:#666666;
			}
			#main{
				padding-top:30px;
				padding-bottom: 100px;
			}
			.register-box{
				border: 1px solid #eee;
				height: 540px; 
				background-color: #FAFAFA;
			}
			.register-box label {
				font-size: 14px;
    			color: #9a9a9a;
    			font-weight: normal !important;
			}
			.register-box div{
				margin-bottom: 18px;
			}
			.clause{				
				margin-left: 115px;
			}
			footer{
				border-top: 1px solid #eee; 
				border-bottom: 1px solid #eee; 
				height: 70px;
			}
			footer p{				
				height:70px;
				line-height: 70px; 
				color: #999;				
			}
			footer a{
				color: #999;
				margin: 0 5px 0 5px;				
			}
			footer a:HOVER {
				color: #999;
			}
			.clause>button {
				border: none;
				background-color: #ddd;
			}
			.clause>button:HOVER {
				color: #999;
			}
		</style>
	</head>
	<body>
		
		<header>
			<div class="container">
				<div class="row">
					<div class="col-md-5">
						<a href="#">
							<img src="<%=request.getContextPath() %>/img/logo.png" />
						</a>
					</div>
					<div class="col-md-7 text-right">
						<a href="<%=request.getContextPath() %>/jsp/user/register.jsp" class="btn btn-primary">用户注册</a>
						<a href="<%=request.getContextPath() %>/jsp/user/login.jsp" class="btn btn-success">登录</a>
					</div>
				</div>
			</div>
		</header>
		<nav> 
			<div class="container">
				<ul class="nav">
					<li>
						<a>
							<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
							主页
						</a>
					</li>
					<li>
						<a href="test.jsp">
							<span class="glyphicon glyphicon-edit"></span>
							试题练习
						</a>
					</li>
					<li>
						<a>
							<span class="glyphicon glyphicon-user"></span>
							会员中心
						</a>
					</li>
					<li>
						<a>
							<span class="glyphicon glyphicon-cog"></span>
							个人设置
						</a>
					</li>
				</ul>
			</div>
		</nav>
		<div id="main">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-md-offset-3 register-box">
						<h3>注册账号</h3>
						<form class="form-horizontal"  action="<%=request.getContextPath() %>/user/reg"  method="post">
							<div class="form-group">
								<label class="control-label col-md-3">账号</label>
								<div class="col-md-9">
									<input type="text" name="username" id="username" class="form-control"/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3">email</label>
								<div class="col-md-9">
									<input type="text" name="email" id="email" class="form-control"/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3">密码</label>
								<div class="col-md-9">
									<input type="password" name="password" id="password" class="form-control"/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3">确认密码</label>
								<div class="col-md-9">
									<input type="password" name="password_confirm" id="password_confirm" class="form-control"/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3">选择专业</label>
								<div class="col-md-9">
									<select name="field" class="form-control" id="field">
										<option value="">--请选择--</option>
									</select>
								</div>
							</div>
							<div class="clause">
								<input type="checkbox"/><label><a href="#">同意Exam++条款</a></label>
							</div>
							<div class="clause">
								<button class="btn btn-default">注册账号</button>
								<button class="btn btn-default">重置</button>
								<!-- 错误信息提示 -->
								<span style="color: red;">${requestScope.regInfo}</span>
							</div>
						</form>
						<div class="row">
							<div class="col-md-12">
								已有账号，<a href="login.jsp">直接登录</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer>
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<p>Exam++ Copyright &copy; <a>Exam++</a>-<a>主页</a>|<a>关于我们 </a>|<a>FAQ</a>|<a>联系我们</a></p>
					</div>
				</div>
			</div>
		</footer>
		
		<!-- 绝对路径引入jQuery和bootstrap -->
		<script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap/js/jquery-2.2.4.min.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap/js/bootstrap.min.js" ></script>
		<!-- javascript 异步获取专业名称 -->
		<script type="text/javascript">
				$(function(){
					$.post("<%=request.getContextPath() %>/load",function(data){
						for(var i = 0; i < data.length; i++){
							 $("#field").append("<option value="+ data[i].question_id + ">" + data[i].question_name + "</option>");
						}
					},"json");
				});
		</script>
	</body>
</html>
