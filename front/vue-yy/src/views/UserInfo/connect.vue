<template>
    <div style="margin-left: 160px;">
        <!--头部-->
    <nav class="navbar navbar-default">
        <div class="container">
            <!-- 移动端导航图标 -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
                <a class="navbar-brand" href="#">Hospital</a>
            </div>
            <!-- 导航-->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li><router-link to="/">首页 <span class="sr-only"></span></router-link></li>
                    <li><router-link to="/about" class="active">住院相关</router-link></li>
                    <!-- <li><router-link to="/new">医疗动态</router-link></li> -->
                    <li><router-link to="/resource">医护信息</router-link></li>
                    <li><router-link to="/contact">个人中心</router-link></li>
                </ul>
            </div>
        </div>
    </nav>
    <!--幻灯片-->
    <div class="page-title">
        <div class="container">
        </div>
    </div>
   <!-- 内容 -->
   <div class="contact-container">
      <div class="container">
        <div class="contact-info">
          <div class="contact-details">
            <h3>联系方式</h3>
            <p><i class="fa fa-home"></i> 地址: XXX市XXX区XXX路123号</p>
            <p><i class="fa fa-phone"></i> 电话: 123-456-7890</p>
            <p><i class="fa fa-envelope"></i> 邮箱: contact@hospital.com</p>
          </div>
          <button class="btn-contact" @click="openDialog">发送消息给我们</button>
        </div>
      </div>
    </div>

    <!-- 对话框 -->
    <div v-if="isDialogOpen" class="dialog-overlay">
      <div class="dialog-box">
        <div class="dialog-header">
          <h3>发送消息</h3>
          <button class="close-button" @click="closeDialog">&times;</button>
        </div>
        <div class="dialog-content">
          <form @submit.prevent="submitForm">
            <div class="form-group">
              <label for="name">姓名:</label>
              <input type="text" id="name" v-model="formData.name" required />
            </div>
            <div class="form-group">
              <label for="email">邮箱:</label>
              <input type="email" id="email" v-model="formData.email" required />
            </div>
            <div class="form-group">
              <label for="message">消息:</label>
              <textarea id="message" v-model="formData.message" required></textarea>
            </div>
            <div class="dialog-footer">
              <button type="submit" class="submit-button">发送</button>
              <button type="button" class="cancel-button" @click="closeDialog">取消</button>
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
                            <p>一个长期以来的事实是，读者会在看到其布局时被页面的可读内容分散注意力。使用XXX的观点是，它具有或多或少的正常字母分配，而不是使用“内容在这里，这里的内容”，使它看起来像可读的英语。</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12">
                        <div class="single-footer-widget">
                            <div class="section-heading">
                                <h4>我们的服务</h4>
                                <div class="line"></div>
                            </div>
                            <ul class="footer-service">
                                <li><a href="#"><span class="fa fa-check"></span>服务名称</a></li>
                                <li><a href="#"><span class="fa fa-check"></span>服务名称</a></li>
                                <li><a href="#"><span class="fa fa-check"></span>服务名称</a></li>
                                <li><a href="#"><span class="fa fa-check"></span>服务名称</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 f1">
                        <div class="single-footer-widget">
                            <div class="section-heading">
                                <h4>关注我们</h4>
                                <div class="line"></div>
                            </div>
                            <img src="../../assets/images/status.gif" />
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 f2">
                        <div class="single-footer-widget">
                            <div class="section-heading">
                                <h4>联系我们</h4>
                                <div class="line"></div>
                            </div>
                            <address class="contact-info">
                <p><span class="fa fa-home"></span>XXX</p>
                <p><span class="fa fa-phone"></span>XXX</p>
                <p><span class="fa fa-envelope"></span>XXX</p>
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
      isDialogOpen: false,
      formData: {
        name: '',
        email: '',
        message: ''
      }
    };
  },
  methods: {
    openDialog() {
      this.isDialogOpen = true;
    },
    closeDialog() {
      this.isDialogOpen = false;
    },
    submitForm() {
      // 模拟提交表单操作
      alert(`姓名: ${this.formData.name}\n邮箱: ${this.formData.email}\n消息: ${this.formData.message}`);
      this.closeDialog();
    }
  }
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

/* 页头样式 */


/* 幻灯片标题样式 */
.page-title {
  padding: 30px 0;
  text-align: center;
  background-color: #007bff;
  color: white;
}

.page-title h1 {
  margin: 0;
  font-size: 2.5rem;
}

/* 联系信息样式 */
.contact-container {
  padding: 30px 0;
  background-color: #fff;
}

.contact-info {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.contact-details {
  flex: 1;
}

.contact-details h3 {
  margin-bottom: 20px;
}

.contact-details p {
  font-size: 1.2rem;
  margin: 10px 0;
}

.btn-contact {
  background-color: #007bff;
  color: white;
  padding: 10px 20px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
  transition: background-color 0.3s ease;
}

.btn-contact:hover {
  background-color: #0056b3;
}

/* 对话框样式 */
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
  border-radius: 10px;
  padding: 20px;
  max-width: 500px;
  width: 100%;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
  transform: translateY(-50px);
  animation: slide-down 0.3s ease forwards;
}

.dialog-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.dialog-header h3 {
  margin: 0;
}

.close-button {
  background: none;
  border: none;
  font-size: 1.5rem;
  cursor: pointer;
}

.dialog-content .form-group {
  margin-bottom: 15px;
}

.dialog-content .form-group label {
  display: block;
  margin-bottom: 5px;
}

.dialog-content .form-group input,
.dialog-content .form-group textarea {
  width: 100%;
  padding: 10px;
  border-radius: 5px;
  border: 1px solid #ccc;
}

.dialog-footer {
  display: flex;
  justify-content: flex-end;
}

.submit-button {
  background-color: #007bff;
  color: white;
  padding: 10px 20px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
  transition: background-color 0.3s ease;
}

.submit-button:hover {
  background-color: #0056b3;
}

.cancel-button {
  margin-right: 10px;
  background-color: #ccc;
  color: white;
  padding: 10px 20px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
  transition: background-color 0.3s ease;
}

.cancel-button:hover {
  background-color: #999;
}

/* 动画效果 */
@keyframes slide-down {
  from {
    transform: translateY(-50px);
    opacity: 0;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}


</style>