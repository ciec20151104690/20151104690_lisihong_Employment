<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>管理员登录页面</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 引入bootstrap -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<!-- 引入JQuery  bootstrap.js-->
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<style>
.carousel-inner img {
	width: 100%;
	height: 100%;
}

.carousel-item {
	width: 100%;
	height: 100%;
}

.jumbotron {
	margin-top: 10px;
	margin-bottom: 0px;
	padding-top: 10px;
}

#demo {
	width: 100%;
	height: 264px;
}

.row {
	height: 264px;
}

.left {
	float: left;
	width: 70%;
}

.right {
	float: left;
	width: 30%;
}

.card {
	height: 264px;
}

.carousel-inner {
	height: 264px;
}

.footer {
	position: absolute;
	bottom: 0;
	height: 80px;
	width: 65%;
}

.jumheight1 {
	height: 140px;
}

.end_name {
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<div>
		<div class="jumbotron text-primary bg-light jumheight1">
			<h1>招聘管理系统</h1>
			<p>一个关于招聘的系统</p>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="left">
					<div id="demo" class="carousel slide " data-ride="carousel">
						<ul class="carousel-indicators">
							<li data-target="#demo" data-slide-to="0" class="active"></li>
							<li data-target="#demo" data-slide-to="1"></li>
							<li data-target="#demo" data-slide-to="2"></li>
						</ul>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="image/lunbo1.jpeg">
							</div>
							<div class="carousel-item">
								<img src="image/lunbo2.jpg">
							</div>
							<div class="carousel-item">
								<img src="image/lunbo3.jpg">
							</div>
						</div>
						<a href="#demo" class="carousel-control-prev" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</a> <a href="#demo" class="carousel-control-next" data-slide=next>
							<span class="carousel-control-next-icon"></span>
						</a>
					</div>
				</div>
				<div class="right">
					<div class="card">
						<div class="card-header">用户登陆</div>
						<div class="card-body">
							<form>
								<table
									style="border-collapse: separate; border-spacing: 0px 10px;">
									<tr>
										<td class="margin-top:10"><label>用户名：</label></td>
										<td><input type="text" id="loginId" class=""></td>
									</tr>
									<tr>
										<td><label for="pwd">密码:</label></td>
										<td><input type="password" id="password"></td>
									</tr>
								</table>
								<div class="footer text-right">
									<button onclick="login()" type="button" class="btn btn-primary">登陆</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function login() {
			// 获得用户名和密码
			var loginId = $("#loginId").val();
			var password = $("#password").val();
			if (loginId == "" || password == "") {
				alert("用户名和密码不能为空");
				return;
			}
			// ajax调用后台
			$.ajax({
				type : 'POST',
				url : "admin/login-verify",
				dataType : "text",
				data : {
					loginId : loginId,
					password : password
				},
				success : function(data) {
					if (data == "SUCCESS") {
						window.location.href = "www.baidu.com";
					} else {
						$("#password").val("");
						alert(data);
					}
				},
				error : function(jqXHR) {
					alert("系统异常，登录失败");
				}

			});
		}
	</script>
</body>
</html>