###blog V1.0模块划分

-blog-parent父工程
-blog-common公共类
-blog-system模块
-blog-system-entity实体类
-blog-system-dao数据访问层
-blog-system-interface接口层
-blog-system-service服务层
-blog-onstage-web前台模块
-blog-manage-web后台管理模块

###本系统所用技术：
- Spring-4.3.17.RELEASE
- Apache Shiro 1.3.2
- Redis
- MySQL、Mybatis、Pagehelper
- Zookeeper-3.4.7
- Dubbo-2.8.4
- Layui、jQuery

###项目配置：
1.创建数据库将blog.sql导入
2.修改配置文件
	1.数据库配置文件：/blog-system-service/src/main/resources/properties/db.properties
	2.redis配置文件：/blog-system-service/src/main/resources/properties/redis.properties
	3.密码加密配置文件：/blog-system-service/src/main/resources/properties/config.properties
	4.发布服务配置文件：/blog-system-service/src/main/resources/spring/spring-service.xml
	5.调用服务配置文件：/blog-manage-web/src/main/resources/spring/spring-manage.xml

###启动项目：
	先将blog-parent进行mvn-install安装，其次将blog-common进行mvn-install安装，然后在将blog-system,blog-manage-web进行mvn-install安装.
	先启动blog-system-service服务端,再启动blog-manage-web工程，服务端默认端口为8083；web端默认端口8082，打开网页访问localhost:8082/blog.
	超级管理员  用户名：guojingyu  密码：123456

###后续更新
