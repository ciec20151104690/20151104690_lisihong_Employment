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
<title>企业列表</title>
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
}

.h100p {
	height: 100%;
}

.clear {
	padding: 0 0;
	margin: 0 0;
}

.search-border {
	border-right: 1px solid #CCC;
	margin-top: 15px;
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

.div-overflow {
	 text-overflow: ellipsis;  
    -moz-text-overflow: ellipsis;  
    overflow: hidden;  
    white-space: nowrap;  
}
</style>
</head>
<body>
	<%
		String pageNum = request.getAttribute("pageNum") == null ? "0" : request.getAttribute("pageNum").toString();
		String curPage = request.getAttribute("curPage") == null ? "0" : request.getAttribute("curPage").toString();
	%>
	<div class="container-fluid h100p">
		<div class="row h100p">
			<div class="col-md-2 search-border">
				<div>
					<form>
						<div class="form-group">
							<input type="text" class="form-control form-control-sm" id="name"
								placeholder="输入企业名称" value="${name}">
						</div>
						<div class="form-group">
							<input type="text" class="form-control form-control-sm" id="city"
								placeholder="输入所属城市" value="${city}">
						</div>
						<div class="form-group">
							<button onclick="search()" type="button" class="btn btn-success btn-block">查询</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-md-10 clear bg-active">
				<div class="col-md-12">
				<table class="table">
					<thead class="thead">
						<tr>
							<th width="20px"></th>
							<th width="150px">账号</th>
							<th width="150px">名称</th>
							<th width="150px">城市</th>
							<th width="150px">薪资</th>
							<th>网址</th>
							<th width="80px">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${businessList.size() > 0}">
							<c:forEach items="${businessList}" var="arr" varStatus="status">
							<tr class="<c:if test="${status.count % 2 == 0}">table-warning</c:if><c:if test="${status.count % 2 == 1}">table-info</c:if>">
								<td>${status.count}</td>
								<td>${arr.login_num}</td>
								<td title="${arr.intoduce}">${arr.login_name}</td>
								<td>${arr.city}</td>
								<td>${arr.scale}</td>
								<td><a href="${arr.website}">${arr.website}</a></td>
								<td><button type="button" class="btn btn-danger btn-sm">删除</button></td>
							</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				</div>
				<c:if test="${businessList.size() > 0}">
					<div class="col-md-12">
						<div class="jqueryPage float-right"></div>
					</div>
				</c:if>
				<c:if test="${businessList.size() <= 0}">
					<div class="col-md-12 text-center">
						暂无数据
					</div>
				</c:if>
			</div>
			
		</div>
	</div>
	<input type="hidden" value="${curPage}" id="curPage" />
	<script type="text/javascript">
		$(".jqueryPage").createPage({
			pageCount : <%=pageNum%>,
			current : <%=curPage%>,
			backFn : function(p) {
				$("#page").val(p);
				search();
			}
		});
		
		function search() {
			var name = $("#name").val();
			var city = $("#city").val();
			var curPage = $("#curPage").val();
			window.location.href = "admin/business-list?name="+name+"&city="+city+"&curPage="+curPage;
		}
	</script>
</body>
</html>