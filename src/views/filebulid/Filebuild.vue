<template>
  <div style="padding: 20px">
<!--    第一行-->
    <el-row>
      <el-col :span="8">
        <div class="grid-content">一级机构:&emsp;
          <el-select v-model="value1" placeholder="请选择" @change="changeFirst">
            <el-option
                v-for="item in options1"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
          </el-select>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="grid-content">二级机构:&emsp;
          <el-select v-model="value2" placeholder="请选择" @change="changeSecond">
            <el-option
                v-for="item in options2"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
          </el-select>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="grid-content">三级机构:&emsp;
          <el-select v-model="value3" placeholder="请选择" @change="changeForth">
            <el-option
                v-for="item in options3"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
          </el-select>
        </div>
      </el-col>
    </el-row>
<!--    第二行-->
    <el-row>
      <el-col :span="8">
        <div class="grid-content">职位分类:&emsp;
          <el-select v-model="value4" placeholder="请选择" @change="changeThird">
            <el-option
                v-for="item in options4"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
          </el-select>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="grid-content">职位名称:&emsp;
          <el-select v-model="value5" placeholder="请选择" @change="aaa">
            <el-option
                v-for="item in options5"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
          </el-select>
        </div>
      </el-col>
      <el-col :span="8">

      </el-col>
    </el-row>
<!--    第三行-->
    <el-row>
      <el-col :span="8">
        <div class="grid-content">名字:&emsp;&emsp;&emsp;
          <el-input v-model="input1" placeholder="请输入内容" style="width: 41%"></el-input>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="grid-content">性别:&emsp;&emsp;&emsp;
          <el-select v-model="value6" placeholder="请选择">
            <el-option
                v-for="item in options6"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
          </el-select>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="grid-content">EMAIL:&emsp;&emsp;
          <el-input v-model="input2" placeholder="请输入内容" style="width: 41%"></el-input>
        </div>
      </el-col>
    </el-row>
<!--    第四行-->
    <el-row>
      <el-col :span="8">
        <div class="grid-content">电话:&emsp;&emsp;&emsp;
          <el-input v-model="input3" placeholder="请输入内容" style="width: 41%"></el-input>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="grid-content">QQ:&emsp;&emsp;&emsp;
          <el-input v-model="input4" placeholder="请输入内容" style="width: 41%;margin-left: 6px"></el-input>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="grid-content">手机:&emsp;&emsp;&emsp;
          <el-input v-model="input5" placeholder="请输入内容" style="width: 41%"></el-input>
        </div>
      </el-col>
    </el-row>
<!--    第五行-->
    <el-row>
      <el-col :span="16">
        <div class="grid-content">住址:&emsp;&emsp;&emsp;
          <el-input v-model="input6" placeholder="请输入内容" style="width: 70.5%"></el-input>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="grid-content">邮编:&emsp;&emsp;&emsp;
          <el-input v-model="input7" placeholder="请输入内容" style="width: 41%"></el-input>
        </div>
      </el-col>
    </el-row>
<!--    第六行-->
    <el-row>
      <el-col :span="6">
        <div class="grid-content">国籍:&emsp;&emsp;&emsp;
          <el-select v-model="value7" placeholder="请选择">
            <el-option
                v-for="item in options7"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
          </el-select>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">出生地:&emsp;&emsp;&emsp;
          <el-input v-model="input8" placeholder="请输入内容" style="width: 41%"></el-input>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">生日:&emsp;&emsp;&emsp;
          <el-input v-model="input9" placeholder="请输入内容" style="width: 41%"></el-input>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">民族:&emsp;&emsp;
          <el-select v-model="value8" placeholder="请选择">
            <el-option
                v-for="item in options8"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
          </el-select>
        </div>
      </el-col>
    </el-row>
