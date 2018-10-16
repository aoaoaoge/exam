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
		<title>试题管理</title>
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=request.getContextPath() %>/img/favicon.ico" />
		<link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/jsp/css/style.css" rel="stylesheet">
		
		<link href="<%=request.getContextPath() %>/jsp/css/exam.css" rel="stylesheet">
		<style>
			.examing-point{
				display:block;
				font-size:10px;
				margin-top:5px;
			}
			.question-name-td{
				width:300px;
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
						<a class="btn btn-primary" href="#">用户注册</a>
						<a class="btn btn-success" href="#">登录</a>
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
						<li  class="active">
							<a href="<%=request.getContextPath() %>/jsp/admin/question-list.jsp">试题管理</a>
						</li>

						<li>
							<a href="<%=request.getContextPath() %>/jsp/admin/exampaper-list.jsp">试卷管理</a>
						</li>
						<li>
							<a href="<%=request.getContextPath() %>/jsp/admin/user-show.jsp">会员管理</a>
						</li>
						<li>
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
								<a href="<%=request.getContextPath() %>/jsp/admin/question-list.jsp"> <i class="fa fa-list-ul"></i> 试题管理 </a>
							</li>
							<li>
								<a href="<%=request.getContextPath() %>/jsp/admin/question-add.jsp"> <i class="fa fa-pencil-square-o"></i> 添加试题 </a>
							</li>
							<li>
								<a href="<%=request.getContextPath() %>/jsp/admin/question-import.jsp"> <i class="fa fa-cloud-upload"></i> 导入试题 </a>
							</li>
						</ul>
					</div>
					<div class="col-xs-9">
						<div class="page-header">
							<h1><i class="fa fa-list-ul"></i> 试题管理 </h1>
						</div>
						<div class="page-content row">

							<div id="question-filter">

								<dl id="question-filter-field">
									<dt>
										题库分类：
									</dt>
									<dd>
										<span class="label label-info fall">全部</span>
												
									</dd>
								</dl>
								<dl id="question-filter-knowledge">
									<dt>
										知识分类：
									</dt>
									<dd>
										<span class="label label-info kall">全部</span>
										
									</dd>
								</dl>

								<dl id="question-filter-type">
									<dt>
										试题类型：
									</dt>
									<dd>
										<span class="label label-info tall" title="">全部</span>
										<span title="1">单选题</span><span title="2">多选题</span>
										<span title="3">判断题</span><span title="4">填空题</span>
										<span title="5">简答题</span><span title="6">论述题</span>
										<span title="7">分析题</span>
									</dd>
								</dl>
								
							</div>
							<div id="question-list">
								<input id="field-id-hidden" value="" type="hidden">
								<input id="knowledge-hidden" value="" type="hidden">
								<input id="question-type-hidden" value="" type="hidden">
								<input id="search-param-hidden" value="" type="hidden">
								<table class="table-striped table">
									<thead>
										<tr>
											<td></td><td>ID</td><td class="question-name-td">试题名称</td><td>试题类型</td><td>专业</td><td>知识类</td><td>操作</td>
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
														        <h6 class="modal-title" id="myModalLabel">修改分类</h6>
														     </div>
														     <div class="modal-body">
														     	<form id="question-edit-form">
														     		<input type="hidden" id="update-questionid" style="display:none;"/>
															     		
														     		<div class="form-line exampaper-type" id="aq-course1">
																		<span class="form-label"><span class="warning-label">*</span>专业：</span>
																		<select id="field-select" class="df-input-narrow">
																			
																		</select><span class="form-message"></span>
																	</div>
														     		<div class="form-line exampaper-type" id="aq-course2">
																		<span class="form-label"><span class="warning-label">*</span>知识类：</span>
																		<select id="point-select" class="df-input-narrow">
																			
																		</select><span class="form-message"></span>
																	</div>
																	
																</form>
														     </div>
														     <div class="modal-footer">
				        										<button type="button" class="btn btn-default close-update" data-dismiss="modal">关闭窗口</button>
				        										<button id="update-question-btn" type="button" class="btn btn-primary">确定修改</button>
				      										 </div>
													    </div>
													  </div>
								</div>
							</div>
							<div class="page-link-content">
								<nav aria-label="...">
								  <ul class="pagination" id="page">
								    
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

		<!-- jQuery -->
		<script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap/js/jquery-2.2.4.min.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap/js/bootstrap.min.js"></script>

	</body>
	<script>
	
		
		$(function(){
		
			fname = "";	//选中的题库名
			kname = "";	//选中的知识点名
			tpye = "";	//选中的试题类型
			pageno = 1;	//当前页码
			minpage = 1;//最小页码
			maxpage = 0;//最大页码
			pagecount = 1; //总页数
			//加载所有的知识库函数
			var showField = function(){
				$.post('field/showField',function(data){
				for(var i=0;i<data.length;i++){
					$("#question-filter-field dd").append("<span id='fname'>"+data[i].question_name+"</span>");
				}
				},'json');
			};
			//加载所有的知识点函数
			var showKnowledgePoint = function(){
					$.post('field/showKnowledgePoint',function(data){
					var k = data.list;
					for(var i=0;i<k.length;i++){
						$("#question-filter-knowledge dd").append("<span id='kname'>"+k[i].knowledeg_name+"</span>");
					}
				},'json');
			};
			
			var getQuestType = function(typeid){
				var type = '';
				if(typeid == 1){
					type = '选择题';
				}
				return type;
			};
			
			//通过题库查询试题
			var shwoQusetionsByField = function(fname,pageno){
				$.post('question/showQusetionByField',{fname:fname,pageno:pageno},function(data){
					$("#question-list table tbody").empty();
					var qusetions = data.questions;
					pagecount = Math.ceil(data.count_questions/5);
					for(var i=0;i<qusetions.length;i++){
					$("#question-list table tbody").append("<tr>"+
															"<td><input type='checkbox'/></td>"+
															"<td>"+qusetions[i].testquestion_id+"</td>"+
															"<td>"+qusetions[i].testquestion_content+"</td>"+
															"<td>"+getQuestType(qusetions[i].testquestion_type)+"</td>"+
															"<td>"+qusetions[i].fieldName+"</td>"+
															"<td>"+qusetions[i].knowledgePointName+"</td>"+
															"<td><a class='btn btn-danger btn-xs updata-question' data-toggle='modal' data-target='#change-property-modal'>修改</a></td>"+
														+"</tr>");
					}
					//加载页码
					getPage();
				},'json');
			};
			var shwoQusetionsByPoint= function(knowledgePointName,pageno){
				$.post('question/shwoQusetionsByPoint',{knowledgePointName:knowledgePointName,pageno:pageno},function(data){
					$("#question-list table tbody").empty();
					var qusetions = data.questions;
					pagecount = Math.ceil(data.count_questions/5);
					for(var i=0;i<qusetions.length;i++){
					$("#question-list table tbody").append("<tr>"+
															"<td><input type='checkbox'/></td>"+
															"<td>"+qusetions[i].testquestion_id+"</td>"+
															"<td>"+qusetions[i].testquestion_content+"</td>"+
															"<td>"+getQuestType(qusetions[i].testquestion_type)+"</td>"+
															"<td>"+qusetions[i].fieldName+"</td>"+
															"<td>"+qusetions[i].knowledgePointName+"</td>"+
															"<td><a class='btn btn-danger btn-xs updata-question' data-toggle='modal' data-target='#change-property-modal'>修改</a></td>"+
														+"</tr>");
					}
					//加载页码
					getPage();
				},'json');
			};
			
			//加载所有题库名
			showField();
			
			//加载所有知识点名
			showKnowledgePoint();
			
			//加载所有试题
			shwoQusetionsByField(fname,pageno);

			//根据题库分类加载知识点并加载所有试题
			$("#question-filter-field dd").on("click","#fname",function(){
				fname = $(this).text();
				pageno = 1;
				$("#question-filter-field dd span").removeClass("label label-info");
				$(this).addClass("label label-info");
				var fname = $(this).text();
				$("#question-filter-knowledge dd").empty();
				$.post('field/selcetPointByField',{fname:fname},function(data){
					for(var i=0;i<data.length;i++){
						$("#question-filter-knowledge dd").append("<span class='label label-info kall'>全部</span>"+
																	"<span id='kname'>"+data[i].knowledeg_name+"</span>");
					}
				},'json');
				shwoQusetionsByField(fname,pageno);
			});
			
			//根据知识点分类加载所有试题
			$("#question-filter-knowledge dd").on("click","#kname",function(){
				kname = $(this).text();
				pageno = 1;
				$("#question-filter-knowledge dd span").removeClass("label label-info");
				$(this).addClass("label label-info");
				shwoQusetionsByPoint(kname,pageno);
			});
			
			//显示所有题库的试题
			$("#question-filter-field dd .fall").click(function(){
				fname ="";
				pageno = 1;
				$("#question-filter-field dd span").removeClass("label label-info");
				$(this).addClass("label label-info");
				$("#question-filter-knowledge dd span").removeClass("label label-info");
				$("#question-filter-knowledge dd .kall").addClass("label label-info");
				$("#kname").remove();
				showKnowledgePoint();
				shwoQusetionsByField(fname,pageno);
			});
			
			//显示所有对应题库的知识点的试题
			$("#question-filter-knowledge dd").on("click",".kall",function(){
				fname = $("#question-filter-field dd span.label-info").text();
				pageno = 1;
				if(fname == '全部'){
					fname = '';
				}
				$("#question-filter-knowledge dd span").removeClass("label label-info");
				$(this).addClass("label label-info");
				shwoQusetionsByField(fname,pageno);
			});
			
			//显示所有对应类型的试题
			$("#question-filter-type dd span").click(function(){
				type = $(this).attr("title");
				$("#question-filter-type dd span").removeClass("label label-info");
				$(this).addClass("label label-info");
				
			});
			//修改界面信息异步加载
			$("#question-list table tbody").on("click",".updata-question",function(){
				var selectField = $(this).parent("td").prev("td").prev("td").text();
				var selectPoint = $(this).parent("td").prev("td").text();
				var questionid = $(this).parent("td").prev("td").prev("td").prev("td").prev("td").prev("td").text();
				$("#update-questionid").val(questionid);
				$("#field-select").empty();
				$("#point-select").empty();
				$("#field-select").append("<option id='fname'>"+selectField+"</option>");
				$("#point-select").append("<option id='kname'>"+selectPoint+"</option>");
				$.post('field/showField',function(data){
				for(var i=0;i<data.length;i++){
					$("#field-select").append("<option id='fname' value="+data[i].question_name+">"+data[i].question_name+"</option>");
				}
				},'json');
			});
			//题库下拉框改变，异步加载知识点
			$("#field-select").change(function(){
				var fname1 = $(this).val();
				$("#point-select").empty();
				$.post('field/selcetPointByField',{fname:fname1},function(data){
				for(var i=0;i<data.length;i++){
					$("#point-select").append("<option id='kname' value="+data[i].knowledeg_name+">"+data[i].knowledeg_name+"</option>");
				}
				},'json');
			});
			//确认修改试题
			$("#update-question-btn").click(function(){
				var update_qusetid = $("#update-questionid").val();
				var update_kname = $("#point-select").val();
				$.post('question/updateQusertion',{qusetid:update_qusetid,kname:update_kname},function(data){
					if(data=="true"){
						alert("修改成功！");
						$("#change-property-modal .close-update").trigger("click");
						$("#question-list table tbody").empty();
						//加载所有试题
						shwoQusetionsByField(fname,1);
					}else alert("修改失败！");
				},'text');
			});
			
			//翻页功能
			//加载页码
			var getPage = function(){
				//清空页码
					$("#page").empty();
					//加载页码
					for(var i=1;i<=pagecount;i++){
						if(i == 1){
							$("#page").append("<li>"+
								    				"<a aria-label='Previous'>上一页</a>"+
								   	 			"</li>");	
						}
						$("#page").append("<li>"+
								   				"<a>"+i+"</a>"+
								   			"</li>");
						if(i == pagecount){
							$("#page").append("<li>"+
								   				"<a aria-label='Next'>下一页</a>"+
								   				"</li>");
						}
					}
					//判断首末页
					if(pageno!=1){
						$("#page li:first").removeClass("disabled");
					}else $("#page li:first").addClass("disabled");
					if(pageno != pagecount){
						$("#page li:last").removeClass("disabled");
					}else $("#page li:last").addClass("disabled");
					//判断当前页
					var currpage = $("#page li a");
					for(var i=1;i<=pagecount;i++){
						if($(currpage[i]).text() == pageno){
							$("#page li").removeClass("active");
							$(currpage[i]).parent("li").addClass("active");
						}
					}
			};

			//换页
			$("#page").on("click","li a",function(){
				if($(this).text()!="上一页" && $(this).text()!="下一页"){
					pageno = $(this).text();
					$(this).parent("li").addClass("active");
					fname = $("#question-filter-field dd span.label-info").text();
					kname = $("#question-filter-knowledge dd span.label-info").text();
					if(fname == '全部'){
						fname = '';
						shwoQusetionsByField(fname,pageno);
					}
					else {
						if(kname == '全部'){
							kname = '';
							shwoQusetionsByPoint(kname,pageno);
						}
						else shwoQusetionsByPoint(kname,pageno);
					}
				}
			});
			//上页
			$("#page").on("click","li a:first",function(){
				if(pageno!=1){
					pageno--;
					fname = $("#question-filter-field dd span.label-info").text();
					kname = $("#question-filter-knowledge dd span.label-info").text();
					if(fname == '全部'){
						fname = '';
						shwoQusetionsByField(fname,pageno);
					}
					else {
						if(kname == '全部'){
							kname = '';
							shwoQusetionsByPoint(kname,pageno);
						}
						else shwoQusetionsByPoint(kname,pageno);
					}
				}
				
				
			});
			//下页
			$("#page").on("click","li a:last",function(){
				if(pageno!=pagecount){
					pageno++;
					fname = $("#question-filter-field dd span.label-info").text();
					kname = $("#question-filter-knowledge dd span.label-info").text();
					if(fname == '全部'){
						fname = '';
						shwoQusetionsByField(fname,pageno);
					}
					else {
						if(kname == '全部'){
							kname = '';
							shwoQusetionsByPoint(kname,pageno);
						}
						else shwoQusetionsByPoint(kname,pageno);
					}
				}
				
			});
		});
		
		
		
		</script>
</html>
