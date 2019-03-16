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
<title>岗位列表</title>
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
							<input type="text" class="form-control form-control-sm" id="s_title"
								placeholder="输入岗位名称" value="${title}">
						</div>
						<div class="form-group">
							<input type="text" class="form-control form-control-sm" id="s_address"
								placeholder="输入岗位地址" value="${address}">
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
							<th width="150px">名称</th>
							<th width="100px">地址</th>
							<th width="120px">薪资范围</th>
							<th width="120px">学历</th>
							<th width="120px">工作经验</th>
							<th>发布日期</th>
							<th width="130px">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${positionList.size() > 0}">
							<c:forEach items="${positionList}" var="arr" varStatus="status">
							<tr class="<c:if test="${status.count % 2 == 0}">table-warning</c:if><c:if test="${status.count % 2 == 1}">table-info</c:if>">
								<td>${status.count}</td>
								<td title="${arr.description}">${arr.title}</td>
								<td>${arr.address}</td>
								<td>${arr.salary}</td>
								<td>${arr.degree}</td>
								<td>${arr.experience}</td>
								<td>${arr.publish_date.substring(0, 19)}</td>
								<td>
									<button onclick="showModel()" type="button" class="btn btn-success btn-sm">新增</button>
									<button onclick="delPosition('${arr.id}')" type="button" class="btn btn-danger btn-sm">删除</button>
								</td>
							</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				</div>
				<c:if test="${positionList.size() > 0}">
					<div class="col-md-12">
						<div class="jqueryPage float-right"></div>
					</div>
				</c:if>
				<c:if test="${positionList.size() <= 0}">
					<div class="col-md-12 text-center">
						暂无数据
					</div>
				</c:if>
			</div>
			
		</div>
	</div>
	<div id="myModal" class="modal fade bd-example-modal-lg" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" id="myModal-content">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-center" style="margin-top:15px;"><h3>岗位信息</h3></div>
						<div class="col-md-10 offset-1">
							<form>
								<div class="form-group">
									<label>名称</label> 
									<input type="text" class="form-control" id="title" placeholder="输入岗位名称">
								</div>
								<div class="form-group">
									<label>城市</label> 
									<input type="text" class="form-control" id="address" placeholder="输入岗位所在城市">
								</div>
								<div class="form-group">
									<label>薪资范围</label> 
									<input type="text" class="form-control" id="salary" placeholder="输入薪资范围">
								</div>
								<div class="form-group">
									<label>工作经验</label> 
									<input type="text" class="form-control" id="experience" placeholder="输入工作经验要求">
								</div>
								<div class="form-group">
									<label>学历要求</label> 
									<input type="text" class="form-control" id="degree" placeholder="输入学历要求">
								</div>
								<div class="form-group">
									<label>岗位介绍</label>
									<textarea class="form-control" id="description" rows="3" placeholder="输入企业介绍">${businessInfo.intoduce}</textarea>
								</div>
								<button type="submit" onclick="savePosition()" style="margin-bottom:10px;" class="btn btn-primary float-right">保存</button>
							</form>
						</div>
					</div>
				</div>
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
			var title = $("#s_title").val();
			var address = $("#s_address").val();
			var curPage = $("#curPage").val();
			window.location.href = "business/position-list?title="+title+"&address="+address+"&curPage="+curPage;
		}
		
		function delPosition(obj) {
			$.ajax({
				type: "POST",
				url: "business/position-delete",
				dataType:"text",
				data: {
					id: obj
				},
				success: function(data) {
					if (data == "SUC") {
						alert("删除成功！");
						window.location.href = "business/position-list";
					} else {
						alert("删除数据失败");
					}
				},
				error: function(err) {
					alert("系统异常，删除数据失败");
				}
				
			});
		}
		
		function showModel() {
			$('#myModal').modal('show');
		}
		
		function savePosition() {
			// 获得基础信息
			var title = $("#title").val();
			var address = $("#address").val();
			var salary = $("#salary").val();
			var experience = $("#experience").val();
			var degree = $("#degree").val();
			var description = $("#description").val();
			if (title==""||address==""||salary==""||experience==""||degree==""||description=="") {
				alert("请填写全部内容");
				return;
			}
			
			$.ajax({
				type: "POST",
				url: "business/position-save",
				dataType: "text",
				data: {
					title: title,
					address: address,
					salary: salary,
					experience: experience,
					degree: degree,
					description: description
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