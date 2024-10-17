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
                <span>欢迎您，李医生&nbsp;</span>
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
          <el-menu-item
            index="doctorLayout"
            :class="{ active: activePath === 'doctorLayout' }"
            @click="menuClick('doctorLayout')"
          >
            <i class="el-icon-s-home" style="font-size: 18px;color: #ffd04b;"> 首页</i>
          </el-menu-item>
          <el-menu-item
            index="orderToday"
            :class="{ active: activePath === 'orderToday' }"
            @click="menuClick('orderToday')"
          >
            <i class="el-icon-news" style="font-size: 18px;"> 医嘱管理列表</i>
          </el-menu-item>
          <el-menu-item
            index="doctorOrder"
            :class="{ active: activePath === 'doctorOrder' }"
            @click="menuClick('doctorOrder')"
          >
            <i class="el-icon-monitor" style="font-size: 18px;"> 历史挂号列表</i>
          </el-menu-item>
          <el-menu-item
            index="doctorCard"
            :class="{ active: activePath === 'userSelect' }"
            @click="menuClick('userSelect')"
          >
            <i class="el-icon-user-select" style="font-size: 18px;"> 患者管理列表</i>
          </el-menu-item>
          <el-menu-item
            index="doctorCard"
            :class="{ active: activePath === 'doctorCard' }"
            @click="menuClick('doctorCard')"
          >
            <i class="el-icon-user-solid" style="font-size: 18px;"> 个人信息查询</i>
          </el-menu-item>
        </el-menu>
      </el-aside>

      <el-main>
        <div class="index-people-container">
          <div class="index-people">
            <div class="indexPeople" style="margin-right: 30px;margin-left: 152px;">
              <div class="userImage">
                <i class="el-icon-user" style="font-size: 132px"></i>
              </div>
              <div class="userFont">
                <div class="spanCure">
                  <span>就诊概况</span>
                </div>
                <div class="spanPeople">
                  <span>今天预约挂号总人数：0</span>
                </div>
              </div>
            </div>

            <div class="indexPeople">
              <div class="userImage">
                <i class="el-icon-office-building" style="font-size: 132px"></i>
              </div>
              <div class="userFont">
                <div class="spanCure">
                  <span>住院概况</span>
                </div>
                <div class="spanPeople">
                  <span>今天住院总人数：0</span>
                </div>
              </div>
            </div>
          </div>

          <div class="image-container" style="text-align: center;">
            <img src="@/assets/16.png" style="width: 641px;">
          </div>
        </div>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
export default {
  data() {
    return {
      activePath: ''
    };
  },
  methods: {
    menuClick(menuItem) {
      this.activePath = menuItem; // 设置活动路径
      switch (menuItem) {
        case 'doctorLayout':
          this.$router.push('/doctor/index');
          break;
        case 'orderToday':
          this.$router.push('/doctor/about');
          break;
        case 'doctorOrder':
          this.$router.push('/doctor/contact'); 
          break;
        case 'doctorCard':
          this.$router.push('/doctor/personal'); 
          break;
          case 'userSelect':
          this.$router.push('/doctor/info'); 
          break;  
        default:
          break;
      }
    },
    handleCommand(command) {
      if (command === 'logout') {
        this.$router.push('/login');
      }
    }
  }
};
</script>

<style scoped >
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
.index-people-container {
  margin: 20px; /* 根据需要调整 */
}
.index-people {
  display: flex; /* 使用 flex 布局 */
}
.indexPeople {
  height: 200px;
  width: 440px;
  background: #58b9ae;
  margin-right: 10px; /* 让两个 div 之间有空隙 */
}
.userFont {
  height: 150px;
  width: 250px;
  float: right;
  color: white;
}
.spanCure {
  font-size: 15px;
  margin-top: 60px;
  margin-bottom: 15px;
}
.spanPeople {
  font-size: 18px;
}
.userImage {
  height: 150px;
  width: 150px;
  font-size: 130px;
  color: white;
  position: relative;
  left: 40px;
  top: 10px;
  float: left;
}
.el-dropdown-link {
  color: #fff;
  cursor: pointer;
}

</style>
