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

    <!--幻灯片-->
    <div class="page-title">
      <div class="container"></div>
    </div>

    <!-- 内容 -->
    <div class="content-container">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h2>医院缴费记录</h2>
            <div class="record-table">
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>缴费日期</th>
                    <th>病人名称</th>
                    <th>项目名称</th>
                    <th>金额</th>
                    <th>支付方式</th>
                    <th>状态</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="record in records" :key="record.recordId">
                    <td>{{ formatDate(record.paymentDate) }}</td>
                    <td>{{ record.userName }}</td>
                    <td>{{ getProjectName(record.projectName) }}</td>
                    <td>￥{{ record.sum.toLocaleString() }}</td>
                    <td>{{ getPaymentMethod(record.paymentMethod) }}</td>
                    <td><span :class="'label ' + getStatusClass(record.status)">{{ getStatusText(record.status) }}</span></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <!-- 统计信息展示 -->
        <div class="row">
          <div class="col-md-6">
            <div class="stats-box">
              <h4>总缴费金额</h4>
              <p>￥{{ totalAmount.toLocaleString() }}</p>
            </div>
          </div>
          <div class="col-md-6">
            <div class="stats-box">
              <h4>未支付金额</h4>
              <p>￥{{ unpaidAmount.toLocaleString() }}</p>
            </div>
          </div>
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
import { ref, onMounted } from 'vue'
import { useTokenStore } from '@/stores/mytoken'

export default {
  name: 'PaymentRecords',
  setup() {
    const tokenStore = useTokenStore()
    const records = ref([])
    const totalAmount = ref(0)
    const unpaidAmount = ref(0)

    const getStatusClass = (status) => {
      return status === 1 ? 'label-success' : 'label-warning'
    }

    const getStatusText = (status) => {
      return status === 1 ? '已支付' : '待支付'
    }

    const getPaymentMethod = (paymentMethod) => {
      if (paymentMethod === null) {
        return '无'
      }
      return paymentMethod === 1 ? '微信' : '支付宝'
    }

    // 项目名称映射
    const getProjectName = (projectName) => {
      switch (projectName) {
        case 1:
          return '住院费用'
        case 2:
          return '药品费用'
        case 3:
          return '治疗费用'
        case 4:
          return '检查费用'
        default:
          return '未知项目'
      }
    }

    const formatDate = (date) => {
      const d = new Date(date)
      return `${d.getFullYear()}-${('0' + (d.getMonth() + 1)).slice(-2)}-${('0' + d.getDate()).slice(-2)}`
    }

    const calculateTotals = () => {
      totalAmount.value = records.value.reduce((acc, record) => {
        return record.status === 1 ? acc + record.sum : acc
      }, 0)

      unpaidAmount.value = records.value.reduce((acc, record) => {
        return record.status === 0 ? acc + record.sum : acc
      }, 0)
    }

    const fetchRecords = async () => {
      try {
        const url = 'http://localhost:8090/api/user/xinxi'
        const response = await fetch(url, {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
            'token': window.localStorage.getItem("token"),
            'Cache-Control': 'no-cache'
          }
        })

        const result = await response.json()

        if (result.code === 1) {
          records.value = result.data
          calculateTotals() // 计算总金额和未支付金额
        } else {
          console.error('Failed to fetch records:', result.message)
        }
      } catch (error) {
        console.error('Error fetching records:', error)
      }
    }

    onMounted(() => {
      fetchRecords()
    })

    return {
      records,
      totalAmount,
      unpaidAmount,
      getStatusClass,
      getStatusText,
      getPaymentMethod,
      getProjectName,
      formatDate
    }
  }
}
</script>


<style scoped>
@import url("../../css/reset.css");
@import url("../../css/hwslider.css");
@import url("../../css/bootstrap.css");
@import url("../../css/font-awesome.min.css");
@import url("../../css/style.css");
/* 标题样式 */
h2 {
  font-weight: 700;
  color: #333;
  margin-bottom: 30px;
}

/* 表格样式 */
.record-table {
  background-color: #fff;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.record-table .table {
  margin-bottom: 0;
}

.table thead th {
  background-color: #007bff;
  color: white;
  font-weight: 600;
  text-align: center;
}

.table tbody td {
  text-align: center;
  vertical-align: middle;
}

.table-striped tbody tr:nth-of-type(odd) {
  background-color: #f2f2f2;
}

/* 标签样式 */
.label {
  display: inline-block;
  padding: 5px 10px;
  font-size: 14px;
  border-radius: 5px;
}

.label-success {
  background-color: #28a745;
  color: white;
}

.label-warning {
  background-color: #ffc107;
  color: black;
}

/* 统计信息样式 */
.stats-box {
  background-color: #007bff;
  color: white;
  padding: 20px;
  border-radius: 8px;
  text-align: center;
  margin-top: 20px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.stats-box h4 {
  font-weight: 600;
  margin-bottom: 10px;
}

.stats-box p {
  font-size: 24px;
  margin: 0;
}
</style>
