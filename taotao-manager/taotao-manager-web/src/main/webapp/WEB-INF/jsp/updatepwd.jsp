<%--
  Created by IntelliJ IDEA.
  User: 刘振河
  Date: 2020/1/10
  Time: 0:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path=request.getContextPath();String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<base href="<%=basePath%>>">
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- BEGIN META -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Custom Theme">
    <!-- END META -->


    <!-- BEGIN SHORTCUT ICON -->
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- END SHORTCUT ICON -->
    <title>Blank</title>

    <!-- BEGIN STYLESHEET -->
    <link href="http://www.jq22.com/jquery/bootstrap-3.3.4.css" rel="stylesheet"><!-- BOOTSTRAP CSS  -->
    <link href="css/bootstrap-reset.css" rel="stylesheet"><!-- BOOTSTRAP CSS  -->
    <link href="http://www.jq22.com/jquery/font-awesome.4.6.0.css" rel="stylesheet"><!-- FONT AWESOME CSS  -->
    <link href="css/style.css" rel="stylesheet"><!-- THEME BASIC CSS  -->
    <link href="css/style-responsive.css" rel="stylesheet"><!-- THEME RESPONSIVE CSS  -->
    <%--<link href="css/css.css" rel="stylesheet" type="text/css">
    <script src="pwd.js"></script>--%>
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <!-- END STYLESHEET -->
</head>
<body>
<!-- BEGIN SECTION -->
<section id="container" class="">
    <!-- BEGIN HEADER -->
    <header class="header white-bg">
        <!-- SIDEBAR TOGGLE BUTTON -->
        <div class="sidebar-toggle-box">
            <div  data-placement="right" class="fa fa-bars tooltips">
            </div>
        </div>
        <!-- SIDEBAR TOGGLE BUTTON  END-->

        <a href="index.html" class="logo">olive<span>admin</span></a>

        <!-- START HEADER  NAV -->

        <nav class="nav notify-row" id="top_menu">

            <ul class="nav top-menu">
                <!-- START NOTIFY TASK BAR -->

                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="fa fa-tasks">
                        </i>
                        <span class="badge bg-success">
                  6
                </span>
                    </a>

                    <ul class="dropdown-menu extended tasks-bar">
                        <li class="notify-arrow notify-arrow-blue">
                        </li>
                        <li>
                            <p class="blue">
                                You have 6 pending tasks
                            </p>
                        </li>
                        <li>
                            <a href="#">
                                <div class="task-info">
                                    <div class="desc">
                                        Dashboard v1.3
                                    </div>
                                    <div class="percent">
                                        40%
                                    </div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-success set-40" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" >
                        <span class="sr-only">
                          40% Complete (success)
                        </span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="task-info">
                                    <div class="desc">
                                        Database Update
                                    </div>
                                    <div class="percent">
                                        60%
                                    </div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-warning set-60" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" >
                        <span class="sr-only">
                          60% Complete (warning)
                        </span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="task-info">
                                    <div class="desc">
                                        Iphone Development
                                    </div>
                                    <div class="percent">
                                        87%
                                    </div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-info set-87" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" >
                        <span class="sr-only">
                          87% Complete
                        </span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="task-info">
                                    <div class="desc">
                                        Mobile App
                                    </div>
                                    <div class="percent">
                                        33%
                                    </div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-danger set-33" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" >
                        <span class="sr-only">
                          33% Complete (danger)
                        </span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="task-info">
                                    <div class="desc">
                                        Dashboard v1.3
                                    </div>
                                    <div class="percent">
                                        45%
                                    </div>
                                </div>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar set-45" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" >
                        <span class="sr-only">
                          45% Complete
                        </span>
                                    </div>

                                </div>
                            </a>
                        </li>
                        <li class="external">
                            <a href="#">
                                See All Tasks
                            </a>
                        </li>
                    </ul>

                </li>
                <!-- END NOTIFY TASK BAR -->

                <!-- START NOTIFY INBOX BAR -->

                <li id="header_inbox_bar" class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="fa fa-envelope-o">
                        </i>
                        <span class="badge bg-important">
                  5
                </span>
                    </a>
                    <ul class="dropdown-menu extended inbox">
                        <li class="notify-arrow notify-arrow-blue">
                        </li>
                        <li>
                            <p class="blue">
                                You have 5 new messages
                            </p>
                        </li>
                        <li>
                            <a href="#">
                    <span class="photo">
                      <img alt="avatar" src="./img/avatar-mini.jpg">
                    </span>
                                <span class="subject">
                      <span class="from">
                        Chintan Pandya
                      </span>
                      <span class="time">
                        Just now
                      </span>
                    </span>
                                <span class="message">
                      Hello, this is an example msg.
                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                    <span class="photo">
                      <img alt="avatar" src="./img/avatar-mini2.jpg">
                    </span>
                                <span class="subject">
                      <span class="from">
                        Parth Jani
                      </span>
                      <span class="time">
                        10 mins
                      </span>
                    </span>
                                <span class="message">
                      Hi, Bro how are you ?
                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                    <span class="photo">
                      <img alt="avatar" src="./img/avatar-mini3.jpg">
                    </span>
                                <span class="subject">
                      <span class="from">
                        Jay Bardolia
                      </span>
                      <span class="time">
                        3 hrs
                      </span>
                    </span>
                                <span class="message">
                      This is awesome dashboard.
                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                    <span class="photo">
                      <img alt="avatar" src="./img/avatar-mini4.jpg">
                    </span>
                                <span class="subject">
                      <span class="from">
                        Pruthvi Bardolia
                      </span>
                      <span class="time">
                        Just now
                      </span>
                    </span>
                                <span class="message">
                      Hello, this is metrolab
                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                See all messages
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- END NOTIFY INBOX BAR -->

                <!-- START NOTIFY NOTIFICATION BAR -->

                <li id="header_notification_bar" class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="fa fa-bell-o">
                        </i>
                        <span class="badge bg-warning">
                  7
                </span>
                    </a>
                    <ul class="dropdown-menu extended notification">
                        <li class="notify-arrow notify-arrow-blue">
                        </li>
                        <li>
                            <p class="blue">
                                You have 7 new notifications
                            </p>
                        </li>
                        <li>
                            <a href="#">
                    <span class="label label-danger">
                      <i class="fa fa-bolt">
                      </i>
                    </span>
                                Server #3 overloaded.
                                <span class="small italic">
                      34 mins
                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                    <span class="label label-warning">
                      <i class="fa fa-bell">
                      </i>
                    </span>
                                Server #10 not respoding.
                                <span class="small italic">
                      1 Hours
                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                    <span class="label label-danger">
                      <i class="fa fa-bolt">
                      </i>
                    </span>
                                Database overloaded 24%.
                                <span class="small italic">
                      4 hrs
                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                    <span class="label label-success">
                      <i class="fa fa-plus">
                      </i>
                    </span>
                                New user registered.
                                <span class="small italic">
                      Just now
                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                    <span class="label label-primary">
                      <i class="fa fa-bullhorn">
                      </i>
                    </span>
                                Application error.
                                <span class="small italic">
                      10 mins
                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                See all notifications
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- END NOTIFY NOTIFICATION BAR -->

            </ul>


        </nav>

        <!-- END HEADER NAV -->


        <!-- START USER LOGIN DROPDOWN  -->
        <div class="top-nav ">
            <ul class="nav pull-right top-menu">
                <li>
                    <input type="text" class="form-control search" placeholder="Search">
                </li>

                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <img alt="" src="img/avatar1_small.jpg">
                        <span class="username">Pruthvi</span>
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu extended logout">
                        <li class="log-arrow-up"></li>
                        <li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
                        <li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
                        <li><a href="#"><i class="fa fa-bell-o"></i> Notification</a></li>
                        <li><a href="login.html"><i class="fa fa-key"></i> Log Out</a></li>
                    </ul>
                </li>

            </ul>
        </div>
        <!-- END USER LOGIN DROPDOWN  -->
    </header>
    <!-- END HEADER -->

    <!-- BEGIN SIDEBAR -->
    <aside>
        <div id="sidebar" class="nav-collapse">

            <ul class="sidebar-menu" id="nav-accordion">
                <li>
                    <a href="/initmain">
                        <i class="fa fa-dashboard"></i>
                        <span>首页</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="itemadd">
                        <i class="fa fa-plus-square"></i>
                        <span>新增商品</span>
                        <span class="label label-inverse span-sidebar">5</span>
                    </a>
                    <a href="itemlist">
                        <i class="fa fa-search"></i>
                        <span>查询商品</span>
                        <span class="label label-inverse span-sidebar">5</span>
                    </a>
                    <a href="itemparamlist">
                        <i class="fa fa-code-fork"></i>
                        <span>规格参数</span>
                        <span class="label label-inverse span-sidebar">5</span>
                    </a>
                    <a href="contentcategory">
                        <i class="fa fa-tasks"></i>
                        <span>内容分类管理</span>
                        <span class="label label-inverse span-sidebar">5</span>
                    </a>

                    <a href="initcontent">
                        <i class="fa fa-folder"></i>
                        <span>网站内容管理</span>
                        <span class="label label-inverse span-sidebar">5</span>
                    </a>
                </li>
            </ul>

        </div>
    </aside>
    <!-- END SIDEBAR -->
    <!-- BEGIN MAIN CONTENT -->
    <section id="main-content">
        <section class="wrapper site-min-height">

            <div class="col-lg-6">
            <section class="panel">
                <header class="panel-heading">
                    <span class="label label-primary">修改密码</span>
                    <span class="tools pull-right">
                           <a href="javascript:;" class="fa fa-chevron-down"></a>
                           <a href="javascript:;" class="fa fa-times"></a>
                           </span>
                </header>
                <div class="panel-body">
                    <form role="form"  method="post" action="/modifypwd">
                        <%--<div class="form-group">
                            <label>旧密码</label>
                            <div class="iconic-input right">
                                <i class="fa fa-coffee"></i>
                                <input type="text" class="form-control" placeholder="请输入旧密码">
                            </div>
                        </div>--%>
                            <div class="form-group">
                                <label for="newpassword">旧密码</label>
                                <input type="password" class="form-control" name="oldpwd" id="oldpassword" placeholder="请输入旧密码">
                            </div>
                        <div class="form-group">
                            <label for="newpassword">新密码</label>
                            <input type="password" class="form-control" name="newpwd" id="newpassword" placeholder="请输入新密码">
                        </div>
                        <%--<div class='inputWrap'>
                            <input type='password' name='password' pattern='^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{9,}$' required>
                            <label title='Toggle password visisbility'>Password<button class='togglePass'></button>
                            </label>
                        </div>--%>

                        <input type="submit" class="btn btn-info" id="updatepwd" value="修改"></input>

                    </form>

                </div>
            </section>
            </div>

        </section>
    </section>
    <!-- END MAIN CONTENT -->
    <!-- BEGIN FOOTER -->
    <footer class="site-footer">
        <div class="text-center">
            2013 &copy; Olive Admin by <a href="" target="_blank">Custom Theme</a>.
            <a href="#" class="go-top">
                <i class="fa fa-angle-up"></i>
            </a>
        </div>
    </footer>
    <!-- END FOOTER -->
