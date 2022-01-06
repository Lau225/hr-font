import Vue from 'vue'
import VueRouter from 'vue-router'
Vue.use(VueRouter)

let routes = [
  {
    path:'/',
    name:'login',
    component: () => import(/* webpackChunkName: "login" */ '../views/Login'),
  },
  {
    path:'/homepage/:rid/',
    name:'Homepage',
    component: () => import(/* webpackChunkName: "homepage" */ '../views/HomePage/HomePage'),
    children:[
      {
        path:'/filebuild',
        component:()=>import(/* webpackChunkName: "filebuild" */ '../views/filebulid/Filebuild')
      },
      {
        path:'/filechange',
        component:()=>import(/* webpackChunkName: "filechange" */ '../views/filechange/Filechange')
      },
      {
        path: '/recheck',
        component: () => import(/* webpackChunkName: "recheck" */ '../views/recheck/Recheck')
      },
      {
        path: '/filequery',
        component:()=>import(/* webpackChunkName: "filequery" */ '../views/filequery/Filequery'),

      },
      {
        path: '/detail',
        component:()=>import(/* webpackChunkName: "detail" */ '../views/detail/Detail'),
      },
      {
        path: '/filedelete',
        component:()=>import(/* webpackChunkName: "filedelete" */ '../views/filedelete/Filedelete')
      },
      {
        path: '/restore',
        component:()=>import(/* webpackChunkName: "restore" */ '../views/restore/Restore')
      },
      {
        path: '/salarychange',
        component:()=>import(/* webpackChunkName: "salarychange" */ '../views/salarychange/Salarychange')
      },
      {
        path: '/salarychangesecond',
        component:()=>import(/* webpackChunkName: "salarychangesecond" */ '../views/salarychangesecond/Salarychangesecond')
      },
      {
        path: '/salaryregistration',
        component:()=>import(/* webpackChunkName: "salaryregistration" */ '../views/salaryregistration/Salaryregistration')
      },
      {
        path: '/salaryrecheckindex',
        component:()=>import(/* webpackChunkName: "Salaryrecheckindex" */ '../views/salaryrecheckindex/Salaryrecheckindex'),
      },
      {
        path: '/salaryrecheck',
        component:()=>import(/* webpackChunkName: "Salaryrecheck" */ '../views/salaryrecheck/Salaryrecheck')
      },
      {
        path: '/salarypaymentregistration',
        component:()=>import(/* webpackChunkName: "salarypaymentregistration" */ '../views/salarypaymentregistration/Salarypaymentregistration')
      },
      {
        path: '/salarypaymentregistrationsecond',
        component:()=>import(/* webpackChunkName: "salarypaymentregistration" */ '../views/salarypaymentregistrationsecond/Salarypaymentregistrationsecond')
      },
      {
        path: '/salarypaymentrecheck',
        component:()=>import(/* webpackChunkName: "salarypaymentrecheck" */ '../views/salarypaymentrecheck/Salarypaymentrecheck')
      },
      {
        path: '/organization',
        component:()=>import(/* webpackChunkName: "organization" */ '../views/organization/Ogranization')
      },
      {
        path: '/job',
        component:()=>import(/* webpackChunkName: "job" */ '../views/job/Job')
      },
      {
        path: '/limited',
        component:()=>import(/* webpackChunkName: "limited" */ '../views/limited/Limited')
      },
    ]
  }
]


const router = new VueRouter({
  mode:'history',
  routes
})
router.beforeEach((to,from,next)=>{
  const token=localStorage.getItem("token")
  if(window.location.href==="http://localhost:8080/"||token){
    next();
  }
})
export default router
