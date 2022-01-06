<template>
  <el-table
      :data="tableData"
      style="width: 100%">
    <el-table-column
        prop="code"
        label="薪酬发放单编号"
        width="180">
    </el-table-column>
    <el-table-column
        prop="first_institutions"
        label="一级机构"
        width="180">
    </el-table-column>
    <el-table-column
        prop="second_institutions"
        label="二级机构"
        width="180">
    </el-table-column>
    <el-table-column
        prop="third_institutions"
        label="三级机构"
        width="180">
    </el-table-column>
    <el-table-column
        prop="count"
        label="人数"
        width="180">
    </el-table-column>
    <el-table-column
        prop="money"
        label="基本薪酬总额"
        width="180">
    </el-table-column>
    <el-table-column
        prop="recheck"
        label="登记"
        width="180">
      <template slot-scope="scope">
        <el-button  type="text" size="small" @click="register(scope.$index)">登记</el-button>
      </template>
    </el-table-column>
  </el-table>
</template>

<script>
import axios from "axios";

export default {
  name: "Salarypaymentregistration",
  methods:{
    register(scope){
      this.$router.push({path:'/salarypaymentregistrationsecond',
        query:{TiId:this.list[scope].TiId,code:this.tableData[scope].code,
          name:this.list[scope].F+"/"+this.list[scope].S+"/"+this.list[scope].T,
          number:this.list[scope].number,money:this.list[scope].money}})
    }
  },
  created() {
    axios.get('/test').then(res=>{
      this.list=res.data.arr
      this.tableData=[]
      console.log(this.list)
      for (const item of this.list) {
        let obj={}
        this.code=item.money*100+"1"
        obj={code:this.code,first_institutions:item.F,
          second_institutions:item.S,third_institutions:item.T,count:item.number,money:item.money
        }
        this.tableData.push(obj)
      }
    })
  },
  data(){
    return{
      list:[],
      tableData: [],
      code:''
    }
  }
}
</script>

<style scoped>

</style>