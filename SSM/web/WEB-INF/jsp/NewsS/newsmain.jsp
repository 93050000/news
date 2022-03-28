<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="${pageContext.request.contextPath}/css/help.css" rel="stylesheet" type="text/css" />

</head>
<style>

    [id^="file"]{
        position: absolute;
        left: 0;
        top: 0;
        opacity: 0;
    }
@keyframes example {
    from { transform: rotate(0deg)}
    to {transform: rotate(360deg)}
}
    #jiazha{
        animation-name: example;
        animation-duration: 1s;
        animation-iteration-count: infinite;
        animation-timing-function:linear;
    }
</style>
<body>
<div id="wrapper">
    <!-- 导航栏部分  start-->
    <%@ include file="../admin/nav.jsp" %>
    <!-- 导航栏部分 end -->
    <!-- 管理员用户列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">新闻管理</h1>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" method="post"
                      action="${pageContext.request.contextPath}/admin/news/lists">
                    <div class="form-group">
                        <label for="title">新闻标题</label>
                        <input type="text" class="form-control" id="title"  name="title" value="" />
                    </div>
                    <div class="form-group">
                        <label for="message">新闻内容</label>
                        <input type="text" class="form-control" id="message"  name="message" value="" />
                    </div>
                    <div class="form-group">
                        <label for="newsColumnId12">新闻类别</label>
                        <select	class="form-control" id="newsColumnId12" name="newsColumnId">

                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">查询</button>
                    <a href="#" class="btn btn-primary" data-toggle="modal"
                       data-target="#addDialog" onclick="ajaxGetId()" >新建</a>
                </form>
            </div>
        </div>

        <%--查询到的新闻列表 start--%>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">新闻信息列表</div>
                </div>
            </div>
        </div>
        <%--查询到新闻列表 end--%>

        <div class="row clearfix">
            <div class="col-md-12 column" style="max-height: 51vh;overflow: auto">
                <div class="row">
                    <c:forEach items="${newList}" var="newList">
                    <div class="col-md-3" style="">
                        <div class="thumbnail">
                            <c:if test="${newList.pic==''||newList.pic==null}">
                            <img alt="300x200" style="max-height: 200px;min-height: 200px;"
                                 src="${pageContext.request.contextPath}/upload/admin_80c072dc-8765-4e8b-9dd7-e5c79b7e3931_222.jpg"
                            class="col-md-12"
                            />
                            </c:if>
                            <c:if test="${newList.pic!=null&&newList.pic!=''}">
                                <img alt="300x200" style="max-height: 200px;min-height: 200px;"
                                     src="${pageContext.request.contextPath}/${newList.pic}"
                                     class="col-md-12"
                                />
                            </c:if>
                            <div class="caption wenzhi" style="">
                                <h3 class="" style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
                                    ${newList.title}
                                </h3>
                                <p class="wenzhi" style="min-height: 80px;max-height: 80px;">
                                    ${newList.message}
                                </p>
                                <p>
                                    <a class="btn btn-danger" href="javascript:delectNewsById(${newList.newsId})">删除</a>
                                    <a class="btn btn-success btn-default"
                                       data-toggle="modal" data-target="#querNews"
                                       href="#" onclick="queryNewsById(${newList.newsId})">查看</a>
                                    <a class="btn btn-warning"
                                       data-toggle="modal" data-target="#updNews" onclick="updNews(${newList.newsId})"
                                       href="#">修改</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
            <c:if test="${yes!=null}">
            <div class="col-md-12 column">
                <ul class="pagination pagination-lg">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/news/list/0">首页</a>
                    </li>
                    <c:forEach begin="1" var="ye"  end="${yes}">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/news/list/${ye-1}">${ye}</a>
                    </li>
                    </c:forEach>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/news/list/${yes-1}">尾页</a>
                    </li>
                </ul>
            </div>
            </c:if>
        </div>


    </div>
    <!-- 管理员用户列表查询部分  end-->



    <!-- 创建新闻模态框 -->
    <div class="modal fade" id="addDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-lg modal-dialog "  role="document">
            <div class="modal-content ">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h3 class="modal-title" id="myModalLabel">新建新闻</h3>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="add_News_Form"
                          enctype="multipart/form-data" method="post"
                          action="${pageContext.request.contextPath}/admin/news/addNews" >
                        <div class="form-group">
                            <label for="new_account" class="col-sm-2 control-label">
                             <h5>新闻标题</h5>
                            </label>
                            <div class="col-sm-10 input-group-lg">
                                <input type="text" class="form-control" placeholder="新闻标题" id="new_account" name="title" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="news_columid" class="col-sm-2 control-label">
                                <h5> 新闻类别</h5>
                            </label>
                            <div class="col-sm-10  input-group-lg">
                                <select	class="form-control" id="news_columid" onclick=""  name="newsColumnId">

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="new_password2" class="col-sm-2 control-label">
                                <h5> 文章正文</h5>
                            </label>
                            <div class="col-sm-10  input-group-lg">
                                <textarea name="message" type="password" style="resize: none;min-height: 300px;" class="form-control" placeholder="文章正文" id="new_password2"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="new_username" class="col-sm-2 control-label">
                                <h5>选择图片</h5>
                            </label>
