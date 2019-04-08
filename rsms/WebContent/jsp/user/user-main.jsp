<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户页面</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 引入bootstrap -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<!-- 引入JQuery  bootstrap.js-->
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

<script language='javascript' src='jquery/jquery.page.js'></script>

<style>
html {
	height: 100%;
}

body {
	height: 100%;
	background: #fafafa;
}

.item-background {
	background: #ffffff;
}

.height40px {
	height: 40px;
	line-height: 40px;
	width: 100%;
}

.carousel-inner img {
	width: 100%;
	height: 100%;
}

.carousel-item {
	width: 100%;
	height: 100%;
}

.carousel-inner {
	height: 364px;
}

.height400px {
	height: 400px;
}

.image-size {
	width: 20px;
	height: 20px;
}

/* page */
.jqueryPage {
	padding: 10px 20px;
	text-align: left;
	color: #ccc;
	text-align: center;
}

.jqueryPage a {
	display: inline-block;
	color: #428bca;
	display: inline-block;
	height: 25px;
	line-height: 25px;
	padding: 0 10px;
	border: 1px solid #ddd;
	margin: 0 2px;
	border-radius: 4px;
	vertical-align: middle;
}

.jqueryPage a:hover {
	text-decoration: none;
	border: 1px solid #428bca;
}

.jqueryPage span.current {
	display: inline-block;
	height: 25px;
	line-height: 25px;
	padding: 0 10px;
	margin: 0 2px;
	color: #fff;
	background-color: #428bca;
	border: 1px solid #428bca;
	border-radius: 4px;
	vertical-align: middle;
}

.jqueryPage span.disabled {
	display: inline-block;
	height: 25px;
	line-height: 25px;
	padding: 0 10px;
	margin: 0 2px;
	color: #bfbfbf;
	background: #f2f2f2;
	border: 1px solid #bfbfbf;
	border-radius: 4px;
	vertical-align: middle;
}

.b-top {
    border-top: 1px solid #CCC;
}

.b-bottom {
    border-bottom: 1px solid #CCC;
}

.b-left {
    border-left: 1px solid #CCC;
}

.b-right {
    border-right: 1px solid #CCC;
}

.clear {
    padding: 0 0;
    margin: 0 0;
    text-align: center;
}

.h60px {
    height: 60px;
    line-height: 60px;
}

