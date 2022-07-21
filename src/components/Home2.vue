<template>
<section>
    <div class='container'  >
      <Vhead></Vhead>
      <div style="margin:100px">{{userinfo.addr}}</div>
        <el-button type='primary' @click="login">login</el-button>
        <el-button type='primary' @click="logout">logout</el-button>
        <div>
          <el-button type='primary' @click="list">显示list</el-button>
          <el-button type='primary' @click="checkCollection">checkCollection</el-button>
          <div>显示用户地址：{{collection}}</div>
        </div>
       <div>
          <el-button type='primary' @click="transation">交易</el-button>
          <div>显示交易id=={{transation1}}</div>
        </div>
        <div>
          <el-button type='primary' @click="delCollection">删除交易</el-button>
          <div>删除交易=={{del1}}</div>
        </div>
        <div>
          <el-button type='primary' @click="mintNft">铸造NFT</el-button>
          <div>铸造的nftId=={{nftDna}}</div>
        </div>
        <div>
          <el-button type='primary' @click="mintNft">我的nft-list</el-button>
          <div>nft-list======={{nfts}}</div>
        </div>
    </div>
    </section>
</template>
 
<script>
import { LIST_TEMPLATES } from "../flow/list-templates.script"
import { HELLO_TEST } from "../flow/hello-test.script"
import {CHECK_COLLECTION} from "../flow/check-collection.script"
import {CREATE_COLLECTION} from "../flow/create-collection.tx"
import { DELETE_COLLECTION } from "../flow/delete-collection.tx"
import { LIST_USER_DAPPIES } from "../flow/list-user-dappies.script"
import { MINT_DAPPY } from "../flow/mint-dappy.tx"


export default {
  data(){
    return{
      userinfo:{},
      collection:{},
      transation1:"",
      del1:"",
      nftDna:"",
      nfts:"",
    }
  },
  methods:{
    logout(){
      this.fcl.unauthenticate()
    },
    setUser(user){
      this.userinfo = user
    },
    login(){
       this.fcl.authenticate()
       this.userinfo = this.fcl.currentUser.subscribe(this.setUser)
    },
    async list(){
      let res = await this.fcl.query({
        cadence:HELLO_TEST,
         args:(arg,t)=>[
           arg("liyun",t.String)
      ]},
      )
      console.log("query======"+res)
    },
    // async list(){
    //   const code =  `
    //     import Hello from 0xTEST
    //      pub fun main(name:String):String{
    //       return Hello.sayHi(to:name)
    //     }
    //     `
    //   const res = await this.fcl.send([
    //     this.fcl.script(code),
    //     this.fcl.args([
    //       this.fcl.arg("liuliyun",this.fcl.t.String)
    //     ])
    //   ]).then(this.fcl.decode)
    //   console.log("dddd=="+res)
    //   }

    async checkCollection(){
      try {
        let res = await this.fcl.query({
        cadence:CHECK_COLLECTION,
        args:(arg,t)=>[arg(this.userinfo.addr,t.Address)]
        })
        this.collection = res
        console.log("query=="+res)
      }catch(err){
        console.log(err);
      }
    },
  async transation(){
      try {
        let res = await this.fcl.mutate({
        cadence:CREATE_COLLECTION,
        limit:55,
        })
        await this.fcl.tx(res).onceSealed()
        this.transation1=res
        console.log("transation======"+res)
      }catch(err){
        console.log(err);
      }
    },
    async delCollection(){
      try {
        let res = await this.fcl.mutate({
        cadence:DELETE_COLLECTION,
        limit:75,
        })
        await this.fcl.tx(res).onceSealed()
        this.del1=res
        console.log("transation======"+res)
      }catch(err){
        console.log(err);
      }
    },
//nft铸造
   async  mintNft(templateID,amount){
      try{
        let res=await this.fcl.mutate({
          cadence:MINT_DAPPY,
          args:(arg,t)=>[arg(templateID,t.UInt32),arg(amount,t.UFix64)],
          limit:55
        })
        await this.fcl.tx(res).onceSealed()
        // await getFUSDBalance();
        // await addDappy(templateID);


      }catch(err){
        console.log(err)
      }

    },
    //获取用户所有的nftlist
    async listNft(){
      try{
        let res = await this.fcl.query({
          cadence:LIST_USER_DAPPIES,
          args:(arg,t)=>[arg(this.userinfo.addr,t.Address)]
        })
        console.log(res)

      }catch(err){
        console.log(err)
      }

    },



  }
}
</script>
 
<style scoped>
 
</style>