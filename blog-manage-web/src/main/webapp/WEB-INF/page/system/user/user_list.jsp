<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/static/jsp/taglibs.jsp"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>用户管理</title>
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
			<label class="layui-form-label">用户名称:</label>
			<div class="layui-input-inline">
				<input type="text" id="username" name="username" lay-verify="username" placeholder="请输入用户名称" autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">手机号：</label>
			<div class="layui-input-inline">
				<input type="text" id="mobile" name="mobile" placeholder="请输入手机号" autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">用户状态:</label>
			<div class="layui-input-inline">
				<select id="status" name="status" lay-verify="status">
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
				<shiro:hasPermission name="user:add">
					<div class="layui-input-add">
						<a href="${ctx}/user/addUser.do" class="layui-btn  layui-btn-sm" style="background: #5FB878;"><i class="layui-icon">&#xe654;</i>新增</a>
					</div>
				</shiro:hasPermission>
			</div> 
		</div>
	</form>
	<div class="admin-main">
		<div class="layui-field-box layui-form">
			<table id="user-lt" lay-filter="user" class="layui-hide layui-table">
	
			</table>
		</div>
	</div>
	
	<script type="text/html" id="userType">
  	 {{ d.userType==0 ? '超级管理员' :(d.userType==1 ? '管理员' : '普通用户')}}
    </script>
	
	<!-- 菜单状态模板 -->
	<script type="text/html" id="userState-tpl">
		<!-- 这里的 checked 的状态只是演示 -->
		<input type="checkbox" name="lock" value="{{d.status}}" title="启用" lay-filter="lockDemo" {{ d.status==1 ? 'checked' : '' }}>
	</script>

	<script type="text/html" id="userOper">
		{{#<shiro:hasPermission name="user:edit">}}
			<a href="${ctx}/user/modifyUser.do?userId={{d.id}}" class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon">&#xe642;</i>修改</a>
		{{#</shiro:hasPermission>}}	    
		{{#<shiro:hasPermission name="user:add">}}
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</a>
		{{#</shiro:hasPermission>}}
	</script>
	<script src="${ctx}/static/plugins/layui/layui.js"></script>
	<script type="text/javascript">
	  	var ctx = '${ctx}';
	</script>
	<script>
		layui.use(['table','layer','form'], function() {
			var table = layui.table;
            var layer = layui.layer;
            var form = layui.form;
            var $ = layui.$;
            var tableOptions = {
           		elem:'#user-lt',
               	width:'full',
               	url:'${ctx}/user/users.do',
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
							field:'username',
							title:'用户名',
							align:'center',
							width: 140,
							minWidth: 120,
						},
						{
							field:'nickname',
							title:'昵称',
							align:'center',
							width: 120,
						},
						{
							field:'mobile',
							title:'手机号',
							align:'center',
							width: 140,
							minWidth: 80,
						},
						{
							field:'email',
							title:'邮箱',
							align:'center',
							width: 180,
							minWidth: 120,
						},
						{
							field:'qq',
							title:'qq号',
							align:'center',
							width: 120,
							minWidth: 80,
						},
						{
							field:'status',
							title:'是否启用',
							align:'center',
							width: 160,
							minWidth: 120,
							templet: '#userState-tpl'
						},
						{
							field:'createTime',
							title: '创建日期',
							align:'center',
							width: 180,
							minWidth: 120,
						},
						{
							field:'userOper',
							title: '用户操作',
							align:'center',
							width: 300,
							minWidth: 240,
							align: 'center',
							toolbar: '#userOper'
						}
               	    ]
               	]
            };
            
          	//渲染表格
			table.render(tableOptions);
          	
			/**
			 * 刷新用户列表
			 */
			$('#refresh').on('click', function() {
				table.render(tableOptions);
			});
			
			//根据条件查询用户信息
			form.on('submit(query)', function(data) {
				var username = data.field.username;
            	var mobile = data.field.mobile;
            	var status = data.field.status;
            	tableOptions.where = {username:username,mobile:mobile,status:status};
				table.render(tableOptions);
				//阻止表单跳转。如果需要表单跳转，去掉这段即可。
				return false;
			});
			
			table.on('tool(user)', function(data) {
				// 删除
				if(data.event === 'del') {
					layer.confirm('确认要删除吗？', function(index) {
						// 执行网络请求
						var index = layer.load(2);
						$.ajax({
							url: ctx + '/user/delUser.do',
							type:'POST',
							data : {userId:data.data.id},
							success : function(data){
								if(data.code=='1'){
									layer.close(index);
									layer.msg(data.msg, {
										time: 2000 //2秒关闭（如果不配置，默认是3秒）
									}, function() {
										// 删除成功跳转到用户列表
										window.location.href = ctx+ '/user/userList.do';
									});
								}else{
									layer.close(index);
									layer.msg(data.msg);
								}
							},
							error : function(data){
								layer.msg(data.msg);
							}
						});
					});
				}
			});
		})
	</script>
</body>
</html>