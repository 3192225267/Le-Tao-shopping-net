<%--
  Created by IntelliJ IDEA.
  User: 刘振河
  Date: 2020/1/9
  Time: 16:33
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
                    <a href="index.html">
                        <i class="fa fa-dashboard"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-laptop"></i>
                        <span>Layouts</span>
                        <span class="label label-success span-sidebar">4</span>
                    </a>
                    <ul class="sub">
                        <li><a href="boxed_page.html">Boxed Page</a></li>
                        <li><a href="horizontal_menu.html">Horizontal Menubar</a></li>
                        <li><a href="language_switch_bar.html">Language Bar</a></li>
                        <li><a href="email_template.html" target="_blank">Email Templates</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>UI Elements</span>
                        <span class="label label-info span-sidebar">7</span>
                    </a>
                    <ul class="sub">
                        <li><a href="general.html">General</a></li>
                        <li><a href="buttons.html">Buttons</a></li>
                        <li><a href="widget.html">Widget</a></li>
                        <li><a href="slider.html">Range Slider</a></li>
                        <li><a href="nestable.html">Nestable List</a></li>
                        <li><a href="tree.html">Tree View List</a></li>
                        <li><a href="font_awesome.html">Font Awesome Icon</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-cogs"></i>
                        <span>Components</span>
                        <span class="label label-primary span-sidebar">5</span>
                    </a>
                    <ul class="sub">
                        <li><a href="grids.html">Grids</a></li>
                        <li><a href="calendar.html">Calendar</a></li>
                        <li><a href="gallery.html">Gallery</a></li>
                        <li><a href="todo_list.html">Todo List</a></li>
                        <li><a href="draggable_portlet.html">Draggable Portlets</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-tasks"></i>
                        <span>Form Stuff</span>
                        <span class="label label-info span-sidebar">7</span>
                    </a>
                    <ul class="sub">
                        <li><a href="form_component.html">Form Components</a></li>
                        <li><a href="advanced_form_components.html">Advanced Components</a></li>
                        <li><a href="form_wizard.html">Form Wizards</a></li>
                        <li><a href="form_validation.html">Form Validation</a></li>
                        <li><a href="dropzone.html">Dropzone File Upload</a></li>
                        <li><a href="inline_editor.html">Inline Editor</a></li>

                        <li><a href="file_upload.html">Multiple File Upload</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-th"></i>
                        <span>Data Tables</span>
                        <span class="label label-inverse span-sidebar">5</span>
                    </a>
                    <ul class="sub">
                        <li><a href="basic_table.html">Basic Table</a></li>
                        <li><a href="responsive_table.html">Responsive Table</a></li>
                        <li><a href="dynamic_table.html">Dynamic Table</a></li>
                        <li><a href="advanced_table.html">Advanced Table</a></li>
                        <li><a href="editable_table.html">Editable Table</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class=" fa fa-envelope"></i>
                        <span>Mail</span>
                        <span class="label label-danger span-sidebar">2</span>
                    </a>
                    <ul class="sub">
                        <li><a href="inbox.html">Inbox</a></li>
                        <li><a href="inbox_details.html">Mail Details</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class=" fa fa-bar-chart-o"></i>
                        <span>Charts</span>
                        <span class="label label-warning span-sidebar">4</span>
                    </a>
                    <ul class="sub">
                        <li><a href="morris.html">Morris Chart</a></li>
                        <li><a href="chartjs.html">Chartjs Chart</a></li>
                        <li><a href="flot_chart.html">Flot Charts</a></li>
                        <li><a href="xchart.html">xChart</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-shopping-cart"></i>
                        <span>Product</span>
                        <span class="label label-success span-sidebar">2</span>
                    </a>
                    <ul class="sub">
                        <li><a href="product_list.html">List View</a></li>
                        <li><a href="product_details.html">Details View</a></li>
                    </ul>
                </li>
                <li>
                    <a href="google_maps.html">
                        <i class="fa fa-map-marker"></i>
                        <span>Google Maps </span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;" class="active">
                        <i class="fa fa-glass"></i>
                        <span>Extra Pages</span>
                        <span class="label label-primary span-sidebar">10</span>
                    </a>
                    <ul class="sub">
                        <li class="active"><a href="blank.html">Blank Page</a></li>
                        <li><a href="lock_screen.html">Lock Screen</a></li>
                        <li><a href="profile.html">Profile</a></li>
                        <li><a href="invoice.html">Invoice</a></li>
                        <li><a href="search_result.html">Search Result</a></li>
                        <li><a href="pricing_table.html">Pricing Table</a></li>
                        <li><a href="faq.html">FAQ</a></li>
                        <li ><a href="fb_wall.html">Timeline</a></li>
                        <li><a href="404.html">404 Error</a></li>
                        <li><a href="500.html">500 Error</a></li>
                    </ul>
                </li>
                <li>
                    <a href="login.html">
                        <i class="fa fa-user"></i>
                        <span>Login Page</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-sitemap"></i>
                        <span>Multi level Menu</span>
                    </a>
                    <ul class="sub">
                        <li><a href="javascript:;">Menu Item 1</a></li>
                        <li class="sub-menu">
                            <a href="boxed_page.html">Menu Item 2 <span class="label label-primary">1</span></a>
                            <ul class="sub">
                                <li><a href="javascript:;"> Item 2.1</a></li>
                                <li class="sub-menu">
                                    <a href="javascript:;">Menu Item 3 <span class="label label-primary">3</span></a>
                                    <ul class="sub">
                                        <li><a href="javascript:;">Item 3.1</a></li>
                                        <li><a href="javascript:;">Item 3.2</a></li>
                                        <li><a href="javascript:;">Item 3.2</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>

            </ul>

        </div>

    </aside>
    <!-- END SIDEBAR -->
    <!-- BEGIN MAIN CONTENT -->
    <section id="main-content">
        <section class="wrapper site-min-height">
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <span class="label label-primary">新增商品</span>
                            <span class="tools pull-right">
                           <a href="javascript:;" class="fa fa-chevron-down"></a>
                           <a href="javascript:;" class="fa fa-times"></a>
                           </span>
                        </header>
                        <div class="panel-body">

                            <%--表单--%>
                            <form class="form-horizontal tasi-form" id="itemAddForm"  method="post">
                                <td>商品类目:</td>
                                <td>
                                    <a href="javascript:void(0)" class="easyui-linkbutton selectItemCat">选择类目</a>
                                    <input type="hidden" name="cid" style="width: 280px;"></input>
                                </td>

                                <div class="form-group">

                                    <label class="col-sm-2 col-sm-2 control-label">商品标题</label>
                                    <div class="col-sm-10">
                                        <%--<input type="text" class="form-control">--%>
                                        <input class="form-control" type="text" name="title" data-options="required:true"></input>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">商品卖点</label>
                                    <div class="col-sm-10">
                                       <%-- <input type="text" class="form-control">--%>
                                        <input class="form-control" name="sellPoint" data-options="multiline:true,validType:'length[0,150]'" ></input>
                                        <%--<span class="help-block">A block of help text that breaks onto a new line and may extend beyond one line.</span>--%>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">商品价格</label>
                                    <div class="col-sm-10">
                                        <%--<input type="text" >--%>
                                        <input class="form-control round-input" type="text" name="priceView" data-options="min:1,max:99999999,precision:2,required:true" />
                                            <input type="hidden" name="price"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">库存数量</label>
                                    <div class="col-sm-10">
                                        <%--<input class="form-control" id="focusedInput" type="text" value="This is focused...">--%>
                                        <input class="form-control" type="text" name="num" data-options="min:1,max:99999999,precision:0,required:true" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">条形码</label>
                                    <div class="col-sm-10">
                                        <%--<input class="form-control" id="disabledInput" type="text" placeholder="Disabled input here..." disabled>--%>
                                        <input class="form-control" type="text" name="barcode" data-options="validType:'length[1,30]'" />
                                    </div>
                                </div>
                                <%--<div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Placeholder</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" placeholder="placeholder">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Password</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" placeholder="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-2 col-sm-2 control-label">Static control</label>
                                    <div class="col-lg-10">
                                        <p class="form-control-static">pruthvi.bardolia@tripzmate.com</p>
                                    </div>
                                </div>--%>
                                <button type="button" class="btn btn-shadow btn-primary">
                                    提交
                                </button>
                                <button type="button" class="btn btn-shadow btn-warning">
                                    重置
                                </button>
                            </form>
                        </div>
                    </section>
                </div>
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


