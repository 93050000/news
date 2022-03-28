<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<%@ taglib prefix="gdkmtool" uri="http://gdkm.edu/common/"%>--%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>管理员用户管理</title>
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
    <!-- 管理员用户列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">管理员用户管理</h1>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="post"
					  action="${pageContext.request.contextPath}/admin/admin/list">
					<div class="form-group">
						<label for="account">管理员登录账号</label> 
						<input type="text" class="form-control" id="account"  name="account" value="" />
					</div>
					<div class="form-group">
						<label for="status">登录状态</label> 
						<select	class="form-control" id="status" name="status">
							<option value="">--请选择--</option>
							<option value="0" >禁用</option>
							<option value="1" >正常 </option>		
						</select>
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
					<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#addDialog" onclick="clearAdmin()" >新建</a>

				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">管理员用户信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>ID</th>
								<th>管理员账号</th>
								<th>管理员用户名</th>
								<th>邮件</th>
								<th>登录状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${admins}" var="admin">
								<tr>
									<td>${admin.adminId}</td>
									<td>${admin.account}</td>
									<td>${admin.username}</td>
									<td>${admin.email}</td>
									<td><c:if test="${admin.status.equals('0')}"> 禁用</c:if>
									    <c:if test="${admin.status.equals('1')}"> 正常</c:if></td>
									<td>
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#editDialog" 
										   onclick="updAdminQueId(${admin.adminId})">修改</a>
										<a href="javascript:void(0)" class="btn btn-danger btn-xs"
										   onclick="deleteAdminById(${admin.adminId})">删除</a>
										<a href="#" class="btn btn-success btn-xs"
										   data-toggle="modal"
										   data-target="#editPasswordDialog"
										   onclick="updAdminId(${admin.adminId})">修改密码</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<gdkmtool:page url="${pageContext.request.contextPath}/admin/admin/list.action" />
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<c:if test="${yes!=null}">
		<div class="col-md-12 column">
			<ul class="pagination pagination-lg">
				<li>
					<a href="${pageContext.request.contextPath}/admin/admin/list/0">首页</a>
				</li>
				<c:forEach begin="1" var="ye"  end="${yes}">
					<li>
						<a href="${pageContext.request.contextPath}/admin/admin/list/${ye-1}">${ye}</a>
					</li>
				</c:forEach>
				<li>
					<a href="${pageContext.request.contextPath}/admin/admin/list/${yes-1}">尾页</a>
				</li>
			</ul>
		</div>
		</c:if>
	</div>

	<!-- 管理员用户列表查询部分  end-->
</div>

<!-- 创建管理员用户模态框 -->
<div class="modal fade" id="addDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel3">新建管理员</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="add_form"  method="post" action="${pageContext.request.contextPath}/admin/admin/addAdmin" >
					<div class="form-group">
						<label for="new_account" class="col-sm-2 control-label"> 登录账号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="登录账号" id="new_account" name="account" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_password" class="col-sm-2 control-label">登录密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" placeholder="登录密码" id="new_password" name="password" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_password2" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" placeholder="确认密码" id="new_password2" />
						</div>
					</div>

					<div class="form-group">
						<label for="new_username" class="col-sm-2 control-label">用户姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="用户姓名" id="new_username" name="username" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_email" class="col-sm-2 control-label">邮件</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="邮件" id="new_email" name="email" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_status" style="float:left;padding:7px 15px 0 27px;">登陆状态</label>
						<div class="col-sm-10">
							<select	class="form-control" id="new_status"  name="status">
								<option value="0" >禁用</option>
								<option value="1"  selected >正常 </option>
							</select>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="addAdmin()" >新建管理员</button>
			</div>
		</div>
	</div>
</div>

<!-- 修改管理员用户模态框 -->
<div class="modal fade" id="editDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel5">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel5">修改管理员信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_form" action="${pageContext.request.contextPath}/admin/admin/updQueI" method="post">
				    <input type="hidden" id="edit_adminId" value="" name="adminId"/>
					<div class="form-group">
						<label for="edit_account" class="col-sm-2 control-label">登录账号</label>
						<div class="col-sm-10">				
							<div style="vertical-align:middle;line-height:34px;" >
								<span id="edit_account"></span>
							</div>
						</div>						
					</div>
					<div class="form-group">
						<label for="edit_password" class="col-sm-2 control-label">登录密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" placeholder="登录密码(不填写则不修改)" id="edit_password" name="password" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_password2" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" placeholder="确认密码" id="edit_password2" />
						</div>
					</div>

					<div class="form-group">
						<label for="edit_username" class="col-sm-2 control-label">用户姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="用户姓名" id="edit_username" name="username" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_email" class="col-sm-2 control-label">邮件</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" placeholder="邮件" id="edit_email" name="email" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_status" style="float:left;padding:7px 15px 0 27px;">登陆状态</label>
						<div class="col-sm-10"> 
							<select	class="form-control" id="edit_status"  name="status">
								<option value="0" >禁用</option>
								<option value="1" >正常 </option>	
							</select>
						</div>
					</div>					
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateAdmin()">保存修改</button>
			</div>
		</div>
	</div>
