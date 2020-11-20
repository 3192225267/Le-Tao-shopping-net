<%--
  Created by IntelliJ IDEA.
  User: 刘振河
  Date: 2020/1/10
  Time: 4:48
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
    <title>管理商品规格参数</title>
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




        <!-- START USER LOGIN DROPDOWN  -->

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
        <section class="wrapper site-min-height">
            <section class="panel">
                <header class="panel-heading">
                    <span class="label label-primary">规格参数</span>
                    <span class="tools pull-right">
                     <a href="javascript:;" class="fa fa-chevron-down"></a>
                     <a href="javascript:;" class="fa fa-times"></a>
                     </span>
                </header>
                <div class="panel-body">


                    <table class="easyui-datagrid" id="itemParamList" title="商品列表"
                           data-options="singleSelect:false,collapsible:true,pagination:true,url:'/item/param/list',method:'get',pageSize:30,toolbar:itemParamListToolbar">
                        <thead>
                        <tr>
                            <th data-options="field:'ck',checkbox:true"></th>
                            <th data-options="field:'id',width:60">ID</th>
                            <th data-options="field:'itemCatId',width:80">商品类目ID</th>
                            <th data-options="field:'itemCatName',width:100">商品类目</th>
                            <th data-options="field:'paramData',width:300,formatter:formatItemParamData">规格(只显示分组名称)</th>
                            <th data-options="field:'created',width:130,align:'center',formatter:TAOTAO.formatDateTime">创建日期</th>
                            <th data-options="field:'updated',width:130,align:'center',formatter:TAOTAO.formatDateTime">更新日期</th>
                        </tr>
                        </thead>
                    </table>
                    <div id="itemEditWindow" class="easyui-window" title="编辑商品" data-options="modal:true,closed:true,iconCls:'icon-save',href:'/item-edit'" style="width:80%;height:80%;padding:10px;">
                    </div>
                </div>
                </div>
            </section>
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
        </div>
    </footer>
    <!-- END FOOTER -->
</section>
<!-- END SECTION -->


<script>

    function formatItemParamData(value , index){
        var json = JSON.parse(value);
        var array = [];
        $.each(json,function(i,e){
            array.push(e.group);
        });
        return array.join(",");
    }

    function getSelectionsIds(){
        var itemList = $("#itemParamList");
        var sels = itemList.datagrid("getSelections");
        var ids = [];
        for(var i in sels){
            ids.push(sels[i].id);
        }
        ids = ids.join(",");
        return ids;
    }

    var itemParamListToolbar = [{
        text:'新增',
        iconCls:'icon-add',
        handler:function(){
            TAOTAO.createWindow({
                url : "/item-param-add",
            });
        }
    },{
        text:'编辑',
        iconCls:'icon-edit',
        handler:function(){
            $.messager.alert('提示','该功能未实现!');
        }
    },{
        text:'删除',
        iconCls:'icon-cancel',
        handler:function(){
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','未选中商品规格!');
                return ;
            }
            $.messager.confirm('确认','确定删除ID为 '+ids+' 的商品规格吗？',function(r){
                if (r){
                    var params = {"ids":ids};
                    $.post("/item/param/delete",params, function(data){
                        if(data.status == 200){
                            $.messager.alert('提示','删除商品规格成功!',undefined,function(){
                                $("#itemParamList").datagrid("reload");
                            });
                        }
                    });
                }
            });
        }
    }];
</script>


<script src="js/jquery.js" ></script><!-- BASIC JS LIABRARY -->
<script src="js/bootstrap.min.js" ></script><!-- BOOTSTRAP JS  -->
<script src="js/jquery.dcjqaccordion.2.7.js"></script><!-- ACCORDING JS -->
<script src="js/jquery.scrollTo.min.js" ></script><!-- SCROLLTO JS  -->
<script src="js/jquery.nicescroll.js" > </script><!-- NICESCROLL JS  -->
<script src="js/respond.min.js" ></script><!-- RESPOND JS  -->
<script src="js/common-scripts.js" ></script><!-- BASIC COMMON JS  -->

<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.1/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.1/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="css/taotao.css" />
<script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<!-- END JS -->
</body>
</html>



