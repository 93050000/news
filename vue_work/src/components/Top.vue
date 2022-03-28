<template>
<div>
  <div class="container">
    <!-- logo -->
    <div class="logo">
      <img src="../assets//img/logo.png" alt="" />
      <span>&nbsp;新闻发布</span>
    </div>

  <!-- list-box -->
    <div class="list-box">
      <ul class="list">
        <li>
          <router-link to="/index">新闻首页</router-link>
        </li>
        <li><router-link to="/join">联系我们</router-link></li>
      </ul>
    </div>
    </div>
    <div class="drop">
      <div class="modelPhone" ref="phone">
            <ul class="drop-down">
               <li>
                <img src="../assets/img/华为手机.png" alt="" />
                <div class="js">
                  <h4>Mate 40 RS保时捷</h4>
                  <span>￥10999</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为手机1.png" alt="" />
                <div class="js">
                  <h4>华为nava 8Pro</h4>
                  <span>￥3699</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为手机2.png" alt="" />
                <div class="js">
                  <h4>华为Mate 40Pro</h4>
                  <span>￥6299</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为手机3.png" alt="" />
                <div class="js">
                  <h4>HUAWEI Mate X2</h4>
                  <span>￥17999</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为手机4.png" alt="" />
                <div class="js">
                  <h4>HUAWEI P50 Pro</h4>
                  <span>￥7488</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为手机5.png" alt="" />
                <div class="js">
                  <h4>HUAWEI nova 8</h4>
                  <span>￥3869</span>
                </div>
              </li>
            </ul>
            <ul class="drop-down">
              <li>
                <img src="../assets/img/华为手机1.webp" alt="" />
                <div class="js">
                  <h4>HUAWEI P50</h4>
                  <span>￥4488</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为手机2.webp" alt="" />
                <div class="js">
                  <h4>HUAWEI nova 9 Pro</h4>
                  <span>￥3469</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为手机3.webp" alt="" />
                <div class="js">
                  <h4>HUAWEI Mate20</h4>
                  <span>￥4999</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为手机4.webp" alt="" />
                <div class="js">
                  <h4>HUAWEI nova 8</h4>
                  <span>￥3299</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为手机5.webp" alt="" />
                <div class="js">
                  <h4>HUAWEI nova 7 5G</h4>
                  <span>￥2999</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为手机6.webp" alt="" />
                <div class="js">
                  <h4>HUAWEI P40</h4>
                  <span>￥4189</span>
                </div>
              </li>
            </ul>
          </div>
      <div class="watch" ref="watch" @mouseenter="showWatch" @mouseleave="hiddenWatch">
        <ul class="drop-down">
              <li>
                <img src="../assets/img/华为手环.png" alt="" />
                <div class="js">
                  <h4>华为手环6</h4>
                  <span>￥329</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为手环1.png" alt="" />
                <div class="js">
                  <h4>HUAWEI WATCH FIT</h4>
                  <span>￥749</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为耳机.png" alt="" />
                <div class="js">
                  <h4>HUAWEI Mate20</h4>
                  <span>￥599</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为耳机1.png" alt="" />
                <div class="js">
                  <h4>FreeBuds Pro耳机</h4>
                  <span>￥949</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为耳机2.png" alt="" />
                <div class="js">
                  <h4>FreeBuds 4i无线耳机</h4>
                  <span>￥499</span>
                </div>
              </li>
            </ul>
            <ul class="drop-down">
              <li>
                <img src="../assets/img/华为耳机1.webp" alt="" />
                <div class="js">
                  <h4>FreeBuds 4 无线耳机</h4>
                  <span>￥999</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为耳机2.webp" alt="" />
                <div class="js">
                  <h4>FreeBuds 4i 无线耳机</h4>
                  <span>￥749</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为耳机3.webp" alt="" />
                <div class="js">
                  <h4>FreeLace Pro 无线耳机</h4>
                  <span>￥599</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为耳机4.webp" alt="" />
                <div class="js">
                  <h4>FreeLace 无线耳机</h4>
                  <span>￥499</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为耳机5.webp" alt="" />
                <div class="js">
                  <h4>FreeBuds 3 无线耳机</h4>
                  <span>￥999</span>
                </div>
              </li>
            </ul>
      </div>
      <div class="rell" ref="rell" @mouseenter="showRell" @mouseleave="hiddenRell">
        <ul class="drop-down">
              <li>
                <img src="../assets/img/华为手机3.png" alt="" />
                <div class="js">
                  <h4>HUAWEI Mate X2</h4>
                  <span>￥17999</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为手机.png" alt="" />
                <div class="js">
                  <h4>Mate 40 RS保时捷</h4>
                  <span>￥10999</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为手机5.webp" alt="" />
                <div class="js">
                  <h4>HUAWEI nova 7 5G</h4>
                  <span>￥2999</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为手机1.webp" alt="" />
                <div class="js">
                  <h4>HUAWEI P50</h4>
                  <span>￥4488</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为手机2.webp" alt="" />
                <div class="js">
                  <h4>HUAWEI nova 9 Pro</h4>
                  <span>￥3469</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为手机6.webp" alt="" />
                <div class="js">
                  <h4>HUAWEI P40</h4>
                  <span>￥4189</span>
                </div>
              </li>
              
            </ul>
            <ul class="drop-down">
               
               <li>
                <img src="../assets/img/华为手环1.png" alt="" />
                <div class="js">
                  <h4>HUAWEI WATCH FIT</h4>
                  <span>￥749</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为耳机.png" alt="" />
                <div class="js">
                  <h4>HUAWEI Mate20</h4>
                  <span>￥599</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为耳机4.webp" alt="" />
                <div class="js">
                  <h4>FreeLace 无线耳机</h4>
                  <span>￥499</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为耳机3.webp" alt="" />
                <div class="js">
                  <h4>FreeLace Pro 无线耳机</h4>
                  <span>￥599</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为耳机1.png" alt="" />
                <div class="js">
                  <h4>FreeBuds Pro耳机</h4>
                  <span>￥949</span>
                </div>
              </li>
              <li>
                <img src="../assets/img/华为耳机5.webp" alt="" />
                <div class="js">
                  <h4>FreeBuds 3 无线耳机</h4>
                  <span>￥999</span>
                </div>
              </li>
            </ul>
      </div>
    </div>
  </div>
  
</template>

<script>
import Index from '../pages/Index.vue'
// var phone = document.querySelector('.modelPhone')
// var watch = document.querySelector('.watch')
// var rell = document.querySelector('.rell')
export default {
  name: "Top",
  data() {
    return {
    }
  },
  methods: {
    // Phone
    showPhone(){
      this.$refs.phone.style.display = 'block'
      // console.log(this.$refs.phone)
    },
    hiddenPhone(){
      this.$refs.phone.style.display = 'none'
  },
    // Watch
    showWatch(){
      this.$refs.watch.style.display = 'block'
    },
    hiddenWatch(){
      this.$refs.watch.style.display = 'none'
  },
    // Rell
    showRell(){
      this.$refs.rell.style.display = 'block'
    },
    hiddenRell(){
      this.$refs.rell.style.display = 'none'
  },
  },
  components:{
      Index
    }
};
</script>

<style scoped>
@import "~@/assets/css/Top.css";
</style>
