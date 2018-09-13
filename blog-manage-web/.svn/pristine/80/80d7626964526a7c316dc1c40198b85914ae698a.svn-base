layui.define(['element','layer'], function(exports){
	var $ = layui.jquery,
      	element = layui.element,
        layer = parent.layer === undefined ? layui.layer : parent.layer,
      	//layer = layui.layer,
      	module_name = 'navtab',
        globalTabIdIndex = 0,
        LarryTab = function(){
            this.config ={
                elem: undefined,
                contextMenu: false,
                closed: true,
                openWait: true
            };
        };
    var ELEM = {};
    /**
     * [参数设置 options]
     */
    LarryTab.prototype.set = function(options){
        var _this = this;
        $.extend(true, _this.config, options);
        return _this;
    };
    /**
     * [init 对象初始化]
     * @return {[type]} [返回对象初始化结果]
     */
    LarryTab.prototype.init  = function(){
        var _this = this;
        var _config = _this.config;
        if(typeof(_config.elem) !== 'string' && typeof(_config.elem) !== 'object') {
            layer.alert('Tab选项卡错误提示: elem参数未定义或设置出错，具体设置格式请参考文档API.');
        }
        var $container;
        if(typeof(_config.elem) === 'string') {
            $container = $('' + _config.elem + '');
        }
        if(typeof(_config.elem) === 'object') {
            $container = _config.elem;
        }
        if($container.length === 0) {
            layer.alert('Tab选项卡错误提示:找不到elem参数配置的容器，请检查.');
        }
        var filter = $container.attr('lay-filter');
        if(filter === undefined || filter === '') {
            layer.alert('Tab选项卡错误提示:请为elem容器设置一个lay-filter过滤器');
        }
        _config.elem = $container;
        ELEM.titleBox = $container.children('ul.layui-tab-title');
        ELEM.contentBox = $container.children('div.layui-tab-content');
        ELEM.tabFilter = filter;
        return _this;
    };
    /**
     * [exists 在layui-tab中检查对应layui-tab-title是否存在，如果存在则返回索引值，不存在返回-1]
     * @param  {[type]} title [description]
     * @return {[type]}       [description]
     */
    LarryTab.prototype.exists = function(title){
        var _this = ELEM.titleBox === undefined ? this.init() : this,
            tabIndex = -1;
        ELEM.titleBox.find('li').each(function(i, e) {
            var $em = $(this).children('em');
            if($em.text() === title) {
                tabIndex = i;
            };
        });
        return tabIndex;
    };
    
    /**
	 * 获取tabid
	 * @param {String} 标题
	 */
    LarryTab.prototype.getTabId = function (title) {
        var _this = ELEM.titleBox === undefined ? this.init() : this,
            tabId = -1;
        ELEM.titleBox.find('li').each(function (i, e) {
            var $em = $(this).children('em');
            if ($em.text() === title) {
                tabId = $(this).attr('lay-id');
            };
        });
        return tabId;
    };
    
    /**
     * [tabAdd 增加选项卡，如果已存在则增加this样式]
     * @param  {[type]} data [description]
     * @return {[type]}      [description]
     */
    LarryTab.prototype.tabAdd = function(data){
        var _this = this;
        var _config = _this.config;
        var tabIndex = _this.exists(data.title);
        // 若不存在
        if(tabIndex === -1){
        	//设置只能同时打开多少个tab选项卡
        	if (_config.maxSetting !== 'undefined') {
                var currentTabCount = _config.elem.children('ul.layui-tab-title').children('li').length;
                if (typeof _config.maxSetting === 'number') {
                    if (currentTabCount === _config.maxSetting) {
                        layer.msg('为了系统的流畅度，只能同时打开' + _config.maxSetting + '个选项卡。');
                        return;
                    }
                }
                if (typeof _config.maxSetting === 'object') {
                    var max = _config.maxSetting.max || 6;
                    var msg = _config.maxSetting.tipMsg || '为了系统的流畅度，只能同时打开' + max + '个选项卡。';
                    if (currentTabCount === max) {
                        layer.msg(msg);
                        return;
                    }
                }
            }
            globalTabIdIndex++;
            var content = '<iframe id="iframe'+ globalTabIdIndex + '" src="' + data.href + '"frameborder="0" data-id="' + globalTabIdIndex + '" class="larry-iframe"></iframe>';
            var title = '';
            // 若icon有定义
            if(data.icon !== undefined){
                if(data.icon.indexOf('fa-') !== -1) {
                    title += '<i class="' + data.icon + '"></i>';
                } else {
                    title += '<i class="layui-icon ">' + data.icon + '</i>';
                }
            }
            title += '<em>' + data.title + '</em>';
            console.log(title);
            if(_config.closed) {
                title += '<i class="layui-icon layui-unselect layui-tab-close" data-id="' + globalTabIdIndex + '">&#x1006;</i>';
            }
            
            var tabId = new Date().getTime();
            //添加tab
            element.tabAdd(ELEM.tabFilter, {
                title: title,
                content: content,
                id:tabId
            });
            //显示loading提示
            var loading = layer.load(1, {shade: false});
            // debugger;
            $('#iframe'+globalTabIdIndex).load(function () {
                //iframe加载完成后隐藏loading提示
                layer.close(loading);
            });
            //iframe 自适应
            ELEM.contentBox.find('iframe[data-id=' + globalTabIdIndex + ']').each(function() {
                $(this).height(ELEM.contentBox.height());
                $(this).width(ELEM.contentBox.width());
            });
            if(_config.closed) {
                //监听关闭事件
                ELEM.titleBox.find('li').children('i.layui-tab-close[data-id=' + globalTabIdIndex + ']').on('click', function() {
                    //获取当前点击选项卡的索引值
                    /*var clickIndex = ELEM.titleBox.find('li').attr('lay-id');
                    if(clickIndex !== 0){
                    	element.tabDelete(ELEM.tabFilter, _this.getTabId(data.title));
                    }*/
                	element.tabDelete(ELEM.tabFilter, $(this).parent('li').attr('lay-id')).init();
                });
            };
            //切换到当前打开的选项卡
            element.tabChange(ELEM.tabFilter, _this.getTabId(data.title));
        }else {
            element.tabChange(ELEM.tabFilter, _this.getTabId(data.title));
        }
        
        if (_config.contextMenu) {
        	element.on('tab(' + ELEM.tabFilter + ')', function (data) {
                $(document).find('div.admin-contextmenu').remove();
            });
        	ELEM.titleBox.find('li').on('contextmenu', function (e) {
        		var $that = $(e.target);
        		e.preventDefault();
                e.stopPropagation();
                
                var $target = e.target.nodeName === 'LI' ? e.target : e.target.parentElement;
                //判断，如果存在右键菜单的div，则移除，保存页面上只存在一个
                if ($(document).find('div.admin-contextmenu').length > 0) {
                    $(document).find('div.admin-contextmenu').remove();
                }
                //创建一个div
                var div = document.createElement('div');
                //设置一些属性
                div.className = 'admin-contextmenu';
                div.style.width = '130px';
                div.style.backgroundColor = 'white';
                var ul = '<ul>';
                ul += '<li data-target="refresh" title="刷新当前选项卡"><i class="fa fa-refresh" aria-hidden="true"></i> 刷新</li>';
                ul += '<li data-target="closeCurrent" title="关闭当前选项卡"><i class="fa fa-close" aria-hidden="true"></i> 关闭当前</li>';
                ul += '<li data-target="closeOther" title="关闭其他选项卡"><i class="fa fa-window-close-o" aria-hidden="true"></i> 关闭其他</li>';
                ul += '<li data-target="closeAll" title="关闭全部选项卡"><i class="fa fa-window-close-o" aria-hidden="true"></i> 全部关闭</li>';
                ul += '</ul>';
                div.innerHTML = ul;
                div.style.top = e.pageY + 'px';
                div.style.left = e.pageX + 'px';
                //将dom添加到body的末尾
                document.getElementsByTagName('body')[0].appendChild(div);

                //获取当前点击选项卡的id值
                var id = $($target).find('i.layui-tab-close').data('id');
                //获取当前点击选项卡的索引值
                var clickIndex = $($target).attr('lay-id');
                var $context = $(document).find('div.admin-contextmenu');
                if ($context.length > 0) {
                    $context.eq(0).children('ul').children('li').each(function () {
                        var $that = $(this);
                        //绑定菜单的点击事件
                        $that.on('click', function () {
                            //获取点击的target值
                            var target = $that.data('target');
                            //
                            switch (target) {
                                case 'refresh': //刷新当前
                                    var src = ELEM.contentBox.find('iframe[data-id=' + id + ']')[0].src;
                                    ELEM.contentBox.find('iframe[data-id=' + id + ']')[0].src = src;
                                    break;
                                case 'closeCurrent': //关闭当前
                                    if (clickIndex !== 0) {
                                        element.tabDelete(ELEM.tabFilter, clickIndex);
                                    }
                                    break;
                                case 'closeOther': //关闭其他
                                    ELEM.titleBox.children('li').each(function () {
                                        var $t = $(this);
                                        var id1 = $t.find('i.layui-tab-close').data('id');
                                        if (id1 != id && id1 !== undefined) {
                                            element.tabDelete(ELEM.tabFilter, $t.attr('lay-id'));
                                        }
                                    });
                                    break;
                                case 'closeAll': //全部关闭
                                    ELEM.titleBox.children('li').each(function () {
                                        var $t = $(this);
                                        if ($t.index() !== 0) {
                                            element.tabDelete(ELEM.tabFilter, $t.attr('lay-id'));
                                        }
                                    });
                                    break;
                            }
                            //处理完后移除右键菜单的dom
                            $context.remove();
                        });
                    });

                    $(document).on('click', function () {
                        $context.remove();
                    });
                }
                return false;
        	});
        }
    };
    var navtab = new LarryTab();
    exports(module_name, function(options) {
        return navtab.set(options);
    });
});