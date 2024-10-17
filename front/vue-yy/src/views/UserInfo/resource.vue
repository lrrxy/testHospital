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
                    <!-- <li><router-link to="/new">医疗动态</router-link></li> -->
                    <li><router-link to="/resource" class="active">医护信息</router-link></li>
                    <li><router-link to="/contact">个人中心</router-link></li>
                </ul>
            </div>
        </div>
    </nav>
    <!--幻灯片-->
    <div class="page2-title">
        <div class="container">
        </div>
    </div>
    <!--医疗资源-->
    <div class="r-top p50">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h3>最充足的医疗资源</h3>
                    <p>广州XX医院是集医疗、教学、科研于一体的大型三级甲等综合医院，是国家卫生计生委指定的全的经营，已高速发展成集国疑难重症诊治指导中心，也是</p>
                    <p>最早承担高干保健和外宾医疗任务的医院之一，以学科齐全、技术力量雄厚、享誉海内外。</p>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <img src="../../assets/images/r (1).png" />
                    <h4>我们的研究</h4>
                    <p>集医疗、教学、科研于一体的大型三</p>
                    <p>级甲等综合医院，是国家卫生计生委指定已高速发展成集重症诊治指导中心</p>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <img src="../../assets/images/r (2).png" />
                    <h4>我们的救护车</h4>
                    <p>90余年来，医院形成了“严谨、求</p>
                    <p>精、勤奋、奉献”的精神和兼格，创立了“三基”、“三严”的现代医学理念</p>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <img src="../../assets/images/r (3).png" />
                    <h4>我们的医生</h4>
                    <p>90余年来，医院形成了“严谨、求</p>
                    <p>精、勤奋、奉献”的精神和兼格，创立了“三基”、“三严”的现代医学理念</p>
                </div>
            </div>
        </div>
    </div>
    <div class="r-mid">
        <div class="container-fluid">
            <img src="../../assets/images/r.png" />
            <h3>— 最专业的医疗技术 —</h3>
            <p>医院形成了“严谨、求精、勤奋、奉献”的精神和兼格，创立了“三基”、“三严”的现代</p>
            <p>医学教育理念，形成了以“教授、病案、图书馆”著称的星际“三宝”，培养造需就了许多一代医学大师和多位中国现代</p>
        </div>
    </div>
    <div class="r-bottom p50">
        <div class="container-fluid">
            <h3>专家团队</h3>
            <p>我们有最专业的专家团队为您保驾护航</p>
        </div>
        <div class="container p50">
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-6 my-team-member wow fadeInUp">
                    <div class="my-member-img">
                        <img src="../../assets/images/1.jpg" class="img-responsive" alt="team01">
                    </div>
                    <div class="my-team-detail text-center">
                        <h4 class="my-member-name">李XX</h4>
                        <p class="my-member-post">消化科主任</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6 my-team-member wow fadeInUp">
                    <div class="my-member-img">
                        <img src="../../assets/images/2.jpg" class="img-responsive" alt="team01">
                    </div>
                    <div class="my-team-detail text-center">
                        <h4 class="my-member-name">李XX</h4>
                        <p class="my-member-post">消化科主任</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6  col-xs-6 my-team-member wow fadeInUp">
                    <div class="my-member-img">
                        <img src="../../assets/images/3.jpg" class="img-responsive" alt="team01">
                    </div>
                    <div class="my-team-detail text-center">
                        <h4 class="my-member-name">李XX</h4>
                        <p class="my-member-post">消化科主任</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6 my-team-member wow fadeInUp">
                    <div class="my-member-img">
                        <img src="../../assets/images/4.jpg" class="img-responsive" alt="team01">
                    </div>
                    <div class="my-team-detail text-center">
                        <h4 class="my-member-name">李XX</h4>
                        <p class="my-member-post">消化科主任</p>
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