<%--                            <div class="col-sm-10  input-group-lg">--%>
<%--                                <input type="file" class="form-control" placeholder="选择图片" id="new_username" name="picFile" />--%>
<%--                            </div>--%>
                            <label for="filePic" class="col-sm-10">
                                <input type="button" id="new_username"  value="点我上传">
                                <span id="textPic">请上传图片</span>
                                <input type="file" name="picFile"  id="filePic">
                            </label>
                        </div>
                        <div class="form-group ">
                            <label for="VIDEO" class="col-sm-2 control-label">
                                <h5>选择视频</h5>
                            </label>
                            <label for="filevideo" class="col-sm-10">
                                <input type="button" id="VIDEO"  value="点我上传">
                                <span id="textvideo">请上传视频</span>
                                <input type="file" name="videoFile"  id="filevideo">
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="Appendix" class="col-sm-2 control-label">
                                <h5>附属文档</h5>
                            </label>
<%--                            <div class="col-sm-10  input-group-lg">--%>
<%--                                <input type="file" class="form-control" placeholder="选择视频" id="new_status2" name="appendixFile" />--%>
<%--                            </div>--%>
<%--                            --%>
                            <label for="fileAppendix" class="col-sm-10">
                                <input type="button" id="Appendix"  value="点我上传">
                                <span id="textAppendix">请上传附属文档</span>
                                <input type="file" name="appendixFile"  id="fileAppendix">
                            </label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer  input-group-lg">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" onclick="addNews()" >提交</button>
                </div>
            </div>
        </div>
    </div>

    <%--查看新闻模态框 start--%>
    <div class="modal fade" id="querNews" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-lg modal-dialog "  style="overflow: auto;"  role="document">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><b style="font-size: 2rem;color: red">X</b></span>
                </button>
                <div class="">
                    <blockquote>
                        <h2 id="q_title">
                            github是一个全球化的开源社区.
                        </h2>

                            <span class="col-md-4">发布者 <cite id="q_account">root</cite></span>
                            <span class="col-md-4">发布时间 <cite id="q_createTime">root</cite></span>
                            <span class="col-md-4">点击量 <cite id="q_num">root</cite></span>

                    </blockquote>



                </div>
                <div class="modal-body">
                    <div class="">
                        <div style="height:300px; text-align: center">
                            <img   height="100%" id="q_pic"  class="col-md-8 col-md-offset-2"
                                   src="${pageContext.request.contextPath}/upload/admin_80c072dc-8765-4e8b-9dd7-e5c79b7e3931_222.jpg" class="img-rounded" />
                        </div>
                        <span style="width:100%;word-break:normal;display:block;white-space:pre-wrap;overflow:hidden;">
                            <b style="font-size: 1.4rem" id="q_message">
                                正文
                             </b>
                        </span>
                    </div>
                    <div style="height:400px; text-align: center;display: none;">
