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
    <div class="page3-title">
        <div class="container">
        </div>
    </div>
    <!--关于我们-->
    <div class="container p50 about">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 text-area ">
                <h3 class="heading left-align">住院详情</h3>
                <div class="line"></div>
                <div class="headul left-align"></div>
                <p>门诊检查与办理住院：‌</p>
                <p class="margin-bottom-50 hidden-md">&emsp;&emsp;病人首先需要持医疗保险证到定点医院门诊进行检查</p>
                <p class="margin-bottom-50 hidden-md">&emsp;&emsp;如果符合入院条件，‌病人将办理住院手续，‌包括持证到定点医院医保办进行住院申报。‌</p>
                <p class="margin-bottom-50 hidden-md">&emsp;&emsp;医保局医师会核对病人及病情进行审批，‌审批通过后，‌病人需按规定支付预付金，‌开始接受合理用药及治疗</p>
                <p class="margin-bottom-50 hidden-md">&emsp;&emsp;病人或家属需到住院处完成后，进行财务结算后，医院会通知病人及家属到住院处做财务结算。</p>
                <router-link to="/about/connect" class="contact-button">
                    联系医院
                </router-link>
            </div>
            <div class="col-md-5 col-sm-12 col-xs-12 p30">
                <img src="../../assets/images/choose-us-img1.jpg" style="width: 100%;" />
            </div>
        </div>
    </div>
    <div class="content_1 container">
        <div class="over_3">
            <h3 class="heading left-align">住院服务</h3>
            <div class="line"></div>
            <div class="bak_7 clearfix">

                <div class="over_3a f_l  bounceInLeft col-md-6 clearfix">
                    <dl>
                        <dt>
	                    <span class="fa fa-heartbeat service-icon-effect"></span></dt>
                        <dd>
                            <li><router-link to="/about/newshow"><b>转院申请 </b><span class="sr-only"></span></router-link></li>
                            <p>XXX的通道有许多变化，但大多数人以某种形式遭受了改变，通过注射幽默</p>
                        </dd>
                    </dl>
                </div>

                <div class="over_3a f_r bounceInRight col-md-6 clearfix">
                    <dl>
                        <dt>
	                    <span class="fa fa-stethoscope service-icon-effect"></span> </dt>
                        <dd>
                            <li><router-link to="/about/cost"><b>费用查询 </b><span class="sr-only"></span></router-link></li>
                            <p>XXX的通道有许多变化，但大多数人以某种形式遭受了改变，通过注射幽默</p>
                        </dd>
                    </dl>
                </div>

                <div class="over_3a f_l  bounceInLeft col-md-6 clearfix">
                    <dl>
                        <dt>
	                    <span class="fa fa-h-square service-icon-effect"></span></dt>
                        <dd>
                            <li><router-link to="/about/record"><b>缴费记录 </b><span class="sr-only"></span></router-link></li>
                            <p>XXX的通道有许多变化，但大多数人以某种形式遭受了改变，通过注射幽默</p>
                        </dd>
                    </dl>
                </div>

                <div class="over_3a f_r  bounceInRight col-md-6 clearfix">
                    <dl>
                        <dt>
	                    <span class="fa fa-medkit service-icon-effect"></span></dt>
                        <dd>
                            <li><router-link to="/about/fees"><b>费用缴纳 </b><span class="sr-only"></span></router-link></li>
                            <p>XXX的通道有许多变化，但大多数人以某种形式遭受了改变，通过注射幽默</p>
                        </dd>
                    </dl>
                </div>

                <div class="over_3a f_l  bounceInLeft col-md-6 clearfix">
                    <dl>
                        <dt>
	                    <span class="fa fa-user-md service-icon-effect"></span></dt>
                        <dd>
                            <li><router-link to="/about/cases"><b>病例信息</b><span class="sr-only"></span></router-link></li>
                            <p>XXX的通道有许多变化，但大多数人以某种形式遭受了改变，通过注射幽默</p>
                        </dd>
                    </dl>
                </div>

                <div class="over_3a f_r  bounceInRight col-md-6 clearfix">
                    <dl>
                        <dt>
	                    <span class="fa fa-ambulance service-icon-effect"></span></dt>
                        <dd>
                            <li><router-link to="/about/reserve"><b>预约检查和手术</b><span class="sr-only"></span></router-link></li>
                            <p>XXX的通道有许多变化，但大多数人以某种形式遭受了改变，通过注射幽默</p>
                        </dd>
                    </dl>
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
                    <div class="col-md-3 col-sm-12 f1">
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
                    <div class="col-md-3 col-sm-12 f2">
                        <div class="single-footer-widget">
                            <div class="section-heading">
                                <h4>关注我们</h4>
                                <div class="line"></div>
                            </div>
                            <img src="../../assets/images/status.gif" />
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12">
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

</script>

<style scoped>
@import url("../../css/reset.css");
@import url("../../css/hwslider.css");
@import url("../../css/bootstrap.css");
@import url("../../css/font-awesome.min.css");
@import url("../../css/style.css");

/* 自定义按钮样式 */
.contact-button {
  display: inline-block;
  padding: 10px 20px;
  font-size: 16px;
  font-weight: bold;
  color: #fff;
  background-color: #007bff; /* 主要按钮颜色 */
  border: none;
  border-radius: 8px; /* 圆角效果 */
  text-align: center;
  text-decoration: none; /* 去掉下划线 */
  transition: transform 0.3s ease, background-color 0.3s ease; /* 添加过渡效果 */
}

/* 悬停效果 */
.contact-button:hover {
  background-color: #0056b3; /* 悬停时的按钮颜色 */
  transform: scale(1.05); /* 鼠标悬停时的放大效果 */
}

/* 点击效果 */
.contact-button:active {
  transform: scale(0.95); /* 点击时的缩小效果 */
}

/* 3D阴影效果 */
.contact-button {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* 添加阴影 */
}

.contact-button:focus {
  outline: none; /* 去掉焦点边框 */
}

.contact-button:disabled {
  background-color: #6c757d; /* 禁用时的按钮颜色 */
  cursor: not-allowed; /* 禁用状态的光标样式 */
}
</style>