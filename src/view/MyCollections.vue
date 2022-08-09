<template>
  <section>
    <div><mtHeader /></div>
    <div style="padding: 30px 0 0 30px;">
        <el-tabs v-model="activeName" class="demo-tabs">
          <el-tab-pane label="collection" name="first">
            <div v-if="collectionNfts.length==0">网络错误 或是 钱包里没有nft,可以去铸造页面铸造专属自己的nft~</div>
            <div v-else>
                <!-- <div style="padding: 30px 0 0 30px;"> -->
                <div class = "content-card-row"
                v-for="nft in collectionNfts"
                :key="nft.id"
                >
               <el-card>
                  <img v-if="nft.url"
                    :src="nft.url"
                    class="img-div-row"
                    />
                    <img v-else
                    src="../assets/img/meta.png"
                    class="img-div-row"
                    />
                  <div class="card-div-row">
                        <li class="card-li"> <span> {{nft.name}} #{{nft.id}}</span> 
                             <img
                               src="../assets/img/network-logo.png"
                            />
                        </li>
                        <li class="card-li" v-if="nft.description.length>20"> 
                             <el-tooltip
                              class="box-item"
                              effect="dark"
                              :content="nft.description"
                              placement="right"
                            >
                              <span> desc:{{nft.description.substring(0,19)}}<span style="color: #D444A3">...</span></span>
                            </el-tooltip>
                         </li> 
                        <li class="card-li" v-else> <span> desc:{{nft.description}}</span> 
                        </li> 
                        <li class="card-li"> <span> type:{{nft.properties[Object.keys(nft.properties)[0]] }}</span> 
                        </li> 
                        <div style="display: flex; align-items: center">
                            <el-popover placement="bottom" :width="400" trigger="click">
                              <template #reference>
                                  <el-button class="button-sell-style" >出售</el-button>
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
                                          <el-input v-model="saleDetails.officialUrl" />
                                     </el-form-item>
                                     <el-form-item>
                                          <el-button  @click="sell_nft(nft,saleDetails)" class="button-sell-style">上架</el-button>
                                     </el-form-item>
                                      </el-form>
                                    </el-popover>
                                    <el-popover placement="bottom" :width="400" trigger="click">
                                      <template #reference>
                                        <el-button class="button-loot-style">发起夺宝任务</el-button>
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
                                        <el-input v-model="activityDetail.partAmount" />
                                        </el-form-item>
                                            <el-form-item label="份数">
                                              <el-radio-group v-model="activityDetail.divisionCount">
                                                <el-radio label="50" />
                                                <el-radio label="100" />
                                                <el-radio label="200" />
                                                <el-radio label="500" />
                                              </el-radio-group>
                                            </el-form-item>
                                            <el-form-item label="持续时长(H)">
                                              <el-radio-group v-model="activityDetail.timeLength">
                                                <el-radio label="24" />
                                                <el-radio label="36"  />
                                                <el-radio label="48" />
                                              </el-radio-group>
                                            </el-form-item>
                                      <el-form-item
                                          prop="url"
                                          label="url介绍"
                                        >
                                          <el-input v-model="activityDetail.url" />
                                        </el-form-item>
                                        <el-form-item>
                                          <el-button @click="CreateActivity(activityDetail,nft.id)" class="button-loot-style">发起掘金</el-button>
                                        </el-form-item>
                                      </el-form>
                                 </el-popover>
                        </div>
                  </div>
                </el-card>  
                <!-- </div> -->
               </div>
             </div>
          </el-tab-pane>
          <el-tab-pane label="我的宝箱" name="second">
            <div>
                <el-row>
                    <el-col :span="6"><div class="grid-content ep-bg-purple" />
                      <el-card>
                           <img
                            src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                            class="img-div-row"
                            />
                            <div class="card-div-row">
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
                            class="img-div-row"
                            />
                            <div class="card-div-row">
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
                            class="img-div-row"
                            />
                            <div class="card-div-row">
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
                            class="img-div-row"
                            />
                            <div class="card-div-row">
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
         <el-table  style="width: 50%;margin-left: 20%;">
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
   import mtHeader from "../components/PageHeader.vue"
   import { ref,onMounted, reactive, toRefs } from 'vue'
   import type { FormInstance } from 'element-plus'
   import  { GET_ACCOUNT_NFT_IDS } from "../flow/scripts/get_account_nft_ids.scripts.js"
   import { GET_ADDRESS_NFT_DETAIL } from "../flow/scripts/get_address_nft_detail.scripts"
   import { getCurrentInstance } from 'vue'
   import { SELL_ITEM } from "../flow/transaction/sell_item.tx"
   import { SELL_NFT } from "../flow/transaction/sell_nft.tx"
   import { SELL_N_ITEM } from "../flow/transaction/sell_n_item.tx"
   import { GET_USER_ACTIVITY } from "../flow/scripts/get_user_activity.scripts"
   import { GET_OWNER_ACTIVITY } from "../flow/scripts/get_owner_activity.scripts"

   const golbal  = getCurrentInstance()!.appContext.config.globalProperties
   let addr = JSON.parse(window.sessionStorage.getItem("CURRENT_USER")!).addr


  
  interface properties {
    key:number;
    value:string;
  }
  interface nft {
    id:string;
    name:string;
    description:string;
    url:string;
    creator:string;
    createTime:string;
    externalUrl:string;
    properties:properties
  }
  interface saleModel {
    price:number;
    url:string;
  }
  interface activeModel {
    name: string, //扩展字段，前端传空
    description: string,//扩展字段，前端传空
    url: string,//url
    saleItemID: number,//nftid 
    partAmount: number, //份数
    createTime: number,//当前时间
    targetAmount: number,//份数=partAmount
    divisionCount: number,//默认值0
    timeLength: number,//时长
  }

  // name: String,//作为保留字段，前端传空串
  //           description: String,//作为保留字段，前端传空串
  //           url: ,
  //           activeStatus: UInt8,//创建的时候，合约给个默认值。前端不传
  //           nftType: Type,//不知道传啥。
  //           saleItemID: UInt64, 
  //           partAmount: UFix64,
  //           createTime: UFix64,//合约new个当前时间，前端不传
  //           targetAmount: UFix64,
  //           divisionCount: UInt64,//不知道传啥。
  //           startTime: UFix64,//合约自己计算
  //           endTime: UFix64,//合约根据持续时长计算

  // interface CreateModel {
  //   name:string;
  //   description:string;
  //   activeStatus:Number;


  // }
   const activeName = ref('first')
   const saleDetails:saleModel = reactive({
    price:0,
    officialUrl:""
   }) 
   const EventDetails = ref({})
   let activityDetail:activeModel = reactive({
    name: "", //扩展字段，前端传空
    description: "",//扩展字段，前端传空
    url: "",//url
    saleItemID: -1,//nftid 
    partAmount: 0, //每份金额
    createTime: 20220704.00,//当前时间
    targetAmount: 0,//partAmount*divisionCount
    divisionCount: 0,//默认值0
    timeLength: 0,//时长
   })
   let collectionNfts = reactive<Array<nft>>([])
   const formRef = ref<FormInstance>()
   const eventFormRef = ref<FormInstance>()
   const flow  = getCurrentInstance()!.appContext.config.globalProperties
   var userWalletAddress = ref("")
   const userinfo = ref({})
 

   onMounted(async ()=>{
    await detail()
    // await getOwnerActivityList()
    // await getActivityList()
   })


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
      console.log('submit!====='+valid)
    } else {
      console.log('error submit!')
      return false
    }
  })
}  


 const getNftList = async () =>{
   try{ 
       let res = await flow.$fcl.query({
          cadence:GET_ACCOUNT_NFT_IDS,
           args:(arg,t)=>[
            arg(addr,t.Address),
          ]
        })
        console.log("res==========="+JSON.stringify(res))

      }catch(err){
        console.log("err==========="+err)
      }
 }
