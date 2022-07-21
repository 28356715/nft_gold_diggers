<template>
  <el-menu
    :default-active="activeIndex"
    class="el-menu-demo"
    mode="horizontal"
    text-color="black"
    active-text-color="#3781ED"
    :ellipsis="false"
    @select="handleSelect"
    style="font-weight:700"
  >
    <el-menu-item index="0">
      <img style="margin:8%" src="../assets/img/logo.png" />
    </el-menu-item>
    <div class="flex-grow" />
    <el-menu-item index="1" @click="gohome">MarketPlace</el-menu-item>
    <el-menu-item index="2" @click="goMintNft">MintNft</el-menu-item>
    <el-menu-item index="3">Collection</el-menu-item>
    <el-menu-item v-if="!userWalletAddress" index="4" @click="login">login</el-menu-item>
    <el-menu-item v-else index="4" @click="logout">logout</el-menu-item>
  </el-menu>
</template>

<script setup>
import { useRouter } from  'vue-router'
import { ref } from 'vue'
import { getCurrentInstance } from 'vue'

const activeIndex = ref(1)
var userWalletAddress = ref("")

//导航
const router = useRouter()

const  goMintNft = (()=>{
   router.push({ path: '/mint' })
   activeIndex.value = 2
})
const  gohome = (()=>{
   router.push({ path: '/home' })
   activeIndex.value = 1
})
//用户信息
const flow  = getCurrentInstance().appContext.config.globalProperties

const setUser = ((user)=>{
  userinfo.value = user
  userWalletAddress.value =  user.addr
  console.log("ddd=="+JSON.stringify(userWalletAddress))

})
const userinfo = ref(flow.$fcl.currentUser.subscribe(setUser))


 const login = ( async ()=>{
       await flow.$fcl.authenticate()
       await flow.$fcl.currentUser.subscribe(setUser)
})
 const logout = ( async ()=>{
        await flow.$fcl.unauthenticate()
        userWalletAddress.value =  ""
})

  
  // export default {
  //   data() {
  //     return {
  //       activeIndex: '1',
  //       userinfo:{}
  //     };
  //   },
  //   methods: {
  //     handleSelect(key, keyPath) {
  //       console.log(key, keyPath);
  //     },
  //     goMintNft(){
  //       this.$router.push('/mint')
  //       this.activeIndex='3'
  //     },
  //     gohome(){
  //       this.$router.push({
  //         path:'/'
  //       })
  //       this.activeIndex='1'
  //     },
  //   setUser(user){
  //     this.userinfo = user
  //     console.log("user===="+this.userinfo.addr)
  //   },
  //     login(){
  //      this.fcl.authenticate()
  //      this.userinfo = this.fcl.currentUser.subscribe(this.setUser)
  //   },
  //   }
  // }
</script>

<style >
.flex-grow {
  flex-grow: 1;
}
 .mt-header{
     background-color: #199568e2;
     height: 20px;
 }
 .nav-font{
    color:"#9f6ab9";
    font-size:14px;
    font-weight:700;
 }
</style>