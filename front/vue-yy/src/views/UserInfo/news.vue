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
                    <li><router-link to="/" >首页 <span class="sr-only"></span></router-link></li>
                    <li><router-link to="/about" >住院相关</router-link></li>
                    <li><router-link to="/new" class="active">医疗动态</router-link></li>
                    <li><router-link to="/resource">医疗资源</router-link></li>
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
    <!--团队-->
    <div class="team p50">
        <section class="team-section go_pt eo_pb">
            <div class="container">
                <div class="row team-style4">
                    <div class="col-md-4 col-sm-6">
                        <div class="team-post">
                            <div class="thumb">
                                <img src="../../assets/images/6.jpg" alt="">
                            </div>
                            <div class="content">
                                <h4 class="title">医疗牙科部门最新趋势</h4>
                                <h5 class="sub-title">李福尔</h5>
                                <p>XX的通道有许多变化，但大部分人以某种形式遭受改变，注入幽默，或者看起来不太可信的随机词。</p>
                                <a href="news - show.html" class="profile">阅读更多</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="team-post">
                            <div class="thumb">
                                <img src="../../assets/images/7.jpg" alt="">
                            </div>
                            <div class="content">
                                <h4 class="title">医疗牙科部门最新趋势</h4>
                                <h5 class="sub-title">李福尔</h5>
                                <p>XX的通道有许多变化，但大部分人以某种形式遭受改变，注入幽默，或者看起来不太可信的随机词。</p>
                                <a href="news - show.html" class="profile">阅读更多</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="team-post">
                            <div class="thumb">
                                <img src="../../assets/images/6.jpg" alt="">
                            </div>
                            <div class="content">
                                <h4 class="title">医疗牙科部门最新趋势</h4>
                                <h5 class="sub-title">李福尔</h5>
                                <p>XX的通道有许多变化，但大部分人以某种形式遭受改变，注入幽默，或者看起来不太可信的随机词。</p>
                                <a href="news - show.html" class="profile">阅读更多</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="team-post">
                            <div class="thumb">
                                <img src="../../assets/images/9.jpg" alt="">
                            </div>
                            <div class="content">
                                <h4 class="title">医疗牙科部门最新趋势</h4>
                                <h5 class="sub-title">李福尔</h5>
                                <p>XX的通道有许多变化，但大部分人以某种形式遭受改变，注入幽默，或者看起来不太可信的随机词。</p>
                                <a href="news - show.html" class="profile">阅读更多</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="team-post">
                            <div class="thumb">
                                <img src="../../assets/images/15.jpg" alt="">
                            </div>
                            <div class="content">
                                <h4 class="title">医疗牙科部门最新趋势</h4>
                                <h5 class="sub-title">李福尔</h5>
                                <p>XX的通道有许多变化，但大部分人以某种形式遭受改变，注入幽默，或者看起来不太可信的随机词。</p>
                                <a href="news - show.html" class="profile">阅读更多</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="team-post">
                            <div class="thumb">
                                <img src="../../assets/images/14.jpg" alt="">
                            </div>
                            <div class="content">
                                <h4 class="title">医疗牙科部门最新趋势</h4>
                                <h5 class="sub-title">李福尔</h5>
                                <p>XX的通道有许多变化，但大部分人以某种形式遭受改变，注入幽默，或者看起来不太可信的随机词。</p>
                                <a href="news - show.html" class="profile">阅读更多</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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
</style>