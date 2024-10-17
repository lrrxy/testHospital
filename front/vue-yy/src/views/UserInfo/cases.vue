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
                      <li><router-link to="/resource">医护信息</router-link></li>
                      <li><router-link to="/contact">个人中心</router-link></li>
                  </ul>
              </div>
          </div>
      </nav>
      <!-- 幻灯片 -->
      <div class="page-title">
          <div class="container">
          </div>
      </div>
      <!-- 内容 -->
      <div class="content">
          <div class="search-form">
              <label for="patient-name">病人姓名:</label>
              <input id="patient-name" v-model="patientName" placeholder="输入病人姓名" />
              
              <label for="bed-number">病人床号:</label>
              <input id="bed-number" v-model="bedNumber" placeholder="输入病人床号" />
              
              <button @click="searchPatient">查询</button>
          </div>

          <div v-if="patientInfo">
              <div class="info-section">
                  <h3>病历信息</h3>
                  <p>病人姓名: {{ patientInfo.userName }}</p>
                  <p>病历症状: {{ patientInfo.caseName }}</p>
                  <p>用药名称: {{ patientInfo.medicineName }}</p>
                  <p>医嘱内容: {{ patientInfo.orderName }}</p>
                  <p>主治医生: {{ patientInfo.doctorName }}</p>
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
import axios from 'axios';

export default {
data() {
  return {
    patientName: '',
    bedNumber: '',
    patientInfo: null,
  };
},
methods: {
  async searchPatient() {
    try {
      const response = await axios.post('http://localhost:8090/api/user/case', {
        sickbedId: this.bedNumber,
        userName: this.patientName
      }, {
        headers: {
          token: window.localStorage.getItem("token") // 将 token 作为 Bearer Token 附加到请求头中
        }
      });

      if (response.data.code === 1) {
        this.patientInfo = response.data.data;
      } else {
        alert('查询失败：' + response.data.msg);
      }
    } catch (error) {
      console.error('查询出错:', error);
      alert('查询失败，请稍后再试');
    }
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

.container {
max-width: 1200px;
margin: 0 auto;
padding: 20px;
}

.page-title {
text-align: center;
margin-bottom: 20px;
}

.page-title h1 {
font-size: 28px;
color: #343a40;
}

.content {
padding: 20px;
background-color: #f1f1f1;
border-radius: 8px;
}

.search-form {
display: flex;
flex-direction: column;
gap: 10px;
}

.search-form label {
font-weight: bold;
}

.search-form input {
padding: 8px;
border-radius: 4px;
border: 1px solid #ddd;
}

.search-form button {
padding: 10px;
background-color: #007bff;
color: #fff;
border: none;
border-radius: 4px;
cursor: pointer;
}

.search-form button:hover {
background-color: #0056b3;
}

.info-section {
margin-bottom: 20px;
background-color: #fff;
padding: 15px;
border-radius: 8px;
box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.footer-top {
background-color: #f8f9fa;
padding: 20px 0;
border-top: 1px solid #ddd;
}

.footer-top h4 {
font-size: 18px;
color: #343a40;
}

.footer-top p,
.footer-top ul {
color: #6c757d;
}

.footer-top ul {
list-style: none;
padding: 0;
}

.footer-top ul li {
margin-bottom: 10px;
}

.footer-top img {
max-width: 100%;
}
</style>
