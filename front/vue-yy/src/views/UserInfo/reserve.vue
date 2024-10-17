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
            <li><router-link to="/about" class="active">住院相关</router-link></li>
            <li><router-link to="/resource">医护信息</router-link></li>
            <li><router-link to="/contact">个人中心</router-link></li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- 内容 -->
    <div class="content">
      <form v-if="!appointmentDetails" @submit.prevent="submitAppointment">
        <div class="form-group">
          <label for="appointment-type">预约类型:</label>
          <select id="appointment-type" v-model="appointmentType" @change="handleAppointmentTypeChange" required>
            <option value="" disabled>请选择预约类型</option>
            <option value="检查">检查</option>
            <option value="手术">手术</option>
          </select>
        </div>

        <div v-if="appointmentType === '检查'" class="form-group">
          <label for="check-type">检查类型:</label>
          <select id="check-type" v-model="checkType" required>
            <option value="" disabled>请选择检查类型</option>
            <option value="b超">b超</option>
            <option value="CT">CT</option>
            <!-- 其他检查类型 -->
          </select>
        </div>

        <div v-if="appointmentType === '手术'" class="form-group">
          <label for="surgery-type">手术类型:</label>
          <select id="surgery-type" v-model="surgeryType" required>
            <option value="" disabled>请选择手术类型</option>
            <option value="开颅手术">开颅手术</option>
            <option value="阑尾切除">阑尾切除</option>
            <!-- 其他手术类型 -->
          </select>
        </div>

        <div class="form-group">
          <label for="appointment-date">预约日期:</label>
          <input id="appointment-date" type="date" v-model="appointmentDate" :min="minDate" required />
        </div>

        <div v-if="appointmentDate" class="form-group">
          <label for="appointment-time">预约时间段:</label>
          <select id="appointment-time" v-model="appointmentTime" required>
            <option value="" disabled>请选择时间段</option>
            <option value="09:00-10:00">09:00-10:00</option>
            <option value="10:00-11:00">10:00-11:00</option>
            <option value="11:00-12:00">11:00-12:00</option>
            <option value="14:00-15:00">14:00-15:00</option>
            <option value="15:00-16:00">15:00-16:00</option>
            <!-- 其他时间段 -->
          </select>
        </div>

        <div class="form-group">
          <label for="doctor">选择医生:</label>
          <select id="doctor" v-model="selectedDoctor" required>
            <option value="" disabled>请选择医生</option>
            <option v-for="doctor in doctors" :key="doctor.doctorId" :value="doctor.doctorId">
              {{ doctor.doctorName }}
            </option>
          </select>
        </div>

        <button type="submit">提交预约</button>
      </form>

      <!-- 如果已有预约，显示预约详情 -->
      <div v-else class="appointment-details">
        <h2>预约详情</h2>
        <div class="detail-item">
          <strong>预约类型:</strong> {{ appointmentDetails.type }}
        </div>
        <div class="detail-item">
          <strong>预约日期:</strong> {{ appointmentDetails.date }}
        </div>
        <div class="detail-item">
          <strong>选择医生:</strong> {{ appointmentDetails.doctorName }}
        </div>
        <button @click="cancelAppointment" class="cancel-button">取消预约</button>
      </div>
    </div>

    <!-- 尾部 -->
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
      appointmentType: '',
      checkType: '',
      surgeryType: '',
      appointmentDate: '',
      appointmentTime: '',
      selectedDoctor: '',
      doctors: [],  // 从API动态获取的医生列表
      appointmentDetails: null,  // 保存的预约信息
    };
  },
  computed: {
    minDate() {
      const today = new Date();
      return today.toISOString().split('T')[0];  // 设定最小日期为今天
    },
  },
  mounted() {
    this.fetchDoctors();  // 页面加载时获取医生信息
    this.loadAppointment();  // 页面加载时检查预约状态
  },
  methods: {
    handleAppointmentTypeChange() {
      this.checkType = '';
      this.surgeryType = '';
    },
    async fetchDoctors() {
      try {
        const response = await axios.get('http://localhost:8090/api/user/getdoctor', {
          headers: {
            token: window.localStorage.getItem("token"),  // 将token添加到请求头
          },
        });
        if (response.data.code === 1) {
          this.doctors = response.data.data; // 更新医生列表
        } else {
          console.error('获取医生信息失败:', response.data.msg);
        }
      } catch (error) {
        console.error('请求错误:', error);
      }
    },
    async submitAppointment() {
      const requestData = {
        examineTreatmentDate: this.appointmentDate,
        examineTreatmentCategory: this.appointmentType === '检查' ? 1 : 2,
        doctorId: this.selectedDoctor,
        checkType: this.checkType,
        surgeryType: this.surgeryType,
        appointmentTime: this.appointmentTime,
      };

      try {
        const response = await axios.post('http://localhost:8090/api/user/appointment', requestData, {
          headers: {
            token: window.localStorage.getItem("token"),
          },
        });

        if (response.data.code === 1) {
          // 成功后获取支付信息
          await this.fetchPaymentStatus();

          // 保存预约详情
          const doctor = this.doctors.find(doc => doc.doctorId === this.selectedDoctor);
          this.appointmentDetails = {
            type: this.appointmentType,
            date: this.appointmentDate,
            doctorName: doctor.doctorName,
          };
          // 保存预约信息到 localStorage
          window.localStorage.setItem('appointmentDetails', JSON.stringify(this.appointmentDetails));
          alert('预约成功');
        } else {
          console.error('预约失败:', response.data.msg);
        }
      } catch (error) {
        console.error('请求错误:', error);
      }
    },
    async fetchPaymentStatus() {
      try {
        const response = await axios.get('http://localhost:8090/api/user/getpay', {
          headers: {
            token: window.localStorage.getItem("token"),
          },
        });

        if (response.data.code === 1) {
          const caseStatus = response.data.data.caseStatus;

          if (caseStatus === 3) {
            alert('预约已同意');
          } else if (caseStatus === 4) {
            alert('预约未同意');
          } else {
            alert('未找到相关支付信息');
          }
        } else {
          console.error('获取支付信息失败:', response.data.msg);
        }
      } catch (error) {
        console.error('请求错误:', error);
      }
    },
    loadAppointment() {
      const storedDetails = window.localStorage.getItem('appointmentDetails');
      if (storedDetails) {
        this.appointmentDetails = JSON.parse(storedDetails);
      }
    },
    cancelAppointment() {
      this.appointmentDetails = null;
      window.localStorage.removeItem('appointmentDetails');
      alert('预约已取消');
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
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.form-group {
  margin-bottom: 15px;
}

.form-group label {
  display: block;
  font-weight: bold;
}

.form-group input,
.form-group select {
  width: 100%;
  padding: 10px;
  border-radius: 4px;
  border: 1px solid #ddd;
}

button {
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  background-color: #007bff;
  color: white;
  cursor: pointer;
}

button:hover {
  background-color: #0056b3;
}

.appointment-details {
  margin-top: 20px;
  padding: 20px;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.appointment-details h2 {
  margin-bottom: 15px;
}

.detail-item {
  margin-bottom: 10px;
}

.cancel-button {
  background-color: #dc3545;
}

.cancel-button:hover {
  background-color: #c82333;
}
</style>
