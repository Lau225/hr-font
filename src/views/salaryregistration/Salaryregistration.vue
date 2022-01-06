<template>
<div style="padding:  20px">
  <el-row>
    <el-col :span="6">
      <div class="grid-content">薪酬标准编号:
        <el-input v-model="code" placeholder="请输入内容" style="width: 41%"></el-input>
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
      <el-button type="primary" plain @click="submit">提交</el-button>
    </el-col>
  </el-row>
  <el-row>
    <el-col :span="6">
      <div class="grid-content">制定人:&emsp;&emsp;&emsp;
        <el-input v-model="editor" placeholder="请输入内容" style="width: 41%"></el-input>
      </div>
    </el-col>
    <el-col :span="6">
      <div class="grid-content">登记人:&emsp;&emsp;&emsp;
        <el-input v-model="register" placeholder="请输入内容" style="width: 41%"></el-input>
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
  name: "Salaryregistration",
  methods:{
    change(){
        this.codeList[4].code=(this.codeList[0].code*0.08)//养老保险
        this.codeList[5].code=(this.codeList[0].code*0.02+3)//医疗保险
        this.codeList[6].code=(this.codeList[0].code*0.005)//实业保险
        this.codeList[7].code=(this.codeList[0].code*0.08)//住房公积金
        this.codeList[1].code=parseInt(this.codeList[1].code)
        this.codeList[0].code=parseInt(this.codeList[0].code)
        this.codeList[2].code=parseInt(this.codeList[2].code)
        this.codeList[3].code=parseInt(this.codeList[3].code)
    },
    submit(){
      axios.post('/addsalary',{
        name:this.name,
        totalSalary:(parseInt(this.money)).toFixed(2),
        developPeople:this.editor,
        registerPeople:this.register,
        basicSalary:(parseInt(this.codeList[0].code)).toFixed(2),
        trafficSalary:(parseInt(this.codeList[1].code)).toFixed(2),
        lunchSalary:(parseInt(this.codeList[2].code)).toFixed(2),
        commSalary:(parseInt(this.codeList[3].code)).toFixed(2),
        endowmentInsurance:(parseInt(this.codeList[4].code)).toFixed(2),
        unemployInsurance:(parseInt(this.codeList[5].code)).toFixed(2),
        medicalInsurance:(parseInt(this.codeList[6].code)).toFixed(2),
        housingProvidentFund:(parseInt(this.codeList[7].code)).toFixed(2),
      }).then(res=>{
        console.log(res)
      })
    }
  },
  data(){
    return{
      code:"",
      name:"",
      money:"",
      editor:"",
      register:"",
      time:"",
      code1:0.00,
      codeList:[
        {code:0.00},
        {code:0.00},
        {code:0.00},
        {code:0.00},
        {code:0.00},
        {code:0.00},
        {code:0.00},
        {code:0.00},
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
    sum:function(){
        let sum=0
        this.codeList.forEach((item,index)=>{
            if(index<=3){
              sum=item.code+sum
            }
            if(index>3){
              sum=sum-item.code
            }
        })
      this.money=sum
      return (parseInt(this.money)).toFixed(2)
    }
  },
  created() {
    const dt = new Date()
    const y = dt.getFullYear()
    const m = (dt.getMonth() + 1 + '').padStart(2, '0')
    const d = (dt.getDate() + '').padStart(2, '0')
    const hh = (dt.getHours() + '').padStart(2, '0')
    const mm = (dt.getMinutes() + '').padStart(2, '0')
    const ss = (dt.getSeconds() + '').padStart(2, '0')
    this.time=`${y}-${m}-${d} ${hh}:${mm}:${ss}`
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