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
    <%@ include file="../admin/nav.jsp" %>
    <!-- 导航栏部分 end -->
    <!-- 管理员用户列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">栏目管理</h1>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" method="get"
                      action="${pageContext.request.contextPath}/admin/news/newsColum">
                    <div class="form-group">
                        <label for="account">栏目名称</label>
                        <input type="text" class="form-control" id="account"  name="columnName" value="" />
                    </div>
                    <div class="form-group">
                        <label for="status">栏目状态</label>
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
                            <th>栏目名称</th>
                            <th>栏目代码</th>
                            <th>栏目状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${newsColumList}" var="colum">
                            <tr>
                                <td>${colum.newsColumnId}</td>
                                <td>${colum.columnName}</td>
                                <td>${colum.columnCode}</td>
                                <td><c:if test="${colum.status.equals('0')}"> 禁用</c:if>
                                    <c:if test="${colum.status.equals('1')}"> 正常</c:if></td>
                                <td>
                                    <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#editDialog"
                                       onclick="updNewsColumnId(${colum.newsColumnId})">修改</a>
                                    <a href="javascript:void(0)" class="btn btn-danger btn-xs"
                                       onclick="deleteNewsColumnId(${colum.newsColumnId})">删除</a>
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
    </div>
    <!-- 管理员用户列表查询部分  end-->
</div>

<!-- 创建管理员用户模态框 -->
<div class="modal fade" id="addDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新建分栏</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="add_form"
                      method="post" action="${pageContext.request.contextPath}/admin/admin/addNewsColumn" >
                    <div class="form-group">
                        <label for="columnName" class="col-sm-2 control-label"> 分栏名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" placeholder="分栏名称" id="columnName" name="columnName" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="columnCode" class="col-sm-2 control-label">分栏代码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" placeholder="分栏代码" id="columnCode" name="columnCode" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="status" class="col-sm-2 control-label">分栏状态</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="status1"  name="status">
                                <option value="0" >禁用</option>
                                <option value="1"  selected >正常 </option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="addNewsColumn()" >创建新栏目</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改管理员用户模态框 -->
<div class="modal fade" id="editDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">修改栏目信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_form"
                      action="${pageContext.request.contextPath}/admin/news/updNewsColum"
                      method="post">
                    <input type="hidden" id="newsColumnId2" value="" name="newsColumnId"/>
                    <div class="form-group">
                        <label for="columnName2" class="col-sm-2 control-label">分栏名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" placeholder="分栏名称" id="columnName2" name="columnName" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="columnCode2" class="col-sm-2 control-label">分栏代码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" placeholder="分栏代码" id="columnCode2" name="columnCode" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="status2" class="col-sm-2 control-label">栏目状态</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="status2"  name="status">
                                <option value="0" >禁用</option>
                                <option value="1"  >正常 </option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updateNewsColum()">保存修改</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function  fromJianChaTiString(String) {
        let b = confirm("你确定要"+String+"吗？");
        if(!b){return false;}
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
    /*检测修改时是否有空值*/
    /*修改新闻检测*/

/*添加一个新闻栏目 start*/
    function addNewsColumn() {
    let b = fromJianChaNotNull($("#add_form input"));
    if(!b){return;}
    let b1 = fromJianChaTiString("添加一个栏目");
    if(!b1){return;}
    $("#add_form").submit();
    }
    /*添加一个新闻栏目 end*/
/*删除一个新闻栏目 start*/
    function deleteNewsColumnId(id) {
        let b = fromJianChaTiString("删除该栏目");
        if(!b){return;}
        $("body").append(`  <form class="form-horizontal" id="edit_formasdasdas"
                      action="${pageContext.request.contextPath}/admin/news/deleteNewsColum"
                      method="post">
                    <input type="hidden"  value="`+id+`" name="newsColumnId"/>
                    </form>`);
        $("#edit_formasdasdas").submit();
    }
    /*删除一个新闻栏目 end*/

    /*修改新闻检测*/
/*通过已经获取到的id修改新闻栏目*/
function updateNewsColum() {
    /*检测是否有空*/
let b = fromJianChaNotNull($("#edit_form input"));
if(!b){return;}
let b1 = fromJianChaTiString("修改栏目");
if(!b1){return;}
$("#edit_form").submit();

}


    function updNewsColumnId(id) {
/*通过要修改的id获取该id下的栏目信息*/

        $.ajax({
            url:"${pageContext.request.contextPath}/admin/news/updNewsColum",
            data:{newsColumnId:id},
            json:"json",
            type:"get",
            async:true,
            success:function (data) {
            data=JSON.parse(data);
            $("#newsColumnId2").val(data.newsColumnId)
                $("#columnCode2").val(data.columnCode)
                $("#columnName2").val(data.columnName)
                $("#status2").val(data.status)

            },error:function (error) {
            console.log(error);
            }
        })


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
