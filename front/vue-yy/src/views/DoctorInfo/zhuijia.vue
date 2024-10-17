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
          <el-menu-item
            index="doctorLayout"
            :class="{ active: activePath === 'doctorLayout' }"
            @click="menuClick('doctorLayout')"
          >
            <i class="el-icon-s-home" style="font-size: 18px;"> 首页</i>
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
            <i class="el-icon-monitor" style="font-size: 18px;color: #ffd04b;"> 历史挂号列表</i>
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
            <!-- 内容 -->
            <el-card>
        <el-row>
          <el-col :span="7">
            挂号单号：<el-input disabled v-model="oId" class="orderInput"></el-input>
          </el-col>
          <el-col :span="7">
            患者账号：<el-input disabled v-model="pId" class="orderInput"></el-input>
          </el-col>
          <el-col :span="7">
            患者姓名：<el-input disabled v-model="pName" class="orderInput"></el-input>
          </el-col>
          <el-col :span="3">
            <el-button type="success" style="font-size: 18px;" @click="submitClick">
              <i class="iconfont icon-r-paper" style="font-size: 20px;"></i> 提交
            </el-button>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="7">
            患者性别：<el-input disabled v-model="pGender" class="orderInput"></el-input>
          </el-col>
          <el-col :span="7">
            联系方式：<el-input disabled v-model="pPhone" class="orderInput"></el-input>
          </el-col>
          <el-col :span="7">
            医生姓名：<el-input disabled v-model="dName" class="orderInput"></el-input>
          </el-col>
          <el-col :span="3">
            <el-button type="success" style="font-size: 18px;" @click="openAdvice">
              <i class="el-icon-circle-plus-outline" style="font-size: 20px;"></i>
              诊断/意见
            </el-button>
          </el-col>
        </el-row>
        <!-- 药物表格 -->
        <el-row>
          <el-col :span="12" style="margin-top: 9px">
            <el-input v-model="queryDrug" placeholder="请输入名称查询" class="drugInput">
              <el-button slot="append" icon="el-icon-search" @click="requestDrug"></el-button>
            </el-input>
            <el-table :data="drugData" stripe border>
              <el-table-column label="编号" prop="drId"></el-table-column>
              <el-table-column label="名称" prop="drName"></el-table-column>
              <el-table-column label="剩余数量" prop="drNumber"></el-table-column>
              <el-table-column label="单位" prop="drUnit"></el-table-column>
              <el-table-column label="单价" prop="drPrice"></el-table-column>
              <el-table-column label="操作" width="120" fixed="right">
                <template #default="{ row }">
                  <el-button type="success" style="font-size: 14px;" @click="addDrug(row.drId)">
                    <i class="el-icon-circle-plus-outline" style="font-size: 16px;"></i> 增加
                  </el-button>
                </template>
              </el-table-column>
            </el-table>
            <!-- 分页 -->
            <el-pagination
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
              background
              layout="total, sizes, prev, pager, next"
              :total="total"
              :page-size="size"
              :page-sizes="[1, 2, 4, 8, 16]"
            ></el-pagination>
          </el-col>
          <!-- 右边已选择的药物 -->
          <el-col :span="12" class="drugRigth">
            <el-table stripe border :data="drugBuyData" class="rigthTable">
              <el-table-column label="编号" prop="drId"></el-table-column>
              <el-table-column label="名称" prop="drName"></el-table-column>
              <el-table-column label="单价" prop="drPrice"></el-table-column>
              <el-table-column label="数量" prop="drNum"></el-table-column>
              <el-table-column label="小记" prop="drSum"></el-table-column>
              <el-table-column label="操作" width="120" fixed="right">
                <template #default="{ row }">
                  <el-button type="danger" style="font-size: 14px;" icon="el-icon-delete" @click="deleteDrug(row.drId)"> 移除</el-button>
                </template>
              </el-table-column>
            </el-table>
            <el-tag>共计：{{ drugTotalPrice }}元</el-tag>
          </el-col>
        </el-row>
        <!-- 检查项目编写 -->
        <el-row>
          <el-col :span="12" style="margin-top: 9px;">
            <el-input v-model="queryCheck" placeholder="请输入名称查询" class="drugInput">
              <el-button slot="append" icon="el-icon-search" @click="requestCheck"></el-button>
            </el-input>
            <el-table stripe border :data="checkData">
              <el-table-column label="编号" prop="chId"></el-table-column>
              <el-table-column label="项目" prop="chName"></el-table-column>
              <el-table-column label="价格" prop="chPrice"></el-table-column>
              <el-table-column label="操作" width="120" fixed="right">
                <template #default="{ row }">
                  <el-button type="success" style="font-size: 14px;" @click="addCheck(row.chId)">
                    <i class="el-icon-circle-plus-outline" style="font-size: 16px;"></i> 增加
                  </el-button>
                </template>
              </el-table-column>
            </el-table>
            <!-- 分页 -->
            <el-pagination
              @size-change="checkSizeChange"
              @current-change="checkCurrentChange"
              background
              layout="total, prev, pager, next"
              :total="checkTotal"
              :page-size="checkSize"
            ></el-pagination>
          </el-col>
          <!-- 右边已选择的检查 -->
          <el-col :span="12" class="drugRigth">
            <el-table stripe border class="rigthTable" :data="checkBuyData">
              <el-table-column label="编号" prop="chId"></el-table-column>
              <el-table-column label="项目" prop="chName"></el-table-column>
              <el-table-column label="价格" prop="chPrice"></el-table-column>
              <el-table-column label="操作" width="120" fixed="right">
                <template #default="{ row }">
                  <el-button type="danger" style="font-size: 14px;" icon="el-icon-delete" @click="deleteCheck(row.chId)"> 移除</el-button>
                </template>
              </el-table-column>
            </el-table>
            <el-tag>共计：{{ checkTotalPrice }}元</el-tag>
          </el-col>
        </el-row>
      </el-card>
  
      <!-- 病因编写对话框 -->
      <el-dialog title="诊断及医生建议编写" :visible.sync="adviceFormVisible">
        <el-input
          type="textarea"
          :rows="8"
          placeholder="请输入内容"
          v-model="advice"
        ></el-input>
        <div slot="footer" class="dialog-footer">
          <el-button @click="adviceFormVisible = false" style="font-size: 18px;">
            <i class="el-icon-close" style="font-size: 20px;"></i> 取 消
          </el-button>
          <el-button type="primary" @click="holdAdvice">保存</el-button>
        </div>
      </el-dialog>


        </el-main>
      </el-container>
    </el-container>
  </template>
