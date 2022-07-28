import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
//flow
import * as fcl from "@onflow/fcl";
import  * as flow from '../config/flow.config';
import '@/assets/css/main.css';
 import * as  properties from "../config/global.config"


fcl.config({
    "discovery.wallet":flow.VUE_APP_WALLET_DISCOVERY , // Endpoint set to Testnet
    // "accessNode.api":'https://rest-testnet.onflow.org',
    "accessNode.api":flow.VUE_APP_ACCESS_NODE,

    "app.detail.title": "Test App",//dapp title
    // "app.detail.icon":"https://placekitten.com/g/200/200" //dapp icon
    // "discovery.authn.include": ["0x9d2e44203cb13051"] // Ledger wallet address on Testnet set to be included
    "0xPioneerNFT":flow.VUE_APP_PIONEERNFT,
    "0xNonFungibleToken":flow.VUE_APP_NonFungibleToken,
})


const app = createApp(App)
app.use(router)
app.use(ElementPlus)
app.config.globalProperties.$fcl = fcl
app.config.globalProperties.$properties = properties
app.mount('#app')
