<template>
  <div style="padding: 20px;">
    <el-table
        :data="tableData"
        style="width: 100%">
      <el-table-column
          prop="code"
          label="薪酬发放编号"
          width="250">
      </el-table-column>
      <el-table-column
          prop="F"
          label="一级机构"
          width="250">
      </el-table-column>
      <el-table-column
          prop="S"
          label="二级机构"
          width="250">
      </el-table-column>
      <el-table-column
          prop="T"
          label="三级机构"
          width="250">
      </el-table-column>
      <el-table-column
          prop="number"
          label="人数"
          width="250">
      </el-table-column>
      <el-table-column
          prop="salary"
          label="基本工资总额"
          width="250">
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
  name: "Salarypaymentrecheck",
  created() {
    axios.get('/test4').then(res=>{
      console.log(res)
      this.list=res.data.arr
      this.tableData=[]
      for (const item of this.list) {
        let obj={code:item.serialId,F:item.F,S:item.S,T:item.T,number:item.number,salary:item.basicSalaryTotal}
        this.tableData.push(obj)
      }
    })
  },
  methods:{
    handleClick(scope){
      axios.post('/test5',{serialId:this.list[scope].serialId}).then(res=>{
        this.$message(res.data.msg)
        this.$router.go(0)
      })
    }
  },
  data(){
    return{
      list:[],
      tableData: [{
        code: '1',
        name: '软件工程师',
        username: "admin"
      },
      ]
    }
  }
}
</script>

<style scoped>

</style>