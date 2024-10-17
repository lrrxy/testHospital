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
                      <i class="el-icon-monitor" style="font-size: 18px;color: #ffd04b;"> 历史挂号列表</i>
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
              <!-- 内容 -->
              <el-card>
                  <el-row type="flex">
                      <el-col :span="6">
                          <el-input v-model="query" placeholder="请输入患者id查询">
                              <el-button slot="append" icon="el-icon-search" @click="requestOrders"></el-button>
                          </el-input>
                      </el-col>
                  </el-row>
                  <el-table :data="caseData" stripe>
                      <el-table-column label="序号" type="index" width="50"></el-table-column>
                      <el-table-column label="病人ID" prop="patientId"></el-table-column>
                      <el-table-column label="病例ID" prop="examineTreatmentCaseId"></el-table-column>
                      <el-table-column label="医生姓名" prop="doctorName"></el-table-column>
                      <el-table-column label="预约类别" :formatter="formatCategory"></el-table-column>
                      <el-table-column label="预约日期" prop="examineTreatmentDate"></el-table-column>
                      <el-table-column label="挂号状态">
                        <template #default="scope">
                                <el-tag
                                    :type="scope.row.caseStatus === 3 ? 'success' : (scope.row.caseStatus === 4 ? 'danger' : 'info')"
                                    style="cursor: pointer;"
                                >
                                    {{ scope.row.caseStatus === 3 ? '已同意' : (scope.row.caseStatus === 4 ? '未同意' : '未知状态') }}
                                </el-tag>
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

                  <!-- 分页 -->
                  <el-pagination 
                      @size-change="handleSizeChange" 
                      @current-change="handleCurrentChange" 
                      background 
                      layout="total, sizes, prev, pager, next, jumper" 
                      :current-page="pageNumber" 
                      :page-size="size" 
                      :page-sizes="[1, 2, 4, 8, 16]" 
                      :total="total">
                  </el-pagination>
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
          userId: 1,
          caseData: [],
          pageNumber: 1,
          size: 8,
          query: "",
          total: 0,
      };
  },
  mounted() {
      this.fetchCaseData();  // 组件挂载后获取病例数据
  },
  methods: {
      async fetchCaseData() {
      try {
              const token = localStorage.getItem('token');
              const response = await axios.get('http://localhost:8090/api/nurse/selectPay', {
                  headers: {
                      token : token // 从本地存储获取token
                  }
              });
              if (response.data.code === 1) {
                  this.caseData = response.data.data;
                  this.total = this.caseData.length;  // 更新总数
              } else {
                  console.error(response.data.msg);
              }
          } catch (error) {
              console.error('获取数据失败:', error);
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
      handleCurrentChange(num) {
          this.pageNumber = num;
          this.fetchCaseData();  // 更新数据
      },
      formatCategory(row) {
          const value = row.examineTreatmentCategory;
          if (value === 0) return '检查';
          if (value === 1) return '手术';
          return '未知';
      },
      formatCaseStatus(row) {
          const status = row.caseStatus;
          if (status === 3) return '已同意';
          if (status === 4) return '未同意';
          return '未知状态';
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
width: 40px;
height: 40px;
border-radius: 50%;
}
.el-dropdown-link {
  color: #fff;
  cursor: pointer;
}
</style>
