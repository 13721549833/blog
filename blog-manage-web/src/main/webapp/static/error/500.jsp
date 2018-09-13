<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/static/jsp/taglibs.jsp"%>
<!DOCTYPE>
<html>
	<head>
	  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8>
	  	<link rel="shortcut icon" href="${ctx}/static/src/images/favicon.ico">
	  	<link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css" media="all" />
	  	<link rel="stylesheet" href="${ctx}/static/plugins/font-awesome/css/font-awesome.min.css" media="all" />
	  	<link rel="stylesheet" href="${ctx}/static/src/css/app.css" media="all" />
	  	<link rel="stylesheet" href="${ctx}/static/src/css/themes/default.css" media="all" id="skin" kit-skin />
		<title>500</title>
		<style>
			.Error{text-align: center;min-height:530px;padding:15% 0;}
			.Error img{display: inline-block;width:40%;}
			.Error p{color: #1d72cc;padding-top: 20px;}
		</style>
	</head>
	<body>
		<div class="layui-layout layui-layout-admin">
			<div class="Error">
				<img src="${ctx}/static/images/500_icon.png">
				<p>亲~服务器出错啦，请稍后访问！</p>
			</div>
		</div>
	</body>
</html>