</div>

<!-- 修改管理员密码模态框 -->
<div class="modal fade" id="editPasswordDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改管理员密码</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="editPassword_form"
					  action="${pageContext.request.contextPath}/admin/admin/updAdminPssword"
					  method="post" >
					<input type="hidden"  id="updatePassword_adminId23" name="adminId" value="" />
					<div class="form-group">
						<label for="oldPassword" class="col-sm-2 control-label">旧密码</label>
						<div class="col-sm-10">				
							<input type="password" class="form-control" placeholder="输入旧密码" id="oldPassword" name="oldPassword" />
						</div>						
					</div>
					<div class="form-group">
						<label for="newPassword2323" class="col-sm-2 control-label">新密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" placeholder="输入新密码" id="newPassword2323" name="password" />
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
				<button type="button" class="btn btn-primary" onclick="updateAdminPassword()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function emait(data) {

		var str='[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z0-9]+';
		let search = data.val().search(str);
		if(search==-1){
			alert("请输入正确的邮箱格式：不要带中文！");
			return false;}
		return true;
	}

	function fromJianChaNotNull(data){
		let bl=true;
		$.each(data,function () {
			$(this).css('border','1px solid #ccc');
			if($(this).val()==''){
				$(this).css('border','1px solid red');
				bl=false;
			}
		})
		if(!bl){
			return false;
		}
		return true;
	}
//打开新建页面
function updAdminId(id) {
$("#updatePassword_adminId23").val(id);
console.log($("#updatePassword_adminId23").val())
}
//新建管理员
function addAdmin(){
	let b = fromJianChaNotNull($("#add_form input"));
	if(!b){return;}
	if($("#new_password").val()!=$("#new_password2").val()){
		alert("密码不一致！")
		return;
	}
	let b2 = emait($("#new_email"));
	if(!b2){return;}


	let b1 = confirm(`确定添加管理员吗?`);
	if(!b1){return;}

	$("#add_form").submit();


}
//删除管理员

//通过id获取修改的管理员用户信息
function updAdminQueId(id) {
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/admin/updQueI",
		type:"get",
		async:true,
		data:{'id':id},
		success:function (data) {
		console.log(data)
			data=JSON.parse(data);
			$("#edit_form input").eq(0).val(data.adminId);
			$("#edit_account").html(data.account);
			$("#edit_form input").eq(3).val(data.username);
			$("#edit_form input").eq(4).val(data.email);
			$("#edit_form input").eq(5).val(data.status);

		},
		error:function (error) {
		console.log(error)
		}
	})
}

//修改管理员信息
function updateAdmin(){
	// console.log($('#edit_adminId').val())
	console.log("ni?")
	let bl=fromJianChaNotNull($("#edit_form input"));
	if(!bl){
		return;
	}
	if($("#edit_password").val()!=$("#edit_password2").val()){
		alert("密码不一致!");
		return;
	}
	let b = emait($("#edit_email"));
	if(!b){return;}
	$("#edit_form").submit();

}

//通过用户id删除
function deleteAdminById(id) {
	console.log(id);
	let b = confirm("你确定删除吗？这样的行为很危险！");
	if(!b){return null;}
	var num=Math.floor(Math.random()*1000);
var biao=`<form style='display:none;' id="edit_form`+num+`"
	action="${pageContext.request.contextPath}/admin/admin/deleteAdminById" method="post">
			<input name="id" value="`+id+`"/>
</form>
`;
	$('body').append(biao);
	var bid="#edit_form"+num;
	console.log($(bid).html())
	$(bid).submit();


}
//修改管理员密码
function updateAdminPassword() {
let b = fromJianChaNotNull($("#editPassword_form input"));
if(!b){return;}
if($("#newPassword2323").val()!=$("#newPassword2").val()){
	alert("密码不一致！");
	return;
}


let b1 = confirm("确定修改？你的行为很危险！");
if(!b1){return;}
$("#editPassword_form").submit();

}
$(function () {
<c:if test="${sessionScope.error!=null}">
	setTimeout(function () {
		alert("${sessionScope.error}");
	},1000);

	<c:remove var="error" scope="session"/>
	</c:if>
})
</script>
</body>
</html>