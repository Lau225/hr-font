<template>
  <div style="padding:  20px">
    <el-row>
      <el-col :span="6">
        <div class="grid-content">薪酬标准编号:
          <el-input v-model="code" placeholder="请输入内容" style="width: 41%" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">薪酬标准名称:
          <el-input v-model="name" placeholder="请输入内容" style="width: 41%"></el-input>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">薪酬总额:
          <el-input v-model="sum" placeholder="请输入内容" style="width: 41%" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="6">
        <el-button type="primary" plain @click="pass">变更</el-button>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="6">
        <div class="grid-content">制定人:&emsp;&emsp;&emsp;
          <el-input v-model="editor" placeholder="请输入内容" style="width: 41%" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">登记人:&emsp;&emsp;&emsp;
          <el-input v-model="register" placeholder="请输入内容" style="width: 41%" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">登记时间:
          <el-input v-model="time" placeholder="请输入内容" style="width: 41%" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="6">
      </el-col>
    </el-row>
    <div>
      <table style="width: 100%;">
        <tr>
          <td width="33%">序号</td>
          <td width="33%">薪酬项目名称</td>
          <td width="33%">金额</td>
        </tr>
        <tr v-for="(item,index) in tableData">
          <td>{{item.date}}</td>
          <td>{{item.name}}</td>
          <td><el-input type="text" v-model="codeList[index].code" @blur="change"
           :disabled="index>3?true:false"/></td>
        </tr>
      </table>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Salarychangesecond",
  created() {
    let id=this.$route.query.id
    console.log(id)
    axios.post('/salaryrecheck',{id:id}).then(res=>{
      console.log(res.data.res[0])
      this.list=res.data.res
      this.code=res.data.res[0].id
      this.name=res.data.res[0].name
      this.money=res.data.res[0].totalSalary
      this.editor=res.data.res[0].developPeople
      this.register=res.data.res[0].registerPeople
      this.time=res.data.res[0].registerTime
      this.codeList[0].code=res.data.res[0].basicSalary
      this.codeList[1].code=res.data.res[0].trafficSalary
      this.codeList[2].code=res.data.res[0].lunchSalary
      this.codeList[3].code=res.data.res[0].commSalary
      this.codeList[4].code=res.data.res[0].endowmentInsurance
      this.codeList[5].code=res.data.res[0].unemployInsurance
      this.codeList[6].code=res.data.res[0].medicalInsurance
      this.codeList[7].code=res.data.res[0].housingProvidentFund
    })
  },
  methods:{
    change(){
      this.codeList[4].code=parseInt((this.codeList[0].code*0.08)).toFixed(2)//养老保险
      this.codeList[5].code=parseInt(this.codeList[0].code*0.02+3).toFixed(2)//医疗保险
      this.codeList[6].code=parseInt(this.codeList[0].code*0.005).toFixed(2)//实业保险
      this.codeList[7].code=parseInt((this.codeList[0].code*0.08)).toFixed(2)//住房公积金
      this.codeList[1].code=parseInt(this.codeList[1].code)
      this.codeList[0].code=parseInt(this.codeList[0].code)
      this.codeList[2].code=parseInt(this.codeList[2].code)
      this.codeList[3].code=parseInt(this.codeList[3].code)
    },
    pass(){
      axios.post('/passsalarychange',{
        id:this.code,
        name:this.name,
        totalSalary:(parseInt(this.money)).toFixed(2),
        basicSalary:this.codeList[0].code,
        trafficSalary:this.codeList[1].code,
        lunchSalary:this.codeList[2].code,
        commSalary:this.codeList[3].code,
        endowmentInsurance:this.codeList[4].code,
        unemployInsurance:this.codeList[5].code,
        medicalInsurance:this.codeList[6].code,
        housingProvidentFund:this.codeList[7].code,
      }).then(res=>{
        console.log(res)
      })
    },
  },
  data(){
    return{
      code:"",
      name:"",
      money:1,
      editor:"",
      register:"",
      time:"",
      list:[],
      codeList:[
        {code:1},
        {code:1},
        {code:1},
        {code:1},
        {code:1},
        {code:1},
        {code:1},
        {code:1},
      ],
      tableData: [{
        date: '1',
        name: '基本工资',
        money: ""
      }, {
        date: '2',
        name: '交通补助',
        money: ""
      }, {
        date: '3',
        name: '午餐补助',
        money: ""
      }, {
        date: '4',
        name: '通信补助',
        money: ""
      },
        {
          date: '5',
          name: '养老保险',
          money: ""
        },
        {
          date: '6',
          name: '失业保险',
          money: ""
        },
        {
          date: '7',
          name: '医疗保险',
          money: ""
        },
        {
          date: '8',
          name: '住房公积金',
          money: ""
        },
      ]
    }
  },
  computed:{
    sum:function (){
      let sum=0
      this.codeList.forEach((item,index)=>{
        if(index<=3){
          sum=parseInt(item.code)+sum
        }
        if(index>3){
          sum=sum-parseInt(item.code)
        }
      })
      this.money=sum
      return (parseInt(this.money)).toFixed(2)
    }
  }
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