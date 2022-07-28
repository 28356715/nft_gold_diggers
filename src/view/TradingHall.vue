<template>
  <section>
    <div><mtHeader /></div>
    <div style="padding: 30px 0 0 30px;">
                <el-row>
                    <el-col :span="4"><div class="grid-content ep-bg-purple" />
                      <el-card>
                           <img
                            src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                            class="image-trade"
                            />
                            <div class="card-content">
                                <li class="card-li"> <span> 一只猴子#123</span> 
                                    <img
                            src="../assets/img/network-logo.png"
                            />
                                </li> 
                                <li class="card-li">价格：100flow</li>
                                <el-button  class="button-loot">Buy Now</el-button>
                            </div>
                      </el-card>
                    </el-col>
                    <el-col :span="4"><div class="grid-content ep-bg-purple" />
                    <el-card>
                           <img
                            src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                            class="image-trade"
                            />
                            <div class="card-content">
                                <li class="card-li"> <span> 一只猴子#123</span> </li>
                                 <li class="card-li">价格：100flow</li>
                                <el-button  class="button-loot">Buy Now</el-button>
                            </div>
                      </el-card></el-col>
                    <el-col :span="4"><div class="grid-content ep-bg-purple" /><el-card>
                           <img
                            src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                            class="image-trade"
                            />
                            <div class="card-content">
                                <li class="card-li"> <span> 一只猴子#123</span> </li>
                                <li class="card-li">价格：100flow</li>
                                <el-button  class="button-loot">Buy Now</el-button>
                            </div>
                      </el-card></el-col>
                    <el-col :span="4"><div class="grid-content ep-bg-purple" /><el-card>
                           <img
                            src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                            class="image-trade"
                            />
                            <div class="card-content">
                                <li class="card-li"> <span> 一只猴子#123</span> </li>
                                <li class="card-li">价格：100flow</li>
                                <el-button  class="button-loot">Buy Now</el-button>
                            </div>
                      </el-card></el-col>
                      <el-col :span="4"><div class="grid-content ep-bg-purple" /><el-card>
                           <img
                            src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                            class="image-trade"
                            />
                            <div class="card-content">
                                <li class="card-li"> <span> 一只猴子#123</span> </li>
                                <li class="card-li">价格：100flow</li>
                                <el-button  class="button-loot">Buy Now</el-button>
                            </div>
                      </el-card></el-col>
                      <el-col :span="4"><div class="grid-content ep-bg-purple" /><el-card>
                           <img
                            src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                            class="image-trade"
                            />
                            <div class="card-content">
                                <li class="card-li"> <span> 一只猴子#123</span> </li>
                                <li class="card-li">价格：100flow</li>
                                <el-button  class="button-loot">Buy Now</el-button>
                            </div>
                      </el-card></el-col>
                </el-row>
    </div>
  </section>
</template>
<script setup >
import { ref } from 'vue'
import mtHeader from "../components/PageHeader.vue"
const currentDate = ref(new Date())
// import type { TabsPaneContext } from 'element-plus'

const activeName = ref('first')
// const handleClick = (tab: TabsPaneContext, event: Event) => {
//   console.log(tab, event)
// }
</script>

<style>
.demo-tabs > .el-tabs__content {
  padding: 32px;
  color: #6b778c;
  font-size: 32px;
  font-weight: 600;
}
.card-li {
  font-size: 15px;
  line-height: 30px;
  color: rgb(7, 7, 7);
}
.card-content {
  /* margin-top: 13px; */
  line-height: 12px;
  padding-left: 15px;
  padding-right: 0px;
  /* display: flex; */
  /* justify-content: space-between; */
  /* align-items: center; */
}
.image-trade {
  width: 100%;
  display: block;
  display:inline-block;
}

.button-loot {
  padding: 2;
  min-height: auto;
  /* background-color: rgb(165, 118, 42); */
  color: white;
  background-image: linear-gradient(to right, #D444A3,#E4505F,#D74698);
}
.el-card {
    height: 90%;
    background-color: #EFE9E1;
    margin: 15px;
}
.demo-tabs > .el-tabs__content {
    font-weight:30;
}
</style>