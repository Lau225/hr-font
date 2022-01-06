<template>
<div style="padding: 50px">
  <el-row>
    <el-col :span="6">
      <div class="grid-content">薪酬发放编号:
        <el-input v-model="code" placeholder="请输入内容" style="width: 41%" disabled></el-input>
      </div>
    </el-col>
    <el-col :span="6">
      <div class="grid-content">机构:
        <el-input v-model="name" placeholder="请输入内容" style="width: 60%" disabled></el-input>
      </div>
    </el-col>
    <el-col :span="6">
      <div class="grid-content">总人数:
        <el-input v-model="number" placeholder="请输入内容" style="width: 41%" disabled></el-input>
      </div>
    </el-col>
    <el-col :span="6">
      <el-button type="primary" plain @click="submit">提交</el-button>
    </el-col>
  </el-row>
  <el-row>
    <el-col :span="6">
      <div class="grid-content">基本总额:&emsp;&emsp;&emsp;
        <el-input v-model="money" placeholder="请输入内容" style="width: 41%" disabled></el-input>
      </div>
    </el-col>
    <el-col :span="6">
      <div class="grid-content">登记人:&emsp;
        <el-input v-model="register" placeholder="请输入内容" style="width: 41%" ></el-input>
      </div>
    </el-col>
    <el-col :span="6">

    </el-col>
    <el-col :span="6">
    </el-col>
  </el-row>
  <el-table
      :data="tableData"
      style="width: 100%"
      v-show="true">
    <el-table-column
        prop="fileId"
        label="档案编号"
        width="180">
    </el-table-column>
    <el-table-column
        prop="name"
        label="姓名"
        width="180">
    </el-table-column>
    <el-table-column
        prop="basicSalary"
        label="基本工资"
        width="180">
    </el-table-column>
    <el-table-column
        prop="trafficSalary"
        label="交通补助"
        width="180">
    </el-table-column>
    <el-table-column
        prop="lunchSalary"
        label="午餐补助"
        width="180">
    </el-table-column>
    <el-table-column
        prop="commSalary"
        label="通信补助"
        width="180">
    </el-table-column>
    <el-table-column
        prop="endowmentInsurance"
        label="养老保险"
        width="180">
    </el-table-column>
    <el-table-column
        prop="unemployInsurance"
        label="失业保险"
        width="180">
    </el-table-column>
    <el-table-column
        prop="medicalInsurance"
        label="医疗保险"
        width="180">
    </el-table-column>
    <el-table-column
        prop="housingProvidentFund"
        label="住房公积金"
        width="180">
    </el-table-column>
    <el-table-column
        prop="reward"
        label="奖励奖金"
        width="180">
    </el-table-column>
    <el-table-column
        prop="chengfa"
        label="应扣奖金"
        width="180">
    </el-table-column>
  </el-table>
</div>
</template>

<script>
import axios from "axios";

export default {
  name: "Salarypaymentregistrationsecond",
  created() {
    this.TiId=this.$route.query.TiId
    this.code=parseInt(this.$route.query.code)
    this.name=this.$route.query.name
    this.number=this.$route.query.number
    this.money=this.$route.query.money
    axios.post('/test3',{TiId:this.TiId}).then(res=>{
      this.list=res.data.arr
      console.log(this.list)
      for (const item of this.list) {
        let obj={fileId:item.fileId,name:item.name,basicSalary:item.basicSalary+".00",trafficSalary:item.trafficSalary+".00",
          lunchSalary:item.lunchSalary+".00",commSalary:item.commSalary+".00",endowmentInsurance:item.endowmentInsurance
          ,unemployInsurance:item.unemployInsurance,medicalInsurance:item.medicalInsurance,housingProvidentFund:item.housingProvidentFund,
          reward:"0.00",chengfa:"0.00"
        }
        this.tableData.push(obj)
      }
    })
  },
  methods:{
    submit(){
      // console.log(this.TiId,this.number)
        axios.post('/test2',{serialId:this.code,affiliationId:this.TiId,number:this.number,
        basicSalary:this.money}).then(res=>{
          console.log(res)
        })
    }
  },
  data(){
    return{
      list:[],
      TiId:'',
      code:"",
      name:"",
      money:"",
      number:"",
      register:"",
      tableData: []
    }
  },
}
</script>

<style scoped lang="less">
table {
  border-collapse: collapse;
}

table, td, th {
  border: 1px solid black;
  tr,td{
    height: 30px;
  }
}
.el-row {
  margin-bottom: 20px;
  &:last-child {
    margin-bottom: 0;
  }
}


.grid-content {
  border-radius: 4px;
  min-height: 36px;
}
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>