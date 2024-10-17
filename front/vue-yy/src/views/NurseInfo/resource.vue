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
            <i class="el-icon-postcard" style="font-size: 18px;color: #ffd04b;"> 转院申请管理</i>
          </el-menu-item>
          <el-menu-item index="doctorCard" @click="menuClick('userSelect')">
            <i class="el-icon-user-select" style="font-size: 18px;"> 病人信息列表</i>
          </el-menu-item>
          <el-menu-item index="doctorCard" @click="menuClick('doctorCard')">
            <i class="el-icon-user-solid" style="font-size: 18px;"> 个人信息查询</i>
          </el-menu-item>
        </el-menu>
      </el-aside>

      <el-main>
        <!-- 内容 -->
        <el-card class="transfer-requests">
          <h3>转院申请列表</h3>
          <div v-for="(request, index) in transferRequests" :key="index" class="transfer-request-item">
            <h4>申请信息 {{ index + 1 }}</h4>
            <p><strong>病人姓名：</strong>{{ request.userName }}</p>
            <p><strong>当前医院：</strong>{{ request.hospitalName }}</p>
            <p><strong>目标医院：</strong>{{ request.new_hospitalName }}</p>
            <p><strong>转院原因：</strong>{{ request.condition }}</p>

            <el-divider></el-divider>

            <el-form :model="form[index]" label-width="120px">
              <el-form-item label="转院申请">
                <el-radio-group v-model="form[index].approvalStatus">
                  <el-radio label="agree">同意</el-radio>
                  <el-radio label="disagree">不同意</el-radio>
                </el-radio-group>
              </el-form-item>

              <el-form-item v-if="form[index].approvalStatus === 'disagree'" label="不同意原因">
                <el-input type="textarea" v-model="form[index].disagreementReason" placeholder="请输入不同意原因"></el-input>
              </el-form-item>

              <el-form-item>
                <el-button type="primary" @click="submitApproval(index)">提交</el-button>
              </el-form-item>
            </el-form>
          </div>
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
      activePath: '',
      transferRequests: [],
      form: [],
      userIds: [],
    };
  },
  created() {
    this.fetchUsers();
  },
  methods: {
    fetchUsers() {
      const token = localStorage.getItem('token');
      axios.get('/api/nurse/selectUser', {
        headers: {
          token: token,
        },
      })
      .then(response => {
        if (response.data.code === 1) {
          this.userIds = response.data.data.map(user => user.userId);
          this.fetchTransfers(this.userIds);
        } else {
          this.$message.error(response.data.msg);
        }
      })
      .catch(error => {
        console.error(error);
        this.$message.error('获取用户信息失败');
      });
    },
    
    fetchTransfers(userIds) {
      const token = localStorage.getItem('token');
      axios.get(`http://localhost:8090/api/nurse/selectTransfer?userId=${userIds}`, {
        headers: {
          token: token,
        },
      })
      .then(response => {
        if (response.data.code === 1) {
          this.transferRequests = response.data.data;
          this.form = this.transferRequests.map(() => ({
            approvalStatus: '',
            disagreementReason: '',
          }));
        } else {
          this.$message.error(response.data.msg);
        }
      })
      .catch(error => {
        console.error(error);
        this.$message.error('获取转院申请失败');
      });
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
    submitApproval(index) {
      const request = this.transferRequests[index];
      const token = localStorage.getItem('token');
      const userId = request.userId; // 假设每个申请都有 userId

      if (this.form[index].approvalStatus === 'agree') {
        axios.post('http://localhost:8090/api/nurse/updateStatus', {
          userId: userId,
          approvalStatus: this.form[index].approvalStatus,
        }, {
          headers: {
            token: token,
          },
        })
        .then(response => {
          if (response.data.code === 1) {
            this.$message.success('已同意转院申请');
            this.fetchTransfers(this.userIds);
          } else {
            this.$message.error(response.data.msg);
          }
        })
        .catch(error => {
          console.error(error);
          this.$message.error('处理申请失败');
        });
      } else if (this.form[index].approvalStatus === 'disagree') {
        if (!this.form[index].disagreementReason) {
          this.$message.warning('请填写不同意原因');
          return;
        }

        const payload = {
          userId: userId,
          userName: request.userName,
          hospitalName: request.hospitalName,
          new_hospitalName: request.new_hospitalName,
          condition: request.condition,
          notcondition: this.form[index].disagreementReason, // 使用不同意原因
        };

        axios.post('http://localhost:8090/api/nurse/insertDingdan', payload, {
          headers: {
            token: token,
          },
        })
        .then(response => {
          if (response.data.code === 1) {
            this.$message.success('已不同意转院申请');
            this.fetchTransfers(this.userIds);
          } else {
            this.$message.error(response.data.msg);
          }
        })
        .catch(error => {
          console.error(error);
          this.$message.error('处理申请失败');
        });
      }
    },
  }
};
</script>
<style scoped>
.transfer-requests {
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 8px;
}
.transfer-request-item {
  padding: 15px;
  margin-bottom: 20px;
  background-color: #ffffff;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}
h4 {
  color: #333;
}
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