<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/static/jsp/taglibs.jsp"%>

<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no"> -->
	<!-- <meta http-equiv="X-UA-Compatible" content="ie=edge,chrome=1"> -->
	<!-- <meta name="renderer" content="webkit"> -->
	<!-- <meta http-equiv="Cache-Control" content="no-siteapp"> -->
	<!-- <meta name="google" value="notranslate"> -->
	<!-- <meta name="robots" content="index,follow"> -->
	<title>Document</title>
	<meta name="keywords" content="">
	<meta name="description" content="">
	<link rel="shortcut icon" href="${ctx}/static/src/images/favicon.ico">
	<link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
	<link rel="stylesheet" href="${ctx}/static/plugins/font-awesome/css/font-awesome.min.css">
	<style>
		.info-box {
			height: 85px;
			background-color: white;
			background-color: #ecf0f5;
		}
		
		.info-box .info-box-icon {
			border-top-left-radius: 2px;
			border-top-right-radius: 0;
			border-bottom-right-radius: 0;
			border-bottom-left-radius: 2px;
			display: block;
			float: left;
			height: 85px;
			width: 85px;
			text-align: center;
			font-size: 45px;
			line-height: 85px;
			background: rgba(0, 0, 0, 0.2);
		}
		
		.info-box .info-box-content {
			padding: 5px 10px;
			margin-left: 85px;
		}
		
		.info-box .info-box-content .info-box-text {
			display: block;
			font-size: 14px;
			white-space: nowrap;
			overflow: hidden;
			text-overflow: ellipsis;
			text-transform: uppercase;
		}
		
		.info-box .info-box-content .info-box-number {
			display: block;
			font-weight: bold;
			font-size: 18px;
		}
		
		.major {
			font-weight: 10px;
			color: #01AAED;
		}
		
		.main {
			margin-top: 25px;
		}
		
		.main .layui-row {
			margin: 10px 0;
		}
	</style>
</head>

<body>
	<div class="layui-fluid main">
		<div class="layui-row">
			<div class="layui-col-md12">
				<ul class="layui-timeline">
					<li class="layui-timeline-item"><i
						class="layui-icon layui-timeline-axis">&#xe63f;</i>
						<div class="layui-timeline-content layui-text">
							<h3 class="layui-timeline-title">9月8日(v1.0.5)</h3>
							<p>
							<h3>#tab</h3>
							<ul>
								<li>添加tab.close(id)方法</li>
								<li>添加tab.getId()方法</li>
							</ul>
							</p>
						</div></li>
					<li class="layui-timeline-item"><i
						class="layui-icon layui-timeline-axis">&#xe63f;</i>
						<div class="layui-timeline-content layui-text">
							<h3 class="layui-timeline-title">9月1日(v1.0.3)</h3>
							<p>
							<h3>#添加两个主题(欢迎你们去配很好看的色彩，反馈给我，然后我分享给大家/xyx)</h3>
							<ul>
								<li><a href="index.2.html" target="_blank">点击我(灰色)</a></li>
								<li><a href="index.3.html" target="_blank">点击我(蓝色)</a></li>
								<li><a href="page.html" target="_blank">模板的另一种加载方式(page)</a></li>
								<li>更新到 layui 2.1.1 <a
									href="http://www.layui.com/doc/base/changelog.html"
									target="_blank">#更新文档</a></li>
							</ul>
							</p>
						</div></li>
					<li class="layui-timeline-item"><i
						class="layui-icon layui-timeline-axis">&#xe63f;</i>
						<div class="layui-timeline-content layui-text">
							<h3 class="layui-timeline-title">8月31日(v1.0.2)</h3>
							<p>
							<h3>#添加onelevel组件（加载头部菜单）</h3>
							<ul>
								<li>详见<a href="onelevel.html">说明文档</a></li>
							</ul>
							<h3>#Tab组件</h3>
							<ul>
								<li>添加选项卡加载进度条</li>
							</ul>
							<h3>#其他更新</h3>
							<ul>
								<li>优化顶部菜单的样式</li>
							</ul>
							</p>
						</div></li>
					<li class="layui-timeline-item"><i
						class="layui-icon layui-timeline-axis">&#xe63f;</i>
						<div class="layui-timeline-content layui-text">
							<h3 class="layui-timeline-title">8月30日(v1.0.1)</h3>
							<p>
							<h3>#Navbar组件</h3>
							<ul>
								<li>添加远程加载和本地加载的方式（设置方式详见<a href="navbar.html">说明文档</a>）
								</li>
							</ul>
							<h3>#Tab组件</h3>
							<ul>
								<li>添加 mainUrl 属性 默认：main.do</li>
							</ul>
							</p>
						</div></li>
					<li class="layui-timeline-item"><i
						class="layui-icon layui-timeline-axis">&#xe63f;</i>
						<div class="layui-timeline-content layui-text">
							<h3 class="layui-timeline-title">8月29日</h3>
							<p>
							<ul>
								<li>更新<a href="navbar.html">navbar组件</a>和<a href="tab.html">tab组件</a>的说明文档
								</li>
								<li>新增左侧菜单可缩进.</li>
								<li>调整头部导航栏的高度，让她看起来更协调.</li>
							</ul>
							</p>
						</div></li>
					<li class="layui-timeline-item"><i
						class="layui-icon layui-timeline-axis">&#xe63f;</i>
						<div class="layui-timeline-content layui-text">
							<h3 class="layui-timeline-title">8月25日</h3>
						</div></li>
					<li class="layui-timeline-item"><i
						class="layui-icon layui-timeline-axis">&#xe63f;</i>
						<div class="layui-timeline-content layui-text">
							<h3 class="layui-timeline-title">8月24日</h3>
							<p>
							<h3>BeginnerAdmin 改名为kit_admin</h3>
							<ul>
								<li>项目重构，基于layui2.0</li>
								<li>添加navbar模块 <a href="navbar.html">navbar文档</a>
								</li>
								<li>添加tab模块 <a href="tab.html">tab文档</a>
								</li>
								<li>还有不想写了....</li>
							</ul>
							</p>
						</div></li>
					<li class="layui-timeline-item"><i
						class="layui-icon layui-timeline-axis">&#xe63f;</i>
						<div class="layui-timeline-content layui-text">
							<div class="layui-timeline-title">2017年</div>
						</div></li>
					<li class="layui-timeline-item"><i
						class="layui-icon layui-timeline-axis">&#xe63f;</i>
						<div class="layui-timeline-content layui-text">
							<div class="layui-timeline-title">更新日志</div>
						</div></li>
				</ul>
			</div>
		</div>
	</div>
	<script src="${ctx}/static/plugins/layui/layui.js"></script>
	<script>
		layui.use('jquery', function() {
			var $ = layui.jquery;
			$('#test').on('click', function() {
				parent.message.show({
					skin : 'cyan'
				});
			});
		});
	</script>
</body>

</html>