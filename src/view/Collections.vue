<template>
  <section>
    <div><mtHeader /></div>
    <div style="padding: 30px 0 0 30px;">
        <el-tabs v-model="activeName" class="demo-tabs" @tab-click="handleClick">
          <el-tab-pane label="collection" name="first">
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

                                  <div style="display: flex; align-items: center">
                                    <el-popover placement="right" :width="400" trigger="click">
                                      <template #reference>
                                        <el-button style="margin-right: 16px">出售</el-button>
                                      </template>
                                     <el-form
                                        ref="formRef"
                                        :model="saleDetails"
                                        label-width="120px"
                                        class="demo-dynamic"
                                      >
                                        <el-form-item
                                          prop="price"
                                          label="售价"
                                          :rules="[
                                            {
                                              required: true,
                                              message: '售价不能为空',
                                              trigger: 'blur',
                                            },
                                          ]"
                                        >
                                          <el-input v-model="saleDetails.price" />
                                        </el-form-item>
                                      <el-form-item
                                          prop="url"
                                          label="url介绍"
                                        >
                                          <el-input v-model="saleDetails.url" />
                                        </el-form-item>
                                        <el-form-item>
                                          <el-button @click="sell(formRef)">上架</el-button>
                                        </el-form-item>
                                      </el-form>
                                    </el-popover>
                                    <el-popover placement="right" :width="400" trigger="click">
                                      <template #reference>
                                        <el-button style="margin-right: 16px">发起夺宝任务</el-button>
                                      </template>
                                      <el-form
                                        ref="eventFormRef"
                                        :model="EventDetails"
                                        label-width="120px"
                                        class="demo-dynamic"
                                      >
                                        <el-form-item
                                          prop="price"
                                          label="售价"
                                          :rules="[
                                            {
                                              required: true,
                                              message: '售价不能为空',
                                              trigger: 'blur',
                                            },
                                          ]"
                                        >
                                          <el-input v-model="EventDetails.price" />
                                        </el-form-item>
                                            <el-form-item label="份数">
                                              <el-radio-group v-model="EventDetails.phr">
                                                <el-radio label="50" />
                                                <el-radio label="100" />
                                                <el-radio label="200" />
                                                <el-radio label="500" />
                                              </el-radio-group>
                                            </el-form-item>
                                            <el-form-item label="持续时长">
                                              <el-radio-group v-model="EventDetails.duration">
                                                <el-radio label="24小时" />
                                                <el-radio label="36小时" />
                                                <el-radio label="48小时" />
                                              </el-radio-group>
                                            </el-form-item>
                                      <el-form-item
                                          prop="url"
                                          label="url介绍"
                                        >
                                          <el-input v-model="EventDetails.url" />
                                        </el-form-item>
                                        <el-form-item>
                                          <el-button @click="sponsor(eventFormRef)">发起掘金</el-button>
                                        </el-form-item>
                                      </el-form>
                                    </el-popover>
                                  </div>
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
          </el-tab-pane>
          <el-tab-pane label="我的宝箱" name="second">
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
           <el-tab-pane label="我是掘金者" name="third">
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
                                <li class="card-li">掘金王：</li>
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
           <el-tab-pane label="掘金奖励" name="fourth">
         <el-table :data="tableData" style="width: 50%;margin-left: 20%;">
            <el-table-column prop="date" label="奖励时间" width="180" />
            <el-table-column prop="name" label="类型" width="180" />
            <el-table-column prop="address" label="数量" />
         </el-table>
          </el-tab-pane>
        </el-tabs>
    </div>
  </section>
</template>
<script setup lang="ts">
   import mtHeader from "../components/Header.vue"
   import { ref } from 'vue'
   import type { FormInstance } from 'element-plus'

  const activeName = ref('first')
   const saleDetails = ref({})
   const EventDetails = ref({})
   const formRef = ref<FormInstance>()
   const eventFormRef = ref<FormInstance>()

  const sell = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      console.log('submit!')
    } else {
      console.log('error!')
      return false
    }
  })
}

  const sponsor = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      console.log('submit!')
    } else {
      console.log('error submit!')
      return false
    }
  })
}




</script>
<style>
 .activity-stauts {
  background-image: linear-gradient(to right, #BB94FE,#3AD3FD,#BB94FE);
 }
 .activity-icon{
  font-size: 18px;
 }

</style>