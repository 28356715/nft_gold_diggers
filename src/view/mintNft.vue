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
              <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且只能上传一张，重复上传会覆盖前一张图片</div>
            </el-upload>
          </el-form-item>
          <el-form-item label="Title" class="item">
            <el-input v-model="form.title" />
          </el-form-item>
          <el-form-item label="Type" class="item">
              <el-radio-group v-model="form.type">
                <el-radio :label="3">History</el-radio>
                <el-radio :label="6">Person</el-radio>
              </el-radio-group>
          </el-form-item>
          <el-form-item label="Desc" class="item">
            <el-input v-model="form.desc" type="textarea" />
          </el-form-item>
          <el-form-item>
            <el-button type="primary" >Create</el-button>
          </el-form-item>
        </el-form>
    </div>
  </div>
</template>

<script setup>
import mtHeader from "../components/Header.vue"
import { ref, toRef } from 'vue'
import * as IPFS from 'ipfs-core'

const fileList = ref([]);
// const file = {}
const form = ref({
  title: '',
  type: 3,
  resource: '',
  desc: '',
  url:'',
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


</style>