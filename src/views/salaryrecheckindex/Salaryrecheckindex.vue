<template>
<div style="padding: 20px;">
  <el-table
      :data="tableData"
      style="width: 100%">
    <el-table-column
        prop="code"
        label="薪酬标准编号"
        width="400">
    </el-table-column>
    <el-table-column
        prop="name"
        label="薪酬标准名字"
        width="400">
    </el-table-column>
    <el-table-column
        prop="username"
        label="登记人"
        width="400">
    </el-table-column>
    <el-table-column
        prop="recheck"
        label="操作"
        width="180">
      <template slot-scope="scope">
        <el-button  type="text" size="small" @click="handleClick(scope.$index)">复核</el-button>
      </template>
    </el-table-column>
  </el-table>
</div>
</template>

<script>
import axios from "axios";

export default {
  name: "Salarychangeindex",
  methods:{
    handleClick(scope){
      let id=this.list[scope].id
      this.$router.push({path:'/salaryrecheck',query:{id:id}})
    }
  },
  created() {
    axios.get('/getsalarystandard').then(res=>{
      this.list=res.data.res
      this.tableData=[]
      for (const item of res.data.res) {
        let obj={}
        obj={
          code:item.id,name:item.name,username:item.registerPeople,
        }
        this.tableData.push(obj)
      }
    })
  },
  data(){
    return{
      tableData: [{
        code: '1',
        name: '软件工程师',
        username: "admin"
      },
      ],
      list:[]
    }
  }
}
</script>

<style scoped>

</style>