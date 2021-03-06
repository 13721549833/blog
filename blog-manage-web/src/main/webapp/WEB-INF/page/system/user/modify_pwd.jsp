<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/static/jsp/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>安全设置</title>
  <link rel="shortcut icon" href="${ctx}/static/src/images/favicon.ico">
  <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css" media="all" />
  <link rel="stylesheet" href="${ctx}/static/plugins/font-awesome/css/font-awesome.min.css" media="all" />
  <link rel="stylesheet" href="${ctx}/static/src/css/app.css" media="all" />
  <link rel="stylesheet" href="${ctx}/static/src/css/themes/default.css" media="all" id="skin" kit-skin />
  <style type="text/css">
  	.layui-form{padding-top:25px;text-align:center;position:relative;left:-0.9rem;}
  </style>
</head>
<body>
	<div class="layui-container">
      <form class="layui-form" method="post">
      	<input type="hidden" name="id" id="id" value="${user.id}" />
		<div class="layui-form-item">
		    <label class="layui-form-label">旧密码</label>
		    <div class="layui-input-block">
		    	<input type="password" name="oldPwd" id="oldPwd" placeholder="请输入旧密码" lay-verify="oldPwd" class="layui-input pwd">
		    </div>
		</div>
		<div class="layui-form-item">
		    <label class="layui-form-label">新密码</label>
		    <div class="layui-input-block">
		    	<input type="password" name="newPwd" id="newPwd" placeholder="请输入新密码" lay-verify="newPwd"  class="layui-input pwd">
		    </div>
		</div>
		<div class="layui-form-item">
		    <label class="layui-form-label">确认密码</label>
		    <div class="layui-input-block">
		    	<input type="password" name="chkPwd" id="chkPwd" placeholder="请确认密码" lay-verify="chkPwd" class="layui-input pwd">
		    </div>
		</div>
		<div class="layui-form-item">
		    <div class="layui-input-block" style="margin-top:1.4rem;margin-left:.6rem;">
		    	<button class="layui-btn layui-btn-sm layui-btn-normal" lay-submit lay-filter="changePwd">立即修改</button>
				<button type="reset" class="layui-btn layui-btn-sm layui-btn-primary">重置</button>
		    </div>
		</div>
	  </form>
	</div>
</body>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script src="${ctx}/static/src/js/RegxValidate.js"></script>
<script type="text/javascript">
  	var ctx = '${ctx}';
</script>
<script type="text/javascript">
	layui.use(['form', 'layer'], function() {
		var layer = layui.layer;
		var form = layui.form;
		var $ = layui.$;
		
		function modifyPwd(){
			var id = $("#id").val();
			var oldPwd = $("#oldPwd").val();
			var newPwd = $("#newPwd").val();
			var chkPwd = $("#chkPwd").val();
			if(RegxUtil.isEmpty(oldPwd)){
				layer.tips('请输入密码', '#oldPwd', {
					tips: [1, '#02CDA3']
				});
				return false;
			}
			if(RegxUtil.isEmpty(newPwd)){
				layer.tips('请输入新密码', '#newPwd', {
					tips: [1, '#02CDA3']
				});
				return false;
			}
			if(oldPwd==newPwd){
				layer.tips('新密码与旧密码不能相同', '#newPwd', {
					tips: [1, '#02CDA3']
				});
				return false;
			}
			if(RegxUtil.isEmpty(chkPwd)){
				layer.tips('请再次输入密码', '#chkPwd', {
					tips: [1, '#02CDA3']
				});
				return false;
			}
			if(newPwd!=chkPwd){
		        layer.tips('两次输入密码不相同', '#chkPwd', {
					tips: [1, '#02CDA3']
				});
				return false;
			}
			
			var index = layer.load(2);
			var index1 = parent.layer.getFrameIndex(window.name);
			
			$.ajax({
				url:ctx + '/web/modifyPwd.do',
				type:'POST',
				data : {
					id : id,  
					oldPwd : oldPwd,
					newPwd : newPwd,
					chkPwd : chkPwd
				},
				success:function(data){
					if(data.code=='1'){
						layer.close(index);
						layer.msg(data.msg, {
							time: 2000 //2秒关闭（如果不配置，默认是3秒）
						}, function() {
							parent.layer.close(index1);
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
		};
		
		//提交表单数据
		form.on('submit(changePwd)', function(data) {
			modifyPwd();
			return false;
		});
	});
</script>
</html>