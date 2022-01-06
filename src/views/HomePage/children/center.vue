<template>
<div class="body">
  <router-view></router-view>

</div>
</template>

<script>
import {Base64} from "js-base64";
import axios from "axios";
export default {
  name: "center",
  data() {
    return {
      msg:""
    }
  },
  methods:{
    get(){
      axios.get('getarticle').then(res=>{
        console.log(res)
      })
    },
    async add(){
      const contentResult=await axios({
        url:'/addarticle',
        method:'post',
        headers:{
          'Authorization':this._encode()
        }
      })
      console.log(contentResult)
    },
    _encode(){
      const token=localStorage.getItem("token")
      const encoded=Base64.encode(`${token}:`)
      return `Basic ${encoded}`
    }
  }
}
</script>

<style lang="less" scoped>
.el-table{
  padding: 20px;
  
}
</style>