<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/static/jsp/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>个人资料</title>
	<link rel="shortcut icon" href="${ctx}/static/src/images/favicon.ico">
	<link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${ctx}/static/plugins/font-awesome/css/font-awesome.min.css" media="all" />
	<link rel="stylesheet" href="${ctx}/static/src/css/app.css" media="all" />
	<link rel="stylesheet" href="${ctx}/static/src/css/themes/default.css" media="all" id="skin" kit-skin />
</head>
<body>
	<div class="layui-container layui-row">
		<!--用户头像上传-->
		<div class="layui-upload layui-col-md4" style="display: inline-block;float: left; text-align: center;">
		  <div class="layui-upload-list">
		   <img id="avatar" style="width: 120px;height: 130px;border: 1px solid cadetblue;">
		   <p id="demoText"></p>
		  </div>
		  <button type="button" class="layui-btn" id="uploadBtn">上传头像</button>
		</div>
		
		<!--用户个人资料-->
		<form class="layui-form layui-col-md6" method="post" action="${ctx}/modifyPersonal.do" style="display: inline-block;float: left;">
			<input type="hidden" name="id" id="id" value="${user.id}" />
			<input type="hidden" name="avatar"/>
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-inline">
					<input type="text" name="username" value="${user.username}" placeholder="请输入用户名" lay-verify="required" class="layui-input" readonly="readonly" disabled="disabled">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">昵称</label>
				<div class="layui-input-inline">
					<input type="text" name="nickname" value="${user.nickname}" placeholder="请输入昵称" lay-verify="required" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input type="radio" name="gender" value="1" <c:if test="${user.gender == '1' }">checked="checked"</c:if> title="男"/>
					<input type="radio" name="gender" value="0" <c:if test="${user.gender == '0' }">checked="checked"</c:if> title="女"/>
				</div>
			</div>
			<div class="layui-form-item" pane="">
				<label class="layui-form-label">邮箱</label>
				<div class="layui-input-inline">
					<input type="text" name="email" value="${user.email}" placeholder="请输入邮箱" lay-verify="required" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">手机</label>
				<div class="layui-input-inline">
					<input type="text" name="mobile" value="${user.mobile}" placeholder="请输入手机号" lay-verify="required" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">QQ号码</label>
				<div class="layui-input-inline">
					<input type="text" name="qq" value="${user.qq}" placeholder="请输入QQ号码" lay-verify="required" class="layui-input">
				</div>
			</div>
			<%-- <div class="layui-form-item">
				<label class="layui-form-label">角色</label>
				<div class="layui-input-inline">
					<select name="roleId" lay-verify="required">
						<c:choose>
						   <c:when test="${pd.roleId eq role.roleId}">  
						   	<c:forEach items="${roleList}" var="role">
								<option value="${role.roleId}">${role.roleName}</option>
							</c:forEach>
						   </c:when>
						   <c:otherwise> 
						   	<c:forEach items="${roleList}" var="role">
								<c:choose>
								   <c:when test="${pd.roleId eq role.roleId}">  
								   	   <option value="${role.roleId}" selected="selected">${role.roleName}</option>     
								   </c:when>
								   <c:otherwise> 
								   	   <c:if test="${QX.edit == 1 }">
								   	   	    <option value="${role.roleId}">${role.roleName}</option>
								   	   </c:if>
								   </c:otherwise>
								</c:choose>
							</c:forEach>
						   </c:otherwise>
						</c:choose>
					</select>
				</div>
			</div> --%>

			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">备注信息</label>
				<div class="layui-input-block">
					<textarea id="remark" name="remark" value="${user.remark}" placeholder="12个汉字以内" class="layui-textarea">${user.remark}</textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn layui-btn-sm layui-btn-normal" id="editBtn" lay-submit lay-filter="editPersonal">立即修改</button>
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
	layui.use(['form', 'layer','upload'], function() {
		var layer = layui.layer;
		var form = layui.form;
		var $ = layui.$;
		//得到upload对象
		var upload = layui.upload;
		
		$("#avatar").attr('src',"${user.avatar}" + "?" + Math.random());
		
		//文件上传
		upload.render({
		  elem: '#uploadBtn',
		  url: ctx + '/web/upload.do',
		  accept: 'file',
		  method: 'POST',
		  done: function(data, index, upload){ //上传后的回调
			  
		  	if(data.code == "1"){
		  		layer.msg(data.msg);
		  		$('#avatar').attr('src',data.url+ '?' + Math.random());
		  		$(".layui-nav-img",window.parent.document).attr('src',data.url+ '?' + Math.random()); 
		  	}
		  }
		});
		
		function editPersonal(){
			var id = $("#id").val();
			console.log(id);
			var username = $("input[name='username']").val();
			var nickname = $("input[name='nickname']").val();
			var gender = $("input[name='gender']").val();
			var email = $("input[name='email']").val();
			var mobile = $("input[name='mobile']").val();
			var qq = $("input[name='qq']").val();
			var remark = $("#remark").val();
			var avatar = $('#avatar').attr('src');
			if(RegxUtil.isNotUserName(username)){
				layer.tips('用户名格式不正确', 'input[name="username"]', {
					tips: [2, '#02CDA3']
				});
				return false;
			}
			if(RegxUtil.isNotPhone(mobile)){
				layer.tips('手机号格式不正确', 'input[name="mobile"]', {
					tips: [2, '#02CDA3']
				});
				return false;
			}
			if(RegxUtil.isNotEmail(email)){
				layer.tips('邮箱格式不正确', 'input[name="email"]', {
					tips: [2, '#02CDA3']
				});
				return false;
			}
			
			var index = layer.load(2);
			var index1 = parent.layer.getFrameIndex(window.name);
			
			$.ajax({
				url:ctx + '/user/modifyPersonal.do',
				type:'POST',
				data : {
					id: id,
					username: username,
					nickname: nickname,
					gender: gender,
					email: email,
					mobile: mobile,
					qq: qq,
					remark: remark,
					avatar: avatar
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
		
		//修改资料
		form.on('submit(editPersonal)', function(data) {
			editPersonal();
			return false;
		});
		
	})
</script>
</html>