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
		<link href="<%=request.getContextPath() %>/bootstrap/css/bootstrapValidator.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/jsp/css/question-add.css" rel="stylesheet">
		<style>
			input.add-ques-amount,input.add-ques-score{
				width:50px;
				margin-right:0;
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
							<li>
								<a href="<%=request.getContextPath() %>/jsp/admin/exampaper-list.jsp"> <i class="fa fa-list-ul"></i> 试卷管理 </a>
							</li>
							<li class="active">
								<a> <i class="fa fa-file-text-o"></i> 创建新试卷 </a>
							</li>
						</ul>
					</div>
					<div class="col-xs-9">
						<div class="page-header">
							<h1><i class="fa fa-file-text-o"></i> 创建新试卷 </h1>
						</div>
						<div class="page-content row">
							<form id="form-exampaper-add" method="post">
								<div class="form-line add-update-exampapername col-lg-0">
									<span class="form-label"><span class="warning-label">*</span>试卷名称：</span>
									<input name="paperName" type="text" class="df-input-narrow">
									<span class="form-message"></span>
								</div>
								<div class="form-line add-update-exampaper-creat-type col-lg-0">
									<span class="form-label"><span class="warning-label">*</span>组卷方式：</span>
									<select name="MethodOfPaper" class="df-input-narrow">
										<option value="2">自动组卷</option>
										<option value="1">手动组卷</option>
										
									</select>
									<span class="form-message"></span>
								</div>
								<div class="form-line add-update-exampaper-type col-lg-0">
									<span class="form-label"><span class="warning-label">*</span>试卷类型：</span>
									<select name="paperType" class="df-input-narrow">
										<option value="3">专家试卷</option>
										<option value="2" selected="selected">模拟考试</option>
										<option value="1">随机试卷</option>
										
									</select>
									<span class="form-message"></span>
								</div>
								<div class="form-line add-update-pass-point col-lg-0">
									<span class="form-label"><span class="warning-label">*</span>及格分数：</span>
									<input name="passscore" type="text" class="df-input-narrow">
									<span class="form-message"></span>
								</div>
								<div class="form-line add-update-duration col-lg-0">
									<span class="form-label"><span class="warning-label">*</span>时长（分钟）：</span>
									<input name="time" type="text" class="df-input-narrow">
									<span class="form-message"></span>
								</div>
								<div id="choice-question" class="form-line add-update-types" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>题型：</span>
									<fieldset>
										<legend>
											选择题型分布
										</legend>
										<span class="add-ques-type">
											<label >单选题</label>
											<input name="questiontypeid" type="hidden" class="ques-id" value="1">
											<input name="questionnum" type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input name="pointByQuestion" type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
										<span class="add-ques-type">
											<label >多选题</label>
											<input name="questiontypeid" type="hidden" class="ques-id" value="2">
											<input name="questionnum" type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input name="pointByQuestion" type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
										<span class="add-ques-type">
											<label >判断题</label>
											<input name="questiontypeid" type="hidden" class="ques-id" value="3">
											<input name="questionnum" type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input name="pointByQuestion" type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
										<span class="add-ques-type">
											<label >填空题</label>
											<input name="questiontypeid" type="hidden" class="ques-id" value="4">
											<input name="questionnum" type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input name="pointByQuestion" type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
										<span class="add-ques-type">
											<label >简答题</label>
											<input name="questiontypeid" type="hidden" class="ques-id" value="5">
											<input name="questionnum" type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input name="pointByQuestion" type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
										<span class="add-ques-type">
											<label >论述题</label>
											<input name="questiontypeid" type="hidden" class="ques-id" value="6">
											<input name="questionnum" type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input name="pointByQuestion" type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
										<span class="add-ques-type">
											<label >分析题</label>
											<input name="questiontypeid" type="hidden" class="ques-id" value="7">
											<input name="questionnum" type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input name="pointByQuestion" type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
									</fieldset>
									<span class="form-message"></span>
								</div>
								<div class="form-line add-total-point">
									<span class="form-label"><span class="warning-label">*</span>总分：</span>
									<input id="total-point" name="score" type="text" class="df-input-narrow" readonly/>
									<span class="form-message"></span>
								</div>
								<div class="form-line add-update-exampaper-scope" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>知识点：</span>
									<fieldset>
										<legend>
											题库及知识点
										</legend>
										<div>
										<div class="clearfix">
											<div id="aq-course1" style="padding:0px;float:left; width:48%;">
												<select id="field-select" class="df-input-narrow" size="4" style="width:100%;">
													
												</select>
											</div>
											<div id="aq-course2" style="padding:0px; float:right;width:48%;">
												<select id="point-from-select" class="df-input-narrow" size="4" style="width:100%;">
												</select>
											</div>
										</div>
										
										<div style="text-align:center;margin:10px 0;">
											<a id="add-point-btn" class="btn btn-primary btn-xs" data-toggle="modal">选择知识点</a>
											<a id="del-point-btn" class="btn btn-danger btn-xs">删除知识点</a>
											<a id="remove-all-point-btn" class="btn btn-warning btn-xs">清除列表</a>
										</div>
										<div id="kn-selected" style="padding-left:0px;text-align:center;margin-bottom:20px;" class="col-lg-0">
												<select name="kps" id="point-to-select" class="df-input-narrow" multiple="multiple" size="4"  style="width:80%;">
												</select>
												<p style="font-size:12px;color:#AAA;">您可以从上面选择4个知识点</p>
										</div>
									</div>
									</fieldset>
									<span class="form-message"></span>
								</div>
								<div class="form-line">
									<a id="submitExampaper"  data-toggle="modal" class="btn btn-primary df-submit">下一步</a>
								</div>
							</form>
							<div class="modal fade bs-example-modal-sm null" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
						  <div class="modal-dialog modal-sm" role="document">
						    <div class="modal-content">
						    	　　　　　　　知识点不能为空！
						    </div>
						  </div>
						</div>
						<div class="modal fade bs-example-modal-sm repeat" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
						  <div class="modal-dialog modal-sm" role="document">
						    <div class="modal-content">
						    	　　　　　　　知识点重复！
						    </div>
						  </div>
						</div>
						<div class="modal fade bs-example-modal-sm notenough" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
						  <div class="modal-dialog modal-sm" role="document">
						    <div class="modal-content">
						    	　　　　　　　试题数量不足！
						    </div>
						  </div>
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
		<script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap/js/bootstrapValidator.min.js"></script>
		
	</body>
	<script type="text/javascript">
		$(function(){
			score = 0;	//总分
			fname = "";//选中的题库名
			kname = "";//选中的知识点名
			//加载所有的知识库函数
			var showField = function(){
				$.post('field/showField',function(data){
				for(var i=0;i<data.length;i++){
					$("#field-select").append("<option id='fname' value="+data[i].question_name+">"+data[i].question_name+"</option>");
				}
				},'json');
			};
			showField();
			//根据题库选择知识点
			$("#field-select").on("click","#fname",function(){
				fname = $(this).val();
				$("#point-from-select").empty();
				$.post('field/selcetPointByField',{fname:fname},function(data){
					for(var i=0;i<data.length;i++){
						$("#point-from-select").append("<option id='kname' value="+data[i].knowledeg_name+">"+data[i].knowledeg_name+"</option>");
					}
				},'json');
			});
			
			//增加知识点
			$("#add-point-btn").click(function(){
				kname = $("#point-from-select").val();
				var flage = false;
				$("#add-point-btn").removeAttr("data-target");
				if($("#field-select").val() != null){
					fname = $("#field-select").val();
				}
				//遍历已选中的知识点并与选中的知识点对比
				$("#point-to-select option").each(function name() {
					//console.log($(this).val());
					//console.log(fname+">"+kname);
					//若知识点已存在便跳出此次循环
					if($(this).val() == (fname+">"+kname)){
						$("#add-point-btn").attr("data-target",".repeat");
						flage = true;
						return false;
					}
				});
				//若知识点已存在便跳出此次事件
				if(flage) return;
				if($("#point-from-select").val() == null){
					$("#add-point-btn").attr("data-target",".null");
					return;
				}
				$("#point-to-select").append("<option id='kname'>"+fname+">"+kname+"</option>");
			});
			
			//删除选中的知识点
			$("#del-point-btn").click(function(){
				$("#point-to-select>option:selected").remove();
				kname = "";
			});
			
			//删除所有知识点
			$("#remove-all-point-btn").click(function(){
				$("#point-to-select option").remove();
				kname = "";
			});
		});
		
		//判断总分
		var countscore = function(){
			var type = $("#choice-question .add-ques-type");
			for(var i=0;i<type.length;i++){
				score += ($(type[i]).children("input").eq(1).val()*1.0)*($(type[i]).children("input").last().val()*1.0);
			}
			$("#total-point").val(score);
			score = 0;
		};
		
		$("#choice-question .add-ques-amount").change(function(){
			//计算分数
			countscore();
			//验证试题数量
			yznum();
		});
		$("#choice-question .add-ques-score").change(function(){
			//计算分数
			countscore();
			//验证试题数量
			yznum();
		});		
		
		//表单提交
		//验证试题数量
		var yznum = function(){
			var type = $("#choice-question .add-ques-type");
			if(type.children("input").eq(1).val() == ''){
				$("#submitExampaper").attr("data-target",".notenough");
			}else{
				$.post('exampaper/countQuestion',$("#form-exampaper-add").serialize(),function(data){
					if(data == 'true'){
						$("#submitExampaper").removeAttr("data-target",".notenough");
					}
					else{
						$("#submitExampaper").attr("data-target",".notenough");
					}
				});
			}
		};
		//验证试题数量
		yznum();
		$("#submitExampaper").click(function(){
			yznum();
			$("#submitExampaper").submit();
			var type = $("#choice-question .add-ques-type");
			if(type.children("input").eq(1).val() != ''){
				$.post('exampaper/countQuestion',$("#form-exampaper-add").serialize(),function(data){
					if(data == 'true'){
						$.post('exampaper/addExamPaper',$("#form-exampaper-add").serialize(),function(data){
							
						},'json');
					}
				},'text');
			}
			
		});
		
		
		//表单验证
		 $("#form-exampaper-add").bootstrapValidator({  
	        live: 'enabled',//验证时机，enabled是内容有变化就验证（默认），disabled和submitted是提交再验证  
	        excluded: [':disabled', ':hidden', ':not(:visible)'],//排除无需验证的控件，比如被禁用的或者被隐藏的 
	        feedbackIcons: {//根据验证结果显示的各种图标  
	            valid: 'glyphicon glyphicon-ok',  
	            invalid: 'glyphicon glyphicon-remove',  
	            validating: 'glyphicon glyphicon-refresh'  
	        },  
	        fields: { 
	            /* text: {  
	                validators: {  
	                    notEmpty: {//检测非空,radio也可用  
	                        message: '文本框必须输入'  
	                    },  
	                    stringLength: {//检测长度  
	                        min: 6,  
	                        max: 30,  
	                        message: '长度必须在6-30之间'  
	                    },  
	                    regexp: {//正则验证  
	                        regexp: /^[a-zA-Z0-9_\.]+$/,  
	                        message: '所输入的字符不符要求'  
	                    },  
	                    remote: {//将内容发送至指定页面验证，返回验证结果，比如查询用户名是否存在  
	                        url: '指定页面',  
	                        message: 'The username is not available'  
	                    },  
	                    different: {//与指定文本框比较内容相同  
	                        field: '指定文本框name',  
	                        message: '不能与指定文本框内容相同'  
	                    },  
	                    emailAddress: {//验证email地址  
	                        message: '不是正确的email地址'  
	                    },  
	                    identical: {//与指定控件内容比较是否相同，比如两次密码不一致  
	                        field: 'confirmPassword',//指定控件name  
	                        message: '输入的内容不一致'  
	                    },  
	                    date: {//验证指定的日期格式  
	                        format: 'YYYY/MM/DD',  
	                        message: '日期格式不正确'  
	                    },  
	                    choice: {//check控件选择的数量  
	                        min: 2,  
	                        max: 4,  
	                        message: '必须选择2-4个选项'  
	                    }  
	                }  
	            }   */
	            paperName:{
	            	validators: {  
	                    notEmpty: {//检测非空,radio也可用  
	                        message: '名称不能为空'  
	                    }
	                }
	            },
	            passscore:{
	            	validators: {  
	                    notEmpty: {//检测非空,radio也可用  
	                        message: '及格分数不能为空'  
	                    }
	                }
	            },
	            score:{
	            	validators: {  
	                    notEmpty: {//检测非空,radio也可用  
	                        message: '总分无效'  
	                    }
	                }
	            },
	            kps:{
	            	validators: {  
	                    notEmpty: {//检测非空,radio也可用  
	                        message: '知识点不能为空'  
	                    }
	                }
	            },
	            time:{
	            	validators: {  
	                    notEmpty: {//检测非空,radio也可用  
	                        message: '时间不能为空'  
	                    }
	                }
	            }
	        }  
	    });
	</script>
</html>