<template>
  <section>
    <div><mtHeader /></div>
  </section>
</template>
 
<script setup>
import mtHeader from "../components/Header.vue"

// import { LIST_TEMPLATES } from "../flow/list-templates.script"
// import { HELLO_TEST } from "../flow/hello-test.script"
// import {CHECK_COLLECTION} from "../flow/check-collection.script"
// import {CREATE_COLLECTION} from "../flow/create-collection.tx"
// import { DELETE_COLLECTION } from "../flow/delete-collection.tx"
// import { LIST_USER_DAPPIES } from "../flow/list-user-dappies.script"
// import { MINT_DAPPY } from "../flow/mint-dappy.tx"


// export default {
//   data(){
//     return{
//       userinfo:{},
//       collection:{},
//       transation1:"",
//       del1:"",
//       nftDna:"",
//       nfts:"",
//     }
//   },
//   methods:{
//     logout(){
//       this.fcl.unauthenticate()
//     },
//     setUser(user){
//       this.userinfo = user
//     },
//     login(){
//        this.fcl.authenticate()
//        this.userinfo = this.fcl.currentUser.subscribe(this.setUser)
//     },
//     async list(){
//       let res = await this.fcl.query({
//         cadence:HELLO_TEST,
//          args:(arg,t)=>[
//            arg("liyun",t.String)
//       ]},
//       )
//       console.log("query======"+res)
//     },
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

//     async checkCollection(){
//       try {
//         let res = await this.fcl.query({
//         cadence:CHECK_COLLECTION,
//         args:(arg,t)=>[arg(this.userinfo.addr,t.Address)]
//         })
//         this.collection = res
//         console.log("query=="+res)
//       }catch(err){
//         console.log(err);
//       }
//     },
//   async transation(){
//       try {
//         let res = await this.fcl.mutate({
//         cadence:CREATE_COLLECTION,
//         limit:55,
//         })
//         await this.fcl.tx(res).onceSealed()
//         this.transation1=res
//         console.log("transation======"+res)
//       }catch(err){
//         console.log(err);
//       }
//     },
//     async delCollection(){
//       try {
//         let res = await this.fcl.mutate({
//         cadence:DELETE_COLLECTION,
//         limit:75,
//         })
//         await this.fcl.tx(res).onceSealed()
//         this.del1=res
//         console.log("transation======"+res)
//       }catch(err){
//         console.log(err);
//       }
//     },
// //nft铸造
//    async  mintNft(templateID,amount){
//       try{
//         let res=await this.fcl.mutate({
//           cadence:MINT_DAPPY,
//           args:(arg,t)=>[arg(templateID,t.UInt32),arg(amount,t.UFix64)],
//           limit:55
//         })
//         await this.fcl.tx(res).onceSealed()
//         // await getFUSDBalance();
//         // await addDappy(templateID);


//       }catch(err){
//         console.log(err)
//       }

//     },
//     //获取用户所有的nftlist
//     async listNft(){
//       try{
//         let res = await this.fcl.query({
//           cadence:LIST_USER_DAPPIES,
//           args:(arg,t)=>[arg(this.userinfo.addr,t.Address)]
//         })
//         console.log(res)

//       }catch(err){
//         console.log(err)
//       }

//     },



//   }
// }
</script>
 
<style scoped>
.img-top{
  margin-top: 40px;
}
.img-font{
    color: #fff;
    font-size: 50px;
    text-transform: uppercase;
    font-family: 'Russo One', sans-serif;
    background: -webkit-linear-gradient(#ffc08a, #E91E63);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}
.img-font-2{
    color: #ff377b;
    font-size: 24px;
    font-weight: 700;
}
.img-a{
    color: #ff377b;
    font-size: 20px;
    border:2px solid #ff377b;
    padding: 5px 10px 5px 10px;
    margin-top:20px;

}
</style>