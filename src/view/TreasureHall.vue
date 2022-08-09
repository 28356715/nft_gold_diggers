<template>
  <section>
    <div><mtHeader /></div>
    <div style="padding: 30px 0 0 30px;">
        <el-tabs v-model="activeName" class="demo-tabs" @tab-click="handleClick">
          <el-tab-pane label="掘金进行中" name="first">
                <!-- <div style="padding: 30px 0 0 30px;"> -->
              <div class = "content-card"
                v-for="item in activityList"
                :key="item.id"
                >
               <el-card>
                  <img v-if="item.url"
                    :src="item.url"
                    class="img-div-row"
                    />
                    <img v-else
                    src="../assets/img/meta.png"
                    class="img-div-row"
                    />
                  <div class="card-div-row">
                        <li class="card-li"> <span> {{item.name}} #{{item.id}}</span> 
                             <img
                               src="../assets/img/network-logo.png"
                            />
                        </li> 
                        <li class="card-li"> <span> 参与门槛:{{item.description}}</span> 
                        </li> 
                        <li class="card-li"> <span> 当前进度:{{item.properties[Object.keys(item.properties)[0]] }}</span> 
                        </li> 
                          <li class="card-li"> <span> 开始时间:{{item.properties[Object.keys(item.properties)[0]] }}</span> 
                        </li> 
                          <li class="card-li"> <span> 结束时间:{{item.properties[Object.keys(item.properties)[0]] }}</span> 
                        </li> 
                        <li class="card-li"><el-button class="button-loot-style">参与夺宝</el-button>
                        </li> 
                    </div>
                </el-card>
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
<script setup lang="ts">
import { ref,onMounted,getCurrentInstance,reactive } from 'vue'
import mtHeader from "../components/PageHeader.vue"
import { GET_ACTIVITY_ALL } from "../flow/scripts/get_activity_all.scripts"


const golbal  = getCurrentInstance()!.appContext.config.globalProperties
let activityList = reactive<Array<any>>([])



 onMounted(async ()=>{
    await getActivityList()
   })




const activeName = ref('first')
// const handleClick = (tab: TabsPaneContext, event: Event) => {
//   console.log(tab, event)
// }
//获取活动列表
  const getActivityList = async () =>{
   try{ 
       console.log("getActivityList====")
       let res = await golbal.$fcl.query({
          cadence: GET_ACTIVITY_ALL,
        })
       console.log("getActivityListgetActivityListgetActivityList===="+res)
         if(res.size!==0){
          res.forEach(e => {
          activityList.push(e)
        })
        }
      }catch(err){
        console.log(err)
      }
 }

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
  width: 40%;
  display: block;
  display:inline-block;
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