<%--                        <img   height="100%"   class="col-md-8 col-md-offset-2"  src="${pageContext.request.contextPath}/upload/admin_80c072dc-8765-4e8b-9dd7-e5c79b7e3931_222.jpg" class="img-rounded" />--%>
                        <video  class="col-md-12"  height="400px" id="q_videos"  controls>
                        </video>
                    </div>
                </div>
                <a id="q_appendix" download=""  style="display: none;">文件链接</a>
                <div class="modal-footer  input-group-lg" style="margin-top: 10px">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" >确认</button>
                </div>
            </div>
        </div>
    </div>
    <%--查看新闻模态框 end--%>
    <!-- 修改新闻模态框 -->
    <div class="modal fade" id="updNews" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-lg modal-dialog "  role="document">
            <div class="modal-content ">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h3 class="modal-title" id="myModalLabelupd">修改新闻</h3>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="upd_News_Form123"
                          enctype="multipart/form-data" method="post"
                          action="${pageContext.request.contextPath}/admin/news/updNews" >
                       <input type="hidden" value="" name="num" id="numId">
                        <input type="hidden" value="" name="newsId" id="newsIds">
                        <div class="form-group">
                            <label for="upd_title" class="col-sm-2 control-label">
                                <h5>新闻标题</h5>
                            </label>
                            <div class="col-sm-10 input-group-lg">
                                <input type="text" class="form-control" placeholder="新闻标题" id="upd_title" name="title" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="updnews_columid" class="col-sm-2 control-label">
                                <h5> 新闻类别</h5>
                            </label>
                            <div class="col-sm-10  input-group-lg">
                                <select	class="form-control" id="updnews_columid" onclick=""  name="newsColumnId">

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="messages" class="col-sm-2 control-label">
                                <h5> 文章正文</h5>
                            </label>
                            <div class="col-sm-10  input-group-lg">
                                <textarea name="message" type="password" style="resize: none;min-height: 300px;" class="form-control" placeholder="文章正文" id="messages"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="updPic" class="col-sm-2 control-label">
                                <h5>选择图片</h5>
                            </label>
                            <%--                            <div class="col-sm-10  input-group-lg">--%>
                            <%--                                <input type="file" class="form-control" placeholder="选择图片" id="new_username" name="picFile" />--%>
                            <%--                            </div>--%>
                            <label for="filePic" class="col-sm-10">
                                <input type="button" id="updPic"  value="点我上传">
                                <span id="textPicupd">请上传图片</span>
                                <input type="file" name="picFile"  id="filePicupd">
                            </label>
                        </div>
                        <div class="form-group ">
                            <label for="updVIDEO" class="col-sm-2 control-label">
                                <h5>选择视频</h5>
                            </label>
                            <label for="filevideo" class="col-sm-10">
                                <input type="button" id="updVIDEO"  value="点我上传">
                                <span id="textvideoupd">请上传视频</span>
                                <input type="file" name="videoFile"  id="filevideoupd">
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="Appendixupd" class="col-sm-2 control-label">
                                <h5>附属文档</h5>
                            </label>
                            <%--                            <div class="col-sm-10  input-group-lg">--%>
                            <%--                                <input type="file" class="form-control" placeholder="选择视频" id="new_status2" name="appendixFile" />--%>
                            <%--                            </div>--%>
                            <%--                            --%>
                            <label for="fileAppendix" class="col-sm-10">
                                <input type="button" id="Appendixupd"  value="点我上传">
                                <span id="textAppendixupd">请上传附属文档</span>
                                <input type="file" name="appendixFile"  id="fileAppendixupd">
                            </label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer  input-group-lg">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" onclick="updNewsPost('#upd_News_Form123')" >修改</button>
                </div>
            </div>
        </div>
    </div>
</div>
    <%--修改新闻模态框--%>

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

