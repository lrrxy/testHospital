<template>
  <el-container style="width: 1520px;">
    <!-- 头部 -->
    <el-header>
      <div class="head-bar">
        <div class="header-ico">
          <img src="@/assets/img/1.png" style="width: 55px; height: 55px; margin-top: 5px;">
        </div>
        <div class="logo">&nbsp;医院管理系统</div>
        <div class="head-right">
          <div class="head-user-con">
            <div class="user-avatar">
              <img src="../../assets/11.jpg" />
            </div>
            <el-dropdown @command="handleCommand" class="user-name" trigger="click">
              <span class="el-dropdown-link">
                <span>欢迎您，{{ user.nurseName }}&nbsp;</span>
                <i class="el-icon-caret-bottom"></i>
              </span>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item command="logout">退出登录</el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
          </div>
        </div>
      </div>
    </el-header>

    <el-container>
      <!-- 侧边栏 -->
      <el-aside width="200px">
        <el-menu background-color="#353744" text-color="#fff">
          <el-menu-item index="doctorLayout" @click="menuClick('doctorLayout')">
            <i class="el-icon-s-home" style="font-size: 18px;"> 首页</i>
          </el-menu-item>
          <el-menu-item index="orderToday" @click="menuClick('orderToday')">
            <i class="el-icon-news" style="font-size: 18px;"> 今日挂号列表</i>
          </el-menu-item>
          <el-menu-item index="doctorOrder" @click="menuClick('doctorOrder')">
            <i class="el-icon-monitor" style="font-size: 18px;"> 历史挂号列表</i>
          </el-menu-item>
          <el-menu-item index="inBed" @click="menuClick('inBed')">
            <i class="el-icon-postcard" style="font-size: 18px;"> 转院申请管理</i>
          </el-menu-item>
          <el-menu-item index="doctorCard" @click="menuClick('userSelect')">
            <i class="el-icon-user-select" style="font-size: 18px;"> 病人信息列表</i>
          </el-menu-item>
          <el-menu-item index="doctorCard" @click="menuClick('doctorCard')">
            <i class="el-icon-user-solid" style="font-size: 18px;color: #ffd04b;"> 个人信息查询</i>
          </el-menu-item>
        </el-menu>
      </el-aside>

      <el-main>
        <!-- 内容 -->
        <div class="user-info">
          <div class="user-item">
            <label>姓名:</label>
            <el-input v-model="user.nurseName" disabled class="user-input" />
          </div>
          <div class="user-item">
            <label>年龄:</label>
            <el-input v-model="user.nurseAge" disabled class="user-input" />
          </div>
          <div class="user-item">
            <label>性别:</label>
            <el-input :value="user.nurseSex === '0' ? '男' : '女'" disabled class="user-input" />
          </div>
          <div class="user-item">
            <label>手机号:</label>
            <el-input v-model="user.nursePhone" disabled class="user-input" />
          </div>
          <div class="user-item">
            <label>身份证号:</label>
            <el-input v-model="user.idCard" disabled class="user-input" />
          </div>
          <div class="user-item">
            <label>邮箱:</label>
            <el-input v-model="user.nurseEmail" disabled class="user-input" />
          </div>
          <div class="user-item">
            <label>职位:</label>
            <el-input v-model="user.nursePosition" disabled class="user-input" />
          </div>
          <div class="user-item">
            <label>评分:</label>
            <el-input v-model="user.nurseScore" disabled class="user-input" />
          </div>
        </div>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      user: {
        nurseName: '',
        nurseAge: '',
        nurseSex: '',
        nursePhone: '',
        idCard: '',
        nurseEmail: '',
        nursePosition: '',
        nurseScore: ''
      }
    };
  },
  created() {
    this.fetchUserData();
  },
  methods: {
    async fetchUserData() {
      try {
        const response = await axios.get('http://localhost:8090/api/nurse/info', {
          headers: {
            token: window.localStorage.getItem("token")  // 将token添加到请求头
          }
        });
        if (response.data.code === 1) {
          this.user = response.data.data;
        } else {
          this.$message.error(response.data.msg);
        }
      } catch (error) {
        this.$message.error('获取数据失败，请重试。');
      }
    },
    menuClick(menuItem) {
      switch (menuItem) {
        case 'doctorLayout':
          this.$router.push('/nurse/index');
          break;
        case 'orderToday':
          this.$router.push('/nurse/about');
          break;
        case 'doctorOrder':
          this.$router.push('/nurse/contact');
          break;
        case 'inBed':
          this.$router.push('/nurse/resource');
          break;
        case 'doctorCard':
          this.$router.push('/nurse/personal');
          break;
        case 'userSelect':
          this.$router.push('/nurse/info');
          break;
        default:
          break;
      }
    },
    handleCommand(command) {
      if (command === 'logout') {
        // 处理退出登录逻辑
        localStorage.removeItem('token');
        this.$router.push('/login');
      }
    }
  }
};
</script>

