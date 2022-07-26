import home from '@/view/home'
import loot from '@/view/loot'

import { createRouter,createWebHashHistory} from "vue-router";
const routes = [
  { path: "/", component: loot },  
  {
      path: '/home',
      name: 'home',
      component: () => import(/* webpackChunkName: "home" */ '@/view/home'),
    },
    {
      path: '/loot',
      name: 'loot',
      component: () => import(/* webpackChunkName: "loot" */ '@/view/loot'),
    },
    {
      path: '/trade',
      name: 'trade',
      component: () => import(/* webpackChunkName: "trade" */ '@/view/tradingHall'),
    },
    {
      path: '/collections',
      name: 'collections',
      component: () => import(/* webpackChunkName: "trade" */ '@/view/collections'),
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

