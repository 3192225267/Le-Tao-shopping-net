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
	<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
	<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>

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
	<title>新增商品</title>

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



		<!-- END HEADER NAV -->


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
		<section class="wrapper site-min-height">
<div style="padding:10px 10px 10px 10px">
	<form id="itemAddForm" class="itemForm" method="post">
	    <table cellpadding="5">
	        <tr>
	            <td>商品类目:</td>
	            <td>
	            	<a href="javascript:void(0)" class="easyui-linkbutton selectItemCat">选择类目</a>  <error-page>

				</error-page>
	            	<input type="hidden" name="cid" style="width: 280px;"></input>
	            </td>
	        </tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
	        <tr>
	            <td>商品标题:</td>
	            <td><input class="easyui-textbox" type="text" name="title" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
	        <tr>
	            <td>商品卖点:</td>
	            <td><input class="easyui-textbox" name="sellPoint" data-options="multiline:true,validType:'length[0,150]'" style="height:60px;width: 280px;"></input></td>
	        </tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
	        <tr>
	            <td>商品价格:</td>
	            <td><input class="easyui-numberbox" type="text" name="priceView" data-options="min:1,max:99999999,precision:2,required:true" />
	            	<input type="hidden" name="price"/>
	            </td>
	        </tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
	        <tr>
	            <td>库存数量:</td>
	            <td><input class="easyui-numberbox" type="text" name="num" data-options="min:1,max:99999999,precision:0,required:true" /></td>
	        </tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
	        <tr>
	            <td>条形码:</td>
	            <td>
	                <input class="easyui-textbox" type="text" name="barcode" data-options="validType:'length[1,30]'" />
	            </td>
	        </tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
	        <tr>
	            <td>商品图片:</td>
	            <td>
	            	 <a href="javascript:void(0)" class="easyui-linkbutton picFileUpload">上传图片</a>
	                 <input type="hidden" name="image"/>
	            </td>
	        </tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
	        <tr>
	            <td>商品描述:</td>
	            <td>
	                <textarea style="width:800px;height:300px;visibility:hidden;" name="desc"></textarea>
	            </td>
	        </tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
	        <tr class="params
">
	        	<td>商品规格:</td>
	        	<td>

	        	</td>
	        </tr>
	    </table>
	    <input type="hidden" name="itemParams"/>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	</div>
</div>
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
<!-- END JS -->

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
</body>
</html>