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
	<style>
		.layui-form-text{width:480px;}
	</style>
</head>
<body>
	<div class="layui-container">
		<form class="layui-form" style="margin-left:20%;margin-top:25px;">
			<div class="layui-form-item">
				<input id="roleId" type="hidden" value="${role.id}">
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-inline">
					<input type="text" id="name" value="${role.name}" name="name" lay-verify="required" placeholder="请输入角色名称"  class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">描述</label>
				<div class="layui-input-inline">
					<input type="text" id="description" value="${role.description}" name="description" placeholder="请输入角色描述信息" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">是否启用</label>
				<div class="layui-input-block">
					<input type="radio" name="status" value="1" title="启用" <c:if test="${role.status=='1'}">checked</c:if>>
					<input type="radio" name="status" value="0" title="禁用" <c:if test="${role.status=='0'}">checked</c:if>>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-inline" style="float: left">
					<button class="layui-btn id="addbtn" layui-btn-lg layui-btn-danger" lay-submit lay-filter="editRole" style="margin-left: 45%;">修改角色</button>
					<div class="back-btn" style="position: relative;left: 204px;top: -38px;">
						<a href="${ctx}/role/roleList.do" class="layui-btn layui-btn-warm" id="import">
							<i class="layui-icon">&#xe65c;</i>返回角色列表
						</a>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script src="${ctx}/static/plugins/layui/layui.js"></script>
	<script src="${ctx}/static/src/js/RegxValidate.js"></script>
	<script type="text/javascript">
	  	var ctx = '${ctx}';
	</script>
	<script>
		layui.use(['layer','form'], function() {
            var layer = layui.layer;
            var form = layui.form;
            var $ = layui.$;
            
            // 校验表单数据
            function editRole(){
            	var roleId = $('#roleId').val();
            	var name = $('#name').val();
				var description = $('#description').val();
				var status = $('input[name="status"]:checked').val();
				
				if(RegxUtil.isEmpty(name)){
					layer.tips('角色名称不能为空', '#name', {
						tips: [2, '#02CDA3']
					});
					return false;
				}
				if(RegxUtil.isEmpty(description)){
					layer.tips('角色描述不能为空', '#description', {
						tips: [2, '#02CDA3']
					});
					return false;
				}
				// 加载层
				var index = layer.load(2);
				
				$.ajax({
					url:ctx + '/role/editRole.do',
					type:'POST',
					data : {
						roleId : roleId,
						roleName : name,
						description : description,
						status : status
					},
					success:function(data){
						if(data.code=='1'){
							layer.close(index);
							layer.msg(data.msg, {
								time: 2000 //2秒关闭（如果不配置，默认是3秒）
							}, function() {
								// 添加成功跳转到用户列表
								window.location.href = ctx+ '/role/roleList.do';
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
            }
            
            // 监听提交按钮事件
            form.on('submit(editRole)', function(data) {
            	editRole();
            	return false;
            })
            
		});
	</script>
</body>
</html>