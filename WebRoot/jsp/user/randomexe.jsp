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
			footer p{
				color: #999;
			}
			.tit{
				
				color: #66BAED;
			}
			.div1{
				float: left;
				margin-top: 20px;
				line-height: 25px;
				margin-left: 10%;
				width: 17%;
				height: 220px;
				border: 1px solid #CECECE;
			}
			.div2{
				margin-top: 20px;
				margin-left: 20px;
			}
			.div3{
				float: left;
				margin-left: 20px;
				margin-top: 20px;
				width: 60%;
				height: 400px;
				border: 1px solid #CECECE;
			}
			.div4{
				height: 40px;
				line-height: 40px;
				text-indent: 2em;
				border-bottom: 1px solid #CECECE;
			}
			.div5{
				text-indent: 2em;
				height: 300px;
				border-bottom: 1px solid #CECECE;
			}
			.div7{
				height: 60px;
			}
			.zz{
				margin-left: 60px;
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
						<a href="user/register.jsp" class="btn btn-primary">用户注册</a>
						<a href="#" class="btn btn-success">登录</a>
					</div>
				</div>
			</div>
		</header>
		<nav> 
			<div class="container">
				<ul class="nav">
					<li >
						<a>
							<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
							主页
						</a>
					</li>
					<li class="active">
						<a>
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
		<div>
			<div class="div1">
				<div class="div2">
				<span class="tit">知识类型:</span><br/>
				<font>随机练习</font><br />
				<span class="tit">题型库:</span><br/>
				<font>所有类型[共20题]</font><br />
				<span class="tit">学习类型:</span><br/>
				<br />
				<a href="#" class="btn btn-success" style="width: 150px;">答题模式</a>
				</div>				
			</div>
			
			<div class="div3">
				<div class="div4"><p id="sp1" ></p></div>
				<div class="div5"><font id="fon1"></font><font id="sp2" ></font>
				<table id="table1">
				<tr>
				<td colspan=3><p id="sp3" ></p></td>								
				</tr>
				</table>
				</div>
				
				
				<div class="div7">
				 <p style="text-align:left">		
		<a href="javascript:prePage()" class="btn btn-success zz" style="width: 150px;">上一题</a>
		<a href="javascript:nextPage()" class="btn btn-success zz" style="width: 150px;">下一题</a>
		<button  class="btn btn-warning zz" style="width: 150px;">提交答案</button>
	</p>
			</div>
			</div>
			
			
		</div>
		<footer>
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<p>Exam++ Copyright &copy; <span>Exam++ - 主页 | 关于我们 | FAQ | 联系我们</span></p>
					</div>
				</div>
			</div>
		</footer>
		
		<script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap/js/jquery-2.2.4.min.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap/js/bootstrap.min.js" ></script>
		
		<script >		
		var pageNo = 1;
		var pageSize = 1;
		var pageCount = 0;
		var exeCount=1;
		//发送异步请求
		function loadAllUsers(page,size){
			//发送请求加载题目
			$.post('<%=request.getContextPath() %>/rdmloadexe/rdmexe',{pageNo:page,pageSize:size},function(data){
				 clearTable();
				var users = data.list;
				for(var i=0;i<users.length;i++){
					$('#sp3').text(users[i].testquestion_content);
					//发送请求加载选项
					$.post('<%=request.getContextPath() %>/rdmloadexe/rdmopt',{testquestion_id:users[i].testquestion_id},function(data){						
						var options=data.option;
						for(var j=0;j<options.length;j++){
							$('#table1').append('<tr>'+
									'<td>'+"<input type='radio' name='radio'>"+options[j].option+'  '+
									options[j].option_content+'</td>'+										
									+'</tr>')
						}
						
					},'json')					}
				//总条目数
				var count = data.count;
				//计算总页数
				pageCount = Math.ceil(count*1.0/pageSize);
			},'json');
		}
	   
		
		//首页
		function firstPage(){
			loadAllUsers(1,pageSize);
			pageNo=1;
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
			exeCount++;
			$("#fon1").text(exeCount)
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
			exeCount--;
			 $("#fon1").text(exeCount)
		}
		
		function clearTable(){
			$('#table1 tr:not(:eq(0))').remove();
		}
	
	</script>
	<script>
			$(document).ready(function(){
				    $("#fon1").text(exeCount)
					$("#sp1").text("随机练习")
					$("#sp2").text("单选题");
				    firstPage();
			})
		</script>
	</body>
</html>
