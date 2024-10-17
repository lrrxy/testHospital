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
                    <li><router-link to="/" class="active">首页 <span class="sr-only"></span></router-link></li>
                    <li><router-link to="/about" >住院相关</router-link></li>
                    <!-- <li><router-link to="/new">医疗动态</router-link></li> -->
                    <li><router-link to="/resource">医护信息</router-link></li>
                    <li><router-link to="/contact">个人中心</router-link></li>
                </ul>
            </div>
        </div>
    </nav>
    <!--幻灯片-->
    <!-- <div id="hwslider" class="hwslider">
        <ul>
            <li><a><img src="../assets/images/banner-1.jpg" /></a></li>
            <li><a><img src="../assets/images/banner-2.jpg" /></a></li>
        </ul>
    </div> -->
    <el-carousel indicator-position="outside">
        <el-carousel-item v-for="item in 2" :key="item">
        <h3 text="2xl" justify="center">{{ item }}</h3>
        </el-carousel-item>
    </el-carousel>
    <!-- <div>
    <h1>欢迎使用首页</h1>
    <p>您的登录令牌是: {{ token }}</p>
    </div> -->

    <!--服务-->
    <div class="service">
        <div class="container p50">
            <div class="row">
                <div class="col-md-12 title">
                    <h2>我们的服务</h2>
                    <div class="line"></div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="ser-item">
                        <div class="service-icon">
                            <span class="fa fa-heartbeat service-icon-effect"></span>
                        </div>
                        <h3><a href="#">预约挂号</a></h3>
                        <p>XXX的通道有许多变化，但大多数人以某种形式遭受了改变，通过注射幽默</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="ser-item">
                        <div class="service-icon">
                            <span class="fa fa-stethoscope service-icon-effect"></span>
                        </div>
                        <h3><a href="#">住院信息</a></h3>
                        <p>XXX的通道有许多变化，但大多数人以某种形式遭受了改变，通过注射幽默</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="ser-item">
                        <div class="service-icon">
                            <span class="fa fa-h-square service-icon-effect"></span>
                        </div>
                        <h3><a href="#">医疗动态</a></h3>
                        <p>XXX的通道有许多变化，但大多数人以某种形式遭受了改变，通过注射幽默</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="ser-item">
                        <div class="service-icon">
                            <span class="fa fa-medkit service-icon-effect"></span>
                        </div>
                        <h3><a href="#">手术进度</a></h3>
                        <p>XXX的通道有许多变化，但大多数人以某种形式遭受了改变，通过注射幽默</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="ser-item">
                        <div class="service-icon">
                            <span class="fa fa-user-md service-icon-effect"></span>
                        </div>
                        <h3><a href="#">问题咨询</a></h3>
                        <p>XXX的通道有许多变化，但大多数人以某种形式遭受了改变，通过注射幽默</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="ser-item">
                        <div class="service-icon">
                            <span class="fa fa-ambulance service-icon-effect"></span>
                        </div>
                        <h3><a href="#">退院申请</a></h3>
                        <p>XXX的通道有许多变化，但大多数人以某种形式遭受了改变，通过注射幽默</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--选择我们 -->
    <div class="choose p50">
        <div class="container">
            <div class="row">
                <div class="col-md-12 title">
                    <h2>为什么选择我们</h2>
                    <div class="line"></div>
                </div>
                <div class="col-md-5 col-sm-12 col-xs-12 p30">
                    <img src="../../assets/images/choose-us-img1.jpg" />
                </div>
                <div class="col-md-7 col-sm-12 col-xs-12 p30 c-show">
                    <div class="row">
                        <div class="col-md-2 col-sm-2">
                            <a href="#" class="media-icon">
                <span class="fa fa-hospital-o"></span>
              </a>
                        </div>
                        <div class="col-md-10 col-sm-10 clearfix c-w">
                            <h3 class="">先进的医疗设备</h3>
                            <p>先进的医疗设备先进的医疗设备先进的医疗设备先进的医疗设备先进的医疗设备先进的医疗设</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-2 ">
                            <a href="#" class="media-icon">
                <span class="fa fa-user-md"></span>
              </a>
                        </div>
                        <div class="col-md-10 col-sm-10 clearfix c-w">
                            <h3 class="">专业的医疗团队</h3>
                            <p>专业的医疗团队专业的医疗团队专业的医疗团队专业的医疗团队专业的医疗团队专业的医疗团</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-2">
                            <a href="#" class="media-icon">
                <span class="fa fa-ambulance"></span>
              </a>
                        </div>
                        <div class="col-md-10 col-sm-10 clearfix c-w">
                            <h3 class="">紧急支援</h3>
                            <p>紧急支援紧急支援紧急支援紧急支援紧急支援紧急支援紧急支援紧急支援紧急支援紧急支援紧</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--数据-->
    <div class="counters p50 clearfix">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="counter-box">
                        <div class="counter-no counter">
                            200
                        </div>
                        <div class="counter-label">医疗人员</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="counter-box">
                        <div class="counter-no counter">
                            300
                        </div>
                        <div class="counter-label">诊所病房</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="counter-box">
                        <div class="counter-no counter">
                            350
                        </div>
                        <div class="counter-label">医疗设备</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="counter-box">
                        <div class="counter-no counter">
                            700
                        </div>
                        <div class="counter-label">康复病人</div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!--新闻资讯-->
    <div class="news p50">
        <div class="container">
            <div class="row">
                <div class="col-md-12 title">
                    <h2>新闻资讯</h2>
                    <div class="line"></div>
                </div>
                <div class="col-md-4 col-sm-12 clearfix">
                    <div class="single-Blog">
                        <div class="single-blog-left">
                            <ul class="blog-comments-box">
                                <li>五月
                                    <h2>02</h2>2017</li>
                                <li><span class="fa fa-eye"></span>1523</li>
                            </ul>
                        </div>
                        <div class="single-blog-right">
                            <div class="blog-img">
                                <figure class="blog-figure">
                                    <a href="news - show.html"><img src="../../assets/images/choose-us-img3.jpg" alt="img"></a>
                                    <span class="image-effect"></span>
                                </figure>
                            </div>
                            <div class="blog-author">
                                <p>作者：<span>李博士</span></p>
                            </div>
                            <div class="blog-content">
                                <h3>医疗牙科部门最新趋势</h3>
                                <p>XXX的通道有许多变化，但大部分人以某种形式遭受改变，注入幽默，或者看起来不太可信的随机词。</p>
                                <div class="more">
                                    <a href="news - show.html" data-hover="Read More"><span>阅读更多</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 clearfix">
                    <div class="single-Blog">
                        <div class="single-blog-left">
                            <ul class="blog-comments-box">
                                <li>五月
                                    <h2>02</h2>2017</li>
                                <li><span class="fa fa-eye"></span>1523</li>
                            </ul>
                        </div>
                        <div class="single-blog-right">
                            <div class="blog-img">
                                <figure class="blog-figure">
                                    <a href="news - show.html"><img src="../../assets/images/choose-us-img3.jpg" alt="img"></a>
                                    <span class="image-effect"></span>
                                </figure>
                            </div>
                            <div class="blog-author">
                                <p>作者：<span>李博士</span></p>
                            </div>
                            <div class="blog-content">
                                <h3>医疗牙科部门最新趋势</h3>
                                <p>XXX的通道有许多变化，但大部分人以某种形式遭受改变，注入幽默，或者看起来不太可信的随机词。</p>
                                <div class="more">
                                    <a href="news - show.html" data-hover="Read More"><span>阅读更多</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 ">
                    <div class="single-Blog">
                        <div class="single-blog-left">
                            <ul class="blog-comments-box">
                                <li>五月
                                    <h2>02</h2>2017</li>
                                <li><span class="fa fa-eye"></span>1523</li>
                            </ul>
                        </div>
                        <div class="single-blog-right">
                            <div class="blog-img">
                                <figure class="blog-figure">
                                    <a href="news - show.html"><img src="../../assets/images/choose-us-img3.jpg" alt="img"></a>
                                    <span class="image-effect"></span>
                                </figure>
                            </div>
                            <div class="blog-author">
                                <p>作者：<span>李博士</span></p>
                            </div>
                            <div class="blog-content">
                                <h3>医疗牙科部门最新趋势</h3>
                                <p>XXX的通道有许多变化，但大部分人以某种形式遭受改变，注入幽默，或者看起来不太可信的随机词。</p>
                                <div class="more">
                                    <a href="news - show.html" data-hover="Read More"><span>阅读更多</span></a>
                                </div>
                            </div>
                        </div>
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
                    <div class="col-md-3 col-sm-12 ">
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

.el-carousel__item h3 {
  display: flex;
  color: #475669;
  opacity: 0.75;
  line-height: 300px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}
</style>