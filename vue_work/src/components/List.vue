<template>
  <div class="fl-list">
    <ul>
      <li><span></span><router-link active-class="active" to="/index/smart">新闻首页</router-link></li>
      <li><span></span><router-link active-class="active" to="/index/news">新闻列表</router-link></li>
<!--       <li><span></span><router-link active-class="active" to="/index/start">新闻列表</router-link></li>-->

    </ul>
  </div>
</template>

<script>
export default {
    name:'List',
};
</script>

<style scope>
@import '~@/assets/css/List.css';
</style>