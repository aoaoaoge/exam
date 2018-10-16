<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
   		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>试题管理</title>
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=request.getContextPath() %>/img/favicon.ico" />
		<link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/jsp/css/style.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/bootstrap/css/bootstrapValidator.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/jsp/css/question-add.css" rel="stylesheet">
		<style type="text/css">
			.uploadify-button-text{
				text-decoration: underline;
			}
			
			span.add-img{
				text-decoration: underline;
				cursor:pointer;
			}
			
			span.add-img:hover{
				text-decoration: underline;
			}
			
			.swfupload {
   				z-index: 10000 !important;
			}
			
			.add-content-img{
				display:block;
			}
			
			.diaplay-img{
				margin-right:5px;
			}
			
			.diaplay-img:hover{
				text-decoration: underline;
				
			}
			.form-question-opt a{
				cursor: pointer;
				color: red;
				padding-left: 5px;
				text-decoration: none;
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
							<a href="#"><i class="fa fa-home"></i>网站首页</a>
						</li>
						<li  class="active">
							<a href="<%=request.getContextPath() %>/jsp/admin/question-list.jsp">试题管理</a>
						</li>

						<li>
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
								<a href="<%=request.getContextPath() %>/jsp/admin/question-list.jsp"> <i class="fa fa-list-ul"></i> 试题管理 </a>

							</li>
							<li class="active">
								<a> <i class="fa fa-pencil-square-o"></i> 添加试题 </a>

							</li>
							<li>
								<a href="<%=request.getContextPath() %>/jsp/admin/question-import.jsp"> <i class="fa fa-cloud-upload"></i> 导入试题 </a>

							</li>

						</ul>

					</div>
					<div class="col-xs-9">
						<div class="page-header">
							<h1><i class="fa fa-pencil-square-o"></i> 添加试题 </h1>
							<span class="result" style="color: red">
								${requestScope.res }
							</span>
						</div>
						<div class="page-content row">
							<form id="question-add-form" style="margin-top:20px" method="post" action="question/addQuestion">
								<div class="form-line question-type" id="question-type">
									<span class="form-label"><span class="warning-label">*</span>试题类型：</span>
									<select name="qtype" id="question-type-select" class="df-input-narrow">

										<option value="1">单选题</option>

										<option value="2">多选题</option>

										<option value="3">判断题</option>

										<option value="4">填空题</option>

										<option value="5">简答题</option>

										<option value="6">论述题</option>

										<option value="7">分析题</option>

									</select><span class="form-message"></span>
								</div>
								<div class="form-line question-knowledge">
									<span class="form-label"><span class="warning-label">*</span>题库及知识点：</span>
									<div>
										<div class="clearfix">
											<div id="aq-course1" style="padding:0px;float:left; width:48%;">
												<select id="field-select" class="df-input-narrow" size="4" style="width:100%;">
													
												</select>
											</div>
											<div id="aq-course2" style="padding:0px; float:right;width:48%;">
												<select id="point-from-select" class="df-input-narrow" size="4"  style="width:100%;">
													
												</select>
											</div>
										</div>
										
										<div style="text-align:center;margin:10px 0;">
											<a id="add-point-btn" class="btn btn-primary btn-xs" data-toggle="modal">选择知识点</a>
											<a id="del-point-btn" class="btn btn-danger btn-xs">删除知识点</a>
											<a id="remove-all-point-btn" class="btn btn-warning btn-xs">清除列表</a>
										</div>
										<div  id="kn-selected" style="padding-left:0px;text-align:center;margin-bottom:20px;">
												<select name="kps" id="point-to-select" class="df-input-narrow" multiple="multiple" size="4"  style="width:80%;">
													
												</select>
												<p style="font-size:12px;color:#AAA;">您可以从上面选择4个知识点</p>
										</div>
									</div>
									<span class="form-message"></span>
								</div>
								
								<div class="form-line question-content">
									<span class="form-label"><span class="warning-label">*</span>试题内容：</span>
									<textarea name="question_content" class="add-question-ta"></textarea>									
									<span class="add-img add-content-img" style="width:100px;" data-toggle="modal" data-target="#myModal">添加图片</span>
									<span class="form-message"></span>
								</div>
								<div class="form-line form-question-opt" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>选项：</span>
									<div class="add-opt-items">
										<span class="add-opt-item"><label class="que-opt-no">A</label>
											<input name="option_content" type="text" class="df-input-narrow form-question-opt-item">
											<span class="add-img add-opt-img f" data-toggle="modal" data-target="#myModal">添加图片</span>
										</span>
										<span class="add-opt-item"><label class="que-opt-no">B</label>
											<input name="option_content" type="text" class="df-input-narrow form-question-opt-item">
											<span class="add-img add-opt-img s" data-toggle="modal" data-target="#myModal">添加图片</span>
										</span>
										<span class="add-opt-item"><label class="que-opt-no">C</label>
											<input name="option_content" type="text" class="df-input-narrow form-question-opt-item">
											<span class="add-img add-opt-img" data-toggle="modal" data-target="#myModal">添加图片</span> <a id='delChose'><i class="glyphicon glyphicon-minus"></i>删除此选项</a>
										</span>
										<span class="add-opt-item"><label class="que-opt-no">D</label>
											<input name="option_content" type="text" class="df-input-narrow form-question-opt-item">
											<span class="add-img add-opt-img" data-toggle="modal" data-target="#myModal">添加图片</span> <a id='delChose'><i class="glyphicon glyphicon-minus"></i>删除此选项</a>
										</span>
									</div>
									<a id="question-add-opt"><i class="glyphicon glyphicon-plus"></i>增加选项</a>
									<br>
									<span class="form-message"></span>
								</div>
								<div class="form-line form-question-answer1 correct-answer" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>正确答案：</span>
									<select name="right_answer" class="df-input-narrow right_answer">
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
									</select>
								</div>
								<!-- 多选题 -->
								<div class="form-line form-question-answer-muti correct-answer" style="display: none;">
									<span class="form-label"><span class="warning-label">*</span>正确答案：</span>

									<span class="muti-opt-item">
										<input type="checkbox" value="A">
										<label class="que-opt-no">A</label>
										<br>
									</span>
									<span class="muti-opt-item">
										<input type="checkbox" value="B">
										<label class="que-opt-no">B</label>
										<br>
									</span>
									<span class="muti-opt-item">
										<input type="checkbox" value="C">
										<label class="que-opt-no">C</label>
										<br>
									</span>
									<span class="muti-opt-item">
										<input type="checkbox" value="D">
										<label class="que-opt-no">D</label>
										<br>
									</span>
								</div>
								<!-- 判断题 -->
								<div class="form-line form-question-answer-boolean correct-answer" style="display: none;">
									<span class="form-label"><span class="warning-label">*</span>正确答案：</span>
									<select class="df-input-narrow">
										<option value="T">正确</option>
										<option value="F">错误</option>
									</select><span class="form-message"></span>
								</div>
								<!-- 大题 -->
								<div class="form-line correct-answer form-question-answer-text" style="display: none;">
									<span class="form-label form-question-answer-more"><span class="warning-label">*</span>参考答案：</span>
									<textarea class="add-question-ta"></textarea>									<span class="form-message"></span>
									<br>

								</div>
								<div class="form-line form-question-reference" style="display: block;">
									<span class="form-label"><span class="warning-label"></span>来源：</span>
										<input type="text" name="source" class="df-input-narrow"><span class="form-message"></span>
									<br>
								</div>
								<div class="form-line form-question-examingpoint" style="display: block;">
									<span class="form-label"><span class="warning-label"></span>考点：</span>
										<input type="text" name="exam_point" class="df-input-narrow"><span class="form-message"></span>
									<br>
								</div>
								<div class="form-line form-question-keyword" style="display: block;">
									<span class="form-label"><span class="warning-label"></span>关键字：</span>
										<input type="text" name="keyword" class="df-input-narrow"><span class="form-message"></span>
									<br>
								</div>
								<div class="form-line form-question-analysis" style="display: block;">
									<span class="form-label"><span class="warning-label"></span>题目解析：</span>
									<textarea class="add-question-ta" name="analysis" ></textarea><span class="form-message"></span>
									<br>

								</div>

								<div class="form-line">
									<input id="btn-save" value="保存" type="submit" class="df-submit">
								</div>
							</form>

						</div>
						
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
						
						
						<div class="modal fade" id="myModal">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						        <h4 class="modal-title">图片上传</h4>
						      </div>
						      <div class="modal-body">
						        <div id="add-question-img-dialog" title="图片上传">
									 <form>
										<div class="form-line img-destination">
											<span class="form-label">添加至：</span>
											<label></label>
											<input name="img-position" type="hidden" value=""/>
										</div>
										<div class="form-line add-update-quetstionfile">
											<span class="form-label">上传图片：</span>
											<div id="div-file-list">
												<input name="imgUrl" type="file">
											</div>
											<div class="form-line" id="uploadify"></div>
											<span class="form-message">请上传png、jpg图片文件。</span>
										</div>
									</form> 
								</div>
						      </div>
						      
						    </div><!-- /.modal-content -->
						  </div><!-- /.modal-dialog -->
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
			
			option = 68;
			//增加选项
			$("#question-add-opt").click(function(){
				//判断答案数量,并提示
				if(option == 70){
					$(".form-question-opt .form-message").text("选项不能超过六个!");
					return;
				}
				//增加选项
				$(".add-opt-items").append("<span class='add-opt-item'><label class='que-opt-no'>"+String.fromCharCode((++option))+"</label>"+
												"<input type='text' class='df-input-narrow form-question-opt-item'>"+
												"<span class='add-img add-opt-img' data-toggle='modal' data-target='#myModal'>添加图片</span><a id='delChose'><i class='glyphicon glyphicon-minus'></i>删除此选项</a>"+
											"</span>");
				//正确选项下拉框加载
				showOption();
			});
			//删除选项
			$(".add-opt-items").on("click","#delChose",function(){
				//$(this).parent("span").remove();
				//清除提示
				$(".form-question-opt .form-message").text("");
				//清除当前选项重新加载
				$(".add-opt-items>span:gt(1)").remove();
				option--;
				for(var i = 67;i<=option;i++){
					$(".add-opt-items").append("<span class='add-opt-item'><label class='que-opt-no'>"+String.fromCharCode((i))+"</label>"+
												"<input type='text' name='option_content' class='df-input-narrow form-question-opt-item'>"+
												"<span class='add-img add-opt-img' data-toggle='modal' data-target='#myModal'>添加图片</span><a id='delChose'><i class='glyphicon glyphicon-minus'></i>删除此选项</a>"+
											"</span>");
				}
				//正确选项下拉框加载
				showOption();
			});
			
			//正确答案选项下拉框选项显示
			var showOption = function(){
				$(".right_answer").empty();
				for(var i = 65;i<=option;i++){
					$(".right_answer").append("<option value="+String.fromCharCode((i))+">"+String.fromCharCode((i))+"</option>");
				}
			};
			
			//
			$(".add-img").click(function(){
				
			});
		});
		
		//表单验证
		 $("#question-add-form").bootstrapValidator({  
	        live: 'disabled',//验证时机，enabled是内容有变化就验证（默认），disabled和submitted是提交再验证  
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
	            question_content:{
	            	validators: {  
	                    notEmpty: {//检测非空,radio也可用  
	                        message: '题目不能为空'  
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
	            option_content:{
	            	validators: {  
	                    notEmpty: {//检测非空,radio也可用  
	                        message: '答案不能为空'  
	                    }
	                }
	            }
	        }  
	    });  
	</script>
</html>