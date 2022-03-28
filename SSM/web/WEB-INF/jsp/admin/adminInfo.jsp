<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<%@ taglib prefix="gdkmtool" uri="http://gdkm.edu/common/"%>--%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>后台个人信息</title>
	<!-- 引入css样式文件 -->
	<!-- Bootstrap Core CSS -->
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
	<!-- MetisMenu CSS -->
	<link href="${pageContext.request.contextPath}/css/metisMenu.min.css" rel="stylesheet" />
	<!-- DataTables CSS -->
	<link href="${pageContext.request.contextPath}/css/dataTables.bootstrap.css" rel="stylesheet" />
	<!-- Admin CSS -->
	<link href="${pageContext.request.contextPath}/css/sb-admin-2.css" rel="stylesheet" />
	<!-- Admin Fonts -->
	<link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/boot-crm.css" rel="stylesheet" type="text/css" />
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<!-- Metis Menu Plugin JavaScript -->
	<script src="${pageContext.request.contextPath}/js/metisMenu.min.js"></script>
	<!-- DataTables JavaScript -->
	<script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/dataTables.bootstrap.min.js"></script>
	<!-- Admin Theme JavaScript -->
	<script src="${pageContext.request.contextPath}/js/sb-admin-2.js"></script>
	<!-- Validate JavaScript -->
	<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.validate.messages_cn.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>	
</head>
<body>
<div id="wrapper">
    <!-- 导航栏部分  start-->
    <%@ include file="nav.jsp" %>
    <!-- 导航栏部分 end -->    
    <!-- 用户信息部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">后台个人信息</h1>
			</div>
		</div>
		<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#editPasswordDialog" onclick="">修改密码</a>
		<div class="row">
			<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<form id="info_form1"
						  class="form-inline"
						  method="post"
						  action="${pageContext.request.contextPath}/admin/admin/updAdmin" >
						<input type="hidden" value="${sessionScope.ADMIN_SESSION.adminId}" name="adminId"/>
						<div class="col-sm-10">
							<label >登录账号：</label> 
							<span>${sessionScope.ADMIN_SESSION.account}</span>
						</div>
						<div class="col-sm-10">
							<label >用户姓名：</label> 
							<input type="text" class="form-control" id="username"  name="username" value="${sessionScope.ADMIN_SESSION.username}" />
						</div>																
						<div class="col-sm-10">
							<label for="email">电子邮件：</label>
							<input type="text" class="form-control" id="email"  name="email" value="${sessionScope.ADMIN_SESSION.email}" />
						</div>						
						<div class="col-sm-10">
							<label for="start">登陆状态：</label>
							<span id="start">
								<c:if test="${sessionScope.ADMIN_SESSION.status.equals('0')}">
									禁用
								</c:if>
								<c:if test="${sessionScope.ADMIN_SESSION.status.equals('1')}">
									正常
								</c:if>
							</span>
						</div>
						<div class="col-sm-10">
							<br><button type="button" class="btn btn-primary" onclick="updateAdmin()" >提交修改</button>
						</div>						
					</form>
				</div>
			</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 用户信息部分  end-->
</div>

<!-- 修改个人密码模态框 -->
<div class="modal fade" id="editPasswordDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改密码</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="editPassword_form">
					<div class="form-group">
						<label for="oldPassword" class="col-sm-2 control-label">旧密码</label>
						<div class="col-sm-10">				
							<input type="password" class="form-control" placeholder="输入旧密码" id="oldPassword" name="oldPassword" />
						</div>						
					</div>
					<div class="form-group">
						<label for="newPassword" class="col-sm-2 control-label">新密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" placeholder="输入新密码" id="newPassword" name="password" />
						</div>
					</div>
					<div class="form-group">
						<label for="newPassword2" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" placeholder="确认新密码" id="newPassword2" />
						</div>
					</div>					
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updPassword()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function () {
		<c:if test="${sessionScope.error!=null}">
		setTimeout(function () {
			alert("${sessionScope.error}");
		},1000);

		<c:remove var="error" scope="session"/>
		</c:if>
	})
//修改当前用户信息
function updateAdmin(){
	var bl=true;
  $.each($("#info_form1 input"),function () {
	  $(this).css('border','1px solid #ccc');
  	if($(this).val()==''){
		bl=false;
		$(this).css('border','1px solid red');
	}
  })
	if(!bl){return;};
	let b = confirm("确定修改吗？要不考虑考虑？");
	if(!b){return;}
	$("#info_form1").submit();
}

//修改当前用户密码
function updPassword() {
var bol=true;
	$.each($("#editPasswordDialog input"),function () {
		$(this).css('border','1px solid #ccc');
		if($(this).val()==''){
			$(this).css("border","1px solid red");
			bol=false;
		}
	})
			// console.log($("#editPasswordDialog input"));
if(!bol){
	return;
}
if($("#newPassword").val()!=$("#newPassword2").val()){
alert("密码不一致！");
return;
}

	let b = confirm("确定修改吗？要不考虑考虑？");
	if(!b){return;}


	$("body").append(`	<form id="info_form2333"
						  class="form-inline"
						  method="post"
						  action="${pageContext.request.contextPath}/admin/admin/updAdmin" >
						<input type="hidden" value="${sessionScope.ADMIN_SESSION.adminId}" name="adminId"/>
							<div class="form-group">
						<label for="newPassword" class="col-sm-2 control-label">新密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control"  placeholder="输入新密码" id="newPassword3" name="password" />
						</div>
					</div>
						</form>
						`);
	$("#newPassword3").val($("#newPassword").val());
	$("#info_form2333").submit();
}
</script>
</body>
</html>