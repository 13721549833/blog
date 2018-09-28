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
	<style>
		.layui-form-text{width:480px;}
	</style>
</head>
<body>
	<div class="layui-container">
		<form class="layui-form" style="margin-left:20%;margin-top:25px;">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-inline">
					<input type="text" id="username" name="username" lay-verify="required" placeholder="请输入用户名"  class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">昵称</label>
				<div class="layui-input-inline">
					<input type="text" id="nickname" name="nickname" placeholder="请输入昵称" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">邮箱</label>
				<div class="layui-input-inline">
					<input type="text" id="email" name="email"  lay-verify="required" placeholder="请输入邮箱" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">手机号</label>
				<div class="layui-input-inline">
					<input type="text" id="mobile" name="mobile"  lay-verify="required" placeholder="请输入手机号" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">QQ号</label>
				<div class="layui-input-inline">
					<input type="text" id="qq" name="qq" placeholder="请输入QQ号" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">出生日期</label>
				<div class="layui-input-inline">
					<input type="text" id="birthday" name="birthday" placeholder="请输入出生日期" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input type="radio" name="gender" value="1" title="男" checked>
					<input type="radio" name="gender" value="2" title="女">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">角色</label>
				<div class="layui-input-inline">
					<select id="role" name="role" lay-verify="required">
						<!-- <option value="0"></option> -->
						<c:forEach items="${roleList}" var="roles">
							<option value="${roles.id}">${roles.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">是否启用</label>
				<div class="layui-input-block">
					<input type="radio" name="status" value="1" title="启用" checked>
					<input type="radio" name="status" value="0" title="禁用">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">公司</label>
				<div class="layui-input-inline">
					<input type="text" name="company" placeholder="请输入公司名称" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">博客地址</label>
				<div class="layui-input-inline">
					<input type="text" name="blog" placeholder="请输入博客地址" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">地址</label>
				<div class="layui-input-inline">
					<input type="text" name="location" placeholder="请输入地址" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">备注信息</label>
				<div class="layui-input-block">
					<textarea id="remark" name="remark" placeholder="12个汉字以内" class="layui-textarea"></textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-inline" style="float: left">
					<button class="layui-btn id="addbtn" layui-btn-lg layui-btn-danger" lay-submit lay-filter="addUser" style="margin-left: 45%;">新增用户</button>
					<div class="back-btn" style="position: relative;left: 204px;top: -38px;">
						<a href="${ctx}/user/userList.do" class="layui-btn layui-btn-warm" id="import">
							<i class="layui-icon">&#xe65c;</i>返回用户列表
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
		layui.use(['layer','form','laydate'], function() {
            var layer = layui.layer;
            var form = layui.form;
            var laydate = layui.laydate;
            var $ = layui.$;
            laydate.render({
                elem: '#birthday' //指定元素
            });
            
            // 校验表单数据
            function addUser(){
            	var username = $('#username').val();
				var nickname = $('#nickname').val();
				var email = $('#email').val();
				var mobile = $('#mobile').val();
				var qq = $('#qq').val();
				var birthday = $('#birthday').val();
				var gender = $('input[name="gender"]:checked').val();
				var status = $('input[name="status"]:checked').val();
				var roleId = $('#role').find('option:selected').val();
				var company = $('input[name="company"]').val();
				var blog = $('input[name="blog"]').val();
				var location = $('input[name="location"]').val();
				var remark = $('#remark').val();
				if(RegxUtil.isNotUserName(username)){
					layer.tips('用户名格式不正确', '#username', {
						tips: [2, '#02CDA3']
					});
					return false;
				}
				if(RegxUtil.isNotPhone(mobile)){
					layer.tips('手机号格式不正确', '#mobile', {
						tips: [2, '#02CDA3']
					});
					return false;
				}
				if(RegxUtil.isNotEmail(email)){
					layer.tips('邮箱格式不正确', '#email', {
						tips: [2, '#02CDA3']
					});
					return false;
				}
				// 加载层
				var index = layer.load(2);
				
				$.ajax({
					url:ctx + '/user/saveUser.do',
					type:'POST',
					data : {
						username : username,
						nickname : nickname,
						email : email,
						mobile : mobile,
						qq : qq,
						birthday : birthday,
						gender : gender,
						status : status,
						roleId : roleId,
						company : company,
						blog : blog,
						location : location,
						remark : remark
					},
					success:function(data){
						if(data.code=='1'){
							layer.close(index);
							layer.msg(data.msg, {
								time: 2000 //2秒关闭（如果不配置，默认是3秒）
							}, function() {
								// 添加成功跳转到用户列表
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
            }
            
            // 监听提交按钮事件
            form.on('submit(addUser)', function(data) {
            	addUser();
            	return false;
            })
            
		});
	</script>
</body>
</html>