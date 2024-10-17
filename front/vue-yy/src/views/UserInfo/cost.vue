<template>
 <div style="margin-left: 160px;">
    <!-- 头部 -->
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
            <li><router-link to="/">首页<span class="sr-only"></span></router-link></li>
            <li><router-link to="/about" class="active">住院相关</router-link></li>
            <li><router-link to="/resource">医护信息</router-link></li>
            <li><router-link to="/contact">个人中心</router-link></li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- 幻灯片 -->
    <div class="page-title">
      <div class="container"></div>
    </div>
    <!-- 内容 -->
    <div class="content-container">
      <div class="container">
        <div class="row">
          <!-- 费用查询表单部分 -->
          <div class="col-md-8">
            <h2>费用查询</h2>
            <form class="cost-query-form" @submit.prevent="queryCost">
              <div class="form-group">
                <label for="jiageId">病床ID</label>
                <input v-model="jiageId" type="text" class="form-control" id="jiageId" placeholder="请输入病床ID" required />
              </div>
              <div class="form-group">
                <label for="userName">病人姓名</label>
                <input v-model="userName" type="text" class="form-control" id="userName" placeholder="请输入病人姓名" required />
              </div>
              <button type="submit" class="btn btn-primary">查询费用</button>
            </form>
          </div>
          
          <!-- 查询须知部分 -->
          <div class="col-md-4">
            <h3>查询须知</h3>
            <ul class="info-list">
              <li>请输入正确的病床ID和姓名。</li>
              <li>查询结果仅供参考，具体费用请以医院结算为准。</li>
              <li>如有疑问，请联系医院财务部门。</li>
            </ul>
          </div>
        </div>
        
        <!-- 查询结果展示 -->
        <div v-if="showResult" class="row result-box">
          <div class="col-md-12">
            <h3>查询结果</h3>
            <div class="result-content">
              <p><strong>病人姓名:</strong> {{ result.userName }}</p>
              <p><strong>病床费用:</strong> ￥{{ result.userPrice }}</p>
              <p><strong>药品费用:</strong> ￥{{ result.medicinePrice }}</p>
              <p><strong>检查费用:</strong> ￥{{ result.examinePrice }}</p>
              <p><strong>治疗费用:</strong> ￥{{ result.treatmentPrice }}</p>
              <hr />
              <h4><strong>总费用:</strong> ￥{{ result.sumPrice }}</h4>
            </div>
          </div>
        </div>
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
                <p>XXX</p>
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

<script setup>
import { ref } from 'vue'
import axios from 'axios'
import { useTokenStore } from '@/stores/mytoken'

const tokenStore = useTokenStore()
const token = tokenStore.token
// console.log(window.localStorage.getItem("token"))

const jiageId = ref('')
const userName = ref('')
const showResult = ref(false)
const result = ref({})

const queryCost = async () => {
  const data = {
    jiageId: jiageId.value,
    userName: userName.value
  }

  try {
    const response = await axios.get('/api/user/jiage', {
      params: data,
      headers: {
        'token': window.localStorage.getItem("token"), // 使用从 Pinia 获取的 token
        'Cache-Control': 'no-cache' // 禁止缓存
      }
    })

    if (response.data.code === 1) { // 修改检查字段为 code
      result.value = response.data.data // 确保正确赋值
      console.log(result.value)
      console.log(response.data)
      showResult.value = true
    } else {
      alert(response.data.msg) // 显示错误信息
    }
  } catch (error) {
    console.error('查询费用失败:', error)
    alert('查询失败，请重试')
  }
}

</script>

<style scoped>
@import url("../../css/reset.css");
@import url("../../css/hwslider.css");
@import url("../../css/bootstrap.css");
@import url("../../css/font-awesome.min.css");
@import url("../../css/style.css");

.content-container {
  background-color: #f5f7fa;
  padding: 40px 0;
}

.cost-query-form {
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  margin-bottom: 40px;
}

.cost-query-form .form-control {
  height: 45px;
  font-size: 16px;
  border-radius: 6px;
  border: 1px solid #ccc;
  transition: all 0.3s ease;
}

.cost-query-form .form-control:focus {
  border-color: #007bff;
  box-shadow: 0 0 5px rgba(0, 123, 255, 0.2);
}

.cost-query-form button {
  background-color: #007bff;
  color: #fff;
  border: none;
  padding: 12px 20px;
  font-size: 16px;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.cost-query-form button:hover {
  background-color: #0056b3;
}

.cost-query-form button:active {
  background-color: #004494;
  box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.2);
}

.cost-query-form button:focus {
  outline: none;
  box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}

.info-list {
  list-style: none;
  padding: 0;
  margin-top: 20px;
}

.info-list li {
  margin-bottom: 12px;
  font-size: 14px;
  color: #555;
  padding-left: 20px;
  position: relative;
}

.info-list li::before {
  content: "•";
  position: absolute;
  left: 0;
  color: #007bff;
}

.result-box {
  margin-top: 40px;
  background-color: #fff;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.result-box .result-content {
  padding: 20px;
  border-radius: 10px;
  background: linear-gradient(135deg, #f9f9f9 0%, #f0f0f0 100%);
}

.result-box h4 {
  color: #007bff;
}

p {
  font-size: 16px;
  margin-bottom: 15px;
}

strong {
  font-weight: 600;
  color: #333;
}
</style>
