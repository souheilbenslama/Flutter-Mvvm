import Vue from 'vue'
import VueRouter from 'vue-router'
import { AuthRequired, NotAuthRequired} from "../utils/AuthRequired";

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Login',
    beforeEnter: NotAuthRequired,
    component: () => import('../views/Login.vue')
  },
  {
    path: '/register',
    name: 'Register',
    beforeEnter: NotAuthRequired,
    component: () => import('../views/Register.vue')
  },
  {
    path: '/home',
    beforeEnter: AuthRequired,
    component: () => import('../views/Home.vue'),
    children: [{
      path: 'vaccines',
      name: 'Vaccines',
      component: () => import('../views/Vaccines.vue'),
    },
    {
      path: 'profile',
      name: 'profile',
      component: () => import('../views/Profile.vue'),
    }]
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
