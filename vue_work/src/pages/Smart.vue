<template>
  <div id="content">
    <div class="super-tj row" id="newslist2">

    </div>
    <div class="super-tj" id="newslist">

    </div>
  </div>
</template>

<script>
  import $ from "jquery";
  //


export default {
  mounted() {
    console.log(111)
    $.ajax({
      url:"http://localhost:8085/SSM_4034/qian/news/qiansha",
      json:"json",
      type:"get",
      success: function (data) {
        console.log(data);
        data = JSON.parse(data);
        data.newsQian.forEach((v,i)=>{
          if (i ==4){
            return false;
          }else {
            $("#newslist").append(
                    `   <a   href="/index/selectNews">
          <img src="http://localhost:8085/SSM_4034` + v.pic+`" alt="" />
          <div class="js">
            <h3>` + v.title + `</h3>
            <p class="line-limit-length">` + v.message + `</p>
            <router-link active-class="active" to="/index/selectNews"><span>`+v.columnName+`</span></router-link>
          </div>
        </a>`

            )
          }
        })
      }
    });
    $.ajax({
      url:"http://localhost:8085/SSM_4034/qian/news/qianshi",
      json:"json",
      type:"get",
      success: function (data) {
        console.log(data);
        data = JSON.parse(data);
        data.newsQian.forEach((v,i)=>{
          if (i ==4){
            return false;
          }else {
            $("#newslist2").append(
                    `   <a   href="/index/selectNews">
          <img src="http://localhost:8085/SSM_4034` + v.pic+`" alt="" />
          <div class="js">
            <h3>` + v.title + `</h3>
            <p class="line-limit-length">` + v.message + `</p>
            <span>`+v.columnName+`</span>
          </div>
        </a>`

            )
          }
        })
      }
    });
  }
};
</script>

<style scope>
@import '~@/assets/css/super-tj.css';
</style>