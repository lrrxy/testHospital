<template>
  <el-container style="width: 1520px;">
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
      <el-aside width="200px">
        <el-menu background-color="#353744" text-color="#fff">
          <el-menu-item index="doctorLayout" @click="menuClick('doctorLayout')">
            <i class="el-icon-s-home" style="font-size: 18px;"> 首页</i>
          </el-menu-item>
          <el-menu-item index="orderToday" @click="menuClick('orderToday')">
            <i class="el-icon-news" style="font-size: 18px;color: #ffd04b;"> 今日挂号列表</i>
          </el-menu-item>
          <el-menu-item index="doctorOrder" @click="menuClick('doctorOrder')">
            <i class="el-icon-monitor" style="font-size: 18px;"> 历史挂号列表</i>
          </el-menu-item>
          <el-menu-item index="inBed" @click="menuClick('inBed')">
            <i class="el-icon-postcard" style="font-size: 18px;"> 转院申请管理</i>
          </el-menu-item>
          <el-menu-item index="userSelect" @click="menuClick('userSelect')">
            <i class="el-icon-user-select" style="font-size: 18px;"> 病人信息列表</i>
          </el-menu-item>
          <el-menu-item index="doctorCard" @click="menuClick('doctorCard')">
            <i class="el-icon-user-solid" style="font-size: 18px;"> 个人信息查询</i>
          </el-menu-item>
        </el-menu>
      </el-aside>

      <el-main>
        <el-card>
          <el-table :data="caseData" stripe>
            <el-table-column label="序号" type="index" width="50"></el-table-column>
            <el-table-column label="病人ID" prop="patientId"></el-table-column>
            <el-table-column label="病例ID" prop="examineTreatmentCaseId"></el-table-column>
            <el-table-column label="医生姓名" prop="doctorName"></el-table-column>
            <el-table-column label="预约类别" :formatter="formatCategory"></el-table-column>
            <el-table-column label="预约日期" prop="examineTreatmentDate"></el-table-column>
            <el-table-column label="操作">
              <template #default="scope">
                <el-button type="success" @click="handleAgree(scope.row.userId, scope.row.examineTreatmentCaseId)">
                  同意
                </el-button>
                <el-button type="danger" @click="handleDisagree(scope.row.userId, scope.row.examineTreatmentCaseId)">
                  不同意
                </el-button>
              </template>
            </el-table-column>
            <el-table-column label="详情">
              <template #default="scope">
                <el-button type="info" @click="viewDetails(scope.row)">
                  详情
                </el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      caseData: [],
      userIds: []
    };
  },
  mounted() {
    this.fetchUserIds();
  },
  methods: {
    async fetchUserIds() {
      try {
        const token = localStorage.getItem('token');
        const response = await axios.get('http://localhost:8090/api/nurse/selectUser', {
          headers: { token: token }
        });
        if (response.data.code === 1) {
          this.userIds = response.data.data.map(user => user.userId).join(',');
          this.fetchCaseData();
        }
      } catch (error) {
        console.error('获取用户ID失败:', error);
      }
    },
    async fetchCaseData() {
      try {
        const token = localStorage.getItem('token');
        const response = await axios.get(`http://localhost:8090/api/nurse/selectCase?userId=${this.userIds}`, {
          headers: { token: token }
        });
        if (response.data.code === 1) {
          this.caseData = response.data.data.map(caseItem => ({
            ...caseItem,
            patientId: caseItem.userId || '无'  // 确保有病人ID
          }));
        }
      } catch (error) {
        console.error('获取病例数据失败:', error);
      }
    },
    async handleAgree(userId, examineTreatmentCaseId) {
      try {
        const token = localStorage.getItem('token');
        const response = await axios.post('http://localhost:8090/api/nurse/agreeStatus', {
          userId: userId,
          examineTreatmentCaseId: examineTreatmentCaseId, // 添加病例ID
        }, {
          headers: { token: token }
        });
        if (response.data.code === 1) {
          this.fetchCaseData();
          this.$message.success('同意成功');
        } else {
          this.$message.error('同意失败');
        }
      } catch (error) {
        console.error('同意请求失败:', error);
        this.$message.error('请求失败');
      }
    },
    async handleDisagree(userId, examineTreatmentCaseId) {
      try {
        const token = localStorage.getItem('token');
        const response = await axios.post('http://localhost:8090/api/nurse/deagereeStatus', {
          userId: userId,
          examineTreatmentCaseId: examineTreatmentCaseId, // 添加病例ID
        }, {
          headers: { token: token }
        });
        if (response.data.code === 1) {
          this.fetchCaseData();
          this.$message.success('不同意成功');
        } else {
          this.$message.error('不同意失败');
        }
      } catch (error) {
        console.error('不同意请求失败:', error);
        this.$message.error('请求失败');
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
        case 'userSelect':
          this.$router.push('/nurse/info'); 
          break;  
        case 'doctorCard':
          this.$router.push('/nurse/personal'); 
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
    formatCategory(row) {
      const value = row.examineTreatmentCategory;
      if (value === 0) return '检查';
      if (value === 1) return '手术';
      return '未知';
    },
    viewDetails(row) {
      console.log('查看详情:', row);
    }
  }
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
/* .title {
  cursor: pointer;
}
.el-header {
  background-color: #427cb3;
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 1000;
}
.el-main {
  margin-left: 200px;
  margin-top: 70px;
  padding: 20px;
  height: calc(100% - 70px);
  overflow-y: auto;
}
.el-container {
  height: 100%;
  margin-left: -16px;
}
.el-aside {
  background-color: #353744;
  border-right: 1px solid lightgrey;
  position: fixed;
  top: 60px;
  left: 0;
  height: calc(100% - 70px);
  overflow-y: auto;
}
.el-menu {
  border: 0;
}
.head-bar {
  position: relative;
  box-sizing: border-box;
  width: 100%;
  height: 70px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.header-ico {
  margin-left: 15px;
}
.logo {
  color: #fff;
  font-size: 24px;
  margin-left: 10px;
}
.head-right {
  margin-right: 15px;
}
.user-avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  overflow: hidden;
  margin-right: 10px;
}
.user-name {
  color: #fff;
  cursor: pointer;
} */
</style>
