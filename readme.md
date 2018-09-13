blog V1.0项目工程大纲

blog-parent父工程
blog-common公共类
blog-system模块
blog-system-entity实体类
blog-system-dao数据访问层
blog-system-interface接口层
blog-system-service服务层
blog-onstage-web前端工程
blog-manage-web后端工程

项目配置：
先创建数据库将blog.sql导入

启动项目：
先启动blog-system-service服务端,再启动blog-manage-web工程，服务端默认端口为8083；web端默认端口8082，打开网页访问localhost:8082/blog.
用户名：guojingyu
密码：123456
