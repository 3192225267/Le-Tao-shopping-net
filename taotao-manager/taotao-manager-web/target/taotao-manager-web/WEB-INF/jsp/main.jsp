<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘振河
  Date: 2020/1/7
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- BEGIN META -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Olive Enterprise">
    <script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <!-- END META -->

    <!-- BEGIN SHORTCUT ICON -->
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- END SHORTCUT ICON -->
    <title>
        首页
    </title>
    <!-- BEGIN STYLESHEET-->
    <link href="http://www.jq22.com/jquery/bootstrap-3.3.4.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
    <link href="css/bootstrap-reset.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
    <link href="http://www.jq22.com/jquery/font-awesome.4.6.0.css" rel="stylesheet"><!-- FONT AWESOME ICON CSS -->
    <link href="css/style.css" rel="stylesheet"><!-- THEME BASIC CSS -->
    <link href="css/style-responsive.css" rel="stylesheet"><!-- THEME RESPONSIVE CSS -->
    <link href="assets/morris.js-0.4.3/morris.css" rel="stylesheet"><!-- MORRIS CHART CSS -->
    <!--dashboard calendar-->
    <link href="css/clndr.css" rel="stylesheet"><!-- CALENDER CSS -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js">
    </script>
    <script src="js/respond.min.js">
    </script>
    <![endif]-->
    <!-- END STYLESHEET-->

    <script type="text/javascript" src="js/z-chart5.js"></script>
    <style>
        html,
        body {
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>
<!-- BEGIN SECTION -->
<section id="container">
    <!-- BEGIN HEADER -->
    <header class="header white-bg">
        <!-- SIDEBAR TOGGLE BUTTON -->
        <div class="sidebar-toggle-box">
            <div  data-placement="right" class="fa fa-bars tooltips">
            </div>
        </div>
        <!-- SIDEBAR TOGGLE BUTTON  END-->
        <a href="index.html" class="logo">
            Olive
            <span>
            Admin
          </span>
        </a>
        <%--<!-- START HEADER  NAV -->--%>

        <%--<nav class="nav notify-row" id="top_menu">--%>

            <%--<ul class="nav top-menu">--%>
                <%--<!-- START NOTIFY TASK BAR -->--%>

                <%--<li class="dropdown">--%>
                    <%--<a data-toggle="dropdown" class="dropdown-toggle" href="#">--%>
                        <%--<i class="fa fa-tasks">--%>
                        <%--</i>--%>
                        <%--<span class="badge bg-success">--%>
                  <%--6--%>
                <%--</span>--%>
                    <%--</a>--%>

                    <%--<ul class="dropdown-menu extended tasks-bar">--%>
                        <%--<li class="notify-arrow notify-arrow-blue">--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<p class="blue">--%>
                                <%--You have 6 pending tasks--%>
                            <%--</p>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#">--%>
                                <%--<div class="task-info">--%>
                                    <%--<div class="desc">--%>
                                        <%--Dashboard v1.3--%>
                                    <%--</div>--%>
                                    <%--<div class="percent">--%>
                                        <%--40%--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="progress progress-striped">--%>
                                    <%--<div class="progress-bar progress-bar-success set-40" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" >--%>
                        <%--<span class="sr-only">--%>
                          <%--40% Complete (success)--%>
                        <%--</span>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#">--%>
                                <%--<div class="task-info">--%>
                                    <%--<div class="desc">--%>
                                        <%--Database Update--%>
                                    <%--</div>--%>
                                    <%--<div class="percent">--%>
                                        <%--60%--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="progress progress-striped">--%>
                                    <%--<div class="progress-bar progress-bar-warning set-60" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" >--%>
                        <%--<span class="sr-only">--%>
                          <%--60% Complete (warning)--%>
                        <%--</span>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#">--%>
                                <%--<div class="task-info">--%>
                                    <%--<div class="desc">--%>
                                        <%--Iphone Development--%>
                                    <%--</div>--%>
                                    <%--<div class="percent">--%>
                                        <%--87%--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="progress progress-striped">--%>
                                    <%--<div class="progress-bar progress-bar-info set-87" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" >--%>
                        <%--<span class="sr-only">--%>
                          <%--87% Complete--%>
                        <%--</span>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#">--%>
                                <%--<div class="task-info">--%>
                                    <%--<div class="desc">--%>
                                        <%--Mobile App--%>
                                    <%--</div>--%>
                                    <%--<div class="percent">--%>
                                        <%--33%--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="progress progress-striped">--%>
                                    <%--<div class="progress-bar progress-bar-danger set-33" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" >--%>
                        <%--<span class="sr-only">--%>
                          <%--33% Complete (danger)--%>
                        <%--</span>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#">--%>
                                <%--<div class="task-info">--%>
                                    <%--<div class="desc">--%>
                                        <%--Dashboard v1.3--%>
                                    <%--</div>--%>
                                    <%--<div class="percent">--%>
                                        <%--45%--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="progress progress-striped active">--%>
                                    <%--<div class="progress-bar set-45" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" >--%>
                        <%--<span class="sr-only">--%>
                          <%--45% Complete--%>
                        <%--</span>--%>
                                    <%--</div>--%>

                                <%--</div>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li class="external">--%>
                            <%--<a href="#">--%>
                                <%--See All Tasks--%>
                            <%--</a>--%>
                        <%--</li>--%>
                    <%--</ul>--%>

                <%--</li>--%>
                <%--<!-- END NOTIFY TASK BAR -->--%>

                <%--<!-- START NOTIFY INBOX BAR -->--%>

                <%--<li id="header_inbox_bar" class="dropdown">--%>
                    <%--<a data-toggle="dropdown" class="dropdown-toggle" href="#">--%>
                        <%--<i class="fa fa-envelope-o">--%>
                        <%--</i>--%>
                        <%--<span class="badge bg-important">--%>
                  <%--5--%>
                <%--</span>--%>
                    <%--</a>--%>
                    <%--<ul class="dropdown-menu extended inbox">--%>
                        <%--<li class="notify-arrow notify-arrow-blue">--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<p class="blue">--%>
                                <%--You have 5 new messages--%>
                            <%--</p>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#">--%>
                    <%--<span class="photo">--%>
                      <%--<img alt="avatar" src="/img/avatar-mini.jpg">--%>
                    <%--</span>--%>
                                <%--<span class="subject">--%>
                      <%--<span class="from">--%>
                        <%--Chintan Pandya--%>
                      <%--</span>--%>
                      <%--<span class="time">--%>
                        <%--Just now--%>
                      <%--</span>--%>
                    <%--</span>--%>
                                <%--<span class="message">--%>
                      <%--Hello, this is an example msg.--%>
                    <%--</span>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#">--%>
                    <%--<span class="photo">--%>
                      <%--<img alt="avatar" src="./img/avatar-mini2.jpg">--%>
                    <%--</span>--%>
                                <%--<span class="subject">--%>
                      <%--<span class="from">--%>
                        <%--Parth Jani--%>
                      <%--</span>--%>
                      <%--<span class="time">--%>
                        <%--10 mins--%>
                      <%--</span>--%>
                    <%--</span>--%>
                                <%--<span class="message">--%>
                      <%--Hi, Bro how are you ?--%>
                    <%--</span>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#">--%>
                    <%--<span class="photo">--%>
                      <%--<img alt="avatar" src="./img/avatar-mini3.jpg">--%>
                    <%--</span>--%>
                                <%--<span class="subject">--%>
                      <%--<span class="from">--%>
                        <%--Jay Bardolia--%>
                      <%--</span>--%>
                      <%--<span class="time">--%>
                        <%--3 hrs--%>
                      <%--</span>--%>
                    <%--</span>--%>
                                <%--<span class="message">--%>
                      <%--This is awesome dashboard.--%>
                    <%--</span>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#">--%>
                    <%--<span class="photo">--%>
                      <%--<img alt="avatar" src="./img/avatar-mini4.jpg">--%>
                    <%--</span>--%>
                                <%--<span class="subject">--%>
                      <%--<span class="from">--%>
                        <%--Pruthvi Bardolia--%>
                      <%--</span>--%>
                      <%--<span class="time">--%>
                        <%--Just now--%>
                      <%--</span>--%>
                    <%--</span>--%>
                                <%--<span class="message">--%>
                      <%--Hello, this is metrolab--%>
                    <%--</span>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#">--%>
                                <%--See all messages--%>
                            <%--</a>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</li>--%>
                <%--<!-- END NOTIFY INBOX BAR -->--%>

                <%--<!-- START NOTIFY NOTIFICATION BAR -->--%>

                <%--<li id="header_notification_bar" class="dropdown">--%>
                    <%--<a data-toggle="dropdown" class="dropdown-toggle" href="#">--%>
                        <%--<i class="fa fa-bell-o">--%>
                        <%--</i>--%>
                        <%--<span class="badge bg-warning">--%>
                  <%--7--%>
                <%--</span>--%>
                    <%--</a>--%>
                    <%--<ul class="dropdown-menu extended notification">--%>
                        <%--<li class="notify-arrow notify-arrow-blue">--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<p class="blue">--%>
                                <%--You have 7 new notifications--%>
                            <%--</p>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#">--%>
                    <%--<span class="label label-danger">--%>
                      <%--<i class="fa fa-bolt">--%>
                      <%--</i>--%>
                    <%--</span>--%>
                                <%--Server #3 overloaded.--%>
                                <%--<span class="small italic">--%>
                      <%--34 mins--%>
                    <%--</span>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#">--%>
                    <%--<span class="label label-warning">--%>
                      <%--<i class="fa fa-bell">--%>
                      <%--</i>--%>
                    <%--</span>--%>
                                <%--Server #10 not respoding.--%>
                                <%--<span class="small italic">--%>
                      <%--1 Hours--%>
                    <%--</span>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#">--%>
                    <%--<span class="label label-danger">--%>
                      <%--<i class="fa fa-bolt">--%>
                      <%--</i>--%>
                    <%--</span>--%>
                                <%--Database overloaded 24%.--%>
                                <%--<span class="small italic">--%>
                      <%--4 hrs--%>
                    <%--</span>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#">--%>
                    <%--<span class="label label-success">--%>
                      <%--<i class="fa fa-plus">--%>
                      <%--</i>--%>
                    <%--</span>--%>
                                <%--New user registered.--%>
                                <%--<span class="small italic">--%>
                      <%--Just now--%>
                    <%--</span>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#">--%>
                    <%--<span class="label label-primary">--%>
                      <%--<i class="fa fa-bullhorn">--%>
                      <%--</i>--%>
                    <%--</span>--%>
                                <%--Application error.--%>
                                <%--<span class="small italic">--%>
                      <%--10 mins--%>
                    <%--</span>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#">--%>
                                <%--See all notifications--%>
                            <%--</a>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</li>--%>
                <%--<!-- END NOTIFY NOTIFICATION BAR -->--%>

            <%--</ul>--%>


        <%--</nav>--%>
        <%--<!-- END HEADER NAV -->--%>

        <!-- START USER LOGIN DROPDOWN  -->

        <div class="top-nav ">
            <ul class="nav pull-right top-menu">
                <li>
                    <input type="text" class="form-control search" placeholder="Search">
                </li>
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <img alt="" src="http://192.168.11.144/ftpuser/2020/01/11/123123.jpg" width="30px" height="30px">
                        <span class="username">
                            ${user.username}
                </span>
                        <b class="caret">
                        </b>
                    </a>
                    <ul class="dropdown-menu extended logout">
                        <li class="log-arrow-up">
                        </li>
                        <li>
                            <a href="/updatepwd">
                                <i class=" fa fa-suitcase">
                                </i>
                                修改密码
                            </a>
                        </li>
                        <li>
                            <a href="lock">
                                <i class="fa fa-lock"></i>
                                锁屏
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-bell-o">
                                </i>
                                Notification
                            </a>
                        </li>
                        <li>
                            <a href="login.html">
                                <i class="fa fa-key">
                                </i>
                                退出账号
                            </a>
                        </li>
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
        <!-- BEGIN WRAPPER  -->
        <section class="wrapper">
            <!-- BEGIN ROW  -->
            <div class="row state-overview">
                <div class="col-lg-3 col-sm-6">
                    <section class="panel">
                        <div class="symbol">
                            <i class="fa fa-tags blue">
                            </i>
                        </div>
                        <div class="value">
                            <h1 ><%--class="count"--%>
                               ${itemnum}
                            </h1>
                            <p>
                               新增商品
                            </p>
                        </div>
                    </section>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <section class="panel">
                        <div class="symbol">
                            <i class="fa fa-money red">
                            </i>
                        </div>
                        <div class="value">
                            <h1 ><%--class=" count2"--%>
                               ${Amount}
                            </h1>
                            <p>
                                最近一周成交额
                            </p>
                        </div>
                    </section>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <section class="panel">
                        <div class="symbol">
                            <i class="fa fa-user yellow">
                            </i>
                        </div>
                        <div class="value">
                            <h1 ><%--class=" count3"--%>
                               ${usernum}
                            </h1>
                            <p>
                                新增用户
                            </p>
                        </div>
                    </section>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <section class="panel">
                        <div class="symbol">
                            <i class="fa fa-shopping-cart purple">
                            </i>
                        </div>
                        <div class="value">
                            <h1 ><%--class=" count4"--%>
                                ${ordernum}
                            </h1>
                            <p>
                                新订单
                            </p>
                        </div>
                    </section>
                </div>
            </div>
            <!-- END ROW  -->
            <div id="morris">
                <!-- BEGIN ROW  -->
                <div class="row">
                    <div class="col-lg-4">
                        <div class="panel terques-chart">
                            <div class="panel-body chart-texture">
                                <div class="chart">
                                    <div class="heading">
                        <span>
                            <strong>
                          成交额一览
                            </strong>
                        </span>

                                            交易总额：￥${paymentnum}

                                    </div>

                                    <%--最近11个月总额发展--%>



                                    <div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" data-data="[${order1},${order2},${order3},${order4},${order5},${order6},${order7},${order8},${order9},${order10},${order11}]">

                                    </div>
                                </div>
                            </div>
                            <div class="chart-tittle">
                 <%--   <span class="title">
                      十一周总收入：
                    </span>--%>
                                <span class="value">
                      <a href="initmain">
                        刷新
                      </a>
                    </span>
                            </div>
                        </div>
                        <div class="panel terques-chart" style="background-color: #43e97b">
                            <div class="panel-body chart-texture">
                                <div class="chart">
                                    <div class="heading">
                        <span>
                            <strong>
                          用户增长一览
                            </strong>
                        </span>

                                        注册总量：${paymentnum}

                                    </div>

                                    <%--最近11个月总额发展--%>



                                    <div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" data-data="[130,230,560,720,750,780,930,1230,1530,1630,1730]">

                                    </div>
                                </div>
                            </div>
                            <div class="chart-tittle" style="background-color: #43e97b">
                                <%--   <span class="title">
                                     十一周总收入：
                                   </span>--%>
                                <span class="value">
                      <a href="initmain">
                        刷新
                      </a>
                    </span>
                            </div>
                        </div>
                    </div>
                    <%--<div class="col-lg-2">

                        <!-- /.tiles .facebook-tile -->
                       &lt;%&ndash;原推特等区域&ndash;%&gt;
                        <!-- /.tiles .twitter-tile -->
                    </div>--%>
                    <div class="col-lg-6">
                        <section class="panel">
                            <div class="ZchartBox">

                                <div class="item" id="circleChart">
                                </div>
                                <%--123--%>

                            </div>
                        </section>
                    </div>

                </div>
                <!-- END ROW  -->
            </div>
            <!-- BEGIN ROW  -->
            <div class="row">
                <div class="col-lg-8">
                    <section class="panel">
<%--
                        Work Progress
--%>
                        <%--<div class="panel-body">
                            <a href="#" class="task-thumb">
                                <img src="img/avatar1.jpg" alt="">
                            </a>
                            <div class="task-thumb-details">
                                <h1>
                                    <a href="#">
                                        Work Progress
                                    </a>
                                </h1>
                                <p>
                                    Pruthvi Bardolia
                                </p>
                            </div>
                        </div>--%>
                        <%--<table class="table table-hover personal-task">
                            <tbody>
                            <tr>
                                <td>
                                    1
                                </td>
                                <td>
                                    Target Revenue
                                </td>
                                <td>
                        <span class="badge bg-important">
                          75%
                        </span>
                                </td>
                                <td>
                                    <div id="work-progress1">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    2
                                </td>
                                <td>
                                    Project Larsen
                                </td>
                                <td>
                        <span class="badge bg-success">
                          43%
                        </span>
                                </td>
                                <td>
                                    <div id="work-progress2">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    3
                                </td>
                                <td>
                                    Project Nowbie
                                </td>
                                <td>
                        <span class="badge bg-info">
                          67%
                        </span>
                                </td>
                                <td>
                                    <div id="work-progress3">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    4
                                </td>
                                <td>
                                    Total Sales
                                </td>
                                <td>
                        <span class="badge bg-warning">
                          30%
                        </span>
                                </td>
                                <td>
                                    <div id="work-progress4">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    5
                                </td>
                                <td>
                                    Delivery Pending
                                </td>
                                <td>
                        <span class="badge bg-primary">
                          15%
                        </span>
                                </td>
                                <td>
                                    <div id="work-progress5">
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>--%>
                    </section>
                </div>
                <div class="col-lg-4">
                    <%--<section class="panel post-wrap pro-box">
                        <aside>
                            <div class="post-info">
                                <div class="panel-body">
                                    <footer class="social-footer">
                                        <ul>
                                            <li class="active">
                                                <a href="#">
                                                    <i class="fa fa-twitter">
                                                    </i>
                                                </a>
                                            </li>
                                        </ul>
                                    </footer>
                                    <!-- END  FOOTER -->
                                    <div class="text-center twite">
                                        <h1>
                                            We just Launch a New Theme Check it Out at
                                            <a href="javascript:;">
                                                http://olivethemes.in/
                                            </a>
                                        </h1>
                                        <p >
                                            4 Days ago
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </aside>
                    </section>--%>
                </div>
            </div>
            <!-- END ROW  -->
            <!-- BEGIN ROW  -->
            <%--<div class="row">
                <div class="col-lg-6">
                    <div class="panel">
                        <div class="panel-body">
                            <div class="media usr-info">
                                <a href="#" class="pull-left">
                                    <img class="thumb" src="img/avatar1.jpg" alt="">
                                </a>
                                <div class="media-body">
                                    <h4 class="media-heading">
                                        Pruthvi Bardolia
                                    </h4>
                                    <span>
                        Chief-Sarathi
                      </span>
                                    <p>
                                        I handcraft beautiful websites and application for all kind of devices
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <section class="panel">
                        <div class="weather-bg">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <i class="fa fa-cloud">
                                        </i>
                                        New Delhi
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="degree">
                                            48°
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <footer class="weather-category">
                            <ul>
                                <li class="active">
                                    <h5>
                                        humidity
                                    </h5>
                                    45%
                                </li>
                                <li>
                                    <h5>
                                        winds
                                    </h5>
                                    5 mph
                                </li>
                            </ul>
                        </footer>
                        <!-- END  FOOTER -->
                    </section>
                </div>
                <div class="col-lg-6">
                    <div class="panel">
                        <div class="panel-body">
                            <div class="calendar-block ">
                                <div class="cal1">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
            <!-- END ROW  -->
            <!-- BEGIN ROW  -->
            <%--<div class="row">
                <div class="col-lg-6">
                    <div class="panel">
                        <div class="panel-body">
                            <footer class="project-category">
                                <ul>
                                    <li class="active">
                                        <h5>
                                            Project 1
                                        </h5>
                                        <div id="work-progress6">
                                        </div>
                                    </li>
                                    <li>
                                        <h5>
                                            Project 2
                                        </h5>
                                        <div id="work-progress7">
                                        </div>
                                    </li>
                                    <li>
                                        <h5>
                                            Project 3
                                        </h5>
                                        <div id="work-progress8">
                                        </div>
                                    </li>
                                </ul>
                                <h1>
                                    用户近三周则找你盖章
                                </h1>
                            </footer>
                            <!-- END  FOOTER -->
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="panel">
                        <div class="panel-body">
                            <div class="bio-chart">
                                <input class="knob" data-width="100" data-height="100" data-displayPrevious=true data-thickness=".2" value="78" data-fgColor="#f9a3a3" data-bgColor="#e8e8e8">
                                <h4 class="red">
                                    Profit
                                </h4>
                            </div>
                            <div class="bio-chart">
                                <input class="knob" data-width="100" data-height="100" data-displayPrevious=true data-thickness=".2" value="63" data-fgColor="#fcce54" data-bgColor="#e8e8e8">
                                <h4 class="yellow">
                                    Expansion
                                </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
            <!-- END ROW  -->
        </section>
        <!-- END WRAPPER  -->
    </section>
    <!-- END MAIN CONTENT -->
    <!-- BEGIN FOOTER -->
    <footer class="site-footer">
        <div class="text-center">
            2019 &copy; Strelitzia
            <a href="" target="_blank">关于我们
            </a>.
            <a href="#" class="go-top">
                <i class="fa fa-angle-up">
                </i>
            </a>
        </div>
    </footer>
    <!-- END  FOOTER -->
</section>
<!-- END SECTION -->
<!-- BEGIN JS -->
<script src="js/jquery-1.8.3.min.js" ></script><!-- BASIC JQUERY 1.8.3 LIB. JS -->
<script src="js/bootstrap.min.js" ></script><!-- BOOTSTRAP JS -->
<script src="js/jquery.dcjqaccordion.2.7.js"></script><!-- ACCORDIN JS -->
<script src="js/jquery.scrollTo.min.js" ></script><!-- SCROLLTO JS -->
<script src="js/jquery.nicescroll.js" ></script><!-- NICESCROLL JS -->
<script src="js/respond.min.js" ></script><!-- RESPOND JS -->
<script src="js/jquery.sparkline.js"></script><!-- SPARKLINE JS -->
<script src="js/sparkline-chart.js"></script><!-- SPARKLINE CHART JS -->
<script src="js/common-scripts.js"></script><!-- BASIC COMMON JS -->
<script src="js/count.js"></script><!-- COUNT JS -->
<!--Morris-->
<script src="assets/morris.js-0.4.3/morris.min.js" ></script><!-- MORRIS JS -->
<script src="assets/morris.js-0.4.3/raphael-min.js" ></script><!-- MORRIS  JS -->
<script src="js/chart.js" ></script><!-- CHART JS -->

<!--Calendar-->
<script src="js/calendar/clndr.js"></script><!-- CALENDER JS -->
<script src="js/calendar/evnt.calendar.init.js"></script><!-- CALENDER EVENT JS -->
<script src="js/calendar/moment-2.2.1.js"></script><!-- CALENDER MOMENT JS -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script><!-- UNDERSCORE JS -->
<script src="assets/jquery-knob/js/jquery.knob.js" ></script><!-- JQUERY KNOB JS -->
<script >
    //knob
    $(".knob").knob();

</script>


<script>
    //饼图
    var pieDatas = {
        title: "一周销售额报表",
        defalutIndex:0,
        type:"pie",//pie、circle
        data: [{ title: "周一", num:35600 }, { title: "周二", num:45600 }, { title: "周三", num:38000 }, { title: "周四", num: 46000}, { title: "周五", num:39000 }, { title: "周六", num:54020 }, { title: "周日", num:67000 },] ,
        callback:function(i){
            console.log(i);
        }
    }
    new pieChart("circleChart", {...pieDatas,type:"circle"});
</script>
<!-- END JS -->
</body>
</html>



