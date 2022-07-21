// import Vue from 'vue'

import { createApp } from 'vue'
import App from './App.vue'
// import VueIpfs from './plugins/vue-ipfs'
import ElementPlus from 'element-plus'
// import 'element-ui/lib/theme-chalk/index.css';
import 'element-plus/dist/index.css'
import * as fcl from "@onflow/fcl";
import  * as flow from '../config/flow.config';
import router from './route'
import vhead from './components/Header.vue'
import vfoot from './components/Footer.vue'
import '@/assets/css/main.css';


// Vue.prototype.fcl=fcl;

/* init flow configuration */
fcl.config({
    "discovery.wallet":flow.VUE_APP_WALLET_DISCOVERY , // Endpoint set to Testnet
    // "accessNode.api":'https://rest-testnet.onflow.org',
    "accessNode.api":flow.VUE_APP_ACCESS_NODE,

    "app.detail.title": "Test App",//dapp title
    // "app.detail.icon":"https://placekitten.com/g/200/200" //dapp icon
    // "discovery.authn.include": ["0x9d2e44203cb13051"] // Ledger wallet address on Testnet set to be included
    "0xDappy":flow.VUE_APP_DAPPY_CONTRACT,
    "0xMT":flow.vue_APP_MT_CONTRACT,
    
    "0xFungibleToken": flow.VUE_APP_FT_CONTRACT,
    "0xFUSD": flow.VUE_APP_FUSD_CONTRACT,
    "0xTEST":flow.VUE_TEST_HELLO_CONTRACT,
})
 
// Load our IPFS plugin.
const app = createApp(App)
// app.use(VueIpfs)
app.use(router)
app.use(ElementPlus)
app.component('Vhead', vhead)
app.component('Vfooter', vfoot)
app.config.globalProperties.$fcl = fcl
app.config.globalProperties.$router = router
app.mount('#app')



