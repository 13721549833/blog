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
		</style>
	</head>
	<body>
		<div class="layui-layout layui-layout-admin">
			<div class="Error">
				<img src="${ctx}/static/images/404_icon.png">
				<p>亲~出错啦，你访问的页面不存在！</p>
			</div>
		</div>
	</body>
</html>