import { createRouter, createWebHistory } from 'vue-router'
import Index from '@/views/UserInfo/index.vue'
import About from '@/views/UserInfo/about.vue'
import Contact from '@/views/UserInfo/contact.vue'
// import Ditu from '@/views/ditu.vue'
import Show from '@/views/UserInfo/new-show.vue'
import New from '@/views/UserInfo/news.vue'
import Resource from '@/views/UserInfo/resource.vue'
import Cost from '@/views/UserInfo/cost.vue'
import Record from '@/views/UserInfo/payment-record.vue'
import Fees from '@/views/UserInfo/pay-fees.vue'
import Connect from '@/views/UserInfo/connect.vue'
import Cases from '@/views/UserInfo/cases.vue'
import Reserve from '@/views/UserInfo/reserve.vue'
import Login from '@/views/UserInfo/login.vue'
import { useTokenStore } from '@/stores/mytoken'
import Nurse_index from '@/views/NurseInfo/index.vue'
import Nurse_about from '@/views/NurseInfo/about.vue'
import Nurse_contact from '@/views/NurseInfo/contact.vue'
import Nurse_resource from '@/views/NurseInfo/resource.vue'
import Nurse_personal from '@/views/NurseInfo/personal.vue'
import Nurse_info from '@/views/NurseInfo/info.vue'
// 医生
import Doctor_index from '@/views/DoctorInfo/index.vue'
import Doctor_about from '@/views/DoctorInfo/about.vue'
import Doctor_contact from '@/views/DoctorInfo/contact.vue'
import Doctor_personal from '@/views/DoctorInfo/personal.vue'
import Doctor_info from '@/views/DoctorInfo/info.vue'
import Doctor_zhuijia from '@/views/DoctorInfo/zhuijia.vue'


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/',
      name: 'Index',
      component: Index,
      meta: { requiresAuth: true },
    },
    {
      path: '/about',
      name: 'About',
      component: About,
      meta: { requiresAuth: true },
    },
    {
      path: '/contact',
      name: 'Contact',
      component: Contact,
      meta: { requiresAuth: true },
    },
    // {
    //   path: '/Ditu',
    //   name: 'Ditu',
    //   component: Ditu
    // },
    {
      path: '/about/newshow',
      name: 'Show',
      component: Show,
      meta: { requiresAuth: true },
    },
    {
      path: '/about/new',
      name: 'New',
      component: New,
      meta: { requiresAuth: true },
    },
    {
      path: '/resource',
      name: 'Resource',
      component: Resource,
      meta: { requiresAuth: true },
    },
    {
      path: '/about/cost',
      name: 'Cost',
      component: Cost,
      meta: { requiresAuth: true },
    },
    {
      path: '/about/record',
      name: 'Record',
      component: Record,
      meta: { requiresAuth: true },
    },
    {
      path: '/about/fees',
      name: 'Fees',
      component: Fees,
      meta: { requiresAuth: true },
    },
    {
      path: '/about/connect',
      name: 'Connect',
      component: Connect,
      meta: { requiresAuth: true },
    },
    {
      path: '/about/cases',
      name: 'Cases',
      component: Cases,
      meta: { requiresAuth: true },
    },
    {
      path: '/about/reserve',
      name: 'Reserve',
      component: Reserve,
      meta: { requiresAuth: true },
    },
    
    {
      path: '/nurse/index',
      name: 'Nurse_index',
      component: Nurse_index,
      meta: { requiresAuth: true },
    },
    {
      path: '/nurse/about',
      name: 'Nurse_about',
      component: Nurse_about,
      meta: { requiresAuth: true },
    },
    {
      path: '/nurse/contact',
      name: 'Nurse_contact',
      component: Nurse_contact,
      meta: { requiresAuth: true },
    },
    {
      path: '/nurse/resource',
      name: 'Nurse_resource',
      component: Nurse_resource,
      meta: { requiresAuth: true },
    },
    {
      path: '/nurse/personal',
      name: 'Nurse_personal',
      component: Nurse_personal,
      meta: { requiresAuth: true },
    },
    {
      path: '/nurse/info',
      name: 'Nurse_info',
      component: Nurse_info,
      meta: { requiresAuth: true },
    },
    {
      path: '/doctor/index',
      name: 'Doctor_index',
      component: Doctor_index,
      meta: { requiresAuth: true },
    },
    {
      path: '/doctor/info',
      name: 'Doctor_info',
      component: Doctor_info,
      meta: { requiresAuth: true },
    },
    {
      path: '/doctor/personal',
      name: 'Doctor_personal',
      component: Doctor_personal,
      meta: { requiresAuth: true },
    },
    {
      path: '/doctor/about',
      name: 'Doctor_about',
      component: Doctor_about,
      meta: { requiresAuth: true },
    },
    {
      path: '/doctor/contact',
      name: 'Doctor_contact',
      component: Doctor_contact,
      meta: { requiresAuth: true },
    },
    {
      path: '/doctor/zhuijia',
      name: 'Doctor_zhuijia',
      component: Doctor_zhuijia,
      meta: { requiresAuth: true },
    },
    
   
    
  ]
})


// 添加路由守卫
router.beforeEach((to, from, next) => {
  const token = localStorage.getItem('token') // 从 localStorage 中获取 JWT 令牌

  // 检查是否需要登录
  if (to.matched.some(r => r.meta?.requiresAuth)) {
    const store = useTokenStore();
    if (!token) {
      next({ name: "Login"});
    } else {
      next();
    }
  } else {
    next();
  }
});


//添加拦截器
// instance.interceptors.request.use(function (config) {
//   console.log(config);
//   //在发送请求前做的事情
//   return config;
// }, function (error) {
//   return Promise.reject(error);
// })

// export default instance;
export default router
