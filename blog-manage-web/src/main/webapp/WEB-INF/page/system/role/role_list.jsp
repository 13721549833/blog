<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/static/jsp/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>角色管理</title>
	<link rel="shortcut icon" href="${ctx}/static/src/images/favicon.ico">
	<link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${ctx}/static/plugins/font-awesome/css/font-awesome.min.css" media="all" />
	<link rel="stylesheet" href="${ctx}/static/src/css/app.css" media="all" />
	<link rel="stylesheet" href="${ctx}/static/src/css/themes/default.css" media="all" id="skin" kit-skin />
	<link rel="stylesheet" href="${ctx}/static/plugins/ztree/css/bootstrapStyle/bootstrapStyle.css" media="all" id="skin" kit-skin />
	<style>
		.search{border: 1px solid gainsboro;background:ghostwhite;border-radius:5px;padding-top:11px;width:98%;margin-left:1%;}
		#query,#refresh{margin-left:30px;width: 100px;}
		.layui-search{position: relative;top: -28px;}
    	.layui-form-item{display:inline-block;}
    	.layui-form-label{float:left;display:block;padding:6px 10px;line-height:20px;}
    	.layui-input{height:30px;}
    	.layui-btn-sm{height:30px;line-height:30px;padding:0 10px;font-size:16px;}
   		.layui-btn-other{padding-left:30px;}
    	.layui-form-item .layui-input-inline{width:180px;} 
    	.layui-input-add,.layui-input-refresh{width:135px;}
    	.layui-field-box{padding:10px 13px;}
    	.layui-role-list{padding: 5px 20px 10px 12px;min-height: 360px;overflow-y: auto;}
		.layui-btn-group{width: 100%;text-align: center;padding-bottom: 10px;overflow: hidden;}
		#setting{position:relative;right:56px;}
		#back{position:relative;left:56px;background: #c2c2c2;}
	</style>
</head>
<body>
  <!--查询条件 开始-->
 	<form class="layui-form search">
	  	<div class="layui-form-item">
			<label class="layui-form-label">角色名称:</label>
			<div class="layui-input-inline">
				<input type="text" id="name" name="name" value="${role.name}" lay-verify="name" placeholder="请输入角色名称" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">角色状态:</label>
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
				<shiro:hasPermission name="role:add">
					<div class="layui-input-add">
						<a href="${ctx}/role/addRole.do" class="layui-btn  layui-btn-sm" style="background: #5FB878;"><i class="layui-icon">&#xe654;</i>新增角色</a>
					</div>
				</shiro:hasPermission>
			</div> 
		</div>
  	</form>
	<div class="admin-main">
		<div class="layui-field-box layui-form">
			<table id="role-lt" lay-filter="role" class="layui-hide layui-table">

			</table>
		</div>
    </div>
	
	<div class="container" id="authorize" style="display: none;">
		<div class="layui-role-list">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
		<div class="layui-btn-group">
			<a id="setting" class="layui-btn layui-btn-sm setting">确认</a>
			<a id="back" class="layui-btn layui-btn-primary layui-btn-sm setting">取消</a>
		</div>
		<input type="hidden" id="roleId" />
		<input type="hidden" id="treeJson">
	</div>
