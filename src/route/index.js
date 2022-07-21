import home from '@/view/Home'
import loot from '@/view/Loot'

import { createRouter,createWebHashHistory} from "vue-router";
const routes = [
  { path: "/", component: loot },  
  {
      path: '/home',
      name: 'home',
      component: () => import(/* webpackChunkName: "home" */ '@/view/Home'),
    },
    {
      path: '/loot',
      name: 'loot',
      component: () => import(/* webpackChunkName: "loot" */ '@/view/Loot'),
    },
    {
      path: '/trade',
      name: 'trade',
      component: () => import(/* webpackChunkName: "trade" */ '@/view/TradingHall'),
    },
    {
      path: '/collections',
      name: 'collections',
      component: () => import(/* webpackChunkName: "trade" */ '@/view/Collections'),
    },
    {
      path: '/mint',
      name: 'mint',
      component: () => import(/* webpackChunkName: "mint" */ '@/view/mintNft'),
    },
  
  ]
  const router = createRouter({
    history:createWebHashHistory(),
    routes:routes
  })

  export default router

