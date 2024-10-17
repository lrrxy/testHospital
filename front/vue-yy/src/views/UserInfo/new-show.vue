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
      <div class="container">
      </div>
    </div>
   <!-- 内容 -->
   <div class="content-container">
      <div class="container">
        <div class="row">
          <div class="col-md-8">
            <h2>转院申请</h2>
            <form @submit.prevent="submitApplication" class="transfer-form">
              <div class="form-group">
                <label for="sickbedId">病人床号</label>
                <input type="text" class="form-control" v-model="sickbedId" placeholder="请输入病人床号">
              </div>
              <div class="form-group">
                <label for="hospitalName">当前医院</label>
                <input type="text" class="form-control" v-model="hospitalName" placeholder="请输入当前医院">
              </div>
              <div class="form-group">
                <label for="newHospitalName">目标医院</label>
                <input type="text" class="form-control" v-model="newHospitalName" placeholder="请输入目标医院">
              </div>
              <div class="form-group">
                <label for="condition">转院原因</label>
                <textarea class="form-control" v-model="condition" rows="3" placeholder="请简述转院原因"></textarea>
              </div>
              <button type="submit" class="btn  btn-primary">提交申请</button>
            </form>
          </div>
          
          <div class="col-md-4">
            <h3>注意事项</h3>
            <ul class="info-list">
              <li>请确保填写信息准确无误。</li>
              <li>申请提交后，处理时间约为3-5个工作日。</li>
              <li>若有紧急情况，请立即拨打急救电话。</li>
            </ul>
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

<script setup>
import { ref } from 'vue'

// 定义表单字段
const sickbedId = ref('')
const hospitalName = ref('')
const newHospitalName = ref('')
const condition = ref('')

const submitApplication = async () => {
  const data = {
    sickbedId: sickbedId.value, // 病人床号
    hospitalName: hospitalName.value, // 当前医院
    new_hospitalName: newHospitalName.value, // 目标医院，改为下划线形式
    condition: condition.value // 转院原因
  }

  try {
    const url = 'http://localhost:8090/api/user/newshow'
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',  // 确保使用 JSON 格式
        'token': window.localStorage.getItem("token"),  // 传递 token
      },
      body: JSON.stringify(data)  // 将数据转换为 JSON 格式
})

    const result = await response.json()

    if (result.code === 1) {
      alert('申请成功')
    } else {
      alert('申请失败：' + result.msg)
    }
  } catch (error) {
    console.error('请求失败', error)
    alert('提交失败，请稍后重试')
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
  background-color: #f9f9f9;
  padding: 40px 0;
}

.transfer-form {
  background-color: #fff;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.transfer-form .form-group {
  margin-bottom: 20px;
}

.transfer-form .form-control {
  height: 45px;
  font-size: 16px;
}

.transfer-form button {
  padding: 10px 20px;
  font-size: 16px;
  border-radius: 4px;
}

.info-list {
  padding-left: 20px;
  list-style-type: disc;
}

.info-list li {
  margin-bottom: 10px;
  font-size: 14px;
  color: #555;
}

h2, h3 {
  font-weight: 600;
  margin-bottom: 20px;
  color: #333;
}
</style>