function xiazxiugai() {
    $("body").append(`    <div id="jiazhai1000092" style="z-index:99999;width: 100%;height: 100vh;background:rgba(000,000,000,0.3);position: fixed;top: 0%;">
        <div style="position: absolute;top:20%;left: 41%;transform: translate(-50%,-50%)" id="jiazha">
            <svg t="1640597321982" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg"
                 p-id="4264" width="200" height="200">
                <path d="M840.3968 755.712c3.072 0 5.632-2.6624 5.632-5.9904a5.7856 5.7856 0 0 0-5.632-5.9392c-3.1232 0-5.632 2.6624-5.632 5.9392 0 3.328 2.5088 5.9904 5.632 5.9904z m-118.5792 141.5168c6.144 0 11.1616-5.2736 11.1616-11.8272a11.52 11.52 0 0 0-11.1616-11.8272 11.52 11.52 0 0 0-11.2128 11.8272c0 6.5536 5.0176 11.8272 11.2128 11.8272z m-161.6896 75.776a17.3056 17.3056 0 0 0 16.7936-17.7664c0-9.8304-7.5264-17.8176-16.7936-17.8176a17.3056 17.3056 0 0 0-16.8448 17.8176c0 9.8304 7.5264 17.8176 16.8448 17.8176z m-174.592-3.4304a23.04 23.04 0 0 0 22.3744-23.7056 23.04 23.04 0 0 0-22.3744-23.7056 23.04 23.04 0 0 0-22.3744 23.7056 23.04 23.04 0 0 0 22.3744 23.7056z m-154.112-80.896c15.4112 0 27.9552-13.312 27.9552-29.6448 0-16.384-12.544-29.6448-28.0064-29.6448-15.4624 0-28.0064 13.312-28.0064 29.6448 0 16.384 12.544 29.6448 28.0064 29.6448zM126.3104 747.008c18.5344 0 33.5872-15.9744 33.5872-35.6352 0-19.6608-15.0528-35.584-33.5872-35.584-18.5856 0-33.6384 15.9232-33.6384 35.584 0 19.6608 15.0528 35.6352 33.6384 35.6352z m-35.9936-175.4112c21.6576 0 39.168-18.5856 39.168-41.472 0-22.9376-17.5104-41.472-39.168-41.472-21.6064 0-39.168 18.5344-39.168 41.472 0 22.8864 17.5616 41.472 39.168 41.472z m39.7824-174.1312c24.7808 0 44.8-21.248 44.8-47.4624s-20.0192-47.4112-44.8-47.4112c-24.7296 0-44.8 21.1968-44.8 47.4112s20.0704 47.4624 44.8 47.4624z m108.1344-139.264c27.8528 0 50.432-23.9104 50.432-53.4016 0-29.4912-22.528-53.4016-50.432-53.4016-27.8528 0-50.432 23.9104-50.432 53.4016 0 29.4912 22.5792 53.4016 50.432 53.4016z m156.1088-77.312c30.9248 0 55.9616-26.5216 55.9616-59.2896 0-32.768-25.088-59.2896-55.9616-59.2896-30.9248 0-56.0128 26.5728-56.0128 59.2896 0 32.768 25.088 59.2896 56.0128 59.2896z m174.6432 0.8192c34.048 0 61.6448-29.184 61.6448-65.28 0-35.9936-27.5968-65.2288-61.6448-65.2288-33.9968 0-61.5936 29.184-61.5936 65.2288 0 36.0448 27.5968 65.28 61.5936 65.28z m160.3584 79.616c37.12 0 67.1744-31.8464 67.1744-71.168 0-39.2192-30.0544-71.1168-67.1744-71.1168-37.0688 0-67.1744 31.8976-67.1744 71.168 0 39.2704 30.1056 71.168 67.1744 71.168z m115.6096 144.4864c40.192 0 72.8064-34.5088 72.8064-77.056 0-42.5984-32.6144-77.1072-72.8064-77.1072-40.192 0-72.7552 34.5088-72.7552 77.1072 0 42.5472 32.5632 77.056 72.7552 77.056z m49.408 185.4464c43.264 0 78.3872-37.2224 78.3872-83.0464 0-45.8752-35.1232-83.0464-78.3872-83.0464-43.3152 0-78.4384 37.1712-78.4384 83.0464 0 45.824 35.1232 83.0464 78.4384 83.0464z" fill="#2c2c2c" p-id="4265"></path></svg>

        </div>
        <h3 style="position: absolute;top: 43%;left: 43%">新闻上传中,请稍等！</h3>

        <div style="position: absolute;top: 53%;left: 35%;width: 500px;">
            <p>
                <strong>上传新闻中</strong>
                <span class="pull-right text-muted" id="jiazhai1000092C2">完成0%</span>
            </p>
            <div class="progress progress-striped active">
                <div class="progress-bar progress-bar-info" role="progressbar"
                     aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
                     style="width: 0%" id="jiazhai1000092C1">
                    <span class="sr-only" id="jiazhai1000092C3">完成0%</span>
                </div>
            </div>
        </div>
    </div>
`);
    var bt=0;
    setInterval(function () {
        let sjs=Math.random()*20;
        bt+=sjs;
        if(bt>=99.9999){
            bt=99.9999;
        }
        $("#jiazhai1000092C1").css("width",bt+"%");
        $("#jiazhai1000092C3").html("完成"+bt+"%");
        $("#jiazhai1000092C2").html("完成"+bt+"%");
        console.log(bt);
    },200);
}






        /*监听事件api*/
        /*帮助提示*/
        function fileTis(file,textid,text) {
            textid.html(file.val());
            if(file.val()==""){textid.html(text);}
        }
        /*监听事件api*/
        /*判断是否为空*/
        function NoTNull(object) {
            if(object==""||object==null){
                return false;
            }
            return true;
        }