</body>
	<script type="text/html" id="roleStatus">
		<!-- 这里的 checked 的状态只是演示 -->
		<input disable type="checkbox" name="lock" value="{{d.status}}" title="启用" lay-filter="lockDemo" {{ d.status==1 ? 'checked' : '' }}>
	</script>
	<script type="text/html" id="roleOper">
		{{#<shiro:hasPermission name="role:authorize">}}
			<a class="layui-btn layui-btn-normal layui-btn-xs layui-input-treeselect" lay-event="authorize"><i class="layui-icon">&#xe63c;</i>授权</a>
		{{#</shiro:hasPermission>}}
		{{#<shiro:hasPermission name="role:edit">}}
			<a href="${ctx}/role/modifyRole.do?roleId={{d.id}}" class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon">&#xe642;</i>修改</a>
		{{#</shiro:hasPermission>}}
		{{#<shiro:hasPermission name="role:delete">}}
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</a>
		{{#</shiro:hasPermission>}}
	</script>
	<script src="${ctx}/static/plugins/jquery-3.2.1.js"></script>
	<script src="${ctx}/static/plugins/layui/layui.js"></script>
	<script src="${ctx}/static/plugins/ztree/js/jquery.ztree.core.js"></script>
	<script src="${ctx}/static/plugins/ztree/js/jquery.ztree.excheck.js"></script>
	<script src="${ctx}/static/plugins/ztree/js/jquery.ztree.exedit.js"></script>
	<script type="text/javascript">
	  	var ctx = '${ctx}';
	</script>
	<script>
        layui.use(['table','layer','form'], function() {
            var table = layui.table;
            var form = layui.form;
            var layer = layui.layer;
            var $ = layui.$;
            var tableOptions = {
            	elem:'#role-lt',
            	height:'full-80',
            	width:'full',
            	url:'${ctx}/role/roles.do',
            	method:'post',
            	request:{
            		pageName:'page',
            		limitName:'limit',
            		limit:'5'
            	},
            	where:{},
            	limits:[5,10,20,30,40],
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
            				title:'角色名称',
            				align:'center',
            				width:200,
            			},
            			{
            				field:'description',
            				title:'描述',
            				align:'center',
            				width:260,
            			},
            			{
            				field:'status',
            				title:'状态',
            				align:'center',
            				width:198,
            				templet: '#roleStatus'
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
            				width: 390,
            				minWidth: 300,
            				toolbar:'#roleOper'
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
            	var status = data.field.status;
            	tableOptions.where = {name:name,status:status};
            	table.render(tableOptions);
            	return false;
			});
            
			var setting = {
				view: {
					//selectedMulti: false
					dblClickExpand: false
				},
				check: {
					enable:true,
					//复选框
					nocheckInherit:true,
					chkStyle: "checkbox",
		            autoCheckTrigger: false,
		            chkboxType: { "Y" : "p", "N" : "s" }
				},
				data: {
					simpleData: {
						enable: true
					}
				}
			};
			
			var zNodes;
			
            table.on('tool(role)',function(data){
            	// 授权
            	if(data.event=='authorize'){
            		$("#roleId").val(data.data.id);
            		var roleId = $("#roleId").val();
            		var url = "${ctx}/role/modifyRoleMenus.do";
            		$.post(url, {roleId:roleId}, function(result) {
           				// 异步获取所有的菜单信息
           				//console.log(result.data);
           				zNodes = $.parseJSON(JSON.stringify(result.data));
           				$.fn.zTree.init($("#treeDemo"), setting, zNodes);
           				layer.open({
                			type: 1,
            				title: "角色授权",
            				area: ['360px', '480px'],
            				shadeClose: false,
            				content: $("#authorize")
                		})
            		});
            	}
            	
            	// 删除
            	if(data.event=='del'){
            		layer.confirm('确认要删除吗？', function(index) {
						// 执行网络请求
						var index = layer.load(2);
						$.ajax({
							url: ctx + '/role/delRole.do',
							type:'POST',
							data : {roleId:data.data.id},
							success : function(data){
								if(data.code=='1'){
									layer.close(index);
									layer.msg(data.msg, {
										time: 2000 //2秒关闭（如果不配置，默认是3秒）
									}, function() {
										// 删除成功跳转到用户列表
										window.location.href = ctx + '/role/roleList.do';
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
            
            function filter(node) { //过滤器直选中2级节点累加  
        		return (node.checked == true);
        	}
            
            function treeIds() { //这是将选中的节点的id用;分割拼接起来,用于持久化到数据库  
        		var zTreeO = $.fn.zTree.getZTreeObj("treeDemo").getNodesByFilter(filter);
            	var treeArr = [];
        		for (var i = 0; i < zTreeO.length; i++) {
        			var map = {};
        			if (zTreeO[i].id != null) {
        				map["id"] = zTreeO[i].id;
        			}
        			if (zTreeO[i].pId != null) {
        				map["pId"] = zTreeO[i].pId;
        			}
        			if (zTreeO[i].type != null) {
        				map["type"] = zTreeO[i].type;
        			}
        			treeArr.push(map);
        		}
        		$("#treeJson").val(JSON.stringify(treeArr));
        	};
            
        	// 确认
            $("#setting").on('click', function() {
            	treeIds();
            	//console.log($("#treeJson").val());
            	var roleId = $("#roleId").val();
        		var treeJson = $("#treeJson").val();
            	var url = ctx + '/role/saveRoleMenus.do';
            	$.post(url, {treeJson:treeJson,roleId:roleId}, function(result) {
       				if(result.code=='1'){
       					layer.alert(result.msg);
       				}else{
       					layer.alert(result.msg,{icon:6,time:3000});
       				}
        		});
        		layer.closeAll();
            });
            
        	// 取消
            $("#back").on('click',function(){
            	layer.closeAll();
            });
        });
    </script>
</html>