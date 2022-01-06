<template>
  <div class="body1">
    <h2>登录页面</h2>
    <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm"  class="demo-ruleForm">
      <el-form-item  prop="username">
        <el-input
            type="text"
            v-model="ruleForm.username"
            autocomplete="off"
            placeholder="账号"
        ></el-input>
      </el-form-item>
      <el-form-item  prop="pwd">
        <el-input
            type="password"
            v-model="ruleForm.pwd"
            autocomplete="off"
            placeholder="密码"
        ></el-input>
      </el-form-item>

      <el-form-item>
        <el-button
            type="primary"
            style="width:100%"
            @click="create"
        >登录</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import axios from "axios";
export default {
      data(){
        return{
          token:"",
          ruleForm:{
            username:"",
            pwd:""
          },
          rules:{
            username:[
              {required:true,message:'账号不能为空！',trigger:'blur'},
              {validator:this.valiName,trigger: 'blur'}
            ],
            pwd:[
              {required:true,message:'密码不能为空！',trigger:'blur'},
              {validator:this.valiPwd,trigger: 'blur'}]
          }
        }
      },
    methods:{
      create(){
        let that=this
        this.$refs.ruleForm.validate(valid=>{
          if(valid){
            axios.post('/login', {
              username:this.ruleForm.username,
              password:this.ruleForm.pwd
            }).then(res=>{
              console.log(res)
              if(res.data.errCode===1001){
                this.$message.error(res.data.msg)
              }
              localStorage.setItem("token",res.data.token)
              that.token=localStorage.getItem("token")
              this.$router.push({name:'Homepage',params:{rid: res.data.rid}})
              this.$message.success("登陆成功")
            })
          }else{
            console.log("发生错误")
          }

        })
      },
      check(){
        let that=this
        axios.post('/verify',{
          token:that.token
        }).then(res=>{
          console.log(res)
        })
      }


    }

}
</script>

<style lang="less">
.body1{
  width: 20%;
  height: 30%;
  margin:0 auto;
  margin-top:350px;
  h2{
    text-align: center;
    color:white;
  }
}
body{
  background-color: slategray;
}
</style>
<!--这个组件主要用来研究upload这个elementui的上传插件组件-->

<!--<template>-->
<!--  <el-row>-->
<!--    <el-col :span="8" :offset="8">-->
<!--      <div id="upload">-->
<!--        <label class="el-form-item__label" style="width: 80px;">上传图片</label>-->
<!--        &lt;!&ndash;elementui的上传图片的upload组件&ndash;&gt;-->
<!--        <el-upload-->
<!--            class="upload-demo"-->
<!--            :before-upload="beforeupload"-->
<!--            drag-->
<!--            style="margin-left:80px;">-->
<!--          <i class="el-icon-upload"></i>-->
<!--          <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>-->
<!--          &lt;!&ndash;<div class="el-upload__tip" slot="tip">只能上传jpg/png文件，且不超过500kb</div>&ndash;&gt;-->
<!--        </el-upload>-->

<!--        &lt;!&ndash;elementui的form组件&ndash;&gt;-->
<!--        <el-form ref="form" :model="form" label-width="80px">-->
<!--          <el-form-item label="活动名称">-->
<!--            <el-input v-model="form.name" name="names" style="width:360px;"></el-input>-->
<!--          </el-form-item>-->
<!--          <el-form-item>-->
<!--            <el-button type="primary" @click="onSubmit">立即创建</el-button>-->
<!--            <el-button>取消</el-button>-->
<!--          </el-form-item>-->
<!--        </el-form>-->
<!--      </div>-->
<!--    </el-col>-->

<!--    &lt;!&ndash;展示选中图片的区域&ndash;&gt;-->
<!--    <el-col :span="4" >-->
<!--      <div style="width:100%;overflow: hidden;margin-left:150px;">-->
<!--        <img :src="src" alt="" style="width:100%;"/>-->
<!--      </div>-->
<!--    </el-col>-->
<!--  </el-row>-->

<!--</template>-->

<!--<script>-->
<!--export default {-->
<!--  data() {-->
<!--    return {-->
<!--      form: {//form里面的参数-->
<!--        name: ''-->
<!--      },-->
<!--      param:"",//表单要提交的参数-->
<!--      src:"" //展示图片的地址-->
<!--    };-->
<!--  },-->
<!--  methods: {-->
<!--    beforeRemove(file, fileList) {-->
<!--      //return this.$confirm(`确定移除 ${ file.name }？`);-->
<!--    },-->
<!--    //阻止upload的自己上传，进行再操作-->
<!--    beforeupload(file) {-->
<!--      console.log(file);-->
<!--      //创建临时的路径来展示图片-->
<!--      var windowURL = window.URL || window.webkitURL;-->

<!--      this.src=windowURL.createObjectURL(file);-->
<!--      //重新写一个表单上传的方法-->
<!--      this.param = new FormData();-->
<!--      this.param.append('file', file, file.name);-->
<!--      return false;-->
<!--    },-->
<!--    //覆盖默认的上传行为-->
<!--    httprequest() {-->

<!--    },-->
<!--    onSubmit(){//表单提交的事件-->
<!--      var names = this.form.name;-->
<!--      //下面append的东西就会到form表单数据的fields中；-->
<!--      this.param.append('message', names);-->
<!--      let config = {-->
<!--        headers: {-->
<!--          'Content-Type': 'multipart/form-data'-->
<!--        }-->
<!--      };-->
<!--      //然后通过下面的方式把内容通过axios来传到后台-->
<!--      //下面的this.$reqs 是在主js中通过Vue.prototype.$reqs = axios 来把axios赋给它;-->
<!--      this.$reqs.post("/upload", this.param, config).then(function(result) {-->
<!--        console.log(result);-->
<!--      })-->
<!--    }-->
<!--  }-->
<!--}-->
<!--</script>-->