</section>
<!-- END SECTION -->
<script>

    $(function(){
        //第一页的确定按钮
        $("#aaa").click(function(){
            alert("ok");

        });
       /* $("#aaa").click(function(){
            alert("ok")
            var newpwd= $(" #newpwd ").val()
            var oldpwd= $(" #oldpwd ").val()
            alert(newpwd)
            alert(oldpwd)
            if(newpwd.equals(oldpwd)){
                alert("两次输入的密码不一致");
                return false;
            }
        })*/

    });
</script>
<!-- BEGIN JS -->
<script src="js/jquery.js" ></script><!-- BASIC JS LIABRARY -->
<script src="js/bootstrap.min.js" ></script><!-- BOOTSTRAP JS  -->
<script src="js/jquery.dcjqaccordion.2.7.js"></script><!-- ACCORDING JS -->
<script src="js/jquery.scrollTo.min.js" ></script><!-- SCROLLTO JS  -->
<script src="js/jquery.nicescroll.js" > </script><!-- NICESCROLL JS  -->
<script src="js/respond.min.js" ></script><!-- RESPOND JS  -->
<script src="js/common-scripts.js" ></script><!-- BASIC COMMON JS  -->
<script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
<script src="js/jquery-1.11.1.min.js"></script>
<!-- END JS -->
</body>
</html>