<style scoped>
.el-header {
  background-color: #427cb3;
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  position: fixed; /* 固定头部 */
  top: 0; /* 距离顶部 */
  left: 0; /* 距离左侧 */
  z-index: 1000; /* 确保头部在其他元素之上 */
}
.el-main {
  margin-left: 200px; /* 留出侧边栏宽度 */
  margin-top: 70px; /* 留出头部高度 */
  padding: 20px; /* 内边距 */
  height: calc(100% - 70px); /* 确保内容区域高度正确 */
  overflow-y: auto; /* 如果内容超出，允许滚动 */
}
.el-container {
    /* margin-top: -15px; */
  height: 100%;
  margin-left: -16px;
}
.el-aside {
  background-color: #353744;
  border-right: 1px solid lightgrey;
  position: fixed; /* 固定侧边栏 */
  top: 60px; /* 距离头部底部 */
  left: 0; /* 距离左侧 */
  height: calc(100% - 70px); /* 高度减去头部的高度 */
  overflow-y: auto; /* 如果内容超出，允许滚动 */
}
.el-menu {
  border: 0;
}
.head-bar {
  position: relative;
  box-sizing: border-box;
  width: 100%;
  height: 70px;
  font-size: 18px;
  color: #fff;
}
.header-ico {
  float: left;
  padding: 0 21px;
  line-height: 70px;
}
.head-bar .logo {
  float: left;
  width: 250px;
  line-height: 70px;
  margin-left: -25px;
}
.head-right {
  float: right;
  padding-right: 50px;
}
.head-user-con {
  display: flex;
  height: 70px;
  align-items: center;
}
.user-name {
  margin-left: 10px;
}
.user-avatar {
  margin-left: 20px;
}
.user-avatar img {
  display: block;
  width: 40px;
  height: 40px;
  border-radius: 50%;
}
.user-info {
  margin: 20px;
  padding: 20px;
  background-color: #f9f9f9; /* 背景颜色 */
  border-radius: 8px; 
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 阴影效果 */
}

.user-item {
  display: flex;
  align-items: center;
  margin-bottom: 15px;
  padding: 10px; /* 内边距 */
  background-color: #ffffff; /* 项目背景颜色 */
  /* border-radius: 4px; 圆角 */
  transition: background-color 0.3s; /* 过渡效果 */
}

.user-item:hover {
  background-color: #f1f1f1; /* 悬停时改变背景颜色 */
}

.user-item label {
  width: 100px; /* 标签宽度 */
  font-weight: bold;
  color: #333; /* 标签颜色 */
}

.user-input {
  flex: 1;
  max-width: 300px;
 
  padding: 8px; /* 内边距 */
  font-size: 14px; /* 字体大小 */
  color: #333; /* 字体颜色 */
}

.user-input:disabled {
  background-color: #e9ecef; /* 禁用状态的背景颜色 */
  color: #6c757d; /* 禁用状态的字体颜色 */
}

.el-dropdown-link {
  color: #fff;
  cursor: pointer;
}
</style>
