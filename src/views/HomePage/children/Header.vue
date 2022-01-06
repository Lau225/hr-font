<template>
<div class="header">
  <div class="font">
    人力资源管理系统
  </div>
  <div class="right">
    <el-dropdown @command="handleCommand">
      <span class="el-dropdown-link el-icon-user-solid" style="color:white">
        <i class="el-icon-arrow-down el-icon--right"></i>
      </span>
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item command="exit">退出登录</el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
  </div>
</div>
</template>

<script>
export default {
  methods:{
    handleCommand(command){
      localStorage.clear()
      this.$router.push("/")
      console.log(123)
    }
  }
}
</script>

<style lang="less" scoped>
.header{
  position: relative;
  .font{
    color:white;
    font-size: 27px;
    line-height: 100px;
    position: absolute;
    left: 50px;
  }
  .btn{
    position: absolute;
    left: 300px;
    color:white;
    top:42px;
  }
  .right{
    position: absolute;
    right: 0;
    color:white;
    top:42px;
  }
}
</style>