<!--    第七行-->
    <el-row>
      <el-col :span="6">
        <div class="grid-content">宗教信仰:&emsp;
          <el-select v-model="value9" placeholder="请选择">
            <el-option
                v-for="item in options9"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
          </el-select>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">政治面貌:&emsp;&emsp;
          <el-select v-model="value10" placeholder="请选择">
            <el-option
                v-for="item in options10"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
          </el-select>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">身份证号:&emsp;
          <el-input v-model="input10" placeholder="请输入内容" style="width: 50%"></el-input>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">社保号:&emsp;
          <el-input v-model="input11" placeholder="请输入内容" style="width: 50%"></el-input>
        </div>
      </el-col>
    </el-row>
<!--    第八行-->
    <el-row>
      <el-col :span="6">
        <div class="grid-content">年龄:&emsp;&emsp;&emsp;
          <el-input v-model="input12" placeholder="请输入内容" style="width: 41%"></el-input>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">学历:&emsp;&emsp;&emsp;&emsp;
          <el-select v-model="value11" placeholder="请选择">
            <el-option
                v-for="item in options11"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
          </el-select>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">教育年限:&emsp;
          <el-select v-model="value12" placeholder="请选择">
            <el-option
                v-for="item in options12"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
          </el-select>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">学历专业:
          <el-select v-model="value13" placeholder="请选择">
            <el-option
                v-for="item in options13"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
          </el-select>
        </div>
      </el-col>
    </el-row>
<!--    第九行-->
    <el-row>
      <el-col :span="6">
        <div class="grid-content">薪酬标准:&emsp;
          <el-select v-model="value14" placeholder="请选择">
            <el-option
                v-for="item in options14"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
          </el-select>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">开户行:&emsp;&emsp;&emsp;
          <el-input v-model="input13" placeholder="请输入内容" style="width: 50%"></el-input>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">账号:&emsp;&emsp;&emsp;
          <el-input v-model="input14" placeholder="请输入内容" style="width: 50%"></el-input>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">登记人:&emsp;
          <el-input v-model="input15" placeholder="请输入内容" style="width: 50%"></el-input>
        </div>
      </el-col>
    </el-row>
<!--    第十行-->
    <el-row>
      <el-col :span="6">
        <div class="grid-content">建档时间:&emsp;
          <el-input v-model="input16"  style="width: 50%" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">特长:&emsp;&emsp;&emsp;&emsp;
          <el-select v-model="value15" placeholder="请选择">
            <el-option
                v-for="item in options15"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
          </el-select>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">爱好:&emsp;&emsp;&emsp;
          <el-select v-model="value16" placeholder="请选择">
            <el-option
                v-for="item in options16"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
          </el-select>
        </div>
      </el-col>
      <el-col :span="6">
        <el-button type="primary" @click="submit">提交</el-button>
      </el-col>
    </el-row>
<!--    第十一行-->
    <el-row>个人履历:
      <el-col :span="24">
        <div class="grid-content">
        <el-input
              type="textarea"
              :autosize="{ minRows: 4, maxRows: 4}"
              placeholder="请输入内容"
              v-model="textarea1"
              style="width: 93%">
          </el-input>
        </div>
      </el-col>
    </el-row>
<!--    第十二行-->
    <el-row>家庭信息关系:
      <el-col :span="24">
        <div class="grid-content">
          <el-input
              type="textarea"
              :autosize="{ minRows: 4, maxRows: 4}"
              placeholder="请输入内容"
              v-model="textarea2"
              style="width: 93%">
          </el-input>
        </div>
      </el-col>
    </el-row>
