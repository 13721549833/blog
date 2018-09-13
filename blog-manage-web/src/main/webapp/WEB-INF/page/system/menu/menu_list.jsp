<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/static/jsp/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>菜单管理</title>
  <link rel="shortcut icon" href="${ctx}/static/src/images/favicon.ico">
  <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css" media="all" />
  <link rel="stylesheet" href="${ctx}/static/plugins/font-awesome/css/font-awesome.min.css" media="all" />
  <link rel="stylesheet" href="${ctx}/static/src/css/app.css" media="all" />
  <link rel="stylesheet" href="${ctx}/static/src/css/themes/default.css" media="all" id="skin" kit-skin />
  <style type="text/css">
  	.search{border: 1px solid gainsboro;background:ghostwhite;border-radius:5px;padding-top:11px;width:98%;margin-left:1%;}
    #query,#refresh{margin-left:30px;width: 100px;}
	.layui-search{position: relative;top: -28px;}
    .layui-form-item{display:inline-block;}
    .layui-form-label{float:left;display:block;padding:6px 10px;line-height:20px;}
    .layui-input{height:30px;}
    .layui-btn-sm{height:30px;line-height:30px;padding:0 25px;font-size:16px;}
    .layui-btn-other{padding-left:30px;}
    .layui-field-box{padding:10px 13px;}
    .layui-form-item .layui-input-inline{width:180px;} 
    .layui-input-add,.layui-input-refresh{width:135px;}
  </style>
</head>
<body>
  <!--查询条件 开始-->
  <form class="layui-form search">
  	<div class="layui-form-item">
		<label class="layui-form-label">菜单名称:</label>
		<div class="layui-input-inline">
			<input type="text" id="name" name="name" lay-verify="name" placeholder="请输入菜单名称" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">菜单类型：</label>
		<div class="layui-input-inline">
			<select name="type" id="type" lay-verify="type">
				<option value="1" selected="selected">一级菜单</option>
				<option value="2">二级菜单</option>
			</select>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">菜单状态:</label>
		<div class="layui-input-inline">
			<select name="status" id="status" lay-verify="status">
				<option value="1" selected="selected">启用</option>
				<option value="0">禁用</option>
			</select>
		</div>
	</div>
	
	<div class="layui-form-item layui-search">
		<button id="query" lay-submit class="layui-btn layui-btn-sm layui-btn-normal" lay-filter="query"><i class="layui-icon">&#xe615;</i>查询</button>
		<button id="refresh" class="layui-btn layui-btn-normal  layui-btn-sm"><i class="layui-icon">&#xe63d;</i>刷新</button>
	</div>
	
	<div class="layui-btn-other">	
		<div class="layui-form-item">
			<shiro:hasPermission name="menu:add">
				<div class="layui-input-add">
					<a class="layui-btn  layui-btn-sm" style="background: #5FB878;"><i class="layui-icon">&#xe654;</i>新增</a>
				</div>
			</shiro:hasPermission>
		</div> 
		<div class="layui-form-item">
			<shiro:hasPermission name="menu:add">
				<div class="layui-input-refresh">
					<a id="batchDelete" class="layui-btn layui-btn-danger  layui-btn-sm"><i class="layui-icon">&#xe640;</i>批量删除</a>
				</div>
			</shiro:hasPermission>
		</div> 
	</div>
  </form>
  <div class="admin-main">
	<div class="layui-field-box layui-form">
		<table id="menu-lt" lay-filter="menu" class="layui-hide layui-table">

		</table>
	</div>
  </div>
</body> 
  <script src="${ctx}/static/plugins/layui/layui.js"></script>
  
  <script type="text/html" id="menuType">
  	 {{ d.type==1 ? '一级菜单' : '二级菜单' }}
  </script>
  <script type="text/html" id="menuStatus">
	 <!-- 这里的 checked 的状态只是演示 -->
	 <input disable type="checkbox" name="lock" value="{{d.status}}" title="启用" lay-filter="lockDemo" {{ d.status==1 ? 'checked' : '' }}>
  </script>

  <script type="text/html" id="menuOper">
	 {{#<shiro:hasPermission name="menu:edit">}}
	 	<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon">&#xe642;</i>修改</a>
	 {{#</shiro:hasPermission>}}
	 {{#<shiro:hasPermission name="menu:delete">}}	 
	 <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</a>
	 {{#</shiro:hasPermission>}}
  </script>
  <script>
        layui.use(['table','layer','form'], function() {
            var table = layui.table;
            var layer = layui.layer;
            var form = layui.form;
            var $ = layui.$;
            var tableOptions = {
            	elem:'#menu-lt',
            	width:'full',
            	url:'${ctx}/menu/menus.do',
            	method:'post',
            	request:{
            		pageName:'page',
            		limitName:'limit',
            		limit:'10'
            	},
            	where:{},
            	limits:[10,20,30,40],
            	response:{
            		statusName:'code',
            		statusCode:1,
            		msgName:'msg',
            		countName: 'count', //数据总数的字段名称，默认：count
            		dataName:'data'
            	},
            	page:true,
            	cols:[
            		[
						{
							field:'',
							title:'',
							type:'checkbox',
							align:'center',
							width:40,
						},
            			{
            				field:'name',
            				title:'菜单名称',
            				align:'center',
            				width:120,
            			},
            			{
            				field:'type',
            				title:'类型',
            				align:'center',
            				width:140,
            				templet:'#menuType'
            			},
            			{
            				field:'url',
            				title:'资源地址',
            				align:'center',
            				width:160,
            			},
            			{
            				field:'status',
            				title:'状态',
            				align:'center',
            				width:178,
            				templet: '#menuStatus'
            			},
            			{
            				field:'icon',
            				title:'图标',
            				align:'center',
            				width:150,
            			},
            			{
            				field:'createTime',
            				title:'创建日期',
            				align:'center',
            				width:180,
            			},
            			{
            				field:'oper',
            				title:'操作',
            				align:'center',
            				width: 300,
            				minWidth: 240,
            				toolbar:'#menuOper'
            			}
            		]
            	]
            };
            
            table.render(tableOptions);
            
            /**
			 * 刷新菜单列表
			 */
			$('#refresh').on('click', function() {
				table.render(tableOptions);
			});
            
			/**
			 * 根据条件查询菜单信息
			 */
            form.on('submit(query)', function(data) {
            	var name = data.field.name;
            	var type = data.field.type;
            	var status = data.field.status;
            	tableOptions.where = {name:name,type:type,status:status};
            	table.render(tableOptions);
            	return false;
            })
        });
    </script>
</html>