//我是掘金者
  const getActivityList = async () =>{
   try{ 
           console.log("GET_USER_ACTIVITY====")

       let res = await flow.$fcl.query({
          cadence: GET_USER_ACTIVITY,
          args:(arg,t)=>[
            arg(addr,t.Address),
          ]
        })
       console.log("huodong===="+res)
      }catch(err){
        console.log(err)
      }
 }
//我的宝箱
 const getOwnerActivityList = async () =>{
  console.log("getOwnerActivityList===")
   try{ 
       let res = await flow.$fcl.query({
          cadence: GET_OWNER_ACTIVITY,
          args:(arg,t)=>[
            arg(addr,t.Address),
          ]
        })
  console.log("getOwnerActivityList==="+res)
      }catch(err){
        console.log(err)
      }
 }
//nft list

  const detail = async () =>{
    console.log("erroooooooo===========")

   try{ 
       let res = await flow.$fcl.query({
          cadence:GET_ADDRESS_NFT_DETAIL,
          args:(arg,t)=>[
            arg(addr,t.Address),//recipient: Address,
          ],
        })
        console.log("erroooooooo==========="+JSON.stringify(res))

        if(res.size!==0){
          res.forEach(element => {
          collectionNfts.push(element)
        });
        }
      }catch(err){
        console.log("err==========="+err)
      }
 }
