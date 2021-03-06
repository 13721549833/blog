layui.config({
	base:ctx+'/static/src/js/'		
}).use(['navtab'],function(){
	var $ = layui.jquery,
    layer = layui.layer;
	_doc = $(document),
	element = layui.element,
    navtab = layui.navtab({
		elem: '.larry-tab-box',
		maxSetting: {
			max: 6,
			tipMsg: '只能开6个哇，不能再开了。'
		},
		contextMenu: true
	});
	
	//iframe自适应
	$(window).on('resize', function() {
		var $content = $('#larry-tab .layui-tab-content');
		$content.height($(this).height()-160);
		//$content.width($(this).width());
	    $content.find('iframe').each(function() {
	    	$(this).height($content.height());
	    });
	}).resize();
	
	
	$(function(){
		$("#larry-nav-side").click(function(){
			if ($(this).attr("lay-filter")!=undefined) {
				$(this).children('ul').find('li').each(function(){
					var $this = $(this);
					if($this.find('dl').length > 0){
						var $dd = $this.find('dd').each(function(){
	                       $(this).on('click', function() {
	                           var $a = $(this).children('a');
	                           var href = $a.data('url');
	                           var icon = $a.children('i:first').data('icon');
	                           var title = $a.children('span').text();
	                           var data = {
	                                 href: href,
	                                 icon: icon,
	                                 title: title
	                           }
	                           navtab.tabAdd(data);
	                       });
	                    });
					}else{
						//console.log($(this));
						$this.on('click', function() {
                           var $a = $(this).children('a');
                           var href = $a.data('url');
                           var icon = $a.children('i:first').data('icon');
                           var title = $a.children('span').text();
                           var data = {
                               href: href,
                               icon: icon,
                               title: title
                           }
                           console.log(title);
                           navtab.tabAdd(data);
	                    });
					}
				});
			}
		}).trigger("click");
	});
	
	
	$('#personal').on('click',function(){
		personal();
	})
	
	$('#security_setting').on('click',function(){
		securitySetting();
	})
});

layui.use(['jquery','layer','element'],function(){
	window.jQuery = window.$ = layui.jquery;
	window.layer = layui.layer;
	initMenu();
	
	// larry-side-menu向左折叠
	$('.kit-side-fold').off('click').on('click',function() {
		var _side = _doc.find('div.kit-side');
		if(_side.hasClass('kit-sided')){
			_side.removeClass('kit-sided');
			_doc.find('em.layui-nav-more').css('display','block');
			_doc.find('div.layui-body').removeClass('kit-body-folded');
	        _doc.find('div.layui-footer').removeClass('kit-footer-folded');
		}else{
			_side.addClass('kit-sided');
			_doc.find('em.layui-nav-more').css('display','none');
	        _doc.find('div.layui-body').addClass('kit-body-folded');
	        _doc.find('div.layui-footer').addClass('kit-footer-folded');
		}
	})
	
})

function personal(){
	layer.open({
        type: 2,
        title: "个人资料", //不显示标题栏
        closeBtn: 1,
        shadeClose:true,
        area: ['560px', '600px'],
        offset: 'auto',
        shade: 0.8,
        id: 'LAY_personal', //设定一个id，防止重复弹出
        moveType: 0, //拖拽模式，0或者1
        content: ctx + '/user/personal.do'
    });
}

function securitySetting(){
	layer.open({
        type: 2,
        title: "安全设置", //不显示标题栏
        closeBtn: 1,
        shadeClose:true,
        area: ['480px', '320px'],
        offset: 'auto',
        shade: 0.8,
        id: 'LAY_security', //设定一个id，防止重复弹出
        moveType: 0, //拖拽模式，0或者1
        content: ctx + '/web/modifyPwdPage.do'
    });
}

function initMenu(){
	var element = layui.element;
	//左侧菜单栏处理
	var menuList = document.getElementById("menuList").innerText;
	var parsedJson = jQuery.parseJSON(menuList);
	var html = "";
	for (var i=0;i<parsedJson.length;i++ ){
		var menu = parsedJson[i];
		html += '<li class="layui-nav-item">';
		if (menu.type=='1') {// 一级目录
			var icon = menu.icon;
			var name = menu.name;
			var id = menu.id;
			html += '<a href="javascript:;"';
			html += '<i class="'+icon+'"></i>';
			html += '<span>'+name+'</span>';
			html += '<em class="layui-nav-more"></em>';
			html += '</a>';
			//子菜单
			for(var j=0;j<parsedJson.length;j++){
				var childMenu = parsedJson[j];
				if(childMenu.parentId==id){
					var icon = childMenu.icon;
					var name = childMenu.name;
					var url = childMenu.url;
					if(childMenu.type=='2'){// 二级目录
						html += '<dl class="layui-nav-child">';
						html += '<dd>';
						html += '<a href="javascript:;" data-url="'+ctx+url+'">';
						html += '<i class="'+icon+'" data-icon="'+icon+'"></i>';
						html += '<span>'+name+'</span>';
						html += '</a>';
						html += '<dd>';
						html += '</dl>'
					}
				}
			}
		}
		html += '</li>'
	}
	$("#menuTree").append(html);
	element.init();  //初始化页面元素
}