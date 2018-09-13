<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/static/jsp/taglibs.jsp"%>
<!DOCTYPE>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>YF-Blog 后台管理系统</title>
  <link rel="shortcut icon" href="${ctx}/static/src/images/favicon.ico">
  <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
  <link rel="stylesheet" href="${ctx}/static/src/css/login.css">
</head>

<body>
  <div class="kit-login">
    <div class="kit-login-bg"></div>
    
    <div class="kit-login-wapper">
     <h3 class="kit-login-slogan">欢迎使用 <br> YF Blog后台管理系统</h3>
      <div class="kit-login-form">
        <h4 class="kit-login-title">登录</h4>
        <form class="layui-form" method="post">
          <div class="kit-login-row">
            <div class="kit-login-col">
              <i class="layui-icon">&#xe612;</i>
              <span class="kit-login-input">
                <input type="text" id="username" name="username" lay-verify="username" placeholder="请输入用户名" />
              </span>
            </div>
            <div class="kit-login-col"></div>
          </div>
          <div class="kit-login-row">
            <div class="kit-login-col">
              <i class="layui-icon">&#xe64c;</i>
              <span class="kit-login-input">
                <input type="password" id="password" name="password" lay-verify="password" placeholder="请输入密码" />
              </span>
            </div>
            <div class="kit-login-col"></div>
          </div>
          <div class="kit-login-row">
            <div class="kit-login-col">
            	<i class="layui-icon">&#xe672;</i>
            	<span class="kit-login-input"> 
            		<input type="text" id="checkCode" name="checkCode" lay-verify="checkCode" placeholder="请输入验证码">
            		<img id="codeImg" alt="图片验证码" src="${ctx}/web/verifyCode.do" style="position: absolute;width: 90px;left: 150px;top: -10px;">
            	</span>
            </div>
          </div>
          <div class="kit-login-row">
            <button class="layui-btn kit-login-btn" id="login-btn" type="button">登录</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <script src="${ctx}/static/plugins/polyfill.min.js"></script>
  <script src="${ctx}/static/plugins/layui/layui.js"></script>
  <script src="${ctx}/static/src/js/RegxValidate.js"></script>
  <script>
    layui.use(['layer'], function() {
      var layer = layui.layer,
        $ = layui.$;

      /**
       * 点击验证码图片更新验证码
       */
      $("#codeImg").on("click", function() {
      	changeCode();
      });
      
      /**
       * 更新验证码
       */
      function changeCode() {
    	$("#codeImg").attr("src",
    	"${ctx}/web/verifyCode.do?t=" + Math.random());
      }
      
      /**
  	   * 监听用户是否按钮了enter键
  	   */
  	  $(document).keypress(function(event) {
  		var keynum = (event.keyCode ? event.keyCode : event.which);
  		if(keynum == '13') {
  			login();
  		}
  	  });
      
      $("#login-btn").on("click",function(){
    	  login();
      });
      
      function login(){
    	var username = $("#username").val(); 
      	var password = $("#password").val();
      	var checkCode = $("#checkCode").val();
      	if(RegxUtil.isEmpty(username)){
      		layer.tips('请输入用户名', '#username', {
  				tips: [2, '#02CDA3']
  			});
  			return false;
      	}
      	if(RegxUtil.isNotUserName(username)&&RegxUtil.isNotEmail(username)){
      		layer.tips('用户名格式不正确', '#username', {
  				tips: [2, '#02CDA3']
  			});
  			return false;
      	}
      	if(RegxUtil.isEmpty(password)){
      		layer.tips('请输入密码', '#password', {
  				tips: [2, '#02CDA3']
  			});
  			return false;
      	}
      	/* if(RegxUtil.isNotPwd(password)){
      		layer.tips('密码格式不正确，至少含数字、字母或字符2种组合', '#password', {
  				tips: [2, '#02CDA3']
  			});
  			return false;
      	} */
      	if(RegxUtil.isEmpty(checkCode)){
      		layer.tips('请输入验证码', '#checkCode', {
  				tips: [2, '#02CDA3']
  			});
  			return false;
      	}
      	
      	var index = layer.load(2);
      	
      	$.ajax({
			url : "${ctx}/web/login.do",
			type:"POST",
			dataType: "json",
			data : {
				username : username,  
				password : password,
				checkCode : checkCode
			},
			success : function(data){
				console.log(data);
				if(data.code == 200){
					console.log(1111);
					layer.msg(data.msg);
					layer.close(index);
					window.location.href = "${ctx}/web/system/index.do";
				}else{
					layer.close(index);
					layer.msg(data.msg);
				}
			},error : function(data){
				layer.msg(data.msg);
			}
	    });
      }
      
    });
  </script>
</body>

</html>