<template>
<div class="div-relative">
  <el-menu
    :default-active="activeIndex"
    class="el-menu-demo div-menu "
    mode="horizontal"
    text-color="black"
    active-text-color="#3781ED"
    :ellipsis="false"
    @select="handleSelect"
    style="font-weight:700;height: 45px;"
    background-color="#ffffff00"
  >
    <div class="flex-grow"  />
    <el-menu-item class="menu-item-font" index="1" @click="gohome">夺宝大厅</el-menu-item>
    <el-menu-item class="menu-item-font" index="2" @click="goTrade">交易市场</el-menu-item>
    <el-menu-item class="menu-item-font" index="3" @click="goMintNft">铸造</el-menu-item>
     <el-menu-item  class="menu-item-font" index="4" @click="goCollections">Collections</el-menu-item>
    <!-- <el-menu-item class="menu-item-font" index="4" @click="logout">Connet Wallet</el-menu-item> -->
    <el-menu-item  class="menu-item-font" v-if="!userWalletAddress" index="4" @click="login">Connet Wallet</el-menu-item>
    <el-menu-item class="menu-item-font"  v-else index="4" @click="logout">Log out</el-menu-item>
  </el-menu>
  </div>
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
   activeIndex.value = 3
})

const  goTrade = (()=>{
   router.push({ path: '/trade' })
   activeIndex.value = 2
})
const  gohome = (()=>{
   router.push({ path: '/loot' })
   activeIndex.value = 1
})
const  goCollections = (()=>{
   router.push({ path: '/collections' })
   activeIndex.value = 4
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
 .header-backgroud{
  background: url("../assets/img/header.png") no-repeat center center;
  background-size: 100% 100%;
  height: 222px;
 }
 .menu-item-font{
  font-size: 18px;

 }
  .menu-item-font:hover{
    background-image: linear-gradient(to right, #ED1E79,#522785);
    color: #ffffff!important;
 }

 .div-relative{
  position:relative;
  background: url("../assets/img/header.png") no-repeat center center;
  background-size: 100% 100%;
  height: 222px;
  }
  .div-menu{ 
    position:absolute; 
    left: 50%;
    top:74%;
    color: black;
    width: 250px;
    /* margin-bottom: 1%; */
  } 
 .el-menu--horizontal{
    border-bottom-color: #ffffff00!important;
  }
</style>