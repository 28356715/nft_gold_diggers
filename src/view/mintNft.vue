<template>
  <div>
    <div>
        <mtHeader></mtHeader>
    </div>
    <div class="form-postion">
        <el-form :model="form" label-width="120px">
          <el-form-item label="图片" class="item">
            <el-upload
              class="upload-demo"
              action="#"
              :on-change="handleChange"
              :auto-upload="false"
              :file-list="fileList"
              :limit="1"
              list-type="picture">
              <el-button size="small" type="primary">点击上传</el-button>
              <div  class="el-upload__tip">只能上传jpg/png文件，且只能上传一张，重复上传会覆盖前一张图片</div>
            </el-upload>
          </el-form-item>
          <el-form-item label="name" class="item">
            <el-input v-model="form.name" />
          </el-form-item>
          <el-form-item label="属性" class="item">
              <el-radio-group v-model="form.properties">
              <el-radio 
              v-for="item in propertiesList"
              :key="item.key"
              :label="item.key">{{item.value}}</el-radio>
              </el-radio-group>
          </el-form-item>
          <el-form-item label="介绍" class="item">
            <el-input v-model="form.desc" type="textarea" />
          </el-form-item>
          <el-form-item>
            <el-button type="primary" class="mt-button" @click="mintNft">铸造</el-button>
          </el-form-item>
        </el-form>
    </div>
  </div>
</template>

<script setup lang="ts" >
import mtHeader from "../components/PageHeader.vue"
import { MINT_NFT } from "../flow/transaction/mint_nft.tx"
import { ref, toRef,reactive } from 'vue'
import * as IPFS from 'ipfs-core'
import { getCurrentInstance } from 'vue'
import { Action, ElMessage, ElMessageBox } from 'element-plus'

interface properties {
  key:string;
  value:string;
}



const golbal  = getCurrentInstance()!.appContext.config.globalProperties
const fileList = ref([]);
const propertiesList:Array<properties> = reactive([{key:"01",value:"Art"},{key:"02",value:"Music"},{key:"03",value:"Video"},{key:"04",value:"Virtual Worlds"}])

// const file = {}
const form = reactive({
  name: '',
  desc: '',
  url:'',
  externalUrl:'',
  properties:'01'
})

const handleRemove = (file, fileList)=>{
        console.log(file, fileList)
      }
      //处理change文件系统
const handleChange =async (file)=>{
const ipfs = await IPFS.create()
    // console.log("进入到这个change方法里边了==="+file.name)
const myFile= {
              path:'/tmp/'+ file.name,
              content:'test img'
              }
    console.log("开始执行这个方法了了==="+myFile)
    const result = await ipfs.add(myFile)
    console.info(result)
    // console.log("进入到这个change方法里边了==="+JSON.stringify(result))
    }

const onSubmit = () => {
  console.log('submit!')
}

const mintNft = async ()=>{
   try{
      let addr = JSON.parse(window.sessionStorage.getItem("CURRENT_USER")!).addr
      console.log("addr======"+addr)
        let name = form.name
        let desc = form.desc
        let now = Date.parse(new Date().toString())/1000+'.0'
        console.log(new Date())
                

        const property = propertiesList.find( e => {
          e.key == form.properties
          return e
        })
        if (addr==null) {
          ElMessageBox.alert('先链接钱包~', {
            confirmButtonText: 'OK',
            type:'error',
          })
          return 
        }

         if (name=="") {
          ElMessageBox.alert('name不能为空~', {

            confirmButtonText: 'OK',
            type:'error',
          })
          return 
        }
           if (desc=="") {
          ElMessageBox.alert('desc不能为空~', {

            confirmButtonText: 'OK',
            type:'error',
          })
          return 
        }
        console.log("now==="+now)

        let res=await golbal.$fcl.mutate({
          cadence:MINT_NFT,
          args:(arg,t)=>[
            arg(addr,t.Address),//ecipient: Address,
            arg(name,t.String),//name: String
            arg(desc,t.String),//escription: String
            arg("https://ipfs.io/ipfs/QmSWoRgRzjb1t76tj2owXwb1APbSWUeAfz46W8ZxvevxKV",t.String),//url.String,
            arg(addr,t.Address),//creator: Address,
            arg(now,t.UFix64),//createTime: UFix64,
            arg("",t.String),//externalUrl
            arg(property,t.Dictionary({ key: t.String, value: t.String })),//properties: {String:String}?)
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


</script>
<style>
.item .el-form-item__label{
    /* color: rgba(0, 0, 0, 0.707); */
    font-weight: 500;
  }
  .form-postion {
    margin-left: 20%;
    margin-top: 5%;
    width: 45%;
  }
  /* 选中后的字体颜色 */
.el-radio__input.is-checked + .el-radio__label {
  color: #d4b728 !important;
}
/* 选中后小圆点的颜色 */
.el-radio__input.is-checked .el-radio__inner {
  background: #d4b728 !important;
  border-color: #d4b728 !important;
}
.mt-button {
  padding: 2;
  min-height: auto;
  /* background-color: rgb(165, 118, 42); */
  color: white;
  background-image: linear-gradient(to right, #D444A3,#E4505F,#D74698);
}

</style>