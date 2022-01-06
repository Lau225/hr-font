<template>
  <el-table
      :data="tableData"
      style="width: 100%">
    <el-table-column
        prop="code"
        label="档案编号"
        width="180">
    </el-table-column>
    <el-table-column
        prop="name"
        label="姓名"
        width="180">
    </el-table-column>
    <el-table-column
        prop="gender"
        label="性别"
        width="180">
    </el-table-column>
    <el-table-column
        prop="first_institution"
        label="一级机构"
        width="180">
    </el-table-column>
    <el-table-column
        prop="second_institution"
        label="二级机构"
        width="180">
    </el-table-column>
    <el-table-column
        prop="third_institution"
        label="三级机构"
        width="180">
    </el-table-column>
    <el-table-column
        prop="job_name"
        label="职位名称"
        width="180">
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
</template>

<script>
import axios from "axios";

export default {
  name: "Recheck",
  data() {
    return {
      tableData: [],
      List:[]
    }
  },
  methods:{
    handleClick(scope){
      let fileId=this.List[scope].fileId
      this.$router.push({path:"/filechange",query:{fileId:fileId}})
    }
  },
  created() {
    axios.get('/getunrecheck').then(res=>{
      console.log(res.data.arr)
      this.List=res.data.arr
      this.tableData=[]

      for (const item of res.data.arr) {
        let obj={}
        obj={code:item.fileId,name:item.name,gender:item.gender,
          first_institution:item.Fi_name, second_institution:item.Si_name,third_institution:item.Ti_name,
          job_name:item.positionName
        }
        this.tableData.push(obj)
      }
    })
  }
}
</script>

<style scoped>

</style>