<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>exam++</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap/js/bootstrap.js"></script>
<style>
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
			#modal_ul ul{
				margin-top:25px;
				font-size: 15px;
				cursor: pointer;
			}
			#modal_ul li{
				padding:10px;
				list-style: none;
				
			}
			.uls> li{
				background-color: #EEEEEE;
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
					<li class="active">
						<a >
							<span class="glyphicon glyphicon-edit"></span>
							试题练习
						</a>
					</li>
					<li href=>
						<a href="login.jsp">
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
		
		<div class="container">
		<h4>开始测试</h4>
		<p>选择您想要参加的测验，考核下自己吧 </p>
		<div class="row"> 
			<div class="select-test col-xs-6">
				<div class="select-test-content">
					<h3 class="title">强化练习</h3>
						<p>自主选择具体考点，各个击破</p>
						<a class="btn btn-primary m" data-toggle="modal" data-target="#qianghua_Modal" value="qianghua" title="参加强化练习">参加练习</a>
				</div>
			</div>
			<div class="select-test col-xs-6">
				<div class="select-test-content">
					<h3 class="title">错题练习</h3>
						<p>收录做过的所有错题 </p>
						<a class="btn btn-primary m" data-toggle="modal" data-target="#qianghua_Modal" value="cuoti"  title="参加错题练习">参加练习</a>
				</div>
			</div>
			<div class="select-test col-xs-6">
				<div class="select-test-content">
					<h3 class="title">随机练习</h3>
						<p>自主选择具体考点，各个击破</p>
						<a class="btn btn-primary" href="<%=request.getContextPath() %>/jsp/user/randomexe.jsp" >参加练习</a>
				</div>
			</div>
			<div class="select-test col-xs-6">
				<div class="select-test-content">
					<h3 class="title">模拟考试</h3>
						<p>自主选择具体考点，各个击破</p>
						<a class="btn btn-primary m" data-toggle="modal" data-target="#qianghua_Modal" value="moni"  title="参加模拟考试">参加练习</a>
				</div>
			</div>
			<div class="select-test col-xs-6">
				<div class="select-test-content">
					<h3 class="title">随机组卷</h3>
						<p>专家组卷，为你提供更权威的考题动向   </p>
						<a class="btn btn-primary" >即将开放</a>
				</div>
			</div>
			<div class="select-test col-xs-6">
				<div class="select-test-content">
					<h3 class="title">专家试卷</h3>
						<p>专家组卷，为你提供更权威的考题动向 </p>
						<a class="btn btn-primary" >即将开放</a>
				</div>
			</div>
			</div>
		</div>
		<!-- 模态框-->
		<div class="modal fade" id="qianghua_Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel"></h4>
					</div>
					<div class="modal-body">
						<div id="modal_ul">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
<script type="text/javascript">

		$(function(){
			
			//发送请求到服务器。查找相关练习
			$(".m").click(function(){
				//获取练习类型
				var le=$(this).attr("value");
				var title=$(this).attr("title");
				
				
				//使用ajax异步加载
				$.post('<%=request.getContextPath()%>/test/chaxunlianxi',{"le":le},function(data){
					$("#myModalLabel").text(title);
						 $("#modal_ul *").remove();
						 //在模态框中加入数据
						 //强化模式下加载数据
						 if(le=="qianghua"){
							 var Data=data;
			                  for(var key in Data) {
			                      		var xuanzheti =0;
			                      		var panduan=0;
			                      		for(var i=0;i<Data[key].length;i++){
				                      		if(Data[key][i].testquestion_type=="单选题"){
				                      			xuanzheti++;
				                      		}else if(Data[key][i].testquestion_type=="判断题"){
				                      			panduan++;
				                      		}
				                      	}
			                      		 //添加ul
				                      	 $("#modal_ul").append("<ul class='uls'>"+"<li onclick='ti(this)'>"+"<span class='glyphicon glyphicon-chevron-up' class='span'>  "+key+"</span></li>"+"<ul>"+
				    	                      		"<li>单选题  共【"+xuanzheti+"】题    <a href='<%=request.getContextPath() %>/test/xuanze?cs="+key+"&x=xz' class='btn btn-success btn-xs'>参加练习</a></li>"+
				                      				 "<li>判断题  共【"+panduan+"】题     <a href='<%=request.getContextPath() %>/test/xuanze?cs="+key+"&x=pd' class='btn btn-success btn-xs'>参加练习</a></li>"+
				                      	 "</ul></ul>");
			                    }
			               
			                  $(".uls ul").hide();
						 }else if(le=="cuoti"){
							 //错题下加载数据
							  var Data=data;
			                  for(var key in Data) { 
			                	  if(Data[key]!=null){
			                      		var xuanzheti =0;
			                      		var panduan=0;
			                      		for(var i=0;i<Data[key].length;i++){
				                      		if(Data[key][i].testquestion_type=="单选题"){
				                      			xuanzheti++;
				                      		}else if(Data[key][i].testquestion_type=="判断题"){
				                      			panduan++;
				                      		}
				                      	}
			                      	//添加ul
			                      		 $("#modal_ul").append("<ul>"+"<ul>"
			    	                      		+"<li>单选题  共【"+xuanzheti+"】题    <a href='#' class='btn btn-success btn-xs'>错题重做</a></li>"+
			                      				 "<li>判断题  共【"+panduan+"】题     <a href='#' class='btn btn-success btn-xs'>错题重做</a></li>"+
			                      	 "</ul></ul>");
			                	  }
			                  }
			                   
						 }else{
							 //模拟测试加载数据
							 $("#modal_ul").append("<ul>");
							  var Data=data;
			                  for(var key in Data) { 
			                      		for(var i=0;i<Data[key].length;i++){
			                      			$("#modal_ul").append("<a href=''><li>《"+Data[key][i].testpaper_name+"》</li></a>");	
			                	  }
			                  }
			                  $("#modal_ul").append("</ul>"); 
						 }
				},"json");
			});
		});
		function ti(obj){
			$(".uls ul").hide();
			$(".uls span").attr("class","glyphicon glyphicon-chevron-up");
			$(obj).siblings().slideDown("fast");
			$(obj).children(":first").attr("class","glyphicon glyphicon-chevron-down");
		}
</script>
</body>
</html>