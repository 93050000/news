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
                <h1 class="page-header">留言管理</h1>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" method="post" action="${pageContext.request.contextPath}/admin/admin/list">
                    <div class="form-group">
                        <label for="status">留言状态</label>
                        <select	class="form-control" onclick="GuestStat(this)"  id="status" name="status">
                            <option value="">--请选择--</option>
                            <option value="1"  >新消息</option>
                            <option value="0"  >已看 </option>
                        </select>
                    </div>
                    <button type="button" onclick="querAllGuest()" class="btn btn-success">查询全部</button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default" style="max-height: 616px;overflow: auto;">
                    <div class="panel-heading">留言信息表</div>

                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped"  >
                        <thead>
                        <tr>
                            <th>邮件</th>
                            <th>主题</th>
                            <th>发送者</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody  id="tableGuests">

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


<!-- 修改管理员用户模态框 -->
<div class="modal fade" id="editDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel23">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel23">信件详情</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_form" action="${pageContext.request.contextPath}/admin/admin/updQueI" method="post">
                    <input type="hidden" id="edit_adminId" value="" name="adminId"/>
                    <div class="form-group">
                        <label for="titleB" class="col-sm-2 control-label">标题</label>
                        <div class="col-sm-10">
                            <div style="vertical-align:middle;line-height:34px;" id="titleB" >
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="titleB" class="col-sm-2 control-label">发送人</label>
                        <div class="col-sm-10">
                            <div style="vertical-align:middle;line-height:34px;" id="guestNameB" >
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="titleB" class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <div style="vertical-align:middle;line-height:34px;" id="guestPhoneB" >
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="titleB" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <div style="vertical-align:middle;line-height:34px;" id="guestEmailB" >
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="titleB" class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-10">
                            <div style="vertical-align:middle;line-height:34px;" id="guestAddressB" >
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="messionZ" class="col-sm-2 control-label">正文</label>
                        <div class="col-sm-10">
                            <textarea
                                    disabled style="resize:none;min-height: 400px;max-height: 400px;overflow: auto;"
                                    class="form-control" placeholder=""
                                    id="messionZ"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updateAdmin()">确认</button>
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
                <form class="form-horizontal" id="editPassword_form">
                    <input type="hidden"  id="updatePassword_adminId" name="adminId" value="" />
                    <div class="form-group">
                        <label for="oldPassword" class="col-sm-2 control-label">旧密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" placeholder="输入旧密码" id="oldPassword" name="oldPassword" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="newPassword" class="col-sm-2 control-label">新密码</label>
                        <div class="col-sm-10">

                            <input type="password" class="form-control" placeholder="输入新密码" id="newPassword" name="passowrd" />
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
            <div class="modal-footer" >
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updateAdminPassword()">保存修改</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function maopao(obj) {
            var len = obj.length;
            for (var i = 0; i < len - 1; i++) {
                for (var j = 0; j < len - 1 - i; j++) {
                    if (obj[j].newstatus < obj[j+1].newstatus) {        // 相邻元素两两对比
                        var temp = obj[j+1];        // 元素交换
                        obj[j+1] = obj[j];
                        obj[j] = temp;
                    }
                }
            }
            console.log(obj)
    return obj;
    }
    function data(data){
        $("#tableGuests").css({

        })
        data=JSON.parse(data);
        data=maopao(data);
        $("#tableGuests").empty();
        data.forEach((v,i)=> {
            var start = `
   <tr style=" opacity: 1; background: #000; color: white " >
   <td style="text-align: center">
<svg t="1640494815421" class="icon" viewBox="0 0 1422 1024" version="1.1" xmlns="http://www.w3.org/2000/svg"
p-id="7692" width="30" height="46"><path d="M1245.029994 0.03622H177.059423A177.041313 177.041313 0 0 0 0 177.077533v669.881154a177.041313 177.041313 0 0 0 177.059423 177.041313h1067.970571a177.041313 177.041313 0 0 0 177.041313-177.041313V177.041313A177.041313 177.041313 0 0 0 1245.029994 0.03622z m98.752689 59.363893l-657.874364 449.122807a16.588568 16.588568 0 0 1-6.501415 2.64403 17.113752 17.113752 0 0 1-22.836446 3.477079L45.83588 97.647991a17.186191 17.186191 0 1 1 19.377476-28.378042l601.552915 410.675722L1324.405207 30.967742a17.188002 17.188002 0 0 1 19.377476 28.396152z" fill="#f4ea2a" p-id="7693" data-spm-anchor-id="a313x.7781069.0.i0" class=""></path></svg>
                                </td>`;
            if (v.newstatus == '0') {
                start = `
    <tr style="background: #000;  opacity: 0.6; " >
   <td style="text-align: center">
<svg t="1640497136495" class="icon" viewBox="0 0 1024 1024" version="1.1"
xmlns="http://www.w3.org/2000/svg" p-id="15076" width="30" height="46"><path d="M71.686667 333.7l429.726666-245.553333a21.333333 21.333333 0 0 1 21.173334 0l429.726666 245.553333L512 593.886667zM981.333333 366.113333L640.406667 567.566667l337.233333 337.233333a53.073333 53.073333 0 0 0 3.693333-19.466667zM603.58 591.086667c-0.366667-0.366667-0.72-0.746667-1.053333-1.133334l-79.673334 47.08a21.333333 21.333333 0 0 1-21.706666 0l-79.673334-47.08c-0.333333 0.386667-0.666667 0.766667-1.053333 1.133334L76.533333 934.973333A53.073333 53.073333 0 0 0 96 938.666667h832a53.073333 53.073333 0 0 0 19.466667-3.693334zM42.666667 366.113333V885.333333a53.073333 53.073333 0 0 0 3.693333 19.466667l337.233333-337.233333z" fill="#2c2c2c" p-id="15077"></path></svg>
`;
            }
            console.log(data);
            var str = start+`
                                <td style=" line-height: 45px;text-align: center;">` + v.guestTitle + `</td>
                                <td style=" line-height: 45px;text-align: center;">` + v.guestName + `</td>
                                    <td >
                                    <a  style=" line-height: 45px;text-align: center;width: 100%;" href="#" class="btn  btn-primary btn-xs" data-toggle="modal" data-target="#editDialog"
                                       onclick="queryGuest(` + v.guestId + `)">查看详情</a>

                                </td>
                            </tr>`;
            $("#tableGuests").append(str);
        })
    }
    $(function () {
        <c:if test="${sessionScope.error!=null}">
        setTimeout(function () {
            alert("${sessionScope.error}");
        },1000);

        <c:remove var="error" scope="session"/>
        </c:if>

        $.ajax({
            url:"${pageContext.request.contextPath}/admin/message/list",
            type:"post",
            async:true,
            json:"json",
            success:data,
            error:function (error,x,y) {
        console.log(error+x+y);
            }
        })

    })
    //更改观看状态
    function queryGuest(id) {
        $.ajax(
            {
                url:"${pageContext.request.contextPath}/admin/message/listx",
                data:{id:id},
                async: true,
                json:"json",
                type:"post",
                success:function (data) {
                    data=JSON.parse(data);
                    data=maopao(data);
                    $("#tableGuests").empty();
                    data.forEach((v,i)=> {

                        if(v.guestId==id){
                        $("#titleB").html(v.guestTitle);
                        $("#messionZ").val(v.guestContent);
                        $("#guestNameB").html(v.guestName);
                            $("#guestPhoneB").html(v.guestPhone);
                            $("#guestEmailB").html(v.guestEmail);
                            $("#guestAddressB").html(v.guestAddress);

                        }
                        var start = `
   <tr style=" opacity: 1; background: #000; color: white " >
   <td style="text-align: center">
<svg t="1640494815421" class="icon" viewBox="0 0 1422 1024" version="1.1" xmlns="http://www.w3.org/2000/svg"
p-id="7692" width="30" height="46"><path d="M1245.029994 0.03622H177.059423A177.041313 177.041313 0 0 0 0 177.077533v669.881154a177.041313 177.041313 0 0 0 177.059423 177.041313h1067.970571a177.041313 177.041313 0 0 0 177.041313-177.041313V177.041313A177.041313 177.041313 0 0 0 1245.029994 0.03622z m98.752689 59.363893l-657.874364 449.122807a16.588568 16.588568 0 0 1-6.501415 2.64403 17.113752 17.113752 0 0 1-22.836446 3.477079L45.83588 97.647991a17.186191 17.186191 0 1 1 19.377476-28.378042l601.552915 410.675722L1324.405207 30.967742a17.188002 17.188002 0 0 1 19.377476 28.396152z" fill="#f4ea2a" p-id="7693" data-spm-anchor-id="a313x.7781069.0.i0" class=""></path></svg>
                                </td>`;
                        if (v.newstatus == '0') {
                            start = `
    <tr style="background: #000;  opacity: 0.6; " >
   <td style="text-align: center">
<svg t="1640497136495" class="icon" viewBox="0 0 1024 1024" version="1.1"
xmlns="http://www.w3.org/2000/svg" p-id="15076" width="30" height="46"><path d="M71.686667 333.7l429.726666-245.553333a21.333333 21.333333 0 0 1 21.173334 0l429.726666 245.553333L512 593.886667zM981.333333 366.113333L640.406667 567.566667l337.233333 337.233333a53.073333 53.073333 0 0 0 3.693333-19.466667zM603.58 591.086667c-0.366667-0.366667-0.72-0.746667-1.053333-1.133334l-79.673334 47.08a21.333333 21.333333 0 0 1-21.706666 0l-79.673334-47.08c-0.333333 0.386667-0.666667 0.766667-1.053333 1.133334L76.533333 934.973333A53.073333 53.073333 0 0 0 96 938.666667h832a53.073333 53.073333 0 0 0 19.466667-3.693334zM42.666667 366.113333V885.333333a53.073333 53.073333 0 0 0 3.693333 19.466667l337.233333-337.233333z" fill="#2c2c2c" p-id="15077"></path></svg>
`;
                        }
                        console.log(data);
                        var str =  start+`
                                <td style=" line-height: 45px;text-align: center;">` + v.guestTitle + `</td>
                                <td style=" line-height: 45px;text-align: center;">` + v.guestName + `</td>
                                    <td >
                                    <a  style=" line-height: 45px;text-align: center;width: 100%;" href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#editDialog"
                                       onclick="queryGuest(` + v.guestId + `)">查看详情</a>

                                </td>
                            </tr>`;
                        $("#tableGuests").append(str);
                    })
                },
                error:function (err,x,y) {
                console.log(error+x+y);
                }
            }
        )

    }
    //按照状态查询
    function GuestStat(nstart) {
            console.log($(nstart).val())
        if($(nstart).val()!='0'&&$(nstart).val()!='1'){
            return;
        }
        console.log("我jll")
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/message/listx",
            data:{start:$(nstart).val()},
            async:true,
            json:"json",
            type:"get",
            success:data,
            error:function () {
            }

        })
    }
    //查询全部
    function querAllGuest() {
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/message/list",
            type:"post",
            async:true,
            json:"json",
            success:data,
            error:function (error,x,y) {
                console.log(error+x+y);
            }
        })
    }
</script>
</body>
</html>
