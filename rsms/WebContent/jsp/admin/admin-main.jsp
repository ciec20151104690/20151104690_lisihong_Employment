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
<title>管理员首页面</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 引入bootstrap -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<!-- 引入JQuery  bootstrap.js-->
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<style>
html {
	height: 100%;
}

body {
	height: 100%;
}

.h100p {
	height: 100%;
}

.h90p {
	height: 90%;
}

.bg-violet {
	background: #663399;
}

.pointer {
	cursor: pointer;
}

</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-violet">
	<div class="navbar-brand">求职招聘管理系统</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
		<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
			<li class="nav-item active"><a class="nav-link pointer">企业管理</a>
			</li>
			<li class="nav-item active"><a class="nav-link pointer">人员管理</a>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0 text-white">
			<span>管理员</span>&nbsp;&nbsp;&nbsp;&nbsp;<a class="pointer" onclick="signOut()">退出</a>
		</form>
	</div>
	</nav>
	<div class="container-fluid h90p">
		<div class="row h100p" class="height: 100%;">
			<iframe src="admin/business-list" width="100%" height="100%" frameborder="0"></iframe>
		</div>
	</div>
	<nav class="navbar fixed-bottom navbar-light bg-light">
	<div class="text-center col-md-12">Copyright © 2019 招聘系统 rsms.com All Rights Reserved.</div>
	</nav>
	<script type="text/javascript">
	function signOut() {
		if(window.confirm("是否要退出？")) {
			window.location.href = "admin/login-out";
		}
	}
    </script>
</body>
</html>