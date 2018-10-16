<%@page import="com.pan.exam.entity.Opinon_ch"%>
<%@page import="com.pan.exam.entity.Test"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>exam++</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/bootstrap/js/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>
<style>
.container {
	width: 900px;
	padding: 5px;
}

header {
	border-top: 3px solid #1BA1E2;
}

nav {
	border-bottom: 1px solid #eee;
	border-top: 1px solid #eee;
	background-color: #FAFAFA;
}

nav ul>li {
	float: left;
	cursor: pointer;
}

nav a {
	color: #5A5C5D;
	font-size: 15px;
	font-weight: 600;
}

nav ul>li.active {
	border-bottom: 3px solid #E47327;
}

footer {
	border-top: 1px solid #eee;
	border-bottom: 1px solid #eee;
	height: 70px;
}

footer p {
	height: 70px;
	line-height: 70px;
	color: #999;
}

footer a {
	color: #999;
	margin: 0 5px 0 5px;
}

footer a:HOVER {
	color: #999;
}

#modal_ul ul {
	margin-top: 25px;
	font-size: 15px;
	cursor: pointer;
}

#modal_ul li {
	padding: 10px;
	list-style: none;
}

.uls>li {
	background-color: #EEEEEE;
	
}

.div1 {
	float: left;
	margin-top: 20px;
	line-height: 25px;
	margin-left: 10%;
	width: 17%;
	height: 220px;
	border: 1px solid #CECECE;
}

.div2 {
	margin-top: 20px;
	margin-left: 20px;
}

.div3 {
	float: left;
	margin-left: 20px;
	margin-top: 20px;
	width: 60%;
	height: 400px;
	border: 1px solid #CECECE;
}

.div4 {
	height: 40px;
	line-height: 40px;
	text-indent: 2em;
	border-bottom: 1px solid #CECECE;
}

.div5 {
	text-indent: 2em;
	height: 300px;
	border-bottom: 1px solid #CECECE;
	
}
.divv{
	width: 400px;
	height: 300px;
	margin-left:50px;
	padding-top：50px;
	
}

.div7 {
	height: 60px;
	
}

.zz {
	margin-left: 60px;
}
.display{
	display: none;
}

