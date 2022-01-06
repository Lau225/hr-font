<template>
<div style="padding: 50px">
  <el-select v-model="value1" placeholder="请选择">
    <el-option
        v-for="item in options1"
        :key="item.value"
        :label="item.label"
        :value="item.value">
    </el-option>
  </el-select>
  <el-select v-model="value2" placeholder="请选择">
    <el-option
        v-for="item in options2"
        :key="item.value"
        :label="item.label"
        :value="item.value">
    </el-option>
  </el-select>
  <el-button type="primary" round @click="submit">提交</el-button>
</div>
</template>

<script>
import axios from "axios";

export default {
  name: "Limited",
  created() {
    axios.get('/power').then(res=>{
      console.log(res.data.res)
      this.options1=[]
      for (const item of res.data.res) {
        let obj={label:item.username,value:item.username}
        this.options1.push(obj)
      }
    })
  },
  data(){
    return{
      options1: [{
        value: '选项1',
        label: '黄金糕'
      }, {
        value: '选项2',
        label: '双皮奶'
      }, {
        value: '选项3',
        label: '蚵仔煎'
      }, {
        value: '选项4',
        label: '龙须面'
      }, {
        value: '选项5',
        label: '北京烤鸭'
      }],
      value1: '',
      options2: [{
        value: 1,
        label: '超级管理员'
      }, {
        value: 2,
        label: '薪酬专员'
      },
        {
          value: 3,
          label: '薪酬经理'
        },
        {
          value: 4,
          label: '人事专员'
        },{
        value: 5,
        label: '人事经理'
      },
        {
          value: 6,
          label: '用户'
        }],
      value2: ''
    }
  },
  methods:{
    submit(){
      console.log(this.value1,this.value2)
      axios.post('/changepower',{username:this.value1,rid:this.value2}).then(res=>{
        console.log(res)
        this.$message(res.data.msg)
        this.$router.go(0)
      })
    }
  }
}
</script>

<style scoped lang="less">
.el-select{
  margin: 30px;
}
</style>