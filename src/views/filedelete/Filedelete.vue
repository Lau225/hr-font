<template>
  <div style="padding: 50px 20px">
    <el-select v-model="value1" placeholder="一级机构" @change="Firstchange">
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
    <el-select v-model="value4" placeholder="职位分类" @change="change3">
      <el-option
          v-for="item in options4"
          :key="item.value"
          :label="item.label"
          :value="item.value">
      </el-option>
    </el-select>
    <el-select v-model="value5" placeholder="职位名称">
      <el-option
          v-for="item in options5"
          :key="item.value"
          :label="item.label"
          :value="item.value">
      </el-option>
    </el-select>
    <el-button type="primary" round @click="submit">提交</el-button>
    <br>
    <br>
    <el-table
        :data="tableData"
        style="width: 100%"
        v-show="true">
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
          <el-button  type="text" size="small" @click="handleClick(scope.$index)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <router-view></router-view>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Filequery",
  data() {
    return {
      first_institutions:[],
      second_institutions:[],
      third_institutions:[],
      position_type:[],
      position:[],
      tableData: [
      ],
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
      options2: [{
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
      options3: [{
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
      options4: [{
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
      options5: [{
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
      value2: '',
      value3: '',
      value4: '',
      value5: '',
      list:[]
    }
  },
  methods:{
    submit(){
      let arr=this.list.filter((item,index)=>{
        return item.first_institution==this.value1&&item.second_institution==this.value2&&item.third_institution==this.value3&&item.job_name==this.value5
      })
      console.log(arr)
      this.tableData=[]
      for (const item of arr) {
        let obj={}
        obj={code:item.code,name:item.name,gender:item.gender,
          first_institution:item.first_institution, second_institution:item.second_institution,third_institution:item.third_institution,
          job_name:item.job_name
        }
        this.tableData.push(obj)
      }

    },
    handleClick(scope){
      let fileId=this.List[scope].fileId
      axios.post('/delete',{fileId:fileId}).then(res=>{
        console.log(res)
        this.$message(res.data.msg)
        this.$router.go(0)
      })

    },
    Firstchange(label){
      if(label=="集团"){
        console.log(label)
        this.options2=[]
        console.log(this.second_institutions)
        let arr=this.second_institutions.filter((item,index)=>{
          return item.FiId=="1"
        })
        let obj={}
        this.options2=[]
        arr.forEach(item=>{
          obj={label:item.Si_name,value:item.Si_name,id:item.Si_id}
          this.options2.push(obj)
        })
      }
    },
    change2(label){
      if(label=="软件公司"){
        this.SId=1
        console.log(this.third_institutions)
        let arr=this.third_institutions.filter((item,index)=>{
          return item.SiId=="1"
        })
        let obj={}
        this.options3=[]
        arr.forEach(item=>{
          obj={label:item.Ti_name,value:item.Ti_name,id:item.Ti_id}
          this.options3.push(obj)
        })
        console.log(this.options3)
      }
      if(label=="生物科技公司"){
        this.SId=3
        console.log(this.third_institutions)
        let arr=this.third_institutions.filter((item,index)=>{
          return item.SiId=="3"
        })
        let obj={}
        this.options3=[]
        arr.forEach(item=>{
          obj={label:item.Ti_name,value:item.Ti_name,id:item.Ti_id}
          this.options3.push(obj)
        })
        console.log(this.options3)
      }
    },
    change3(label){
      if(label=="工程师"){
        let arr=this.position.filter((item,index)=>{
          return item.PtypeId=="1"
        })
        let obj={}
        this.options5=[]
        arr.forEach(item=>{
          obj={label:item.name,value:item.name,id:item.id}
          this.options5.push(obj)
        })
      }
      if(label=="学徒"){
        let arr=this.position.filter((item,index)=>{
          return item.PtypeId=="2"
        })
        console.log(arr)
        let obj={}
        this.options5=[]
        arr.forEach(item=>{
          obj={label:item.name,value:item.name,id:item.id}
          this.options5.push(obj)
        })
      }
      if(label=="实验员"){
        let arr=this.position.filter((item,index)=>{
          return item.PtypeId=="7"
        })
        console.log(arr)
        let obj={}
        this.options5=[]
        arr.forEach(item=>{
          obj={label:item.name,value:item.name,id:item.id}
          this.options5.push(obj)
        })
      }
    },
  },
  created() {
    axios.get('/filequery').then(res=>{
      this.first_institutions=res.data.first_institutions[0]
      this.second_institutions=res.data.second_institutions
      this.third_institutions=res.data.third_institutions
      this.position_type=res.data.position_type
      this.position=res.data.position
      this.options1=[]
      console.log(this.first_institutions.Fi_name)
      let obj={label:this.first_institutions.Fi_name,value:this.first_institutions.Fi_name}
      this.options1.push(obj)
      this.options4=[]
      res.data.position_type.forEach(item=>{
        let obj={}
        obj={label:item.name,value:item.name,id:item.id}
        this.options4.push(obj)
      })
    })
    axios.get('/getrechecked').then(res=>{
      this.List=res.data.arr
      this.tableData=[]
      for (const item of res.data.arr) {
        let obj={}
        obj={code:item.fileId,name:item.name,gender:item.gender,
          first_institution:item.Fi_name, second_institution:item.Si_name,third_institution:item.Ti_name,
          job_name:item.positionName
        }
        this.tableData.push(obj)
        this.list.push(obj)
      }
      console.log(this.tableData)
    })
  }
}
</script>

<style scoped lang="less">
.el-select{
  margin: 20px;
}


</style>