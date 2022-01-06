<template>
  <div style="display: flex;justify-content: center;margin-top: 20px;">
    <el-select v-model="value1" placeholder="一级机构" @change="change1">
      <el-option
          v-for="item in options1"
          :key="item.value"
          :label="item.label"
          :value="item.value">
      </el-option>
    </el-select>
    <el-select v-model="value2" placeholder="二级机构" @change="change2">
      <el-option
          v-for="item in options2"
          :key="item.value"
          :label="item.label"
          :value="item.value">
      </el-option>
    </el-select>
    <el-select v-model="value3" placeholder="三级机构">
      <el-option
          v-for="item in options3"
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
  name: "Ogranization",
  created() {
    axios.get('/addinstitutions').then(res=>{
      this.list1=res.data.first_institutions
      this.list2=res.data.second_institutions
      this.list3=res.data.third_institutions
      this.options1=[]
      this.list1.forEach((item,index)=>{
        let obj={}
        obj={label:item.Fi_name,value:item.Fi_id}
        this.options1.push(obj)
      })
    })
  },
  data(){
    return{
      list1:[],
      list2:[],
      list3:[],
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
      options2: [],
      options3: [],
      value1:"",
      value2:"",
      value3:"",
    }
  },
  methods:{
    submit(){
      axios.post('/createinstutitions',{fId:this.value1,sId:this.value2,tId:this.value3}).then(res=>{
        this.$message(res.data.msg)
        this.$router.go(0)
      })
      console.log(this.value1+" "+this.value2+" "+this.value3)
    },
    change1(value){
      if(value==1){
        this.options2=[]
        console.log(this.list2)
        let arr=this.list2.filter(item=>{
          return item.FiId==1
        })
        arr.forEach(item=>{
          let obj={}
          obj={label:item.Si_name,value:item.Si_id}
          this.options2.push(obj)
        })
      }
    },
    change2(value){
      if(value==3){
        this.options3=[]
        console.log(this.list3)
        let arr=this.list3.filter(item=>{
          return item.SiId==3
        })
        console.log(arr)
        arr.forEach(item=>{
          let obj={}
          obj={label:item.Ti_name,value:item.Ti_id}
          this.options3.push(obj)
        })
      }
    },
  }

}
</script>

<style scoped lang="less">
.el-select{
  margin-right: 30px;
}
</style>