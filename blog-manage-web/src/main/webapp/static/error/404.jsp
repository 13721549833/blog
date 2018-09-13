<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/static/jsp/taglibs.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>404</title>
		<link rel="shortcut icon" href="${ctx}/static/src/images/favicon.ico">
		<link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${ctx}/static/plugins/font-awesome/css/font-awesome.min.css" media="all" />
		<link rel="stylesheet" href="${ctx}/static/src/css/app.css" media="all" />
		<link rel="stylesheet" href="${ctx}/static/src/css/themes/default.css" media="all" id="skin" kit-skin />
		<style>
			.Error{text-align:center;min-height:530px;padding:15% 0;background: #FAF7F8;}
			.Error img{display:inline-block;width:50%;}
			.Error p{color:#C8A357;padding-top:20px;padding-bottom:20px;}
			.Error button{border:1px solid #C8A357;border-radius:14px;width:90px;height:26px;line-height:26px;font-size:12px;background:#C8A357;}
			.Error a{color:#FEFFF8;}
			#back{width:16px;position:relative;height:16px;top:-2px;}
		</style>
	</head>
	<body>
		<div class="layui-layout layui-layout-admin">
			<div class="Error">
				<img src="${ctx}/static/images/404_icon.png">
				<p>亲~出错啦，你访问的页面不存在！</p>
				<button><img id="back" alt="返回首页" src="${ctx}/static/images/back.png"/><a href="${ctx}/web/system/index.do">返回首页</a></button>
			</div>
		</div>
	</body>
</html>