//nft上架
const sell_nft =  async (nft,saleDetails) =>{
  console.log("id====="+JSON.stringify(nft.properties)+"===price====="+saleDetails.price)
    try{
        let res=await golbal.$fcl.mutate({
          cadence: SELL_NFT,
          args:(arg,t)=>[
            arg(nft.id,t.UInt64),//ecipient: Address,
            arg(nft.url,t.String),
            arg(saleDetails.price,t.UFix64),//name: String
            arg(nft.name,t.String),
            arg(nft.description,t.String),
            arg(saleDetails.officialUrl,t.String),
            arg(addr,t.Address),
          ],
        })
        await golbal.$fcl.tx(res).onceSealed()
        console.log("res======="+res)
        // await getFUSDBalance();
        // await addDappy(templateID);
      }catch(err){
        console.log("err========="+err)
      }
 }
 const sell_item =  async (id,price) =>{
  console.log("id====="+id+"===price====="+price)
    try{
        let res=await golbal.$fcl.mutate({
          cadence:SELL_ITEM,
          args:(arg,t)=>[
            arg(id,t.UInt64),//ecipient: Address,
            // arg(price,t.UFix64),//name: String
            arg('1.3',t.UFix64),
          ],
        })
        await golbal.$fcl.tx(res).onceSealed()
        console.log("res======="+res)
        // await getFUSDBalance();
        // await addDappy(templateID);
      }catch(err){
        console.log("err========="+err)
      }
 }


//创建活动
const CreateActivity =  async (activityForm,saleItemID) =>{

  console.log("activityForm==="+JSON.stringify(activityForm))
  console.log("saleItemID==="+saleItemID)
  console.log("SHENGFA==="+activityForm.divisionCount*activityForm.partAmount)

    try{
        let res=await golbal.$fcl.mutate({
          cadence:SELL_N_ITEM,
          args:(arg,t)=>[
            arg(activityForm.name,t.String),
            arg(activityForm.description,t.String),
            arg(activityForm.url,t.String),
            arg(saleItemID,t.UInt64),
            arg(activityForm.partAmount,t.UFix64),
            arg(activityDetail.timeLength*60*60+'.0',t.UFix64),
            arg(activityForm.divisionCount*activityForm.partAmount,t.UFix64),
            arg(activityForm.divisionCount,t.UInt64),
            arg(activityForm.timeLength,t.UFix64),
          ],
        })
        await golbal.$fcl.tx(res).onceSealed()
        console.log("res======="+res)
      }catch(err){
        console.log("err========="+err)
      }
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