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
			<li class="nav-item active"><a onclick="changeUrl('business/position-list')"
				class="nav-link pointer">招聘岗位维护</a></li>
			<li class="nav-item active"><a
				onclick="changeUrl('business/delivery-list')" class="nav-link pointer">求职信息维护</a>
			</li>
			<li class="nav-item active"><a
				onclick="changeUrl('admin/user-list')" class="nav-link pointer">历史信息查看</a>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0 text-white">
			<span onclick="showModel()">企业：【${businessInfo.login_name}】
			</span>&nbsp;&nbsp;&nbsp;&nbsp;<a class="pointer" onclick="signOut()">退出</a>
		</form>
	</div>
	</nav>
	<div class="container-fluid h90p">
		<div class="row h100p" class="height: 100%;">
			<iframe id="mainFrame" src="business/position-list" width="100%"
				height="100%" frameborder="0"></iframe>
		</div>
	</div>
	<nav class="navbar fixed-bottom navbar-light bg-light">
	<div class="text-center col-md-12">Copyright © 2019 招聘系统 rsms.com
		All Rights Reserved.</div>
	</nav>
	<div id="myModal" class="modal fade bd-example-modal-lg" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" id="myModal-content">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-center" style="margin-top:15px;"><h3>企业信息</h3></div>
						<input type="hidden" value="${businessInfo.id }" id="login_id"/>
						<div class="col-md-10 offset-1">
							<form>
								<div class="form-group">
									<label>名称</label> 
									<input type="text" class="form-control" id="login_name" value="${businessInfo.login_name}" placeholder="输入企业名称">
								</div>
								<div class="form-group">
									<label>城市</label> 
									<input type="text" class="form-control" id="city" value="${businessInfo.city}" placeholder="输入企业所在城市">
								</div>
								<div class="form-group">
									<label>薪资范围</label> 
									<input type="text" class="form-control" id="scale" value="${businessInfo.scale}" placeholder="输入企业薪资范围">
								</div>
								<div class="form-group">
									<label>网站主页</label> 
									<input type="text" class="form-control" id="website" value="${businessInfo.website}" placeholder="输入企业网站主页">
								</div>
								<div class="form-group">
									<label>企业介绍</label>
									<textarea class="form-control" id="intoduce" rows="3" placeholder="输入企业介绍">${businessInfo.intoduce}</textarea>
								</div>
								<button type="submit" onclick="saveBusiness()" style="margin-bottom:10px;" class="btn btn-primary float-right">保存</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function signOut() {
			if (window.confirm("是否要退出？")) {
				window.location.href = "business/login-out";
			}
		}

		function changeUrl(url) {
			$("#mainFrame").attr("src", url);
		}

		function showModel(obj) {
			$('#myModal').modal('show');
		}
		
		function saveBusiness() {
			// 获得基础信息
			var id = $("#login_id").val();
			var login_name = $("#login_name").val();
			var city = $("#city").val();
			var scale = $("#scale").val();
			var website = $("#website").val();
			var intoduce = $("#intoduce").val();
			if (id==""||login_name==""||city==""||scale==""||website==""||intoduce=="") {
				alert("请填写全部内容");
				return;
			}
			
			$.ajax({
				type: "POST",
				url: "business/business-save",
				dataType: "text",
				data: {
					id: id,
					login_name: login_name,
					city: city,
					scale: scale,
					website: website,
					intoduce: intoduce
				},
				success : function(data) {
					if (data == "SUC") {
						alert("保存成功");
					} else {
						alert("保存失败");
					}
				},
				error : function(res) {
					alert("获取数据失败，请重新操作！");
				}
				
			});
		}
	</script>
</body>
</html>