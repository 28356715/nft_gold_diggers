<template>
  <section>
    <div><mtHeader /></div>
    <div style="padding: 30px 0 0 30px;">
        <el-tabs v-model="activeName" class="demo-tabs" @tab-click="handleClick">
          <el-tab-pane label="掘金进行中" name="first">
            <div>
                <el-row>
                    <el-col :span="6"><div class="grid-content ep-bg-purple" />
                      <el-card>
                           <img
                            src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                            class="image"
                            />
                            <div class="card-content">
                                <li class="card-title"> <span> 一只猴子#123</span> 
                                    <img
                            src="../assets/img/network-logo.png" class="icon"
                            />
                                </li> 
                                <li class="card-li">参与门槛：1Flow</li>
                                <li class="card-li">当前进度：50/100</li>
                                <li class="card-li">开始时间：2022.7.20 10:24</li>
                                <li class="card-li">结束时间：2022.7.20 10:24</li>
                                <el-button  class="button-loot">参与夺宝</el-button>
                            </div>
                      </el-card>
                    </el-col>
                    <el-col :span="6"><div class="grid-content ep-bg-purple" />
                    <el-card>
                           <img
                            src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                            class="image"
                            />
                            <div class="card-content">
                                <li class="card-title">一只猴子#123</li> 
                                <li class="card-li">参与门槛：1Flow</li>
                                <li class="card-li">当前进度：50/100</li>
                                <li class="card-li">开始时间：2022.7.20 10:24</li>
                                <li class="card-li">结束时间：2022.7.20 10:24</li>
                                <el-button  class="button-loot">参与夺宝</el-button>
                            </div>
                      </el-card></el-col>
                    <el-col :span="6"><div class="grid-content ep-bg-purple" /><el-card>
                           <img
                            src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                            class="image"
                            />
                            <div class="card-content">
                                <li class="card-title">一只猴子#123</li> 
                                <li class="card-li">参与门槛：1Flow</li>
                                <li class="card-li">当前进度：50/100</li>
                                <li class="card-li">开始时间：2022.7.20 10:24</li>
                                <li class="card-li">结束时间：2022.7.20 10:24</li>
                                <el-button  class="button-loot">参与夺宝</el-button>
                            </div>
                      </el-card></el-col>
                    <el-col :span="6"><div class="grid-content ep-bg-purple" /><el-card>
                           <img
                            src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                            class="image"
                            />
                            <div class="card-content">
                                <li class="card-title">一只猴子#123</li> 
                                <li class="card-li">参与门槛：1Flow</li>
                                <li class="card-li">当前进度：50/100</li>
                                <li class="card-li">开始时间：2022.7.20 10:24</li>
                                <li class="card-li">结束时间：2022.7.20 10:24</li>
                                <el-button  class="button-loot">参与夺宝</el-button>
                            </div>
                      </el-card></el-col>
                </el-row>
            </div>
          </el-tab-pane>
          <el-tab-pane label="掘金已结束" name="second">
            <div>
                <el-row>
                    <el-col :span="6"><div class="grid-content ep-bg-purple" />
                      <el-card>
                           <img
                            src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                            class="image"
                            />
                            <div class="card-content">
                                <li class="card-title"> <span> 一只猴子#123</span> 
                                    <img
                            src="../assets/img/network-logo.png" class="icon"
                            />
                                </li> 
                                <li class="card-li">参与门槛：1Flow</li>
                                <li class="card-li">当前进度：50/100</li>
                                <li class="card-li">开始时间：2022.7.20 10:24</li>
                                <li class="card-li">结束时间：2022.7.20 10:24</li>
                                <img class="card-content-img"
                                  src="../assets/img/success.png"
                                 />
                            </div>
                      </el-card>
                    </el-col>
                    <el-col :span="6"><div class="grid-content ep-bg-purple" />
                    <el-card>
                           <img
                            src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                            class="image"
                            />
                            <div class="card-content">
                                <li class="card-title">一只猴子#123</li> 
                                <li class="card-li">参与门槛：1Flow</li>
                                <li class="card-li">当前进度：50/100</li>
                                <li class="card-li">开始时间：2022.7.20 10:24</li>
                                <li class="card-li">结束时间：2022.7.20 10:24</li>
                                 <img class="card-content-img"
                                  src="../assets/img/fail.png"
                                 />
                            </div>
                      </el-card></el-col>
                    
                </el-row>
            </div>
          </el-tab-pane>
        </el-tabs>
    </div>

  </section>
</template>
<script setup >
import { ref } from 'vue'
import mtHeader from "../components/Header.vue"
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
  display:inline-block;
  position: relative;
}
.card-content-img{
  position: absolute;
  left:60px;
  top: 100px;
}

.button-loot {
  padding: 2;
  min-height: auto;
  /* background-color: rgb(165, 118, 42); */
  color: white;
  background-image: linear-gradient(to right, #D444A3,#E4505F,#D74698);
}
.card-title {
  font-size: 20px;
  line-height: 50px;
  color: rgb(7, 7, 7);
}
.image {
  width: 45%;
  display: block;
  display:inline-block;
}
.icon {

}
.el-card {
    height: 100%;
    background-color: #EFE9E1;
    margin: 15px;
}
.demo-tabs > .el-tabs__content {
    font-weight:30;
}
</style>