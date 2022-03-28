<template>
  <div>
    <div id="container">
      <div id="list" style="left:-1530px">
          <img src="../assets/img/NewsBanner5.jpg" alt="5" />
          <img src="../assets/img/NewsBanner1.jpg" alt="1" />
          <img src="../assets/img/NewsBanner2.jpg" alt="2" />
          <img src="../assets/img/NewsBanner3.jpg" alt="3" />
          <img src="../assets/img/NewsBanner4.jpg" alt="4" />
          <img src="../assets/img/NewsBanner5.jpg" alt="5" />
          <img src="../assets/img/NewsBanner1.jpg" alt="1" />
      </div>
      <div id="pointsDiv">
        <span index="1" class="on"></span>
        <span index="2"></span>
        <span index="3"></span>
        <span index="4"></span>
        <span index="5"></span>
      </div>
      <a href="javascript:;" id="prev" class="arrow">&lt;</a>
      <a href="javascript:;" id="next" class="arrow">&gt;</a>
    </div>
  </div>
</template>

<script>
export default {
  name: "Banner",
  mounted() {
    var container = document.getElementById("container")
    var list = document.getElementById("list")
    var pointsDiv = document.getElementById("pointsDiv")
    var prev = document.getElementById("prev")
    var next = document.getElementById("next")
    //获取所有的图片
    var imgArr = document.getElementsByTagName("img")
    //获取所有的下标
    var points = document.querySelectorAll("#pointsDiv>span")
    //获取到下标的数量
    var imgCount = points.length
    //定义一个定时器变量
    var timer
    //默认图片索引
    var index = 0
    //一页的宽度
    var PAGE_WIDTH = 1530
    //动画总时长
    var TIME = 600
    //动画执行的间隔时间
    var ITEM_TIME = 30
    // 定义初始翻页状态
    var moving = false
    let pointsIndex

    //动态设置list的宽
    list.style.width = imgArr.length * 1530 + "px"

    //动态设置导航栏的left值
    pointsDiv.style.left =
      (container.offsetWidth - pointsDiv.offsetWidth) / 2 + "px"

    // 1. 点击向右(左)的图标, 平滑切换到下(上)一页
    prev.onclick = function () {
      // 平滑到上一页
      nextPage(false)
      console.log(imgCount)
    }

    next.onclick = function () {
      // 平滑到下一页
      nextPage(true)
    }

    // 3. 每隔2s自动滑动到下一页
    timer = setInterval(function () {
      nextPage(true)
    }, 4000)

    // 4.当鼠标进入图片区域时, 自动切换停止, 当鼠标离开后,又开始自动切换
    container.onmouseenter = function () {
      clearInterval(timer);
    }
    container.onmouseleave = function () {
      timer = setInterval(function () {
        nextPage(true)
      }, 4000)
    }

    /*
        点击圆点切换图片
            */
    for (let i = 0; i < points.length; i++) {
      points[i].num = i
      points[i].onclick = function () {
        //获取当前元素的索引
        pointsIndex = this.num
        //当点击的圆点与当前圆点不一样时，再翻页
        if (pointsIndex != index) {
          nextPage(pointsIndex)
        }
      }
    }

    /*
        翻页效果函数
    */
    function nextPage(event) {
      // 总的偏移量：offset
      // 总时间：TIME=400
      // 单元移动的间隔时间：ITEM_TIME = 20
      // 单元移动的偏移量：itemOffset = offset/(TIME/ITEM_TIME)

      //如果正在翻页，则取消操作
      if (moving) {
        return
      }

      moving = true

      var offset = 0
      if (typeof event === "boolean") {
        offset = event ? -PAGE_WIDTH : PAGE_WIDTH
      } else {
        offset = -(event - index) * PAGE_WIDTH
      }

      //单位时间的偏移量
      var itemOffset = offset / (TIME / ITEM_TIME)

      // 获取到当前的left值
      var currLeft = list.offsetLeft

      //获取目标left值
      var targetLeft = offset + currLeft

      var intervalId = setInterval(function () {
        //更新当前的left值
        currLeft += itemOffset

        //当currLeft到达targetLeft的时停止定时器
        if (currLeft === targetLeft) {
            // currLeft = targetLeft
          clearInterval(intervalId)

          moving = false;
          // 2. 无限循环切换: 第一页的上一页为最后页, 最后一页的下一页是第一页
          if (currLeft === -(imgCount + 1) * PAGE_WIDTH) {
            // 如果到达了最右边的图片(1.jpg), 跳转到最左边的第2张图片(1.jpg)
            currLeft = -PAGE_WIDTH
          } else if (currLeft === 0) {
            // 如果到达了最左边的图片(5.jpg), 跳转到最右边的第2张图片(5.jpg)
            currLeft = -imgCount * PAGE_WIDTH;
          }
          // 更新圆点
          updataPoint(event);
        }

        list.style.left = currLeft + 'px'
      }, ITEM_TIME);
    }

    /*
        更新圆点函数
    */
    // 5. 切换页面时, 下面的圆点也同步更新
    function updataPoint(event) {
     let targetIndex = 0;
      if (typeof event === "boolean") {
        if (event) {
          targetIndex = index + 1;
          if (targetIndex === imgCount) {
            targetIndex = 0
          }
        } else {
          targetIndex = index - 1
          if (targetIndex === -1) {
            targetIndex = imgCount - 1
          }
        }
      } else {
        targetIndex = event
      }

      //将原本的圆点样式去除
      points[index].className = ""
      //给目标圆点加上on类
      points[targetIndex].className = "on"
      //更新index值
      index = targetIndex
    }
  },
}
</script>

<style scope>
@import '~@/assets/css/Banner.css';
</style>