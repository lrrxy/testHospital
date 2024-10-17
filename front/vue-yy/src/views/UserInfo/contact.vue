<template>
  <div style="margin-left: 160px;">
    <!--头部-->
    <nav class="navbar navbar-default">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Hospital</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><router-link to="/">首页</router-link></li>
            <li><router-link to="/about">住院相关</router-link></li>
            <li><router-link to="/resource">医护信息</router-link></li>
            <li><router-link to="/contact" class="active">个人中心</router-link></li>
          </ul>
        </div>
      </div>
    </nav>

    <!--个人中心-->
    <div class="personal-center-container">
    <!-- 个人信息区 -->
    <div class="personal-info">
      <h2>欢迎, {{ userName }}</h2>
      <p><strong>邮箱:</strong> {{ userEmail }}</p>
      <p><strong>住院病房:</strong> {{ roomNumber }}</p>
      <button class="edit-btn" @click="toggleEdit">编辑个人信息</button>
    </div>

    <!-- 3D卡片区域 -->
    <div class="card-container">
      <div class="card" v-for="card in cards" :key="card.id">
        <h3>{{ card.title }}</h3>
        <p>{{ card.description }}</p>
        <button class="action-btn" @click="cardAction(card.id)">查看详情</button>
      </div>
    </div>

    <!-- 退出登录按钮 -->
    <button class="logout-btn" @click="logout">退出登录</button>

    <!-- 编辑个人信息对话框 -->
    <div v-if="showEditDialog" class="dialog-overlay">
      <div class="dialog-box">
        <h3>编辑个人信息</h3>
        <form @submit.prevent="submitEditForm">
          <div class="form-group">
            <label for="name">姓名:</label>
            <input type="text" id="name" v-model="editData.name" />
          </div>
          <div class="form-group">
            <label for="email">邮箱:</label>
            <input type="email" id="email" v-model="editData.email" />
          </div>
          <div class="dialog-footer">
            <button type="submit" class="submit-btn">保存</button>
            <button type="button" class="cancel-btn" @click="toggleEdit">取消</button>
          </div>
        </form>
      </div>
    </div>
  </div>

    <!--尾部-->
    <footer>
      <div class="footer-top">
        <div class="container">
          <div class="row">
            <div class="col-md-3 col-sm-12">
              <div class="single-footer-widget">
                <div class="section-heading">
                  <h4>关于我们</h4>
                  <div class="line"></div>
                </div>
                <p>我们是一家专业的医疗机构，致力于为您提供最优质的服务。</p>
              </div>
            </div>
            <div class="col-md-3 col-sm-12">
              <div class="single-footer-widget">
                <div class="section-heading">
                  <h4>我们的服务</h4>
                  <div class="line"></div>
                </div>
                <ul class="footer-service">
                  <li><a href="#"><span class="fa fa-check"></span>住院服务</a></li>
                  <li><a href="#"><span class="fa fa-check"></span>手术服务</a></li>
                  <li><a href="#"><span class="fa fa-check"></span>护理服务</a></li>
                  <li><a href="#"><span class="fa fa-check"></span>紧急服务</a></li>
                </ul>
              </div>
            </div>
            <div class="col-md-3 col-sm-12 f1">
              <div class="single-footer-widget">
                <div class="section-heading">
                  <h4>关注我们</h4>
                  <div class="line"></div>
                </div>
                <img src="../../assets/images/status.gif" alt="Status Image" />
              </div>
            </div>
            <div class="col-md-3 col-sm-12 f2">
              <div class="single-footer-widget">
                <div class="section-heading">
                  <h4>联系我们</h4>
                  <div class="line"></div>
                </div>
                <address class="contact-info">
                  <p><span class="fa fa-home"></span> 地址: XXX</p>
                  <p><span class="fa fa-phone"></span> 电话: XXX</p>
                  <p><span class="fa fa-envelope"></span> 邮箱: XXX</p>
                </address>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
  </div>
</template>

<script>
export default {
  data() {
    return {
      userName: '张三',
      userEmail: 'zhangsan@example.com',
      roomNumber: '203B',
      showEditDialog: false,
      editData: {
        name: '张三',
        email: 'zhangsan@example.com',
      },
      cards: [
        { id: 1, title: '病历记录', description: '查看详细的病历信息' },
        { id: 2, title: '费用查询', description: '查看住院费用明细' },
        { id: 3, title: '医疗提醒', description: '查看即将到来的医疗提醒' },
        { id: 4, title: '健康报告', description: '下载您的健康报告' },
      ],
    };
  },
  methods: {
    toggleEdit() {
      this.showEditDialog = !this.showEditDialog;
    },
    submitEditForm() {
      this.userName = this.editData.name;
      this.userEmail = this.editData.email;
      this.toggleEdit();
    },
    cardAction(id) {
      alert(`查看卡片ID: ${id}`);
    },
    logout() {
      alert('已退出登录');
    },
  },
};
</script>

<style scoped>
@import url("../../css/reset.css");
@import url("../../css/hwslider.css");
@import url("../../css/bootstrap.css");
@import url("../../css/font-awesome.min.css");
@import url("../../css/style.css");
/* 全局样式 */
body {
  font-family: Arial, sans-serif;
  background-color: #f4f4f4;
}

/* 个人中心样式 */
.personal-center-container {
  padding: 40px;
  background: #f4f4f4;
  min-height: 100vh;
}

.personal-info {
  text-align: center;
  background-color: #fff;
  padding: 20px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  border-radius: 10px;
  margin-bottom: 20px;
}

.card-container {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}

.card {
  background-color: #fff;
  width: 200px;
  padding: 20px;
  margin: 10px;
  text-align: center;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
  border-radius: 10px;
  transform: perspective(1000px) rotateY(0deg);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
  transform: perspective(1000px) rotateY(15deg);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
}

.action-btn {
  background-color: #42b983;
  color: #fff;
  padding: 10px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.logout-btn {
  background-color: #ff4d4d;
  color: white;
  padding: 10px 20px;
  border: none;
  cursor: pointer;
  margin-top: 20px;
  border-radius: 5px;
  display: block;
  width: 100%;
  text-align: center;
}

.dialog-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.6);
  display: flex;
  justify-content: center;
  align-items: center;
}

.dialog-box {
  background-color: white;
  padding: 20px;
  max-width: 400px;
  width: 100%;
  border-radius: 10px;
}

.submit-btn {
  background-color: #42b983;
  color: white;
  padding: 10px 20px;
  border: none;
  cursor: pointer;
  margin-right: 10px;
}

.cancel-btn {
  background-color: #ccc;
  color: white;
  padding: 10px 20px;
  border: none;
  cursor: pointer;
}
</style>
