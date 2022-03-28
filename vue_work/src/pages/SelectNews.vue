<template>
  <div class="docker-server">
        <div class="main-content-right">
        <div class="main-text-box">
            <div class="main-text-box-tbg">
                <div class="main-text-box-bbg">
                    <div class="article-box" id="NewsById">

                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</template>

<script>
    import $ from "jquery";

    export default {
        mounted() {
            $.ajax({
                url: "http://localhost:8085/SSM_4034/qian/news/one",
                json: "json",
                type: "get",
                data:{'newsId':1},
                success: function (data) {
                    console.log(data);
                    data = JSON.parse(data);
                    $.each(data, function (i, item) {
                          $("#NewsById").append(
                        ` <h1>`+item.title+`</h1>
                        <div class="source-bar" style="font-size:20px">发布者: `+item.account+` 分类： 更新时间：`+item.createTime+` </div>
                        <div class="article-content">
                            <span class="article-summary" style="font-size:16px">
                                  新闻图片：<br>
                                      <!-- <img src="<%=request.getContextPath() %>/upload/<%=news.getPicPath() %>" alt="" /> -->
                                    <!-- <img src=""> 这里写图片的路径 -->
                                    <img src="http://localhost:8085/SSM_4034` + item.pic+`" width="500px" height="300px">
                                    <p>`+item.message+`</p>
                                    <a  href="/index/news"><button type="submit">返回</button></a>
                                    </span>
                         </div>`
                          )
                        return false;
                })

                }
            })
        }
    }
</script>

<style>
@import '~@/assets/css/SelectNews.css';
</style>