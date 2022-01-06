<template>
<div class="body">
<!--  头部-->
  <Header id="header"></Header>
<!--  左侧菜单-->
 <div class="leftSide">
   <el-menu
       default-active="2"
       class="el-menu-vertical-demo"
       background-color="#545c64"
       text-color="#fff"
       active-text-color="#ffd04b"
       :unique-opened="true"
       :router="true"
   >
     <el-submenu :index="index+''" v-for="(item,index) in menuConfig" :key="index" v-show="item.isShow==1?true:false">
       <template slot="title">
         <i class="el-icon-location"></i>
         <span>{{item.title}}</span>
       </template>
       <el-menu-item :index="menu.path" v-for="(menu,index) in item.subs"
       v-show="menu.isShow==1?true:false">{{menu.title}}</el-menu-item>
     </el-submenu>

   </el-menu>
 </div>
<!--  中间内容-->
  <centers class="rightSize">
  </centers>
</div>
</template>

<script>
import Header from "./children/Header";
import centers from "./children/center";
import axios from "axios";
export default {
  components:{
    Header,
    centers,
  },
  mounted() {

  },
  created() {
        if(localStorage.getItem("rid")==null){
          localStorage.setItem("rid",this.$route.params.rid)
        }
        axios.post('/getPower',{rid:localStorage.getItem("rid")}).then(res=>{
          console.log(this.NavList)
        this.NavList=res.data.result[0]

        this.menuConfig[0].isShow=this.NavList.fileModule

        this.menuConfig[0].subs[0].isShow=this.NavList.fileRegister

        this.menuConfig[0].subs[1].isShow=this.NavList.fileUpdate

        this.menuConfig[0].subs[2].isShow=this.NavList.fileRegisterReview

        this.menuConfig[0].subs[3].isShow=this.NavList.fileSelect

        this.menuConfig[0].subs[4].isShow=this.NavList.fileDelete

        this.menuConfig[0].subs[5].isShow=this.NavList.fileRestore

        this.menuConfig[1].isShow=this.NavList.salaryStandard

        this.menuConfig[1].subs[0].isShow=this.NavList.salaryStandardRegister

        this.menuConfig[1].subs[1].isShow=this.NavList.salaryStandardUpdate
        this.menuConfig[1].subs[2].isShow=this.NavList.salaryStandardReview
        this.menuConfig[2].isShow=this.NavList.salaryProvide
        this.menuConfig[2].subs[0].isShow=this.NavList.salaryProvideRegister
        this.menuConfig[2].subs[1].isShow=this.NavList.salaryProvideReview
        this.menuConfig[3].isShow=this.NavList.systemModule
        this.menuConfig[3].subs[0].isShow=this.NavList.setAgencies
        this.menuConfig[3].subs[1].isShow=this.NavList.setPosition
        this.menuConfig[3].subs[2].isShow=this.NavList.limited
      })

  },
  data(){
    return{
      rid:"",
      NavList:{},
      username:"",
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
            {title:'档案恢复',path:'/restore',isShow:1,},
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
      currentConfig:[]
    }
  }

}
</script>
<style>

</style>
<style lang="less">
body{
  background-color: white;
}
*{
  margin: 0;
  padding: 0;
}
.body{
  #header{
    position: relative;
    background-color: dodgerblue;
    height: 100px;
    top:0px
  }
  .leftSide{
    position: absolute;
    width: 250px;
    left: 0;
    bottom: 0px;
    top:100px;
  }

}
.rightSize{
  position: absolute;
  right: 0;
  left:250px;
  bottom: 0;
  top:100px;
}
.el-menu{
  height: 100%;
}

</style>