<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/static/jsp/taglibs.jsp"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>YF-Blog 后台管理系统</title>
  <link rel="shortcut icon" href="${ctx}/static/src/images/favicon.ico">
  <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css" media="all" />
  <link rel="stylesheet" href="${ctx}/static/plugins/font-awesome/css/font-awesome.min.css" media="all" />
  <link rel="stylesheet" href="${ctx}/static/src/css/app.css" media="all" />
  <link rel="stylesheet" href="${ctx}/static/src/css/themes/default.css" media="all" id="skin" kit-skin />
</head>

<body class="kit-theme">
  <div class="layui-layout layui-layout-admin kit-layout-admin">
    <div class="layui-header">
      <div class="layui-logo">YF - BLOG</div>
      <ul class="layui-nav layui-layout-right kit-nav">
        <li class="layui-nav-item">
          <a href="javascript:;">
            <i class="layui-icon">&#xe658;</i> 皮肤
          </a>
          <dl class="layui-nav-child skin">
            <dd><a href="javascript:;" data-skin="blue.1" style="color:#00c0ef;"><i class="layui-icon">&#xe658;</i> 天空蓝</a></dd>
            <dd><a href="javascript:;" data-skin="default" style="color:#393D49;"><i class="layui-icon">&#xe658;</i> 默认</a></dd>
            <dd><a href="javascript:;" data-skin="orange" style="color:#ff6700;"><i class="layui-icon">&#xe658;</i> 橘子橙</a></dd>
            <dd><a href="javascript:;" data-skin="green" style="color:#00a65a;"><i class="layui-icon">&#xe658;</i> 原谅绿</a></dd>
            <dd><a href="javascript:;" data-skin="pink" style="color:#FA6086;"><i class="layui-icon">&#xe658;</i> 少女粉</a></dd>
            <dd><a href="javascript:;" data-skin="red" style="color:#dd4b39;"><i class="layui-icon">&#xe658;</i> 枫叶红</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">
            <img src="${user.avatar}" class="layui-nav-img"> ${user.nickname}
          </a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;" id="personal" kit-target><span>基本资料</span></a></dd>
            <dd><a href="javascript:;" id="security_setting">安全设置</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="${ctx}/web/logout.do"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a></li>
      </ul>
    </div>

	<span id="menuList" style="display: none;">${menuList}</span>
    <div class="layui-side layui-bg-black kit-side">
      <div class="layui-side-scroll" id="larry-nav-side" lay-filter="side">
        <div class="kit-side-fold"><i class="fa fa-navicon" aria-hidden="true"></i></div>
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" id="menuTree">
        
      </div>
    </div>
    <div class="layui-body" id="container" style="bottom: 0;border-left: solid 2px #1AA094;">
      <!-- 内容主体区域 -->
      <div class="layui-tab layui-tab-card larry-tab-box" id="larry-tab" lay-filter="main-tab" lay-allowClose="true">
		  <ul class="layui-tab-title">
		  	  <li class="layui-this" id="admin-home"><i class="fa fa-home"></i><em>控制台</em></li>
		  </ul>
		  
		  
		  <div class="layui-tab-content">
		   	  <div class="layui-tab-item layui-show">
				 <iframe id="myiframe" class="larry-iframe" width="100%" scrolling="yes" frameborder="0" data-id='0' src="main.do"></iframe>
			  </div>
		  </div>
      </div>
    </div>
	
	<!-- 个人资料弹出框 -->
	<div class="container" id="personal-info" style="display: none;">
		
	</div>
	<!-- 安全设置弹出框 -->
	<div class="container" id="security-setting" style="display: none;">
		
	</div>
	
    <div class="layui-footer">
      <!-- 底部固定区域 -->
      Copyright &copy; 2018 
      <a href="http://www.itaka.top/blog/">www.itaka.top/blog/</a> 黔ICP备18002968号
    </div>
  </div>
  <script type="text/javascript">
  	var ctx = '${ctx}';
  </script>
  <script src="${ctx}/static/plugins/layui/layui.js"></script>
  <script src="${ctx}/static/src/js/index.js"></script>

</body>

</html>