<!--    第十三行-->
    <el-row>备注:
      <el-col :span="24">
        <div class="grid-content">
          <el-input
              type="textarea"
              :autosize="{ minRows: 4, maxRows: 4}"
              placeholder="请输入内容"
              v-model="textarea3"
              style="width: 93%">
          </el-input>
        </div>
      </el-col>
    </el-row>

  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "Filebuild",
  data() {
    return {
      FId:1,
      SId:1,
      TiId:1,
      input1:'',//名字
      input2:'',//email
      input3:'',//电话
      input4:'',//qq
      input5:'',//手机
      input6:'',//住址
      input7:'',//邮编
      input8:'',//出生地
      input9:'',//生日
      input10:'',//身份证号
      input11:'',//社保号
      input12:'',//年龄
      input13:'',//开户行
      input14:'',//账号
      input15:'',//登记人
      input16:"",//建档时间
      value1:'',//一级机构
      value2:'',//二级机构
      value3:'',//三级机构
      value4:'',//职位分类
      value5:'',//职位名称
      value6:'',//
      value7:'',//国籍
      value8:'',//民族
      value9:'',//宗教
      value10:'',//政治面貌
      value11:'',//学历
      value12:'',//教育年限
      value13:'',//学历专业
      value14:'',//薪酬标准
      value15:'',//特长
      value16:"",//爱好
      textarea1:'',//个人履历
      textarea2:'',//家庭关系信息
      textarea3:'',//备注
      currentoptions:[],
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
      first_institutions:[],
      second_institutions:[],
      third_institutions:[],
      options2: [],
      options3: [],
      options4: [],
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
      options6: [{
        value: '男',
        label: '男'
      }, {
        value: '女',
        label: '女'
      }],
      options7: [{
        value: '中国',
        label: '中国'
      }, {
        value: '美国',
        label: '美国'
      }, {
        value: '澳大利亚',
        label: '澳大利亚'
      }, {
        value: '英国',
        label: '英国'
      }],
      options8: [{
        value: '汉族',
        label: '汉族'
      }, {
        value: '藏族',
        label: '藏族'
      }],
      options9: [{
        value: '佛教',
        label: '佛教'
      }, {
        value: '基督教',
        label: '基督教'
      }, {
        value: '犹太教',
        label: '犹太教'
      }, {
        value: '无神论',
        label: '无神论'
      }],
      options10: [{
        value: '党员',
        label: '党员'
      }, {
        value: '团员',
        label: '团员'
      }, {
        value: '群众',
        label: '群众'
      }],
      options11: [{
        value: '小学',
        label: '小学'
      }, {
        value: '初中',
        label: '高中'
      }, {
        value: '专科',
        label: '专科'
      }, {
        value: '本科',
        label: '本科'
      }, {
        value: '研究生',
        label: '研究生'
      }],
      options12: [{
        value: '12年',
        label: '12年'
      }, {
        value: '9年',
        label: '9年'
      }, {
        value: '6年',
        label: '6年'
      }, {
        value: '0年',
        label: '0年'
      }],
      options13: [{
        value: '软件工程',
        label: '软件工程'
      }, {
        value: '计算机科学与技术',
        label: '计算机科学与技术'
      }, {
        value: '电子信息工程',
        label: '电子信息工程'
      }],
      options14: [],
      options15: [{
        value: '敲代码',
        label: '敲代码'
      }],
      options16: [{
        value: '篮球',
        label: '篮球'
      }, {
        value: '足球',
        label: '足球'
      }],
    }
  },
  mounted(){
  },
  methods: {
    aaa(label){
      console.log(this.value5)
    },
    changeFirst(label){
      if(label=="集团"){
        console.log(this.value1)
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
    changeSecond(label){
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
    changeThird(label){
        if(label=="工程师"){
          let arr=this.currentoptions.filter((item,index)=>{
            return item.PtypeId=="1"
          })
          let obj={}
          this.options5=[]
          arr.forEach(item=>{
            obj={label:item.name,value:item.id,id:item.id}
            this.options5.push(obj)
          })
        }
      if(label=="学徒"){
        let arr=this.currentoptions.filter((item,index)=>{
          return item.PtypeId=="2"
        })
        console.log(arr)
        let obj={}
        this.options5=[]
        arr.forEach(item=>{
          obj={label:item.name,value:item.id,id:item.id}
          this.options5.push(obj)
        })
      }
      if(label=="实验员"){
        let arr=this.currentoptions.filter((item,index)=>{
          return item.PtypeId=="7"
        })
        console.log(arr)
        let obj={}
        this.options5=[]
        arr.forEach(item=>{
          obj={label:item.name,value:item.id,id:item.id}
          this.options5.push(obj)
        })
      }
      console.log(this.options5)
    },
    changeForth(label){
      if(label=="测试组"){
        this.TiId=1
      }
      if(label=="开发一组"){
        this.TiId=2
      }
      if(label=="研发组"){
        this.TiId=7
      }
      if(label=="开发二组"){
        this.TiId=9
      }
      console.log(this.FId+this.SId+this.TiId)
      console.log(this.value3)
    },
    submit(){
      axios.post('/filebuild',{
        positionId:this.value5,
        salaryId:this.value14,
        TiId:this.TiId,
        name:this.input1,
        fileId:"0"+this.FId+"0"+this.SId+"0"+this.TiId,
        gender:this.value6,
        email:this.input2,
        phone:this.input3,
        qq:this.input4,
        mobilePhone:this.input5,
        address:this.input6,
        zipCode:this.input7,
        picture:"123",
        country:this.value7,
        birth_place:this.input8,
        birthday:this.input9,
        nation:this.value8,
        religion:this.value9,
        politicsStatus:this.value10,
        idCard:this.input10,
        socialNumber:this.input11,
        age:this.input12,
        education:this.value11,
        educationYears:this.value12,
        educationMajor:this.value13,
        compensationStandards:this.value14,
        openBank:this.input13,
        bankNumber:this.input14,
        registrant:this.input15,
        advantage:this.value15,
        hobby:this.value16,
        resume:this.textarea1,
        familyRelationship:this.textarea2,
        comment:this.textarea3
      }).then(res=>{
        this.$message.success(res.data.msg)
        this.$router.go(0)
      })
    }
  },
  created() {
      //获取当前时间
    const dt = new Date()
    const y = dt.getFullYear()
    const m = (dt.getMonth() + 1 + '').padStart(2, '0')
    const d = (dt.getDate() + '').padStart(2, '0')
    const hh = (dt.getHours() + '').padStart(2, '0')
    const mm = (dt.getMinutes() + '').padStart(2, '0')
    const ss = (dt.getSeconds() + '').padStart(2, '0')
    this.input16=`${y}-${m}-${d} ${hh}:${mm}:${ss}`
      //获取机构
      axios.get('/getInstitutions').then(res=>{
        console.log(res)
        this.first_institutions=res.data.first_institutions
        this.second_institutions=res.data.second_institutions
        this.third_institutions=res.data.third_institutions
        let firstArr=[]
        let firstObj={label:this.first_institutions[0].Fi_name,value:this.first_institutions[0].Fi_name}
        firstArr.push(firstObj)
        this.options1=firstArr
      })
      //获取职位
      axios.get('/getPosition').then(res=>{

        this.options5=res.data.position
        this.options4=[]
        res.data.position_type.forEach(item=>{
          let obj={}
          obj={label:item.name,value:item.name,id:item.id}
          this.options4.push(obj)
        })
        this.currentoptions=res.data.position
        console.log(this.options5)
      })
      //获取薪酬
      axios.get('/getSalary').then(res=>{
        console.log(res.data.result)
        this.options14=[]
        for (let i = 0; i <res.data.result.length ; i++) {
          let firstObj={label:res.data.result[i].name,value:res.data.result[i].id}
          this.options14.push(firstObj)
        }
        console.log(this.options14)
      })
  }
}

</script>

<style scoped lang="less">
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
#headImg{
  margin-left: 50px;
  .viewPhoto{
    border: 1px rgba(99, 199, 210, 0.79) dashed;
    width: 200px;
    height: 200px;
  }
  #saveImage{
    display: none;
  }
  .save{
    margin: 30px auto;
  }
  .viewPhoto{
    position: relative;
    float: left;
    margin-right: 10%;
  }
  .el-icon-plus{
    font-size: 50px;
    color: rgba(99, 199, 210, 0.79);
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    max-width: 50%;
    text-align: center;
  }
}
</style>