<template>
  <el-menu
      default-active="2"
      class="el-menu-vertical-demo"
      background-color="#545c64"
      text-color="#fff"
      active-text-color="#ffd04b"
      :unique-opened="true"
      :router="true"
  >
    <el-submenu :index="index+''" v-for="(item,index) in menuConfig" :key="index">
      <template slot="title">
        <i class="el-icon-location"></i>
        <span>{{item.title}}</span>
      </template>
        <el-menu-item :index="menu.path" v-for="(menu,index) in item.subs">{{menu.title}}</el-menu-item>
    </el-submenu>

  </el-menu>
</template>

<script>
export default {
  props:{
    NavList:{
      type:Object,
      default(){
        return{}
      },
    }
  },
  data(){
    return{
        menuConfig:[
          {
            isShow:1,
            title:'档案管理',
            subs:[
              {title:'档案登记',path:'/filebuild',isShow:1,},
              {title:'档案变更',path:'/filechange',isShow:1,},
              {title:'档案复核',path:'/recheck',isShow:1,},
              {title:'档案查询',path:'/filequery',isShow:1,},
              {title:'档案删除',path:'/filedelete',isShow:1,},
            ]
          },
          {
            title:'薪酬标准管理',
            isShow:1,
            subs:[
              {title:'薪酬标准登记',path:'/salaryregistration',isShow:1,},
              {title:'薪酬标准变更',path:'/salarychange',isShow:1,},
              {title:'薪酬标准复核',path:'/salaryrecheckindex',isShow:1,},

            ]
          },
          {
            title:'薪酬发放管理',
            isShow:1,
            subs:[
              {title:'薪酬发放登记',path:'/salarypaymentregistration',isShow:1,},
              {title:'薪酬发放复核',path:'/salarypaymentrecheck',isShow:1,},
            ]
          },
          {
            title:'系统管理',
            isShow:1,
            subs:[
              {title:'设置机构',path:'/organization',isShow:1,},
              {title:'设置职位',path:'/job',isShow:1,},
              {title:'设置权限',path:'/limited',isShow:1,},
            ]
          },
        ],

    }
  },
  mounted() {
    console.log(this.props)
  }
}
</script>

<style lang="less">
.el-menu{
  height: 100%;
}
</style>