</style>
</head>
<body>
	<header>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<a href="#"> <img
					src="<%=request.getContextPath()%>/img/logo.png" />
				</a>
			</div>
			<div class="col-md-7 text-right">
				<a href="<%=request.getContextPath()%>/jsp/user/register.jsp"
					class="btn btn-primary">用户注册</a> <a
					href="<%=request.getContextPath()%>/jsp/user/login.jsp"
					class="btn btn-success">登录</a>
			</div>
		</div>
	</div>
	</header>
	<nav>
	<div class="container">
		<ul class="nav">
			<li><a> <span class="glyphicon glyphicon-home"
					aria-hidden="true"></span> 主页
			</a></li>
			<li class="active"><a> <span
					class="glyphicon glyphicon-edit"></span> 试题练习
			</a></li>
			<li href=><a href="login.jsp"> <span
					class="glyphicon glyphicon-user"></span> 会员中心
			</a></li>
			<li><a> <span class="glyphicon glyphicon-cog"></span> 个人设置
			</a></li>
		</ul>
	</div>
	</nav>
	<div>
		<div class="div1">
			<div class="div2">
				<span class="tit">知识类型:</span><br /> <font style="color:red">
				<%List question=(List) request.getAttribute("question");
				Test qus=(Test) question.get(1);
				%>
				<%=qus.getKnowledeg_name() %>
				</font><br />
				<span class="tit">题型库:</span><br /> <font style="color:red"><%=qus.getQuestion_describe() %>[共<%=question.size() %>题]</font><br />
				<span class="tit">学习类型:</span><br /> <br /> <a href="#"class="btn btn-success" style="width: 150px;">答题模式</a>
			</div>
		</div>
		
		<div class="div3">
		<div class="div4">
		<!-- 加载题目-->
		<%
		
		for(int i=0;i<question.size();i++){
			Test qu=(Test) question.get(i);
			%>
			<p class="<%=i%> display timu" value='<%=i%>'>第<%=i+1 %>题：<%=qu.getTestquestion_content() %></p>
			<%
		}
		%>
		</div>
			<div class="div5">
			<!-- 加载选项 -->
				<%
				Map options =(Map)request.getAttribute("option");
				for( int y=0;y<options.size();y++){
					List opt =(List) options.get(y);
					
					%>
					<div class="divv display <%=y%>">
					<br/>
					<%
					for(int j=0;j<opt.size();j++){
						Opinon_ch op =(Opinon_ch) opt.get(j);
						
						%>
						<input type="radio"   name="<%=op.getTestquestion_id()%>" value=<%=op.getOption()%>">&nbsp;&nbsp;&nbsp;<%=op.getOption()+"   "+ op.getOption_content()  %><br/>
						<%
					}
					%>
					</div>
					<% 
				}
				%>
			</div>
			<div class="div7">
				<p style="text-align: left">
					<a href="javascript:prePage()" class="btn btn-success syt"
						style="width: 150px;">上一题</a> <a href="javascript:nextPage()"
						class="btn btn-success xyt" style="width: 150px;">下一题</a>
					<button class="btn btn-warning tijao" style="width: 150px;">提交答案</button>
				</p>
			</div>
		</div>
		<div class="div3" style="margin-left: 350px">
			<div class="div4">
				<p id="sp1">
					<span class="glyphicon glyphicon-envelope"></span>学员评论
				</p>
			</div>
			<div class="div5">
				<font id="fon1"></font><font id="sp2"></font>
				<table id="table1">
					<tr>
						<td colspan=3><p id="sp3"></p></td>
						<span  style="margin-top:50px;">留下点什么吧：</span>
				<textarea style=" margin-top:50px; width: 400px; height: 100px;" > </textarea><br/>
					<a href="" class="btn btn-success " style="width: 180px;margin-left: 200px">发表评论</a>								
				</tr>
				</table>
			</div>
		
		</div>
	</div>
	<footer>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<p>
					Exam++ Copyright &copy; <span>Exam++ - 主页 | 关于我们 | FAQ |
						联系我们</span>
				</p>
			</div>
		</div>
	</div>
	</footer>
	<div class="dtks"
		style="display: none; position: fixed; width: 550px; height: 80px; left: 300px; bottom: 0px; border: 2px solid #5CB85C; border-radius: 10px; background-color: white;"></div>
	<button onclick="xianshidatika()" class="btn btn-success dtk"
		style="position: fixed; width: 150px; left: 300px; bottom: 0px;">
		<span class=" glyphicon glyphicon-arrow-down"></span>答题卡
	</button>
	<script type="text/javascript">
		$(function() {
			
			<%
			int size= question.size();
			%>
			//动态添加答题卡
			<%for(int a=1;a<=size;a++){
				%>
				$(".dtks").append("<div style='text-align: center;height:20px;width:20px;background-color:red;border-radius: 5px;cursor: pointer; position: relative;float:left; margin-left:4px;margin-top:4px;' onclick='tianzhuandaoxuanxiang(this)'><%=a%></div>");
			<%
			}
			%>
			 siz=0;
			$("."+siz).css("display","block");
			//显示下一题
				$(".xyt").click(function(){
					if( siz< <%=size-1%>){
						$("."+siz).css("display","none");
						siz++;
						$("."+siz).css("display","block");
					}else{
						alert("到尾了。。。")
					}
				});
			//显示上一题
				$(".syt").click(function(){
					if(siz>0 ){
						$("."+siz).css("display","none");
						siz--;
						$("."+siz).css("display","block");
					}else{
						alert("到头了。。。")
					}
				});
			
			//提交答案
			$(".tijao").click(function(){
				//获取到用户的答案
				
			});
				
		});
		
		//显示答题卡
		function xianshidatika() {
			var height = $(".dtk").css("bottom");
			if (height == "0px") {
				$(".dtk").css("bottom", "80px");
				$(".dtks").css("display", "block");
				} else {
				$(".dtk").css("bottom", "0px");
				$(".dtks").css("display", "none");
			}

		}
		//点击跳转到该选项的题目
		function tianzhuandaoxuanxiang(e){
		var s=e.innerHTML-1;
		$("."+siz).css("display","none");
		$("."+s).css("display","block");
		siz=s;
		}
	</script>
</body>
</html>