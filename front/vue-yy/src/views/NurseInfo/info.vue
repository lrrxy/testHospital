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
                <span>欢迎您，刘护士&nbsp;</span>
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
          <el-menu-item
            index="doctorCard"
            :class="{ active: activePath === 'userSelect' }"
            @click="menuClick('userSelect')"
          >
            <i class="el-icon-user-select" style="font-size: 18px;color: #ffd04b;"> 病人信息列表</i>
          </el-menu-item>
          <el-menu-item index="doctorCard" @click="menuClick('doctorCard')">
            <i class="el-icon-user-solid" style="font-size: 18px;"> 个人信息查询</i>
          </el-menu-item>
        </el-menu>
      </el-aside>

      <el-main>
        <!-- 内容 -->
        <div class="patient-info-container">
          <div class="patient-card" v-for="(patient, index) in patients" :key="index">
            <img :src="patient.photo" class="patient-photo" />
            <div class="patient-details">
              <p>姓名: {{ patient.name }}</p>
              <p>病床号: {{ patient.bedNumber }}</p>
              <p>年龄: {{ patient.age }}</p>
              <p>性别: {{ patient.gender }}</p>
              <p>病症: {{ patient.condition }}</p>
            </div>
            <el-button type="primary" @click="viewDetails(patient)">详情</el-button>
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
      activePath: '',
      patients: [],
    };
  },
  methods: {
    async fetchPatients() {
      const url = 'http://localhost:8090/api/nurse/selectUser';
      const token = window.localStorage.getItem('token');

      try {
        const response = await axios.get(url, {
          headers: {
            'Content-Type': 'application/json',
            'token': token,
            'Cache-Control': 'no-cache',
          },
        });

        if (response.data.code === 1) {
          this.patients = response.data.data.map(patient => ({
            name: patient.userName,
            bedNumber: patient.sickbedId,
            age: patient.userAge,
            gender: patient.userSex === '0' ? '男' : '女',
            condition: patient.userCase,
            
          }));
        } else {
          console.error(response.data.msg);
        }
      } catch (error) {
        console.error('获取病人信息时出错:', error);
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
        localStorage.removeItem('token');
        this.$router.push('/login');
      }
    },
    viewDetails(patient) {
      console.log('查看病人详情:', patient);
      // 可以在这里实现查看详情的逻辑
    },
  },
  mounted() {
    this.fetchPatients(); // 组件挂载后获取病人信息
  },
};
</script>

<style scoped>
.title {
  cursor: pointer;
}
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
.patient-info-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin-top: 20px;
}
.patient-card {
  width: calc(50% - 20px); /* 每行放两个卡片，留出间隙 */
  margin: 10px;
  padding: 15px;
  border: 1px solid #ccc;
  border-radius: 8px;
  text-align: center;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s; /* 动画效果 */
}
.patient-card:hover {
  transform: translateY(-5px); /* 悬停时抬起效果 */
}
.patient-photo {
  width: 80px; /* 确定大小 */
  height: 80px; /* 确定大小 */
  border-radius: 50%;
  object-fit: cover; /* 确保图片覆盖 */
  margin-bottom: 10px; /* 底部间距 */
}
.el-dropdown-link {
  color: #fff;
  cursor: pointer;
}
</style>