<script>
export default {
  data() {
    return {
        oId: 1,
      pId: 1,
      dId: 0,
      pName: "aa",
      pGender: "as",
      pPhone: "asd",
      dName: "",
      drugData: [],
      size: 4,
      pageNumber: 1,
      total: 3,
      queryDrug: "",
      drugBuyData: [],
      drugTotalPrice: 0,
      advice: "",
      checkData: [],
      queryCheck: "",
      checkTotal: 3,
      checkSize: 4,
      checkPageNumber: 1,
      checkTotalPrice: 0,
      checkBuyData: [],
      adviceFormVisible: false,
    };
  },
  methods: {
    menuClick(menuItem) {
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
        // 处理退出登录逻辑
        localStorage.removeItem('token');
        this.$router.push('/login');
      }
      },
    //点击病因保存按钮
    holdAdvice(){
      this.adviceFormVisible = false;
      this.$message.success("信息保存成功！");
      },
    //打开病因编写对话框
    openAdvice(){
      this.adviceFormVisible = true;

    },
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
.logo {
  font-size: 24px;
  font-weight: bold;
}
.head-user-con {
  display: flex;
  align-items: center;
}
.orderInput {
  width: 95%;
}
.drugInput {
  width: 95%;
}
.drugRigth {
  max-height: 400px;
  overflow-y: auto;
}
.rigthTable {
  max-height: 300px;
  overflow-y: auto;
}

.drugRigth{
  text-align: center;
}
.el-tag{
  margin: 8px;
}
.rigthTable{
  margin-top: 56px;
  margin-left: 8px;
}
.drugInput{
  margin-top: 8px;
  margin-bottom: 8px;
}
.el-row{
    margin: 5px;
}
.orderInput{
    width: 240px;
}
.el-pagination{
  margin: 8px;
}
.el-tag {
  border-radius: 12px;
  background-color: #e7f5ff;
}
</style>