/*添加新闻*/
    function addNews(){


     let b = fromJianChaNotNull($("#add_News_Form input:text"));
     let b2=fromJianChaNotNull($("#add_News_Form textarea"));
     if(!b2){return;}
     if(!b){return;}
     let b1 = fromJianChaTiString("添加新闻");
     if(!b1){return;}
        $("#add_News_Form").submit();
     xiazxiugai();
    }

    $(function () {
    // $("#newsColumnId12");
        <c:if test="${sessionScope.error!=null}">
        setTimeout(function () {
            alert("${sessionScope.error}");
        },1000);

        <c:remove var="error" scope="session"/>
        </c:if>

        $.ajax({
            url:"${pageContext.request.contextPath}/admin/news/newsColum",
            data:{},
            type:"post",
            async:true,
            success:function (data) {
                data=JSON.parse(data);
                $("#newsColumnId12").empty();
                /*查询的是查询*/
                $("#newsColumnId12").append(`<option value="">--请选择--</option>`)
                data.forEach((v,i)=>{
                    $("#newsColumnId12").append(` <option value="`+v.newsColumnId+`" >`+v.columnName+`</option>`);
                })

            },
            error:function (erro) {

            }
        })

        $("#textPic").html("(可选填)请上传图片(JPG,PNG,GIF)");
        $("#filePic").change(function () {
            fileTis($("#filePic"), $("#textPic"),"(可选填)请上传图片(JPG,PNG,GIF)");
        })
        $("#textvideo").html("(可选填)请上传视频(MP4)");
        $("#filevideo").change(function () {
            fileTis($("#filevideo"), $("#textvideo"),"(可选填)请上传视频(MP4)");
        })
        $("#textAppendix").html("(可选填)请上传文件(*)");
        $("#fileAppendix").change(function () {
            fileTis($("#fileAppendix"), $("#textAppendix"),"(可选填)请上传文件(*)");
        })


  })
        function updNews(id) {
            $.ajax({
                url:"${pageContext.request.contextPath}/admin/news/newsColum",
                data:{},
                type:"post",
                async:true,
                success:function (data) {
                    data=JSON.parse(data);
                    $("#updnews_columid").empty();
                    /*修改的*/
                    data.forEach((v,i)=>{
                        $("#updnews_columid").append(` <option value="`+v.newsColumnId+`" >`+v.columnName+`</option>`);
                    })

                },
                error:function (erro) {

                }
            })

            $.ajax({
                url:"${pageContext.request.contextPath}/admin/news/queryNewsByid",
                async:true,
                type:"get",
                data:{newsid:id},
                json:"json",
                success:function (data) {
                data=JSON.parse(data);
                /*标题*/
                $("#upd_title").val(data.title);
                /*新闻类别*/
                    $("#updnews_columid").val(data.newsColumnId);
                    /*文章正文*/
                    $("#messages").val(data.message);
                    $("#numId").val(data.num);
                    $("#newsIds").val(data.newsId);
                    /*文章图片*/
                    if(NoTNull(data.pic)){ $("#textPicupd").html(data.pic);}else{$("#textPicupd").html("暂未上传图片");}
                    /*视频*/
                    if(NoTNull(data.video)){$("#textvideoupd").html(data.video);}else{$("#textvideoupd").html("暂未上传视频");}
                    /*文档*/
                    if(NoTNull(data.appendix)){ $("#textAppendixupd").html(data.appendix);}else{$("#textAppendixupd").html("暂未上传文件");}
                    $("#filePicupd").change(function () {
                        if(NoTNull(data.pic)){
                            fileTis($("#filePicupd"),$("#textPicupd"),data.pic);
                        }else{
                            fileTis($("#filePicupd"),$("#textPicupd"),"暂未上传图片");
                        }
                    })
                    $("#filevideoupd").change(function () {
                        if(NoTNull(data.video)){
                            fileTis($("#filevideoupd"),$("#textvideoupd"),data.video);
                        }else{
                            fileTis($("#filevideoupd"),$("#textvideoupd"),"暂未上传视频");
                        }
                    })
                    $("#fileAppendixupd").change(function () {
                        if(NoTNull(data.appendix)){
                            fileTis($("#fileAppendixupd"),$("#textAppendixupd"),data.appendix);
                        }else{
                            fileTis($("#fileAppendixupd"),$("#textAppendixupd"),"暂未上传文档");
                        }
                    })
                }

            })
        }


    function ajaxGetId() {
        var id='#news_columid';
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/news/newsColum",
            data:{},
            type:"post",
            async:true,
            success:function (data) {
                data=JSON.parse(data);
                $(id).empty();
                data.forEach((v,i)=>{
                    $(id).append(` <option value="`+v.newsColumnId+`" >`+v.columnName+`</option>`);
                })

            },
            error:function (erro) {

            }
        })
    }

    function delectNewsById(id) {
        let b = confirm("是否删除？");
        if(!b){return;}

        var bt=`<form id='delectNewsById' method="post" action="${pageContext.request.contextPath}/admin/news/DelNews">
        <input type="text" value="`+id+`" name="newsColumId">
    </form>`;
        $("body").append(bt);
        $("#delectNewsById").submit();
    }
    /*查询新闻*/
    function queryNewsById(id) {

    let url ="${pageContext.request.contextPath}/admin/news/queryNewsByid";
    var f="#q_";
    $.ajax({
        url:url,
        data:{newsid:id},
        async:true,
        json:"json",
        type:"get",
        success:function (data) {
        data=JSON.parse(data);
        /*发布者*/
        $(f+"account").html(data.account);
        /*标题*/
            $(f+"createTime").html(data.createTime);
            $(f+"message").html(data.message);
            $(f+"num").html(data.num);
            $(f+"title").html(data.title);

            if(NoTNull(data.pic)){
                $(f+"pic")[0].src="${pageContext.request.contextPath}/"+data.pic;
            }else{
                $(f+"pic")[0].src="${pageContext.request.contextPath}/upload/admin_80c072dc-8765-4e8b-9dd7-e5c79b7e3931_222.jpg";
            }

            if(NoTNull(data.video)){
                $(f+"videos").parent().css("display","block");

                $(f+"videos").empty();
                $(f+"videos").append(`<source id="q_video" src="${pageContext.request.contextPath}/`+data.video+`" type="video/mp4">`);
                <%--$(f+"video")[0].src="${pageContext.request.contextPath}/"+data.video;--%>
                $(f+"videos").load();
            }
            if(NoTNull(data.appendix)){
                $(f+"appendix").css("display","block");
                $(f+"appendix").html("附件链接");
                $(f+"appendix")[0].href=`${pageContext.request.contextPath}/`+data.appendix;
                var Snum=Math.random()*20000;
                for (var i=0;i<data.appendix.length;i++){
                    if(i>data[i].length-6){
                        Snum+=data[i];
                    }
                }
                $(f+"appendix")[0].download=Snum;
            }



        console.log(data);
        },error:function (error) {

        }
    })
        return false;
    }
    /*提交修改新闻*/
        function updNewsPost(id){
            let b2 = fromJianChaNotNull($("#upd_News_Form123 input:text"));
            let b1 = fromJianChaNotNull($("#upd_News_Form123 textarea"));
            if(!b1||!b2){return;}




            let b = confirm("是否修改?");
            if(!b){return;}
            $(id).submit();
            xiazxiugai();
        }

        /*查看模块框关闭监听*/
        $('#querNews').on('hidden.bs.modal', function () {
           let f="#q_";
            $("#q_videos")[0].pause()
            $("#q_videos").parent().css("display","none");
            $("#q_videos").empty();


            $(f+"appendix").css("display","none");
            $(f+"appendix").html("");
            $(f+"appendix")[0].href=``;

        });

    </script>
</body>
</html>
