<template>
  <div id="app">
    <Banner />
    <List />
    <router-view></router-view>

  </div>
</template>

<script>
import Banner from "../components/Banner.vue";
import List from "../components/List.vue";


export default {
  name: "Index",
  components: {
    Banner,
    List,

  },
};
</script>

<style lang="scss">
* {
  margin: 0;
  padding: 0;
  -webkit-tap-highlight-color: transparent;
  box-sizing: border-box;
}

body {
  width: 100%;
  min-width: 768px;
  margin: 0 auto;
  color: gray;
  overflow-x: hidden;
  background-color: #f3f3f3;
}

a,
a:hover {
  text-decoration: none;
}

ul {
  list-style: none;
}

input {
  border: none;
  outline: none;
}

.clearfix::before,
.clearfix::after {
  content: "";
  display: block;
  height: 0;
  visibility: hidden;
  clear: both;
}
/*媒体查询*/
@media screen and (max-width: 1430px) {
  .fl-list ul li a {
    font-size: 18px; /*字体大小*/
    padding-left: 25px; /*左内边距*/
  }
}
@media screen and (max-width: 1300px) {
  .fl-list ul li a {
    font-size: 17px; /*字体大小*/
  }
}
@media screen and (max-width: 1200px) {
  .navbar-collapse .nav .dl a {
    display: none; /*隐藏*/
  }
  .navbar-collapse .nav .zc a {
    display: none; /*隐藏*/
  }
}
@media screen and (max-width: 1025px) {
  .fl-list ul li {
    display: none; /*隐藏*/
  }
  .navbar-collapse .nav .dropDown .dropdown-menu li {
    width: 30%;
  }
  .navbar-collapse .nav .icon-box {
    width: 125px; /*宽度*/
    margin-left: 10px; /*左外边距*/
  }
  .navbar-collapse .nav li {
    margin-left: 5px; /*外边距*/
  }
}
</style>
