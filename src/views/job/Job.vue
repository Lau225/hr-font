<template>
  <div style="display: flex;justify-content: center;margin-top: 20px;">
    <el-select v-model="value1" placeholder="职位分类" @change="get">
      <el-option
          v-for="item in options1"
          :key="item.value"
          :label="item.label"
          :value="item.value">
      </el-option>
    </el-select>
    <el-select v-model="value2" placeholder="职位名称">
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
  name: "Job",
  data(){
    return{
      options1: [{
        value: '开发组',
        label: '开发组'
      }, {
        value: '后勤组',
        label: '后勤组'
      }],
      option1List1:[{value:"软件工程师",label:"软件工程师"},{value:"架构师",label:"架构师"}],
      option1List2:[{value:"扫地工人",label:"扫地工人"},],
      options2: [],
      value1:"",
      value2:"",
    }
  },
  methods:{
    submit(){
      axios.post('/addjobs',{ptId:this.value1,pId:this.value2}).then(res=>{
        this.$message(res.data.msg)
        this.$router.go(0)
      })
    },
    get(label){
        let arr=this.options2.filter((item,index)=>{
          return item.PtypeId==7
        })
        console.log(arr)
        this.options2=[]
        arr.forEach((item,index)=>{
          let obj={}
          obj={label:item.name,value:item.id}
          this.options2.push(obj)
        })

    }
  },
  created() {
    axios.get('/getjob').then(res=>{
      console.log(res.data)
      this.options1=[]
      this.options2=res.data.res
      res.data.res2.forEach((item,index)=>{
        let obj={}
        obj={label:item.name,value:item.id}
        console.log(obj)
        this.options1.push(obj)
      })
      console.log(this.options2)
      console.log(this.options1[0])
    })
  }

}
</script>

<style scoped lang="less">
.el-select{
  margin-right: 30px;
}
</style>