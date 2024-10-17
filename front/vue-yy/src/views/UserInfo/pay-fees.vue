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
    <div class="payment-container">
      <div class="container">
        <h2>医院缴费</h2>
        <div class="payment-details">
          <div v-for="(item, index) in paymentData" :key="index" class="payment-card">
            <div class="payment-info">
              <h4>{{ getProjectName(item.projectName) }}</h4>
              <p>费用: ¥{{ item.sum }}</p>
              <p>缴费日期: {{ item.paymentDate }}</p>
              <p>支付状态: {{ item.status === 1 ? '已支付' : '未支付' }}</p>
            </div>
            <button v-if="item.status === 0" class="btn btn-primary" @click="confirmPayment(item)">确认缴费</button>
          </div>
        </div>
      </div>
      <!-- 新增余额查看和充值功能 -->
    <div class="balance-section">
      <h3>当前余额: ¥{{ balance }}</h3>
    </div>
    </div>

    <!-- 确认弹出框 -->
    <div v-if="showModal" class="modal">
      <div class="modal-content">
        <h3>确认缴费</h3>
        <p>您确认要缴纳费用 ¥{{ selectedPayment.sum }} 吗？</p>
        <button class="btn btn-success" @click="proceedPayment">确定</button>
        <button class="btn btn-danger" @click="cancelPayment">取消</button>
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
import axios from 'axios'; // 使用 axios 进行 API 请求

export default {
  data() {
    return {
      paymentData: [],
      balance: 0,
      showModal: false,
      selectedPayment: null
    };
  },
  created() {
    this.fetchBalance(); // 页面加载时获取余额信息
    this.fetchPaymentData(); // 页面加载时获取缴费数据
  },
  methods: {
    // 获取支付数据（GET 请求）
    fetchPaymentData() {
      console.log('fetchPaymentData 被调用了');
      axios
        .get('http://localhost:8090/api/user/payment', {
          headers: { token: window.localStorage.getItem("token") }
        })
        .then((response) => {
          this.paymentData = response.data.data; // 假设后端返回的数据在 data 中
        })
        .catch((error) => {
          console.error('获取支付数据时出错:', error);
        });
    },
    // 获取余额信息
    fetchBalance() {
      console.log('fetchBalance 被调用了');
      axios
        .get('http://localhost:8090/api/user/getbalance', {
          headers: { token: window.localStorage.getItem("token") }
        })
        .then((response) => {
          this.balance = response.data.data; // 假设返回的数据结构包含 balanceSum
        })
        .catch((error) => {
          console.error('获取余额时出错:', error);
        });
    },
    // 映射项目名称
    getProjectName(projectName) {
      switch (projectName) {
        case 1:
          return '住院费用';
        case 2:
          return '药品费用';
        case 3:
          return '治疗费用';
        case 4:
          return '检查费用';
        default:
          return '未知项目';
      }
    },
    // 确认缴费（POST 请求）
    confirmPayment(item) {
      this.selectedPayment = item;
      this.showModal = true;
    },
    // 提交缴费请求（POST 请求）
    proceedPayment() {
      const recordId = this.selectedPayment.recordId; // 获取选中的 recordId
      axios
        .post('http://localhost:8090/api/user/payment', { recordId }, {
          headers: { token: window.localStorage.getItem("token") }
        })
        .then((response) => {
          if (response.data.code === 1) {
            alert(response.data.msg); // 提示操作成功
            this.selectedPayment.status = 1; // 更新支付状态为已支付
            this.showModal = false; // 关闭弹出框
          } else {
            alert('缴费失败，请稍后重试');
          }
        })
        .catch((error) => {
          console.error('提交缴费时出错:', error);
          alert('提交缴费时出错');
        });
    },
    // 取消缴费
    cancelPayment() {
      this.showModal = false;
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


/* 整体布局 */
.payment-container {
  background-color: #f1f1f1;
  padding: 40px 0;
}

h2 {
  font-weight: 700;
  color: #333;
  text-align: center;
  margin-bottom: 30px;
  text-transform: uppercase;
}

/* 缴费详情卡片 */
.payment-details {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.payment-card {
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.payment-info h4 {
  margin: 0;
  font-size: 18px;
  font-weight: 600;
}

.payment-info p {
  margin: 5px 0;
  font-size: 14px;
}

/* 弹出框样式 */
.modal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
}

.modal-content {
  background-color: #fff;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
  text-align: center;
}

.modal-content h3 {
  margin-bottom: 20px;
}

.modal-content button {
  margin: 0 10px;
  padding: 10px 20px;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.modal-content .btn-success {
  background-color: #28a745;
  color: #fff;
  border: none;
}

.modal-content .btn-success:hover {
  background-color: #218838;
}

.modal-content .btn-danger {
  background-color: #dc3545;
  color: #fff;
  border: none;
}

.modal-content .btn-danger:hover {
  background-color: #c82333;
}
</style>