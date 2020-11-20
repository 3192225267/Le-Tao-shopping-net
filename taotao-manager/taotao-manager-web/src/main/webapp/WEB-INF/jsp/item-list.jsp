<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>查询商品</title>
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
        <!-- START HEADER  NAV -->


    </header>

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

    <section id="main-content">
        <!-- BEGIN WRAPPER  -->
        <section class="wrapper site-min-height">
            <section class="panel">
                <header class="panel-heading">
                    <span class="label label-primary">商品列表</span>
                    <span class="tools pull-right">
                     <a href="javascript:;" class="fa fa-chevron-down"></a>
                     <a href="javascript:;" class="fa fa-times"></a>
                     </span>
                </header>
                <div class="panel-body">
                    <table class="easyui-datagrid" id="itemList" title="商品列表"
                           data-options="singleSelect:false,collapsible:true,pagination:true,url:'/item/list',method:'get',pageSize:10,toolbar:toolbar">
                        <thead>
                        <tr>
                            <th data-options="field:'ck',checkbox:true"></th>
                            <th data-options="field:'id',width:60">商品ID</th>
                            <th data-options="field:'title',width:200">商品标题</th>
                            <th data-options="field:'cid',width:100">叶子类目</th>
                            <th data-options="field:'sellPoint',width:100">卖点</th>
                            <th data-options="field:'price',width:70,align:'right',formatter:TAOTAO.formatPrice">价格</th>
                            <th data-options="field:'num',width:70,align:'right'">库存数量</th>
                            <th data-options="field:'barcode',width:100">条形码</th>
                            <th data-options="field:'status',width:60,align:'center',formatter:TAOTAO.formatItemStatus">状态</th>
                            <th data-options="field:'created',width:130,align:'center',formatter:TAOTAO.formatDateTime">创建日期</th>
                            <th data-options="field:'updated',width:130,align:'center',formatter:TAOTAO.formatDateTime">更新日期</th>
                        </tr>
                        </thead>
                    </table>
                    <div id="itemEditWindow" class="easyui-window" title="编辑商品" data-options="modal:true,closed:true,iconCls:'icon-save',href:'item-edit'" style="width:80%;height:80%;padding:10px;">
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





















<script>

    function getSelectionsIds(){
        var itemList = $("#itemList");
        var sels = itemList.datagrid("getSelections");
        var ids = [];
        for(var i in sels){
            ids.push(sels[i].id);
        }
        ids = ids.join(",");
        return ids;
    }

    var toolbar = [{
        text:'新增',
        iconCls:'icon-add',
        handler:function(){
            location.href="itemadd";
        }
    },{
        text:'编辑',
        iconCls:'icon-edit',
        handler:function(){
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','必须选择一个商品才能编辑!');
                return ;
            }
            if(ids.indexOf(',') > 0){
                $.messager.alert('提示','只能选择一个商品!');
                return ;
            }

            $("#itemEditWindow").window({

                onLoad :function(){
                    //回显数据
                    var data = $("#itemList").datagrid("getSelections")[0];
                    data.priceView = TAOTAO.formatPrice(data.price);
                    $("#itemeEditForm").form("load",data);

                    // 加载商品描述
                    $.getJSON('/item/query/item/desc/'+data.id,function(_data){
                        if(_data.status == 200){
                            //UM.getEditor('itemeEditDescEditor').setContent(_data.data.itemDesc, false);
                            itemEditEditor.html(_data.data.itemDesc);
                        }
                    });

                    //加载商品规格
                    $.getJSON('/rest/item/param/item/query/'+data.id,function(_data){
                        if(_data && _data.status == 200 && _data.data && _data.data.paramData){
                            $("#itemeEditForm .params").show();
                            $("#itemeEditForm [name=itemParams]").val(_data.data.paramData);
                            $("#itemeEditForm [name=itemParamId]").val(_data.data.id);

                            //回显商品规格
                            var paramData = JSON.parse(_data.data.paramData);

                            var html = "<ul>";
                            for(var i in paramData){
                                var pd = paramData[i];
                                html+="<li><table>";
                                html+="<tr><td colspan=\"2\" class=\"group\">"+pd.group+"</td></tr>";

                                for(var j in pd.params){
                                    var ps = pd.params[j];
                                    html+="<tr><td class=\"param\"><span>"+ps.k+"</span>: </td><td><input autocomplete=\"off\" type=\"text\" value='"+ps.v+"'/></td></tr>";
                                }

                                html+="</li></table>";
                            }
                            html+= "</ul>";
                            $("#itemeEditForm .params td").eq(1).html(html);
                        }
                    });

                    TAOTAO.init({
                        "pics" : data.image,
                        "cid" : data.cid,
                        fun:function(node){
                            TAOTAO.changeItemParam(node, "itemeEditForm");
                        }
                    });
                }
            }).window("open");
        }
    },{
        text:'删除',
        iconCls:'icon-cancel',
        handler:function(){
            var ids = getSelectionsIds();

            if(ids.length == 0){
                $.messager.alert('提示','未选中商品!');
                return ;
            }
            $.messager.confirm('确认','确定删除ID为 '+ids+' 的商品吗？',function(r){
                if (r){
                    var params = {"ids":ids};
                    $.post("/item/delete",params, function(data){
                        if(data.status == 200){
                            $.messager.alert('提示','删除商品成功!',undefined,function(){
                                $("#itemList").datagrid("reload");
                            });
                        }


                    });
                }
            });
        }
    },'-',{
        text:'下架',
        iconCls:'icon-remove',
        handler:function(){
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','未选中商品!');
                return ;
            }
            $.messager.confirm('确认','确定下架ID为 '+ids+' 的商品吗？',function(r){
                if (r){
                    var params = {"ids":ids};
                    $.post("/rest/item/instock",params, function(data){
                        if(data.status == 200){
                            $.messager.alert('提示','下架商品成功!',undefined,function(){
                                $("#itemList").datagrid("reload");
                            });
                        }
                    });
                }
            });
        }
    },{
        text:'上架',
        iconCls:'icon-remove',
        handler:function(){
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','未选中商品!');
                return ;
            }
            $.messager.confirm('确认','确定上架ID为 '+ids+' 的商品吗？',function(r){
                if (r){
                    var params = {"ids":ids};
                    $.post("/rest/item/reshelf",params, function(data){
                        if(data.status == 200){
                            $.messager.alert('提示','上架商品成功!',undefined,function(){
                                $("#itemList").datagrid("reload");
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
<script >
    //knob
    $(".knob").knob();

</script>



<!-- END JS -->
</body>
</html>