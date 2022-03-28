<template>
    <div id="content">
        <h1 style="color: white;display: block;padding-left: 180px; height: 60px; background: #9d9d9d ;line-height: 60px  ">博客</h1>
        <div class="super-tj" id="newslist">


        </div>
        <h1 style="color: white;display: block;padding-left: 180px; height: 60px; background: #9d9d9d ;line-height: 60px  ">创客新闻</h1>
        <div class="super-tj" id="newslist1">

        </div>
        <h1 style="color: white;display: block;padding-left: 180px; height: 60px; background: #9d9d9d ;line-height: 60px  ">创客项目</h1>
        <div class="super-tj" id="newslist2">

        </div>
    </div>
</template>

<script>

    import $ from 'jquery';
    // import '../assets/css/bootstrap.min.css';
    // import '../assets/css/dataTables.bootstrap.css';
    // import '../assets/js/bootstrap.min';
    // import '../assets/css/dataTables.bootstrap.css';

    export default {
        mounted() {
            //获取栏目id为1的前四新闻
            $.ajax({
                url: "http://localhost:8085/SSM_4034/qian/news/qianByCid1",
                json: "json",
                type: "get",
                success: function (data) {
                    console.log(data);
                    data = JSON.parse(data);
                    data.newsQian.forEach((v, i) => {

                        $("#newslist").append(
                            `
                <a   href="/index/selectNews">
          <img src="http://localhost:8085/SSM_4034` + v.pic+`" alt="" />
          <div class="js">
            <h3>` + v.title + `</h3>
            <p class="line-limit-length">` + v.message + `</p>
            <span>`+v.columnName+`</span>
          </div>
        </a>
        `
                        )

                    })
                }
            });
            //获取栏目id为2的前四新闻
            $.ajax({
                url: "http://localhost:8085/SSM_4034/qian/news/qianByCid2",
                json: "json",
                type: "get",
                success: function (data) {
                    console.log(data);
                    data = JSON.parse(data);
                    data.newsQian.forEach((v, i) => {

                        $("#newslist1").append(
                            `
                <a   href="/index/selectNews">
          <img src="http://localhost:8085/SSM_4034` + v.pic+`" alt="" />
          <div class="js">
            <h3>` + v.title + `</h3>
            <p class="line-limit-length">` + v.message + `</p>
            <span>`+v.columnName+`</span>
          </div>
        </a>
        `
                        )

                    })
                }
            });
            //获取栏目id为1的前四新闻
            $.ajax({
                url: "http://localhost:8085/SSM_4034/qian/news/qianByCid3",
                json: "json",
                type: "get",
                success: function (data) {
                    console.log(data);
                    data = JSON.parse(data);
                    data.newsQian.forEach((v, i) => {

                        $("#newslist2").append(
                            `
                <a   href="/index/selectNews">
          <img src="http://localhost:8085/SSM_4034` + v.pic+`" alt="" />
          <div class="js">
            <h3>` + v.title + `</h3>
            <p class="line-limit-length">` + v.message + `</p>
            <span>`+v.columnName+`</span>
          </div>
        </a>
        `
                        )

                    })
                }
            });

        }
    }
</script>

<style scope>
    @import '../assets/css/super-tj.css';

</style>