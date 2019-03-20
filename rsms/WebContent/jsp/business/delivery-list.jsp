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
	%>
	<div class="container-fluid h100p">
		<div class="row h100p">
			<div class="col-md-2 search-border">
				<div>
					<form>
						<div class="form-group">
							<input type="text" class="form-control form-control-sm" id="user_name"
								placeholder="输入求职人姓名" value="${userName}">
						</div>
						<div class="form-group">
							<input type="text" class="form-control form-control-sm" id="position_name"
								placeholder="输入岗位名称" value="${positionName}">
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
							<th width="100px">名称</th>
							<th width="100px">学历</th>
							<th width="120px">联系方式</th>
							<th>毕业院校</th>
							<th width="120px">岗位</th>
							<th width="120px">岗位地址</th>
							<th width="200px">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${deliveryList.size() > 0}">
							<c:forEach items="${deliveryList}" var="arr" varStatus="status">
							<tr class="<c:if test="${status.count % 2 == 0}">table-warning</c:if><c:if test="${status.count % 2 == 1}">table-info</c:if>">
								<td>${status.count}</td>
								<td>${arr.login_name}</td>
								<td>${arr.education}</td>
								<td>${arr.contack_num}</td>
								<td>${arr.university}</td>
								<td>${arr.title}</td>
								<td>${arr.address}</td>
								<td>
									<button onclick="changeStatus('${arr.id}', 1)" type="button" class="btn btn-success btn-sm">通过</button>
									<button onclick="changeStatus('${arr.id}', 2)" type="button" class="btn btn-danger btn-sm">拒绝</button>
									<button onclick="showModel('${arr.user_id}')" type="button" class="btn btn-info btn-sm">简历</button>
								</td>
							</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				</div>
				<c:if test="${deliveryList.size() > 0}">
					<div class="col-md-12">
						<div class="jqueryPage float-right"></div>
					</div>
				</c:if>
				<c:if test="${deliveryList.size() <= 0}">
					<div class="col-md-12 text-center">
						暂无数据
					</div>
				</c:if>
			</div>
			
		</div>
	</div>
	<div id="myModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
			                                <div id="login_name" class="col-md-4 clear b-left"></div>
			                                <div class="col-md-2 clear b-left">性别</div>
			                                <div id="sex" class="col-md-4 clear b-left b-right"></div>
			                            </div>
			                        </div>
			                        <div class="col-md-12 clear">
			                            <div class="row clear h60px b-bottom">
			                                <div class="col-md-2 clear b-left">生日</div>
			                                <div id="birthday" class="col-md-4 clear b-left"></div>
			                                <div class="col-md-2 clear b-left">民族</div>
			                                <div id="nation" class="col-md-4 clear b-left b-right"></div>
			                            </div>
			                        </div>
			                        <div class="col-md-12 clear">
			                            <div class="row clear h60px b-bottom">
			                                <div class="col-md-2 clear b-left">籍贯</div>
			                                <div id="native_place" class="col-md-4 clear b-left"></div>
			                                <div class="col-md-2 clear b-left">学历</div>
			                                <div id="education" class="col-md-4 clear b-left b-right"></div>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="col-md-3 clear b-right b-bottom">
			                        <img id="image" width="90%" height="180px" src="">
			                    </div>
			                </div>
			            </div>
			            <div class="col-md-12 clear">
			                <div class="row clear h60px b-bottom">
			                    <div class="col-md-2 clear b-left">毕业院校</div>
			                    <div id="m-university" class="col-md-4 clear b-left"></div>
			                    <div class="col-md-2 clear b-left">专业</div>
			                    <div id="major" class="col-md-4 clear b-left b-right"></div>
			                </div>
			            </div>
			            <div class="col-md-12 clear">
			                <div class="row clear h60px b-bottom">
			                    <div class="col-md-2 clear b-left">联系方式</div>
			                    <div id="contack_num" class="col-md-4 clear b-left"></div>
			                    <div class="col-md-2 clear b-left">地址</div>
			                    <div id="address" class="col-md-4 clear b-left b-right"></div>
			                </div>
			            </div>
			            <div class="col-md-12 clear">
			                <div class="row clear h60px b-bottom">
			                    <div class="col-md-2 clear b-left">婚姻状况</div>
			                    <div id="marital_status" class="col-md-4 clear b-left"></div>
			                    <div class="col-md-2 clear b-left">邮箱</div>
			                    <div id="email" class="col-md-4 clear b-left b-right"></div>
			                </div>
			            </div>
			            <div class="col-md-12 clear">
			                <div class="row clear h120px b-bottom">
			                    <div class="col-md-2 clear b-left">学校经历</div>
			                    <div id="school_experience" class="col-md-10 clear b-left b-right">已婚</div>
			                </div>
			            </div>
			            <div class="col-md-12 clear">
			                <div class="row clear h120px b-bottom">
			                    <div class="col-md-2 clear b-left">项目经历</div>
			                    <div id="work_experience" class="col-md-10 clear b-left b-right"></div>
			                </div>
			            </div>
			            <div class="col-md-12 clear">
			                <div class="row clear h60px b-bottom">
			                    <div class="col-md-2 clear b-left">个人评价</div>
			                    <div id="self_evaluation" class="col-md-10 clear b-left b-right"></div>
			                </div>
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
			var user_name = $("#user_name").val();
			var position_name = $("#position_name").val();
			var curPage = $("#curPage").val();
			window.location.href = "business/delivery-list?userName="+user_name+"&positionName="+position_name+"&curPage="+curPage;
		}
		
		function showModel(obj) {
			//通过ajax保存
			$.ajax({
				url : "business/user-detail",
				type : "POST",
				dataType : "text",
				data : {
					id : obj
				},
				success : function(data) {
					var obj = eval("("+data+")"); 
					// 获得数据json，并解析
					$("#login_name").html(obj.login_name);
					$("#sex").html(obj.sex == 1 ? "男" : "女");
					$("#birthday").html(obj.birthday);
					$("#nation").html(obj.nation);
					$("#native_place").html(obj.native_place);
					$("#education").html(obj.education);
					$("#image").attr("src", "/upload/" + obj.image);
					$("#m-university").html(obj.university);
					$("#major").html(obj.major);
					$("#contack_num").html(obj.contack_num);
					$("#address").html(obj.address);
					$("#marital_status").html(obj.marital_status == 1 ? "未婚" : "已婚");
					$("#email").html(obj.email);
					$("#school_experience").html(obj.school_experience);
					$("#work_experience").html(obj.work_experience);
					$("#self_evaluation").html(obj.self_evaluation);
					
					$('#myModal').modal('show');
				},
				error : function(res) {
					alert("获取数据失败，请重新操作！");
				}
			});
			
		}
		
		function changeStatus(obj, status) {
			$.ajax({
				type: "POST",
				url: "business/delivery-change",
				dataType: "text",
				data: {
					id: obj,
					status: status
				},
				success: function(data) {
					if (data == "SUC") {
						alert("操作成功！");
						search();
					} else {
						alert("操作失败");
					}
				},
				error: function(err) {
					alert("系统异常，删除数据失败");
				}
			});
		}
		
	</script>
</body>
</html>