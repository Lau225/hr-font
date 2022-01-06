<template>
  <div style="padding: 20px">
<!--    头行-->
    <el-row>
      <el-col :span="24">
        <div class="grid-content">档案编号:&emsp;
          <el-input v-model="filecode" placeholder="请输入内容" style="width: 41%" disabled></el-input>
        </div>
      </el-col>
    </el-row>
    <!--    第一行-->
    <el-row>
      <el-col :span="8">
        <div class="grid-content">一级机构:&emsp;
          <el-input v-model="value1" placeholder="请输入内容" style="width: 41%" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="grid-content">二级机构:&emsp;
          <el-input v-model="value2" placeholder="请输入内容" style="width: 41%" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="grid-content">三级机构:&emsp;
          <el-input v-model="value3" placeholder="请输入内容" style="width: 41%" disabled></el-input>
        </div>
      </el-col>
    </el-row>
    <!--    第二行-->
    <el-row>
      <el-col :span="8">
        <div class="grid-content">职位分类:&emsp;
          <el-input v-model="value4" placeholder="请输入内容" style="width: 41%" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="grid-content">

        </div>
      </el-col>
      <el-col :span="8">
        <div class="grid-content">职位名称:&emsp;
          <el-input v-model="value5" placeholder="请输入内容" style="width: 41%" disabled></el-input>
        </div>
      </el-col>
    </el-row>
    <!--    第三行-->
    <el-row>
      <el-col :span="8">
        <div class="grid-content">名字:&emsp;&emsp;&emsp;
          <el-input v-model="input1" placeholder="请输入内容" style="width: 41%" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="grid-content">性别:&emsp;&emsp;&emsp;
          <el-select v-model="value6" placeholder="请选择" disabled>
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
          <el-input v-model="input2" placeholder="请输入内容" style="width: 41%" disabled></el-input>
        </div>
      </el-col>
    </el-row>
    <!--    第四行-->
    <el-row>
      <el-col :span="8">
        <div class="grid-content">电话:&emsp;&emsp;&emsp;
          <el-input v-model="input3" placeholder="请输入内容" style="width: 41%" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="grid-content">QQ:&emsp;&emsp;&emsp;
          <el-input v-model="input4" placeholder="请输入内容" style="width: 41%;margin-left: 6px" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="grid-content">手机:&emsp;&emsp;&emsp;
          <el-input v-model="input5" placeholder="请输入内容" style="width: 41%" disabled></el-input>
        </div>
      </el-col>
    </el-row>
    <!--    第五行-->
    <el-row>
      <el-col :span="16">
        <div class="grid-content">住址:&emsp;&emsp;&emsp;
          <el-input v-model="input6" placeholder="请输入内容" style="width: 70.5%" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="grid-content">邮编:&emsp;&emsp;&emsp;
          <el-input v-model="input7" placeholder="请输入内容" style="width: 41%" disabled></el-input>
        </div>
      </el-col>
    </el-row>
    <!--    第六行-->
    <el-row>
      <el-col :span="6">
        <div class="grid-content">国籍:&emsp;&emsp;&emsp;
          <el-select v-model="value7" placeholder="请选择" disabled>
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
          <el-input v-model="input8" placeholder="请输入内容" style="width: 41%" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">生日:&emsp;&emsp;&emsp;
          <el-input v-model="input9" placeholder="请输入内容" style="width: 41%" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">民族:&emsp;&emsp;
          <el-select v-model="value8" placeholder="请选择" disabled>
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
          <el-select v-model="value9" placeholder="请选择" disabled>
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
          <el-select v-model="value10" placeholder="请选择" disabled>
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
          <el-input v-model="input10" placeholder="请输入内容" style="width: 50%" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">社保号:&emsp;
          <el-input v-model="input11" placeholder="请输入内容" style="width: 50%" disabled></el-input>
        </div>
      </el-col>
    </el-row>
    <!--    第八行-->
    <el-row>
      <el-col :span="6">
        <div class="grid-content">年龄:&emsp;&emsp;&emsp;
          <el-input v-model="input12" placeholder="请输入内容" style="width: 41%" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">学历:&emsp;&emsp;&emsp;&emsp;
          <el-select v-model="value11" placeholder="请选择" disabled>
            <el-option
                v-for="item in options11"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
          </el-select>
        </div >
      </el-col>
      <el-col :span="6">
        <div class="grid-content">教育年限:&emsp;
          <el-select v-model="value12" placeholder="请选择" disabled>
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
          <el-select v-model="value13" placeholder="请选择" disabled>
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
          <el-select v-model="value14" placeholder="请选择" disabled>
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
          <el-input v-model="input13" placeholder="请输入内容" style="width: 50%" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">账号:&emsp;&emsp;&emsp;
          <el-input v-model="input14" placeholder="请输入内容" style="width: 50%" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">登记人:&emsp;
          <el-input v-model="input15" placeholder="请输入内容" style="width: 50%" disabled></el-input>
        </div>
      </el-col>
    </el-row>
    <!--    第十行-->
    <el-row>
      <el-col :span="6">
        <div class="grid-content">建档时间:&emsp;
          <el-input v-model="input16" placeholder="请输入内容" style="width: 50%" disabled></el-input>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">特长:&emsp;&emsp;&emsp;&emsp;
          <el-select v-model="value15" placeholder="请选择" disabled>
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
          <el-select v-model="value16" placeholder="请选择" disabled>
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
        <el-button type="primary" @click="recheck">复核</el-button>
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
              style="width: 93%" disabled>
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
              style="width: 93%" disabled>
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
              style="width: 93%" disabled>
          </el-input>
        </div>
      </el-col>
    </el-row>

  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Filechange",
  data() {
    return {
      filecode:'',//档案编号
      input1:'',
      input2:'',
      input3:'',
      input4:'',
      input5:'',
      input6:'',
      input7:'',
      input8:'',//出生地
      input9:'',//生日
      input10:'',//身份证号
      input11:'',//社保号
      input12:'',//年龄
      input13:'',//开户行
      input14:'',//账号
      input15:'',//登记人
      input16:'',//建档时间
      value1:'',
      value2:'',
      value3:'',
      value4:'',
      value5:'',
      value6:'',
      value7:'',//国籍
      value8:'',//民族
      value9:'',//宗教
      value10:'',//政治面貌
      value11:'',//学历
      value12:'',//教育年限
      value13:'',//学历专业
      value14:'',//薪酬标准
      value15:'',//特长
      value16:'',//爱好
      textarea1:'',//个人履历
      textarea2:'',//家庭关系信息
      textarea3:'',//备注
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
      options6: [{
        value: '选项1',
        label: '男'
      }, {
        value: '选项2',
        label: '女'
      }],
      options7: [{
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
      options8: [{
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
      options9: [{
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
      options10: [{
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
      options11: [{
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
      options12: [{
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
      options13: [{
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
      options14: [{
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
      options15: [{
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
      options16: [{
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
      fileId:"",
      list:[]
    }
  },
  methods: {
    recheck(){
      axios.post('/rechecked',{fileId:this.fileId}).then(res=>{
        this.$message(res.data.msg)
        this.$router.push('/recheck')
      })
    }
  },
  created() {
    this.fileId=this.$route.query.fileId
    axios.post('recheck',{fileId:this.fileId}).then(res=>{
      console.log(res)
      this.list=res.data.arr
      this.filecode=this.list.fileId
      this.input1=this.list.name
      this.input2=this.list.email
      this.input3=this.list.phone
      this.input4=this.list.qq
      this.input5=this.list.mobilePhone
      this.input6=this.list.address
      this.input7=this.list.zipCode
      this.input8=this.list.birth_place
      this.input9=this.list.birthday
      this.input10=this.list.idCard
      this.input11=this.list.socialNumber
      this.input12=this.list.age
      this.input13=this.list.openBank
      this.input14=this.list.bankNumber
      this.input15=this.list.registrant
      this.input16=this.list.buildDate
      this.value1=res.data.Fi_name
      this.value2=res.data.Si_name
      this.value3=res.data.Ti_name
      this.value4=res.data.position_type
      this.value5=res.data.positionName
      this.value6=this.list.gender
      this.value7=this.list.country
      this.value8=this.list.nation
      this.value9=this.list.religion
      this.value10=this.list.politicsStatus
      this.value11=this.list.education
      this.value12=this.list.educationYears
      this.value13=this.list.educationMajor
      this.value14=this.list.compensationStandards
      this.value15=this.list.advantage
      this.value16=this.list.hobby
      this.textarea1=this.list.resume
      this.textarea2=this.list.familyRelationship
      this.textarea3=this.list.comment
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