<script type="text/javascript">
    var itemAddEditor ;
    //页面初始化完毕后执行此方法
    $(function(){
        //创建富文本编辑器
        itemAddEditor = TAOTAO.createEditor("#itemAddForm [name=desc]");
        //初始化类目选择和图片上传器
        TAOTAO.init({fun:function(node){
                //根据商品的分类id取商品 的规格模板，生成规格信息。第四天内容。
                TAOTAO.changeItemParam(node, "itemAddForm");
            }});
    });
    //提交表单
    function submitForm(){
        //有效性验证
        if(!$('#itemAddForm').form('validate')){
            $.messager.alert('提示','表单还未填写完成!');
            return ;
        }
        //取商品价格，单位为“分”
        $("#itemAddForm [name=price]").val(eval($("#itemAddForm [name=priceView]").val()) * 100);
        //同步文本框中的商品描述
        itemAddEditor.sync();
        //取商品的规格
        /**/
        var paramJson = [];
        $("#itemAddForm .params li").each(function(i,e){
            var trs = $(e).find("tr");
            var group = trs.eq(0).text();
            var ps = [];
            for(var i = 1;i<trs.length;i++){
                var tr = trs.eq(i);
                ps.push({
                    "k" : $.trim(tr.find("td").eq(0).find("span").text()),
                    "v" : $.trim(tr.find("input").val())
                });
            }
            paramJson.push({
                "group" : group,
                "params": ps
            });
        });
        //把json对象转换成字符串
        paramJson = JSON.stringify(paramJson);
        $("#itemAddForm [name=itemParams]").val(paramJson);

        //ajax的post方式提交表单
        //$("#itemAddForm").serialize()将表单序列号为key-value形式的字符串
        $.post("/item/save",$("#itemAddForm").serialize(), function(data){
            if(data.status == 200){
                $.messager.alert('提示','新增商品成功!');
            }
        });
    }

    function clearForm(){
        $('#itemAddForm').form('reset');
        itemAddEditor.html('');
    }
</script>
<!-- BEGIN JS -->
<script src="js/jquery.js" ></script><!-- BASIC JS LIABRARY -->
<script src="js/bootstrap.min.js" ></script><!-- BOOTSTRAP JS  -->
<script src="js/jquery.dcjqaccordion.2.7.js"></script><!-- ACCORDING JS -->
<script src="js/jquery.scrollTo.min.js" ></script><!-- SCROLLTO JS  -->
<script src="js/jquery.nicescroll.js" > </script><!-- NICESCROLL JS  -->
<script src="js/respond.min.js" ></script><!-- RESPOND JS  -->
<script src="js/common-scripts.js" ></script><!-- BASIC COMMON JS  -->
<!-- END JS -->
</body>
</html>


