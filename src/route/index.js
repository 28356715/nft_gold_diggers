import home from '@/view/Home'
import { createRouter,createWebHashHistory} from "vue-router";
const routes = [
  { path: "/", component: home },  
  {
      path: '/home',
      name: 'home',
      component: () => import(/* webpackChunkName: "home" */ '@/view/Home'),
    },
    {
      path: '/mint',
      name: 'mint',
      component: () => import(/* webpackChunkName: "home" */ '@/view/mintNft'),
    },
  
  ]
  const router = createRouter({
    history:createWebHashHistory(),
    routes:routes
  })

  export default router

