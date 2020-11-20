<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- BEGIN META -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="Custom Theme">
	<!-- END META -->

	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.1/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.1/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="css/taotao.css" />
	<script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<!-- BEGIN SHORTCUT ICON -->
	<link rel="shortcut icon" href="img/favicon.ico">
	<!-- END SHORTCUT ICON -->
	<title>网站内容管理</title>

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
<div class="easyui-panel" title="Nested Panel" data-options="width:'100%',minHeight:500,noheader:true,border:false" style="padding:10px;">
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',split:false" style="width:250px;padding:5px">
            <ul id="contentCategoryTree" class="easyui-tree" data-options="url:'/content/category/list',animate: true,method : 'GET'">
            </ul>
        </div>
        <div data-options="region:'center'" style="padding:5px">
            <table class="easyui-datagrid" id="contentList" data-options="toolbar:contentListToolbar,singleSelect:false,collapsible:true,pagination:true,method:'get',pageSize:20,url:'/content/query/list',queryParams:{categoryId:0}">
		    <thead>
		        <tr>
		            <th data-options="field:'id',width:30">ID</th>
		            <th data-options="field:'title',width:120">内容标题</th>
		            <th data-options="field:'subTitle',width:100">内容子标题</th>
		            <th data-options="field:'titleDesc',width:120">内容描述</th>
		            <th data-options="field:'url',width:60,align:'center',formatter:TAOTAO.formatUrl">内容连接</th>
		            <th data-options="field:'pic',width:50,align:'center',formatter:TAOTAO.formatUrl">图片</th>
		            <th data-options="field:'pic2',width:50,align:'center',formatter:TAOTAO.formatUrl">图片2</th>
		            <th data-options="field:'created',width:130,align:'center',formatter:TAOTAO.formatDateTime">创建日期</th>
		            <th data-options="field:'updated',width:130,align:'center',formatter:TAOTAO.formatDateTime">更新日期</th>
		        </tr>
		    </thead>
		</table>
        </div>
    </div>
</div>
<script type="text/javascript">
$(function(){
	var tree = $("#contentCategoryTree");
	var datagrid = $("#contentList");
	tree.tree({
		onClick : function(node){
			if(tree.tree("isLeaf",node.target)){
				datagrid.datagrid('reload', {
					categoryId :node.id
		        });
			}
		}
	});
});
var contentListToolbar = [{
    text:'新增',
    iconCls:'icon-add',
    handler:function(){
    	var node = $("#contentCategoryTree").tree("getSelected");
    	if(!node || !$("#contentCategoryTree").tree("isLeaf",node.target)){
    		$.messager.alert('提示','新增内容必须选择一个内容分类!');
    		return ;
    	}
    	TT.createWindow({
			url : "/content-add"
		}); 
    }
},{
    text:'编辑',
    iconCls:'icon-edit',
    handler:function(){
    	var ids = TT.getSelectionsIds("#contentList");
    	if(ids.length == 0){
    		$.messager.alert('提示','必须选择一个内容才能编辑!');
    		return ;
    	}
    	if(ids.indexOf(',') > 0){
    		$.messager.alert('提示','只能选择一个内容!');
    		return ;
    	}
		TT.createWindow({
			url : "/content-edit",
			onLoad : function(){
				var data = $("#contentList").datagrid("getSelections")[0];
				$("#contentEditForm").form("load",data);
				
				// 实现图片
				if(data.pic){
					$("#contentEditForm [name=pic]").after("<a href='"+data.pic+"' target='_blank'><img src='"+data.pic+"' width='80' height='50'/></a>");	
				}
				if(data.pic2){
					$("#contentEditForm [name=pic2]").after("<a href='"+data.pic2+"' target='_blank'><img src='"+data.pic2+"' width='80' height='50'/></a>");					
				}
				
				contentEditEditor.html(data.content);
			}
		});    	
    }
},{
    text:'删除',
    iconCls:'icon-cancel',
    handler:function(){
    	var ids = TT.getSelectionsIds("#contentList");
    	if(ids.length == 0){
    		$.messager.alert('提示','未选中商品!');
    		return ;
    	}
    	$.messager.confirm('确认','确定删除ID为 '+ids+' 的内容吗？',function(r){
    	    if (r){
    	    	var params = {"ids":ids};
            	$.post("/content/delete",params, function(data){
        			if(data.status == 200){
        				$.messager.alert('提示','删除内容成功!',undefined,function(){
        					$("#contentList").datagrid("reload");
        				});
        			}
        		});
    	    }
    	});
    }
}];
</script>


</section>
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
<!-- END JS -->


</body>
</html>