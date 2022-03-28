<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE HTML>
<html>
<head>
	<title>科软工作室后台管理系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
</head>
<body>
<div id="wrapper">
    <!-- 导航栏部分  start-->
    <%@ include file="nav.jsp" %>
    <!-- 导航栏部分 end -->    
    <!-- 后台管理首页  start-->
	<div id="page-wrapper">
			<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">后台管理首页</h1>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-body">
			       欢迎用户【${ADMIN_SESSION.account}】访问科软工作室后台管理系统
			</div>
	     </div> 
	</div>
	<!-- 后台管理首页  end-->
</div>
<script>
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