.h120px {
    height: 120px;
    line-height: 120px;
}
</style>
</head>
<body>
	<%
		String pageNum = request.getAttribute("pageNum") == null ? "0" : request.getAttribute("pageNum").toString();
		String curPage = request.getAttribute("curPage") == null ? "0" : request.getAttribute("curPage").toString();
		String user_id = request.getAttribute("user_id") == null ? "0" : request.getAttribute("user_id").toString();
		String user_name = request.getAttribute("user_name") == null ? "0" : request.getAttribute("user_name").toString();
	%>
	<nav class="navbar sticky-top navbar-light bg-dark text-white">
	<div class="container-fluid height40px">
		<div class="row height40px">
			<div class="col-md-2">
				<span style="font-size: 20px;">招聘管理系统</span>
			</div>
			<div class="col-md-10 text-right">
				<c:if test="${user_id == '' || user_id == null}" >
					<span onclick="showLoginModel()">登录</span>
					&nbsp;|&nbsp;<span onclick="showRegistoryModel()">注册</span>
				</c:if>
				<c:if test="${user_id != '' && user_id != null}" >
					<span onclick="showLoginModel()">${user_name}</span>
				&nbsp;|&nbsp;<span onclick="showDeliveryModel()">申请记录</span>
				&nbsp;|&nbsp;<span onclick="showResumeModal()">个人简历</span>
				</c:if>
			</div>
		</div>
	</div>
	</nav>
	<div id="demo" class="carousel slide " data-ride="carousel">
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="image/lunbo2.jpg">
			</div>
			<div class="carousel-item">
				<img src="image/lunbo3.jpg">
			</div>
			<div class="carousel-item">
				<img src="image/lunbo1.jpeg">
			</div>
		</div>
		<a href="#demo" class="carousel-control-prev" data-slide="prev"> <span
			class="carousel-control-prev-icon"></span>
		</a> <a href="#demo" class="carousel-control-next" data-slide=next> <span
			class="carousel-control-next-icon"></span>
		</a>
	</div>
	<div class="container" style="margin-top: 10px;">
		<div class="row" style="border-bottom: 1px solid #CCCCCC;">
			<div class="text-dark" style="font-size: 24px; font-weight: bold;">
				<span>企业查看</span>
			</div>
		</div>
		<div class="row">
			<c:if test="${positionList.size() > 0}">
				<c:forEach items="${positionList}" var="arr" varStatus="status">
					<div class="col-md-3 height400px">
						<div class="col-md-12 item-background text-dark"
							style="height: 340px; margin-top: 20px;">
							<div class="row" style="padding-top: 10px;">
								<div class="col-md-12 text-info"
									style="padding-top: 15px; font-size: 24px; font-weight: bold;">${arr.title}</div>
								<div class="col-md-12" style="padding-top: 15px;">
									<img class="image-size" src="image/gongsi.png" />
									${arr.login_name}
								</div>
								<div class="col-md-6" style="padding-top: 15px;">
									<img class="image-size" src="image/city.png" /> ${arr.address}
								</div>
								<div class="col-md-6" style="padding-top: 15px;">
									<img class="image-size" src="image/xinshui.png" />
									${arr.salary}
								</div>
								<div class="col-md-12" style="padding-top: 15px;">
									<img class="image-size" src="image/xueli.png" /> ${arr.degree}
								</div>
								<div class="col-md-12" style="padding-top: 15px;">
									<img class="image-size" src="image/jingyan.png" />
									${arr.experience}
								</div>
								<div class="col-md-12" style="padding-top: 15px; float: left;">
									<div style="width: 10%; float: left;">
										<img class="image-size" src="image/wangzhan.png" />
									</div>
									<div title="${arr.website}"
										style="width: 85%; float: left; overflow: hidden;">${arr.website}</div>
								</div>
								<div class="col-md-12" style="padding-top: 20px;">
									<div class="row">
										<div class="col-md-6">
										<button
											onclick="alert('${arr.description}')"
											class="btn btn-danger btn-block">查看描述</button>
										</div>
										<div class="col-md-6">
										<button
											onclick="applyPosition('${arr.id}','${arr.business_id}')"
											class="btn btn-success btn-block">申请岗位</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${positionList.size() > 0}">
				<div class="col-md-12">
					<div class="jqueryPage float-right"></div>
				</div>
			</c:if>
			<c:if test="${positionList.size() <= 0}">
				<div class="col-md-12 text-center">暂无数据</div>
			</c:if>
		</div>
	</div>
	<nav class="navbar bg-dark text-white">
	<div class="text-center col-md-12">Copyright © 2019 招聘系统 rsms.com
		All Rights Reserved.</div>
	</nav>
	<div id="loginModel" class="modal fade bd-example-modal-lg" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" id="loginModel-content">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-center" style="margin-top:15px;"><h3>请登录</h3></div>
						<div class="col-md-10 offset-1">
							<form>
								<div class="form-group">
									<label>账号</label> 
									<input type="text" class="form-control" id="login_num" placeholder="输入账号">
								</div>
								<div class="form-group">
									<label>密码</label> 
									<input type="password" class="form-control" id="password" placeholder="输入密码">
								</div>
								<button type="button" onclick="userLogin()" style="margin-bottom:10px;" class="btn btn-primary float-right">登录</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="registerModel" class="modal fade bd-example-modal-lg" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" id="loginModel-content">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-center" style="margin-top:15px;"><h3>请注册</h3></div>
						<div class="col-md-10 offset-1">
							<form id="uploadForm" class="form-horizontal" enctype="multipart/form-data" method="POST">
								<div class="form-group">
									<label>账号</label> 
									<input type="text" class="form-control" id="r_login_num" placeholder="输入账号">
								</div>
								<div class="form-group">
									<label>用户名</label> 
									<input type="text" class="form-control" id="r_login_name" placeholder="输入姓名">
								</div>
								<div class="form-group">
									<label>密码</label> 
									<input type="password" class="form-control" id="r_password" placeholder="输入密码">
								</div>
								<div class="form-group">
									<label>性别</label><br/>
									<input type="radio" name="sex" id="sexNan" value="1" checked>
									<label>男</label>
									<input type="radio" name="sex" id="sexNv" value="2">
									<label>女</label>
								</div>
								<div class="form-group">
									<label>民族</label> 
									<input type="text" class="form-control" id="nation" placeholder="输入民族">
								</div>
								<div class="form-group">
									<label>籍贯</label> 
									<input type="text" class="form-control" id="native_place" placeholder="输入籍贯">
								</div>
								<div class="form-group">
									<label>生日</label> 
									<input type="text" class="form-control" id="birthday" placeholder="输入生日">
								</div>
								<div class="form-group">
									<label>婚姻</label><br/>
									<input type="radio" name="marial_status" id="marial_status1" value="1" checked>
									<label>未婚</label>
									<input type="radio" name="marial_status" id="marial_status2" value="2">
									<label>已婚</label>
								</div>
								<div class="form-group">
									<label>学历</label> 
									<input type="text" class="form-control" id="education" placeholder="输入学历">
								</div>
								<div class="form-group">
									<label>毕业院校</label> 
									<input type="text" class="form-control" id="university" placeholder="输入毕业院校">
								</div>
								<div class="form-group">
									<label>专业</label> 
									<input type="text" class="form-control" id="major" placeholder="输入专业">
								</div>
								<div class="form-group">
									<label>地址</label> 
									<input type="text" class="form-control" id="address" placeholder="输入地址">
								</div>
								<div class="form-group">
									<label>联系方式</label> 
									<input type="text" class="form-control" id="contack_num" placeholder="输入联系方式">
								</div>
								<div class="form-group">
									<label>邮箱</label> 
									<input type="text" class="form-control" id="email" placeholder="输入邮箱">
								</div>
								<div class="form-group">
									<label>学校经历</label>
									<textarea class="form-control" id="school_experience" rows="3" placeholder="输入学校经历"></textarea>
								</div>
								<div class="form-group">
									<label>工作经历</label>
									<textarea class="form-control" id="work_experience" rows="3" placeholder="输入工作经历"></textarea>
								</div>
								<div class="form-group">
									<label>个人介绍</label>
									<textarea class="form-control" id="self_evaluation" rows="3" placeholder="输入自我介绍"></textarea>
								</div>
								<div class="form-group">
									<input type="file" name="upload_file" id="upload_file" />
									<img id="uploadImg" width=80 height=60 src="" />
								</div>
								<input type="hidden" id="img" />
								<button type="button" onclick="userSave()" style="margin-bottom:10px;" class="btn btn-primary float-right">登录</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="resumeModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-lg">
    		<div class="modal-content" id="myModal-content">
      			<div class="container-fluid" style="margin: 15px 0;">
			        <div class="row clear">
			            <div class="col-md-12 clear">
			                <h1>简历</h1>
			            </div>
			            <div class="col-md-12 clear b-top" style="margin-top: 10px;">
			                <div class="row clear">
			                    <div class="col-md-9 clear">
			                        <div class="col-md-12 clear">
			                            <div class="row clear h60px b-bottom">
			                                <div class="col-md-2 clear b-left">姓名</div>
			                                <div id="re_login_name" class="col-md-4 clear b-left"></div>
			                                <div class="col-md-2 clear b-left">性别</div>
			                                <div id="re_sex" class="col-md-4 clear b-left b-right"></div>
			                            </div>
			                        </div>
			                        <div class="col-md-12 clear">
			                            <div class="row clear h60px b-bottom">
			                                <div class="col-md-2 clear b-left">生日</div>
			                                <div id="re_birthday" class="col-md-4 clear b-left"></div>
			                                <div class="col-md-2 clear b-left">民族</div>
			                                <div id="re_nation" class="col-md-4 clear b-left b-right"></div>
			                            </div>
			                        </div>
			                        <div class="col-md-12 clear">
			                            <div class="row clear h60px b-bottom">
			                                <div class="col-md-2 clear b-left">籍贯</div>
			                                <div id="re_native_place" class="col-md-4 clear b-left"></div>
			                                <div class="col-md-2 clear b-left">学历</div>
			                                <div id="re_education" class="col-md-4 clear b-left b-right"></div>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="col-md-3 clear b-right b-bottom">
			                        <img id="re_image" width="90%" height="180px" src="">
			                    </div>
			                </div>
			            </div>
			            <div class="col-md-12 clear">
			                <div class="row clear h60px b-bottom">
			                    <div class="col-md-2 clear b-left">毕业院校</div>
			                    <div id="re_university" class="col-md-4 clear b-left"></div>
			                    <div class="col-md-2 clear b-left">专业</div>
			                    <div id="re_major" class="col-md-4 clear b-left b-right"></div>
			                </div>
			            </div>
			            <div class="col-md-12 clear">
			                <div class="row clear h60px b-bottom">
			                    <div class="col-md-2 clear b-left">联系方式</div>
			                    <div id="re_contack_num" class="col-md-4 clear b-left"></div>
			                    <div class="col-md-2 clear b-left">地址</div>
			                    <div id="re_address" class="col-md-4 clear b-left b-right"></div>
			                </div>
			            </div>
			            <div class="col-md-12 clear">
			                <div class="row clear h60px b-bottom">
			                    <div class="col-md-2 clear b-left">婚姻状况</div>
			                    <div id="re_marital_status" class="col-md-4 clear b-left"></div>
			                    <div class="col-md-2 clear b-left">邮箱</div>
			                    <div id="re_email" class="col-md-4 clear b-left b-right"></div>
			                </div>
			            </div>
			            <div class="col-md-12 clear">
			                <div class="row clear h120px b-bottom">
			                    <div class="col-md-2 clear b-left">学校经历</div>
			                    <div id="re_school_experience" class="col-md-10 clear b-left b-right">已婚</div>
			                </div>
			            </div>
			            <div class="col-md-12 clear">
			                <div class="row clear h120px b-bottom">
			                    <div class="col-md-2 clear b-left">项目经历</div>
			                    <div id="re_work_experience" class="col-md-10 clear b-left b-right"></div>
			                </div>
			            </div>
			            <div class="col-md-12 clear">
			                <div class="row clear h60px b-bottom">
			                    <div class="col-md-2 clear b-left">个人评价</div>
			                    <div id="re_self_evaluation" class="col-md-10 clear b-left b-right"></div>
			                </div>
			            </div>
			        </div>
			    </div>
    		</div>
  		</div>
	</div>
	<div class="modal fade" id="deliveryModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<h5 class="modal-title">申请记录</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div id="deliveryModel-content" class="modal-body">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	<input type="hidden" value="${curPage}" id="curPage" />
	<input type="hidden" value="${user_id}" id="user_id"/>
	<script type="text/javascript">
		function applyPosition(pId, bId) {
			// 判断是否有人登录
			var userId = $("#user_id").val();
			if (userId == "") {
				alert("还未登录，请先登录");
				return;
			}
			$.ajax({
				type: "POST",
				url: "user/delivery-save",
				dataType: "text",
				data: {
					userId: userId,
					businessId: bId,
					positionId: pId
				},
				success: function(data) {
					if (data == "SUC") {
						alert("申请岗位成功");
					} else {
						alert("申请岗位失败，请重新操作");
					}
				},
				error: function() {
					alert("系统异常，请重新操作");
				}
			});
		}
		
		$(".jqueryPage").createPage({
			pageCount : <%=pageNum%>,
			current : <%=curPage%>,
			backFn : function(p) {
				$("#page").val(p);
				search();
			}
		});
		
		function search() {
			var curPage = $("#curPage").val();
			window.location.href = "user/main?curPage="+curPage;
		}
		
		function showLoginModel() {
			$('#loginModel').modal('show');
		}
		
		function showRegistoryModel() {
			$('#registerModel').modal('show');
		}
		
		function userLogin() {
			var loginNum = $("#login_num").val();
			var password = $("#password").val();
			if (loginNum == "" || password == "") {
				alert("用户名和密码不能为空");
				return;
			}
			// ajax登录
			$.ajax({
				type: "POST",
				url: "user/login-verify",
				dataType: "text",
				data: {
					login_num: loginNum,
					password: password
				},
				success: function(data) {
					if (data == "SUC") {
						search();
					} else {
						alert("用户名或密码不正确，请重新登录");
						showLoginModel();
					}
				},
				error: function() {
					alert("系统异常，请重新操作");
				}
			});
		}
		
		$("#upload_file").change(function() {
			var filePath = $("#upload_file").val();
			if (filePath == null || filePath == "") {
				alert("请选择上传文件");
			}
			var hz = filePath.substring(filePath.indexOf("."),
					filePath.length).toLowerCase();
			var imgHz = ".jpg.jpeg.bmp.gif.png";

			if (imgHz.indexOf(hz) > -1) {
				var formData = new FormData($("#uploadForm")[0]);
				$.ajax({
					type : "POST",
					url : "upload",
					data : formData,
					dataType : "text",
					async : false,
					cache : false,
					contentType : false,
					processData : false,
					error : function() {
						alert("上传失败");
					},
					success : function(data) {
						if (data == "ERROR") {
							alert("上传失败，请重新上传");
						} else {
							$("#img").val(data);
							$("#uploadImg").attr("src", "/upload/" + data);
						}
					}
				});
			} else {
				alert("请上传图片格式文件");
			}
		});
		
		function userSave() {
			var loginNum = $("#r_login_num").val();
			var loginName = $("#r_login_name").val();
			var password = $("#r_password").val();
			var sex = $('input[name="sex"]:checked').val();
			var nation = $("#nation").val();
			var nativePlace = $("#native_place").val();
			var birthday = $("#birthday").val();
			var marialStatus = $('input[name="marial_status"]:checked').val();
			var education = $("#education").val();
			var university = $("#university").val();
			var major = $("#major").val();
			var address = $("#address").val();
			var contackNum = $("#contack_num").val();
			var email = $("#email").val();
			var schoolExperience = $("#school_experience").val();
			var workExperience = $("#work_experience").val();
			var selfEvaluation = $("#self_evaluation").val();
			var image = $("#img").val();
			
			$.ajax({
				type: "POST",
				url: "user/save",
				dataType:"text",
				data: {
					loginNum: loginNum,
					loginName: loginName,
					password: password,
					sex: sex,
					nation: nation,
					nativePlace: nativePlace,
					marialStatus: marialStatus,
					birthday: birthday,
					education: education,
					university: university,
					major: major,
					address: address,
					contackNum: contackNum,
					email: email,
					schoolExperience: schoolExperience,
					workExperience: workExperience,
					selfEvaluation: selfEvaluation,
					image: image
				},
				success: function(data) {
					if (data == "SUC") {
						alert("注册成功！");
						$('#registerModel').modal('hide');
						
					} else {
						alert("注册失败");
					}
				},
				error: function(err) {
					alert("系统异常，删除数据失败");
				}
			});
		}
		
		function showResumeModal() {
			var userId = $("#user_id").val();
			//通过ajax保存
			$.ajax({
				url : "user/user-detail",
				type : "POST",
				dataType : "text",
				data : {
					id : userId
				},
				success : function(data) {
					var obj = eval("("+data+")"); 
					// 获得数据json，并解析
					$("#re_login_name").html(obj.login_name);
					$("#re_sex").html(obj.sex == 1 ? "男" : "女");
					$("#re_birthday").html(obj.birthday);
					$("#re_nation").html(obj.nation);
					$("#re_native_place").html(obj.native_place);
					$("#re_education").html(obj.education);
					$("#re_image").attr("src", "/upload/" + obj.image);
					$("#re_university").html(obj.university);
					$("#re_major").html(obj.major);
					$("#re_contack_num").html(obj.contack_num);
					$("#re_address").html(obj.address);
					$("#re_marital_status").html(obj.marital_status == 1 ? "未婚" : "已婚");
					$("#re_email").html(obj.email);
					$("#re_school_experience").html(obj.school_experience);
					$("#re_work_experience").html(obj.work_experience);
					$("#re_self_evaluation").html(obj.self_evaluation);
					
					$('#resumeModal').modal('show');
				},
				error : function(res) {
					alert("获取数据失败，请重新操作！");
				}
			});
		}
		
		function showDeliveryModel() {
			// 判断是否有人登录
			var userId = $("#user_id").val();
			if (userId == "") {
				alert("还未登录，请先登录");
				return;
			}
			//通过ajax保存
			$.ajax({
				url : "user/delivery-all-list",
				type : "POST",
				dataType : "text",
				data : {
					id : userId
				},
				success : function(data) {
					var obj = eval("("+data+")"); 
					// 获得数据json，并解析
					var htmlStr = "<table class='table'>"
					+ "<thead><tr>"
					+ "<th scope='col'>序号</th>"
					+ "<th scope='col'>公司</th>"
					+ "<th scope='col'>岗位</th>"
					+ "<th scope='col'>工作地</th>"
					+ "<th scope='col'>薪资</th>"
					+ "<th scope='col'>申请日期</th>"
					+ "<th scope='col'>状态</th></tr></thead>"
				    
					for(var key in obj){
						var values = obj[key]; 
						htmlStr +="<tr><td>"+key+"</td>"
							+"<td>"+values.login_name+"</td>"
                            +"<td>"+values.title+"</td>"
                            +"<td>"+values.address+"</td>"
                            +"<td>"+values.salary+"</td>"
                            +"<td>"+values.delivery_date.substring(0, 19)+"</td>"
                            +"<td>"+convert(values.status)+"</td></tr>";
                        
                    };
					htmlStr += "</table>";
					$("#deliveryModel-content").html(htmlStr);
					
					$('#deliveryModel').modal('show');
				},
				error : function(res) {
					alert("获取数据失败，请重新操作！");
				}
			});
			
		}
		
		function convert(obj) {
			if (obj == 0) {
				return "审核中";
			}
			if (obj == 1) {
				return "通过";
			}
			if (obj == 2) {
				return "未通过";
			}
		}
	</script>
</body>
</html>