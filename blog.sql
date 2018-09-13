/*
Navicat MySQL Data Transfer

Source Server         : 腾讯数据库
Source Server Version : 50622
Source Host           : 193.112.68.84:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2018-09-10 08:58:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_blog
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog`;
CREATE TABLE `tb_blog` (
  `id` char(32) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '文章标题',
  `user_id` char(32) NOT NULL COMMENT '用户ID',
  `cover_image` varchar(255) DEFAULT NULL COMMENT '文章封面图片',
  `is_markdown` tinyint(1) unsigned DEFAULT '1',
  `content` longtext COMMENT '文章内容',
  `content_md` longtext COMMENT 'markdown版的文章内容',
  `top` tinyint(1) DEFAULT '0' COMMENT '是否置顶',
  `type_id` char(32) NOT NULL COMMENT '类型',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `recommended` tinyint(1) unsigned DEFAULT '0' COMMENT '是否推荐',
  `original` tinyint(1) unsigned DEFAULT '1' COMMENT '是否原创',
  `description` varchar(300) DEFAULT NULL COMMENT '文章简介，最多200字',
  `keywords` varchar(200) DEFAULT NULL COMMENT '文章关键字，优化搜索',
  `comment` tinyint(1) unsigned DEFAULT '1' COMMENT '是否开启评论',
  `create_time` varchar(100) DEFAULT NULL COMMENT '添加时间',
  `update_time` varchar(100) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_blog
-- ----------------------------

-- ----------------------------
-- Table structure for tb_blog_kind
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog_kind`;
CREATE TABLE `tb_blog_kind` (
  `id` char(32) NOT NULL,
  `blog_id` char(32) NOT NULL COMMENT '文章ID',
  `user_id` char(32) DEFAULT NULL COMMENT '已登录用户ID',
  `user_ip` varchar(50) DEFAULT NULL COMMENT '用户IP',
  `type` tinyint(2) unsigned NOT NULL COMMENT '类型:1 查看, 2 喜欢',
  `look_time` varchar(100) DEFAULT NULL COMMENT '浏览时间',
  `create_time` varchar(100) DEFAULT NULL COMMENT '添加时间',
  `update_time` varchar(100) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_blog_kind
-- ----------------------------

-- ----------------------------
-- Table structure for tb_blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog_tags`;
CREATE TABLE `tb_blog_tags` (
  `id` char(32) NOT NULL,
  `tag_id` char(32) NOT NULL COMMENT '标签表主键',
  `blog_id` char(32) NOT NULL COMMENT '文章ID',
  `create_time` varchar(100) DEFAULT NULL COMMENT '添加时间',
  `update_time` varchar(100) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_blog_tags
-- ----------------------------

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `id` char(32) NOT NULL,
  `sid` char(32) DEFAULT NULL COMMENT '被评论的文章或者页面的ID',
  `user_id` char(32) DEFAULT NULL COMMENT '评论人的ID',
  `pid` char(32) DEFAULT NULL COMMENT '父级评论的id',
  `qq` varchar(13) DEFAULT NULL COMMENT '评论人的QQ（未登录用户）',
  `nickname` varchar(13) DEFAULT NULL COMMENT '评论人的昵称（未登录用户）',
  `avatar` varchar(255) DEFAULT NULL COMMENT '评论人的头像地址',
  `email` varchar(100) DEFAULT NULL COMMENT '评论人的邮箱地址（未登录用户）',
  `url` varchar(200) DEFAULT NULL COMMENT '评论人的网站地址（未登录用户）',
  `status` enum('VERIFYING','APPROVED','REJECT','DELETED') DEFAULT 'VERIFYING' COMMENT '评论的状态',
  `ip` varchar(64) DEFAULT NULL COMMENT '评论时的ip',
  `address` varchar(100) DEFAULT NULL COMMENT '评论时的地址',
  `browser` varchar(64) DEFAULT NULL COMMENT '评论时的浏览器类型',
  `content` varchar(2000) DEFAULT NULL COMMENT '评论的内容',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注（审核不通过时添加）',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持（赞）',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对（踩）',
  `create_time` varchar(100) DEFAULT NULL COMMENT '添加时间',
  `update_time` varchar(100) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------

-- ----------------------------
-- Table structure for tb_link
-- ----------------------------
DROP TABLE IF EXISTS `tb_link`;
CREATE TABLE `tb_link` (
  `id` char(32) NOT NULL,
  `url` varchar(200) NOT NULL COMMENT '链接地址',
  `name` varchar(50) DEFAULT NULL COMMENT '链接名',
  `description` varchar(300) DEFAULT NULL COMMENT '链接介绍',
  `email` varchar(100) DEFAULT NULL COMMENT '友链站长邮箱',
  `qq` varchar(13) DEFAULT NULL COMMENT '友链站长QQ',
  `favicon` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态',
  `home_page_display` tinyint(1) unsigned DEFAULT '1' COMMENT '是否首页显示',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `source` enum('ADMIN','AUTOMATIC') DEFAULT 'ADMIN' COMMENT '来源：管理员添加、自动申请',
  `create_time` varchar(100) DEFAULT NULL COMMENT '添加时间',
  `update_time` varchar(100) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_link
-- ----------------------------

-- ----------------------------
-- Table structure for tb_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log` (
  `id` char(32) NOT NULL,
  `operator` varchar(100) DEFAULT NULL COMMENT '操作人',
  `content` varchar(255) DEFAULT NULL COMMENT '日志内容',
  `moudle` varchar(100) DEFAULT NULL COMMENT '操作模块',
  `type` varchar(100) DEFAULT NULL COMMENT '操作类型',
  `ip` varchar(100) DEFAULT NULL COMMENT 'ip',
  `add_time` varchar(100) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_log
-- ----------------------------
INSERT INTO `tb_log` VALUES ('00e7e9c24ab34dc58eee603edc0bb101', 'admin100', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:45:46');
INSERT INTO `tb_log` VALUES ('0175ba4a2a1d453d9a5f9c7c7041c1d7', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 20:55:33');
INSERT INTO `tb_log` VALUES ('01fb537404e2443f97d986ac42a9c82e', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:12:20');
INSERT INTO `tb_log` VALUES ('02d5928c68ea40baa14107b6e4bc7be3', 'admin100', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:38:38');
INSERT INTO `tb_log` VALUES ('0303c755aa1a4f53a014c0a95de37f0c', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 14:43:44');
INSERT INTO `tb_log` VALUES ('031a760d96344023be6189ccc8bccdd0', 'fengjianke', '新增用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:44:37');
INSERT INTO `tb_log` VALUES ('056c522faf0044ae944189961839a783', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:26:31');
INSERT INTO `tb_log` VALUES ('0690246efea141d59e640469c9db7ef5', 'guojingyu', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:29:35');
INSERT INTO `tb_log` VALUES ('076d66da153f4ae3a103bdf29675c9da', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 14:31:59');
INSERT INTO `tb_log` VALUES ('0820978b96bd4214b4b639c38d2eaa8c', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:13:19');
INSERT INTO `tb_log` VALUES ('0b1011521800436992c7f3b5d0a5e3af', 'fengjianke', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:21:30');
INSERT INTO `tb_log` VALUES ('0b9010d13390424b817f641377a9f9cb', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:16:23');
INSERT INTO `tb_log` VALUES ('0bfb075dfaf4425e9308a26c09404e6c', 'admin100', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-09 23:49:14');
INSERT INTO `tb_log` VALUES ('0c803a7a409b42dda392038ebf3c36d3', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:46:09');
INSERT INTO `tb_log` VALUES ('0d21f058e54e485ba7f993ff97e2f982', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 14:04:30');
INSERT INTO `tb_log` VALUES ('0e28697dd18147758a120271944f7094', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:05:49');
INSERT INTO `tb_log` VALUES ('0e85537f894749f4b198412e7ab793fd', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:54:06');
INSERT INTO `tb_log` VALUES ('0e8baf280695498988f9f3bd53aa9fe1', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 22:08:21');
INSERT INTO `tb_log` VALUES ('0fb996f014d14ad393705cf814c8b2e6', 'fengjianke', '保存用户', '系统管理', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-03 11:18:03');
INSERT INTO `tb_log` VALUES ('10166ba916f04aae9f84339ce860ceaa', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 16:37:32');
INSERT INTO `tb_log` VALUES ('10e34a985c08427aa5e5d8cfb449752b', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 20:26:57');
INSERT INTO `tb_log` VALUES ('1123b63bcf444c59b1135d83661e67cd', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-08 23:35:23');
INSERT INTO `tb_log` VALUES ('11699afe715c44ababb243e4ca9e83ff', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:25:17');
INSERT INTO `tb_log` VALUES ('116f05e9dd844e078c88395bb8ee272a', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 14:38:33');
INSERT INTO `tb_log` VALUES ('12888bfc08ee4c93a18bb0b78bd4958b', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:38:22');
INSERT INTO `tb_log` VALUES ('1288f8af8b5642d2ac4cf5047999ea73', 'fengjianke', '个人资料', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:50:06');
INSERT INTO `tb_log` VALUES ('13080611b4f740d89fd1d0585632bc7b', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 13:53:53');
INSERT INTO `tb_log` VALUES ('1487e0ecfd034bfdb4a4feaf590ab1c0', 'guojingyu', '保存用户', '系统管理', '用户操作', '0:0:0:0:0:0:0:1', '2018-08-31 17:35:42');
INSERT INTO `tb_log` VALUES ('14b09b57114c45cda7f34f483fb10abe', 'guojingyu', '保存用户', '系统管理', '用户操作', '0:0:0:0:0:0:0:1', '2018-08-31 17:12:19');
INSERT INTO `tb_log` VALUES ('16231e08985648eab96ba9fdca8ab5ed', 'fengjianke', '新增角色', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:16:17');
INSERT INTO `tb_log` VALUES ('170d0ccbed0a48098f72d7ff64eab769', 'guojingyu', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:16:08');
INSERT INTO `tb_log` VALUES ('17e76432316343ea9d8d3699fbe8c02a', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 21:04:38');
INSERT INTO `tb_log` VALUES ('181aa9b572934ccda97e901bb50b111f', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-06 20:25:00');
INSERT INTO `tb_log` VALUES ('18688c6486d54287a5ad27f50443e571', 'fengjianke', '新增角色', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:16:30');
INSERT INTO `tb_log` VALUES ('18d210121a474a968c9b346ce6c3d61b', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 20:46:56');
INSERT INTO `tb_log` VALUES ('190d07cbf6fe45869f0b10224f2eb92b', 'fengjianke', '编辑角色', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:54:16');
INSERT INTO `tb_log` VALUES ('191e10f56203428a9d28f8f88ee51c2b', 'zhangyin', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:40:43');
INSERT INTO `tb_log` VALUES ('1a518a19822e4df094c1409bb4781ef5', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 22:10:43');
INSERT INTO `tb_log` VALUES ('1c2e5e388f7e4029b3ba97a7cc8bd92f', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 21:10:50');
INSERT INTO `tb_log` VALUES ('1cfaafb303c64312b115dc98bf1880e6', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:27:58');
INSERT INTO `tb_log` VALUES ('1d3c6a81aaa94129a69ee811e0f43455', 'guojingyu', '保存用户', '系统管理', '用户操作', '0:0:0:0:0:0:0:1', '2018-08-31 16:48:20');
INSERT INTO `tb_log` VALUES ('1e057f6be83a4ea691cc78db2cdcad1e', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:47:11');
INSERT INTO `tb_log` VALUES ('1ee7898b6c764715bcd9a3b5369ba6dd', 'guojingyu', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:35:07');
INSERT INTO `tb_log` VALUES ('1f1eb09f4e764ea096a64ad2729a9efa', 'guojingyu', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-10 00:35:13');
INSERT INTO `tb_log` VALUES ('20f3e253de3a438a8d4ea5ec981de0c3', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-08 19:53:32');
INSERT INTO `tb_log` VALUES ('21aa68ffbe034bc4b79beebd8c6c2ed1', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:42:06');
INSERT INTO `tb_log` VALUES ('222ceb6c9f064e0bbacce924f7d11b82', 'fengjianke', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:34:37');
INSERT INTO `tb_log` VALUES ('2234ab098de64b43b8c6687da3d8b1c7', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:41:28');
INSERT INTO `tb_log` VALUES ('22a60eaf4e4640818fd9780a9d5cf177', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:23:36');
INSERT INTO `tb_log` VALUES ('2416a55f16004cf191ff86e720672944', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-08 23:39:41');
INSERT INTO `tb_log` VALUES ('244419cd5a7b420cb180a9c96a8f0319', 'fengjianke', '编辑角色', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:41:19');
INSERT INTO `tb_log` VALUES ('244b7cd76e3840628fa8f77c368b2021', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 21:16:01');
INSERT INTO `tb_log` VALUES ('24ef578822c644059123a90dd7f90f29', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-04 13:47:10');
INSERT INTO `tb_log` VALUES ('252a7ece78484bebb9cf1f6e9348320a', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 22:45:33');
INSERT INTO `tb_log` VALUES ('25ed72cfdefb45639461f472d7f7c356', 'zhangyin', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:44:32');
INSERT INTO `tb_log` VALUES ('26f862b150234cb6aed1cb65ffbe0ba9', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:35:40');
INSERT INTO `tb_log` VALUES ('2763a530f59f439c998206d81bdac937', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 14:34:16');
INSERT INTO `tb_log` VALUES ('2776e7c672bf4fd98ea8a981eb01c26b', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:41:56');
INSERT INTO `tb_log` VALUES ('27a1b5e991b642e687c5c59b7ca503eb', 'guojingyu', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:11:24');
INSERT INTO `tb_log` VALUES ('27b20021b12c42f2a75d035f548c0773', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:35:44');
INSERT INTO `tb_log` VALUES ('28f05d07561946a58e01cbce0b3926b5', 'zhangyin', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:39:12');
INSERT INTO `tb_log` VALUES ('2964be99cd10479fadc1767207445801', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-09 23:50:27');
INSERT INTO `tb_log` VALUES ('29d92b3be8754abcb3a3d91ab5c69e0b', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-04 13:43:37');
INSERT INTO `tb_log` VALUES ('29f94a624f2849899f9177a150bfaa84', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:35:50');
INSERT INTO `tb_log` VALUES ('2a95c91058b2486e8ac3f3be2eccc3a7', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 22:03:17');
INSERT INTO `tb_log` VALUES ('2ce56bf3922f41c98a88636a8693da04', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 20:25:43');
INSERT INTO `tb_log` VALUES ('2d248d311f1b4e8d8bd4452cc51d2444', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 21:05:43');
INSERT INTO `tb_log` VALUES ('2d7ab60d17e4460c94343118bfbcc5a4', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 20:26:13');
INSERT INTO `tb_log` VALUES ('2d88adfbe5714e7b9e0a635fcfba5b2a', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:36:41');
INSERT INTO `tb_log` VALUES ('2db8d9cbf8724dd49c750350fc43d05d', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 13:54:17');
INSERT INTO `tb_log` VALUES ('2fbb3ea03b984518aa8f90b2bf43c186', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-07 14:33:48');
INSERT INTO `tb_log` VALUES ('2fe72314ef0c4dc293ceda5e234b383a', 'guojingyu', '保存角色授权', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:51:24');
INSERT INTO `tb_log` VALUES ('30291b2350bf4fdf88c9ec277ed5a765', 'admin100', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-03 11:27:07');
INSERT INTO `tb_log` VALUES ('30bad39c119447f2879497acb8a32a60', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 20:47:01');
INSERT INTO `tb_log` VALUES ('32180c7cb40946c88864f880f2d5439c', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-08-31 16:37:28');
INSERT INTO `tb_log` VALUES ('321e8f6cff024d928f6c7c63968d47ca', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-08 23:46:06');
INSERT INTO `tb_log` VALUES ('33b1f08b665748ce98f39ea378d8b11c', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:05:15');
INSERT INTO `tb_log` VALUES ('34388ebd8a3f4a89a2e13bec86beb451', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:38:35');
INSERT INTO `tb_log` VALUES ('34482ac978994880888da1f295d0cca9', 'fengjianke', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 19:53:35');
INSERT INTO `tb_log` VALUES ('34fd7216360646c989b2ab7116bb5fcf', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 20:56:58');
INSERT INTO `tb_log` VALUES ('3547dcf73d174b8f9e198264415b7186', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 20:22:59');
INSERT INTO `tb_log` VALUES ('35f5e67ce9d7415f98472047f8f5d99b', 'fengjianke', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:38:34');
INSERT INTO `tb_log` VALUES ('36a63839ab6a403db6cf42f30954c4f5', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:37:41');
INSERT INTO `tb_log` VALUES ('374d3dec59a548d9b1074c3f6cf0d9a6', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 19:35:00');
INSERT INTO `tb_log` VALUES ('3753eaaa487542c2be99cabd2dc4b0ff', 'fengjianke', '删除角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 14:51:24');
INSERT INTO `tb_log` VALUES ('37bcb0ea3aa64bc8b02ee72b5923f054', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:25:10');
INSERT INTO `tb_log` VALUES ('37fe60d35c9d4327970b82b31f62083c', 'guojingyu', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:39:53');
INSERT INTO `tb_log` VALUES ('385c88519c884953bbb91b68a5998dd3', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 16:12:26');
INSERT INTO `tb_log` VALUES ('39c1bec3cc1c45efa5be92f2c3072736', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-07 13:56:22');
INSERT INTO `tb_log` VALUES ('39f5cd5b5dc5448980a8423b45e4a0c8', 'guojingyu', '保存用户', '系统管理', '用户操作', '0:0:0:0:0:0:0:1', '2018-08-31 17:16:35');
INSERT INTO `tb_log` VALUES ('3a22445239c447ecb19d5c15e2f0838f', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-08 22:45:29');
INSERT INTO `tb_log` VALUES ('3b415e152922466d82fbd2a20ff97aa9', 'guojingyu', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:23:42');
INSERT INTO `tb_log` VALUES ('3b7c7711d43545e28f7ea7046c244856', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-08 23:27:50');
INSERT INTO `tb_log` VALUES ('3c6830e630674e84bcb7aeff3e77a886', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:07:46');
INSERT INTO `tb_log` VALUES ('3c7291f599414bef9f4e3240f6362c88', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:13:52');
INSERT INTO `tb_log` VALUES ('3c99b0023b0a4d76a3c0fd11be1fbc3f', 'guojingyu', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:48:57');
INSERT INTO `tb_log` VALUES ('3cee1873e8194dd39c0d93297c80f46e', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:57:07');
INSERT INTO `tb_log` VALUES ('3e0ddbbc79594f28a469ab79cbd65c36', 'fengjianke', '修改密码', '个人资料', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:50:24');
INSERT INTO `tb_log` VALUES ('3e358b6a0ef94f03a0f1ab516b56fb08', 'fengjianke', '删除角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 14:25:18');
INSERT INTO `tb_log` VALUES ('3f14a01cb3db4c5b8bd5d15aa2a9a246', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:10:35');
INSERT INTO `tb_log` VALUES ('3f16a306aa7c47e496a6541c22bd2731', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 14:13:49');
INSERT INTO `tb_log` VALUES ('3f5f1895d88c426d9cee85ce2f469e2d', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 13:56:25');
INSERT INTO `tb_log` VALUES ('401ef0ac57484c61bbbd287264ab93dd', 'admin100', '新增用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:36:29');
INSERT INTO `tb_log` VALUES ('409d130e3fb4471cb3b35af5ed82dc9a', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 21:15:57');
INSERT INTO `tb_log` VALUES ('40b0332c80ed4889b20c9fc325f7bd36', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 14:47:27');
INSERT INTO `tb_log` VALUES ('413947b72d7b433b83cb178e4d8d6895', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-04 16:31:02');
INSERT INTO `tb_log` VALUES ('4164173d4be643a0ad8a922ca86f5ba0', 'guojingyu', '新增用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 16:12:27');
INSERT INTO `tb_log` VALUES ('41d3b6da2f33489494c2902b906cb0f3', 'fengjianke', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:39:06');
INSERT INTO `tb_log` VALUES ('427bd0f1723c47069cb6974b478ee25d', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 20:45:41');
INSERT INTO `tb_log` VALUES ('429a6537fe764b01b3c2e125896a6064', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:35:10');
INSERT INTO `tb_log` VALUES ('42b9e8ef507844ed9fe708288f6bb6b5', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 20:52:56');
INSERT INTO `tb_log` VALUES ('42fbd70c0c75466d88bc361cab42fc65', 'fengjianke', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:28:45');
INSERT INTO `tb_log` VALUES ('43252fa841b346d7b29e269eae1e07ec', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 14:47:13');
INSERT INTO `tb_log` VALUES ('436203e3b31047ad81c0da270beb60de', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:38:10');
INSERT INTO `tb_log` VALUES ('4391f001201d4e1598ff7f16b63699b9', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:30:19');
INSERT INTO `tb_log` VALUES ('43d2472a1708420ba2c101cc435471ec', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:52:05');
INSERT INTO `tb_log` VALUES ('43df7c086dfc4acb8d57ba7f076fb891', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:48:34');
INSERT INTO `tb_log` VALUES ('4415834e1c3444f2843a74242208c01e', 'fengjianke', '保存角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 14:15:07');
INSERT INTO `tb_log` VALUES ('44e525562d144e9eaf73e9c37ef49015', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:37:05');
INSERT INTO `tb_log` VALUES ('45ef74b50c5d49089ae6ba1130602ff2', 'zhangyin', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:40:44');
INSERT INTO `tb_log` VALUES ('4886c596b1b94b0a8036d1bc10fdab9d', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:19:26');
INSERT INTO `tb_log` VALUES ('48ada922bbd749ee90c136b0ebc782d3', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:19:53');
INSERT INTO `tb_log` VALUES ('48cb450480ae4babba7836f9e13f08d8', 'fengjianke', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:28:27');
INSERT INTO `tb_log` VALUES ('48fc85d8c6ae4b6d826c5eaac8719879', 'guojingyu', '保存角色授权', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:47:02');
INSERT INTO `tb_log` VALUES ('4977f6781c384ce1896746b59ebc69f3', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 21:04:30');
INSERT INTO `tb_log` VALUES ('4984516a186e4fce8c22e022b0429a52', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 20:40:17');
INSERT INTO `tb_log` VALUES ('49ed68704345436897c537990890c39a', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:41:12');
INSERT INTO `tb_log` VALUES ('4a1901ad2fa742249a66eabd9bcb6a77', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-09 22:19:21');
INSERT INTO `tb_log` VALUES ('4a282fdbb42a41208f5377919b1508e2', 'admin100', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:48:15');
INSERT INTO `tb_log` VALUES ('4a654c9da50c4738aba9e4b87af23e8b', 'zhangyin', '保存角色授权', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:44:40');
INSERT INTO `tb_log` VALUES ('4abca974968e4b98b2cf13412c200cdd', 'guojingyu', '新增用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:05:17');
INSERT INTO `tb_log` VALUES ('4b024f62cf77490da44ad50892ffcec8', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:38:17');
INSERT INTO `tb_log` VALUES ('4b4f8e136bb54aeb8f8a0b91bcfaf685', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 20:28:42');
INSERT INTO `tb_log` VALUES ('4b6a9fc1ffec4526983d9d7c70a0aa26', 'guojingyu', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:29:23');
INSERT INTO `tb_log` VALUES ('4c8104a46e7743daadca56dfce6fef15', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 14:31:40');
INSERT INTO `tb_log` VALUES ('4d4decd87ea847a7bdc5e255f5a382a0', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:12:22');
INSERT INTO `tb_log` VALUES ('4e2135b929cf48e1a84c6ebdc7c72bad', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:15:36');
INSERT INTO `tb_log` VALUES ('4e5ef054a6024ad19bc4b806ccaee9e4', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 20:25:03');
INSERT INTO `tb_log` VALUES ('4eaab9717aad48189398306803d212fa', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:13:16');
INSERT INTO `tb_log` VALUES ('4fd59b68073447ab81e116344b291cb0', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:37:59');
INSERT INTO `tb_log` VALUES ('4ff34e14cc1f45a8bb70ee24d0e618ce', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 20:58:59');
INSERT INTO `tb_log` VALUES ('5007ec63447d4c32982d3292a38313a8', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-08-31 17:05:12');
INSERT INTO `tb_log` VALUES ('510d147dfa7a4622b0fafd156416fedc', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:36:50');
INSERT INTO `tb_log` VALUES ('514e9686942d44ba8551613a9c2f4ba2', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 20:28:36');
INSERT INTO `tb_log` VALUES ('51dcf9588b3f42bab6a65647ac0dffc5', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 20:54:33');
INSERT INTO `tb_log` VALUES ('527d775f70f148ff878d204f21eb59af', 'fengjianke', '个人资料', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:40:00');
INSERT INTO `tb_log` VALUES ('52e0fb67f29547f58ef7baed6cc79dc5', 'guojingyu', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:51:16');
INSERT INTO `tb_log` VALUES ('539d77c1ef4f45dda48f0898c152f5dc', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:39:01');
INSERT INTO `tb_log` VALUES ('53d06a97ab4946e3b6159af4c9f7ef80', 'zhangyin', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-08 23:39:04');
INSERT INTO `tb_log` VALUES ('54f0782cb329418fa630bfbae63da6db', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 22:42:38');
INSERT INTO `tb_log` VALUES ('561eaf09092849bbb5eb35b3f27d42b1', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 14:41:18');
INSERT INTO `tb_log` VALUES ('569d262423b8436db14e99cf98f3e111', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 19:54:26');
INSERT INTO `tb_log` VALUES ('57a47c3c8f4d461f9a00be56ba0903be', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 14:34:27');
INSERT INTO `tb_log` VALUES ('5881fbc0c7604220a1aec63c5447f8ab', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 16:48:22');
INSERT INTO `tb_log` VALUES ('58fe44a5b4d14fb5af3dde3ff3b5853a', 'admin100', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-09 23:42:42');
INSERT INTO `tb_log` VALUES ('59f17556f15e4841b4f5407c32d7708a', 'admin100', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:46:46');
INSERT INTO `tb_log` VALUES ('59f7efa5115f45cfbb7d05b5f66220f9', 'guojingyu', '编辑角色', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:41:52');
INSERT INTO `tb_log` VALUES ('5a1d917884c54a35bfbd420146993f22', 'fengjianke', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 15:03:07');
INSERT INTO `tb_log` VALUES ('5a1e1da927304327a92bab547c092512', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-04 14:20:08');
INSERT INTO `tb_log` VALUES ('5a4a2aaf31444726838a9d3cbba9b0ae', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 20:25:09');
INSERT INTO `tb_log` VALUES ('5b9a73895d384251b7b7b4abac7bfc7b', 'guojingyu', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:21:17');
INSERT INTO `tb_log` VALUES ('5c24d612f9a746b89f9919ab5ba13c59', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 20:56:56');
INSERT INTO `tb_log` VALUES ('5c3b7cde7232401bad47c87b58bce753', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-04 16:25:01');
INSERT INTO `tb_log` VALUES ('5cdafe59366c45eab265397167abc9e7', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:28:55');
INSERT INTO `tb_log` VALUES ('5f1bc040c0464714820e6cc0244783af', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:28:50');
INSERT INTO `tb_log` VALUES ('5fc28dccf0eb40fb8816dbaa14559490', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:22:05');
INSERT INTO `tb_log` VALUES ('5fe4a084499f40b48e60fada66b250f2', 'fengjianke', '编辑角色', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:52:26');
INSERT INTO `tb_log` VALUES ('6090072aa7a146db8824750acd9ebffe', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 22:07:51');
INSERT INTO `tb_log` VALUES ('61ce32e692f14c8c865cc25e4017fdef', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 16:02:07');
INSERT INTO `tb_log` VALUES ('6230fe2f59f149ffa97876d583359d13', 'guojingyu', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:14:13');
INSERT INTO `tb_log` VALUES ('62d43d5c0ebf45cfa7b9785fbcf554a3', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:10:57');
INSERT INTO `tb_log` VALUES ('630a5cda9a5d480e84bddc557325259a', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:16:37');
INSERT INTO `tb_log` VALUES ('6335cb800fef4a5494fd12d9cd0dfb00', 'admin100', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:35:37');
INSERT INTO `tb_log` VALUES ('640b263d6b0140d9b75c8523d243939f', 'guojingyu', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:47:41');
INSERT INTO `tb_log` VALUES ('64425ea3589449ef846f8042495079a5', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 22:02:59');
INSERT INTO `tb_log` VALUES ('645ff6d5f2414272bb71fa6cced5572c', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:20:29');
INSERT INTO `tb_log` VALUES ('6475bc26a2ec42d59496b733029ee1e4', 'fengjianke', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:26:52');
INSERT INTO `tb_log` VALUES ('655239d1e554433c8a909b7a3409f1d5', 'fengjianke', '编辑角色', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:43:14');
INSERT INTO `tb_log` VALUES ('6591f1cd32444bd09da0f5c579d5d1f9', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 20:01:30');
INSERT INTO `tb_log` VALUES ('66e6abaf823b437399f6f73aac376f9c', 'zhangyin', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:41:22');
INSERT INTO `tb_log` VALUES ('683e6c0c77c24b6d8f23bb1958b169e8', 'fengjianke', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:41:00');
INSERT INTO `tb_log` VALUES ('689ac40ac3fc4c28b3dc31c8f2019f26', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:13:58');
INSERT INTO `tb_log` VALUES ('69345d7bfc0c40358edae1cb4f95c051', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 22:17:57');
INSERT INTO `tb_log` VALUES ('6945147bb01449b6a5781d96811ab3f5', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-08-31 17:11:52');
INSERT INTO `tb_log` VALUES ('69815acd5ec841ebbdcebb65ffb01263', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 22:10:44');
INSERT INTO `tb_log` VALUES ('698542d4971a4375be9c33a70273a682', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-07 14:13:39');
INSERT INTO `tb_log` VALUES ('69bfec206f654ae1b8ea5db9d3356d06', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 22:04:28');
INSERT INTO `tb_log` VALUES ('6bde0cdf27f4475997e84120d2d32af0', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:48:14');
INSERT INTO `tb_log` VALUES ('6dc6e4e7c71c434c81c883b9b7965df1', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:25:19');
INSERT INTO `tb_log` VALUES ('6e0ab36ffb7644cca6569a2da91fb400', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:31:21');
INSERT INTO `tb_log` VALUES ('6e7f282a4a494206b1c3e24eafaa0e38', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-03 11:14:50');
INSERT INTO `tb_log` VALUES ('6ee98bc5784f4284bc1caf268bc7f2ed', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 20:50:04');
INSERT INTO `tb_log` VALUES ('70048dd48b21427a9bc43cf37806e7e4', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-08 19:51:14');
INSERT INTO `tb_log` VALUES ('70e159c3342d4ba0b21727f3234f6eeb', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-04 16:35:17');
INSERT INTO `tb_log` VALUES ('71214cbc43cb439b96e7cf2a8336196e', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:42:32');
INSERT INTO `tb_log` VALUES ('71285a974bef486aa226ddc4feb14e84', 'fengjianke', '个人资料', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:39:20');
INSERT INTO `tb_log` VALUES ('7208ce8686e84bf89386824e68609379', 'fengjianke', '编辑用户', '系统管理', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:38:45');
INSERT INTO `tb_log` VALUES ('725127032ff54b42a88d0998f54e445a', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-07 14:04:26');
INSERT INTO `tb_log` VALUES ('72c6c5a1e0194f0babe310ca7d24b8b2', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:39:27');
INSERT INTO `tb_log` VALUES ('734827e368bb4b9597b40222a5e01cf2', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 14:34:19');
INSERT INTO `tb_log` VALUES ('7358be6e23b848e7a15c6ad0e5f32689', 'fengjianke', '修改角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 14:50:40');
INSERT INTO `tb_log` VALUES ('738c85745b7543f8890ce2c2ba892658', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 20:26:37');
INSERT INTO `tb_log` VALUES ('73c939fb82e540dc8f5a5b6ad80077da', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-07 14:06:59');
INSERT INTO `tb_log` VALUES ('74fb71b445644e3e9f35e6d4a5141a00', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 22:39:22');
INSERT INTO `tb_log` VALUES ('7535cb808c274b13a50055caecd66db1', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 20:01:19');
INSERT INTO `tb_log` VALUES ('753890e62a9a42ad9f56f89105c3c023', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:39:44');
INSERT INTO `tb_log` VALUES ('75d7122d77904e5199cf6088cc9cd4d3', 'fengjianke', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:11:01');
INSERT INTO `tb_log` VALUES ('7623907e2ab040c5bf6ef178dda3b029', 'guojingyu', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-09 23:48:42');
INSERT INTO `tb_log` VALUES ('7721c9ae712f46ceaec76a2726b8b48a', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:11:55');
INSERT INTO `tb_log` VALUES ('772f90436b674efe899eea056b799aaa', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:52:36');
INSERT INTO `tb_log` VALUES ('776b99179fa34c56a1fd32e8deec5a75', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 21:18:23');
INSERT INTO `tb_log` VALUES ('78f5f76f53f645d39912b7b6ff28c1ef', 'guojingyu', '新增用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 16:37:33');
INSERT INTO `tb_log` VALUES ('797922e205cb43809ce39ea1ef72b3a6', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-04 16:41:01');
INSERT INTO `tb_log` VALUES ('79e8894ec13b49b6b858d57e0a65c682', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 19:54:24');
INSERT INTO `tb_log` VALUES ('79f31b5e1d30402baf8aef5024548668', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:16:07');
INSERT INTO `tb_log` VALUES ('7a395876c0584afb8562e2020f60b9d4', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:20:54');
INSERT INTO `tb_log` VALUES ('7aaa1f862af2435badaa8bd131165bef', 'admin100', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:38:56');
INSERT INTO `tb_log` VALUES ('7c077c025a6a4eaf9a457b584e0147c7', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:37:27');
INSERT INTO `tb_log` VALUES ('7c25bc8ad5324403ad36de89904cfb1c', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-07 13:53:46');
INSERT INTO `tb_log` VALUES ('7c6b3c9e18cb4d8ead7320b9c0b620c1', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 14:07:00');
INSERT INTO `tb_log` VALUES ('7ccae5678c814f4480531591ea669d61', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 21:14:06');
INSERT INTO `tb_log` VALUES ('7d4761061af849b193e788d448068c22', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 21:04:40');
INSERT INTO `tb_log` VALUES ('7da5de3ee63f46d8a527d67223856912', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 22:17:52');
INSERT INTO `tb_log` VALUES ('7e5b9fd9a4254fadb7ec1ff1ae1a8b32', 'guojingyu', '编辑用户', '系统管理', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:52:03');
INSERT INTO `tb_log` VALUES ('7ebfde9854ef4512aae4e7f601ab7420', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-04 16:19:33');
INSERT INTO `tb_log` VALUES ('801a6444860143679a6e6399336c387e', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-04 16:19:31');
INSERT INTO `tb_log` VALUES ('805e1d76922541fc89f662c8e26d84c5', 'guojingyu', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:16:20');
INSERT INTO `tb_log` VALUES ('80e2c23c46ab4700bbc0c2579cf2bcfd', 'guojingyu', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:47:10');
INSERT INTO `tb_log` VALUES ('814132bdd8fe4a7187e4e90ce7cdf34d', 'guojingyu', '保存角色授权', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:47:39');
INSERT INTO `tb_log` VALUES ('81527465fde14d7496a17a24f6dc477a', 'zhangyin', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:40:45');
INSERT INTO `tb_log` VALUES ('81f77a1d03b6406b8244d718b0c355ed', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 20:27:29');
INSERT INTO `tb_log` VALUES ('81fe2efae1584321b9f8080a9374dbe1', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-07 14:44:41');
INSERT INTO `tb_log` VALUES ('8294dbde09294f4fa8411bfd233d691a', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:38:18');
INSERT INTO `tb_log` VALUES ('831837cd846d48fb8382cebb9e087384', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 14:32:03');
INSERT INTO `tb_log` VALUES ('832ef6f9a79a4b858a04e5bb762baa90', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:53:58');
INSERT INTO `tb_log` VALUES ('835e447da82b4070a55e8aa659cd4c20', 'fengjianke', '保存角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 14:16:37');
INSERT INTO `tb_log` VALUES ('83e038574d184544a417391f45e88112', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:20:30');
INSERT INTO `tb_log` VALUES ('8495a7401ea54ad6a5a63d2f0459fef5', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 21:10:54');
INSERT INTO `tb_log` VALUES ('849e8e2653d14abc91d8030cedb77289', 'fengjianke', '保存角色授权', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:13:07');
INSERT INTO `tb_log` VALUES ('84c42cc699b84368b45a0b4ea11003eb', 'fengjianke', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:27:42');
INSERT INTO `tb_log` VALUES ('8559fe4fc2cf4214ae947c0022f35147', 'fengjianke', '编辑角色', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:50:29');
INSERT INTO `tb_log` VALUES ('857a8b1151fa4b72ba3a19f7ad9cbbf7', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:12:16');
INSERT INTO `tb_log` VALUES ('85973ac5a3034d8b9fe72248fc8bf676', 'guojingyu', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:48:45');
INSERT INTO `tb_log` VALUES ('85b3e5d90eb14a24a6a0eb329d7296fc', 'zhangyin', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-08 23:40:21');
INSERT INTO `tb_log` VALUES ('85db08d140b2424693e6ba00a4f63a23', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-07 14:47:11');
INSERT INTO `tb_log` VALUES ('861f7cc6d40d40cdbd20ffbc36d8ae5c', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 14:13:04');
INSERT INTO `tb_log` VALUES ('869f09e98c4e441f8cf5493409d51a21', 'fengjianke', '保存角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 14:29:35');
INSERT INTO `tb_log` VALUES ('87f37845adbb4fba8617670f9c14857a', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 21:05:56');
INSERT INTO `tb_log` VALUES ('88a339efcf8b4a1eb6d1ed8a07eb4df7', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-08 22:13:26');
INSERT INTO `tb_log` VALUES ('891f19892e6c47009f54b4858f42bb19', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-06 20:20:53');
INSERT INTO `tb_log` VALUES ('89c0bc9048104c5d81c279122111e920', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-04 16:34:09');
INSERT INTO `tb_log` VALUES ('8a42f61b50a247ff8f2b249449ec7d47', 'fengjianke', '修改角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 14:54:20');
INSERT INTO `tb_log` VALUES ('8ba00424fe2e44a29bc5186f3b4e3946', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:55:10');
INSERT INTO `tb_log` VALUES ('8bd74d99155b4fee8b37be5e2b55e2b1', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 19:38:26');
INSERT INTO `tb_log` VALUES ('8c40b9b0a70a432e94eb13f03868e85f', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 20:25:48');
INSERT INTO `tb_log` VALUES ('8c4a40ee52f64a719356c7858a304c5c', 'fengjianke', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:43:09');
INSERT INTO `tb_log` VALUES ('8c6f34c662f6417f9a27ce910f842864', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:34:00');
INSERT INTO `tb_log` VALUES ('8d9d1cc8f1974e388863256817b5f2bf', 'guojingyu', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:47:18');
INSERT INTO `tb_log` VALUES ('8e7d1c6b0e254b9186672734a11aed8f', 'guojingyu', '新增用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:34:01');
INSERT INTO `tb_log` VALUES ('8ebfda00e0304df9b4b30e71fa83c905', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:28:10');
INSERT INTO `tb_log` VALUES ('8eee4cf62a7d44ff88a81813d3a420a6', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:18:10');
INSERT INTO `tb_log` VALUES ('8f7e71e765f743cf8ef945d31de0c66b', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 22:13:31');
INSERT INTO `tb_log` VALUES ('8f9d97f61d744d5ea0a600cdf345fa3e', 'guojingyu', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:51:27');
INSERT INTO `tb_log` VALUES ('8fdae399481448aa8eabaccf1f74857e', 'fengjianke', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:16:58');
INSERT INTO `tb_log` VALUES ('9177072c93b24917830fe095822d65a7', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-08-31 17:16:09');
INSERT INTO `tb_log` VALUES ('919042fb32a14058bbeef77572a8ba6c', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-09 22:34:37');
INSERT INTO `tb_log` VALUES ('92b7508a1fc149c29353069867bb4566', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:43:09');
INSERT INTO `tb_log` VALUES ('92da36d0309e46e69e3c43f7b6c982dd', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 21:18:19');
INSERT INTO `tb_log` VALUES ('9379a96d4fa44b4c96d25ad13730e146', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-04 16:38:22');
INSERT INTO `tb_log` VALUES ('93b40455cb8a433098b352ec202f3b0b', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:59:50');
INSERT INTO `tb_log` VALUES ('93c025d790a64fff9e6864fafd22ec46', 'fengjianke', '保存角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 14:39:25');
INSERT INTO `tb_log` VALUES ('9487542c130d46f49be7f8ef4a48f57f', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-04 13:43:33');
INSERT INTO `tb_log` VALUES ('94dd59a22baf4f4382bde6f770c1ef86', 'fengjianke', '编辑角色', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:50:14');
INSERT INTO `tb_log` VALUES ('950f06ff662c4cb99ab8316764a0a497', 'guojingyu', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:48:34');
INSERT INTO `tb_log` VALUES ('9548b5908cf3466b8669a5e5897e6691', 'guojingyu', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:32:48');
INSERT INTO `tb_log` VALUES ('96bdb89d980844258f4f1b37e6339077', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:56:46');
INSERT INTO `tb_log` VALUES ('97879f7590f9450086446d80f03048d0', 'fengjianke', '编辑用户', '系统管理', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-03 11:25:10');
INSERT INTO `tb_log` VALUES ('97de14d1dd584e7b9b1b823c4b6edce2', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 20:27:24');
INSERT INTO `tb_log` VALUES ('97e5c363cefc4c4ab81cd83f4bbcd29d', 'guojingyu', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:31:18');
INSERT INTO `tb_log` VALUES ('982c61eeb62b4c50a9ea765e5d544038', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-06 14:10:22');
INSERT INTO `tb_log` VALUES ('984eab3e1b1c426d9ac3b9a2c486e92e', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 22:08:27');
INSERT INTO `tb_log` VALUES ('98fc1b4560be42c48670249f5e536811', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:24:27');
INSERT INTO `tb_log` VALUES ('990dc32e39a04c1c8b90d5af147f3290', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:16:11');
INSERT INTO `tb_log` VALUES ('9910f3a8fc04479788a16b4ca843826c', 'admin100', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-10 00:35:34');
INSERT INTO `tb_log` VALUES ('99b978aa789445c3bdc0befed02d67fb', 'fengjianke', '保存角色授权', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:24:02');
INSERT INTO `tb_log` VALUES ('9a7a550f27274686aed2d6dde72120e1', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-08 23:10:31');
INSERT INTO `tb_log` VALUES ('9b60ee8f0b524048978723a4e611865a', 'guojingyu', '新增用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 16:38:12');
INSERT INTO `tb_log` VALUES ('9bb1f4a3732e45cfb53d4b7be545f709', 'guojingyu', '保存用户', '系统管理', '用户操作', '0:0:0:0:0:0:0:1', '2018-08-31 16:39:32');
INSERT INTO `tb_log` VALUES ('9c51d72f4fa24feea6823dd77e2da160', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 20:22:18');
INSERT INTO `tb_log` VALUES ('9c7591bce34d4e708f6167b7aa1fc6c1', 'guojingyu', '保存角色授权', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:50:25');
INSERT INTO `tb_log` VALUES ('9c87033ed87240fa9a120f3e968693d5', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:17:40');
INSERT INTO `tb_log` VALUES ('9cd5886c710941d383b23fb331d0f509', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-08 22:17:48');
INSERT INTO `tb_log` VALUES ('9e5090c639814629a2b9594a1ad3c23c', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:44:40');
INSERT INTO `tb_log` VALUES ('9e9a32d2379d45519b0ae8c0c1f01741', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 21:18:40');
INSERT INTO `tb_log` VALUES ('9ecfc80e85514f8aa5ad146c384ca882', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:40:49');
INSERT INTO `tb_log` VALUES ('9ed90e7b3675439490d84351e02b1b10', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 14:37:24');
INSERT INTO `tb_log` VALUES ('9fa5858c5ca344a4a45f9536aa47e9e6', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:19:44');
INSERT INTO `tb_log` VALUES ('9fba57a7c4aa4e9fbabf145f8cccf3af', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:52:17');
INSERT INTO `tb_log` VALUES ('a00c6f40f73140c4b52e84556b8f3bf6', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-01 15:41:49');
INSERT INTO `tb_log` VALUES ('a2356ea1e1fd490eb2d9ce732ac52a80', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 16:47:48');
INSERT INTO `tb_log` VALUES ('a311935596324ee09626805030196976', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 20:30:14');
INSERT INTO `tb_log` VALUES ('a4582c0ab5024e9eb8b077556d57c8da', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 22:04:35');
INSERT INTO `tb_log` VALUES ('a5b331b758fb4f9ebfe60337770a916d', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-03 11:14:55');
INSERT INTO `tb_log` VALUES ('a60ebae0bf9946ca9f3f8be71da2f0fa', 'fengjianke', '修改角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 14:52:33');
INSERT INTO `tb_log` VALUES ('a720070188954acaae947d766754e906', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 19:36:20');
INSERT INTO `tb_log` VALUES ('a82a2997766e45038871e23303a68dec', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:43:07');
INSERT INTO `tb_log` VALUES ('a8a6280e54204b98ac254f9308cd15c8', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 22:34:51');
INSERT INTO `tb_log` VALUES ('a8c64c7257d640de8205a3c454c77e8e', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 21:05:45');
INSERT INTO `tb_log` VALUES ('a8d928d969344b0aacb1c634b0704e2c', 'fengjianke', '编辑角色', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:49:12');
INSERT INTO `tb_log` VALUES ('a9898852ec934a39aca1b39414695016', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-08 23:21:17');
INSERT INTO `tb_log` VALUES ('a9f9a68a14a04e398bfd391242723dec', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 22:23:19');
INSERT INTO `tb_log` VALUES ('aa1ca38af1284918ae0b1d511df6a3f7', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:18:18');
INSERT INTO `tb_log` VALUES ('aaa35e5ed14d404e8089c64e0af28e4d', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:54:22');
INSERT INTO `tb_log` VALUES ('aacb06765bdc49819cfac82153e542a9', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:40:24');
INSERT INTO `tb_log` VALUES ('ab36a96a53af4039804ec63f672aaa65', 'fengjianke', '新增角色', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:14:00');
INSERT INTO `tb_log` VALUES ('ab464d97e0824900bb16e1e2c6158fed', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:27:02');
INSERT INTO `tb_log` VALUES ('ab94e4f32a8d4bf78ca89176d277ab5f', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 22:44:30');
INSERT INTO `tb_log` VALUES ('ac57234ef20a424b99f349795f6e7400', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:36:28');
INSERT INTO `tb_log` VALUES ('ac97342b747748019e2f5cf60ee5d711', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 22:43:37');
INSERT INTO `tb_log` VALUES ('adbbeaf0c2714bf2bd0f5d72000665ae', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 22:39:32');
INSERT INTO `tb_log` VALUES ('add1d4b5b39f4089bf92d2e55271ba66', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:12:13');
INSERT INTO `tb_log` VALUES ('ade814966547403788e809056d69fc53', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:21:11');
INSERT INTO `tb_log` VALUES ('ae3f589db1c14b31bf4a1930ca2807ce', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 20:58:16');
INSERT INTO `tb_log` VALUES ('aeec4b51c3e243ceb4ebd2637d0bbda6', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:38:47');
INSERT INTO `tb_log` VALUES ('af27adc55dcf451b9cd0ab650e065735', 'zhangyin', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:44:25');
INSERT INTO `tb_log` VALUES ('afb1f2296fd34d7985339048e0b7876e', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:37:07');
INSERT INTO `tb_log` VALUES ('afb3b955b936426da76bcca4d65f7ac1', 'fengjianke', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:34:29');
INSERT INTO `tb_log` VALUES ('b07a4fdfe26e48fbb4e9ec125580cb1e', 'guojingyu', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:50:48');
INSERT INTO `tb_log` VALUES ('b0efc7d1fbf7434eae87f8ad881a22cb', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:25:48');
INSERT INTO `tb_log` VALUES ('b146c26449ca4cc08adb29e827068e6a', 'guojingyu', '新增用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:16:12');
INSERT INTO `tb_log` VALUES ('b161895f88b844da8d867fa9212f7c09', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:35:28');
INSERT INTO `tb_log` VALUES ('b2743472dff54f6991fe00285e60c29f', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-04 16:35:19');
INSERT INTO `tb_log` VALUES ('b29ccb38269c49569ccc5f17eb5e4f55', 'fengjianke', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 16:02:09');
INSERT INTO `tb_log` VALUES ('b33798466b994066bd2f3871e3cdd3b3', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:50:34');
INSERT INTO `tb_log` VALUES ('b3664779ae8c41a7aeaf8339bfdf1789', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-07 14:37:22');
INSERT INTO `tb_log` VALUES ('b4284d59006a42e9ba18fc9323d3efca', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-09 22:58:13');
INSERT INTO `tb_log` VALUES ('b4d903d6aebe43fdb686f7605f790c4a', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 14:32:12');
INSERT INTO `tb_log` VALUES ('b5b8b02addd1495094d6416adc8febd8', 'fengjianke', '保存角色授权', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:00:47');
INSERT INTO `tb_log` VALUES ('b736c276c0534c2bb83327c916b151dc', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:11:02');
INSERT INTO `tb_log` VALUES ('b79f29773ae943c389d441e9e21bc670', 'guojingyu', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:15:04');
INSERT INTO `tb_log` VALUES ('b80c9fc4307d4f97a55de3df0cb7b85e', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 16:39:34');
INSERT INTO `tb_log` VALUES ('b8219028469b445ab9bd92b01de03d08', 'fengjianke', '新增用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-03 11:15:31');
INSERT INTO `tb_log` VALUES ('b95abc7c3e7d4346be330edeed7b86b0', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 20:35:17');
INSERT INTO `tb_log` VALUES ('b9c9d337740c4d929c420555245751ee', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 20:54:39');
INSERT INTO `tb_log` VALUES ('b9f07763cefd4585a68eda2a4a3f5f6d', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 20:22:14');
INSERT INTO `tb_log` VALUES ('b9f4bbc5c9cc4d33bd0c323ebfca3b25', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 20:24:04');
INSERT INTO `tb_log` VALUES ('ba6fdc3c7af241b89609563dc86076d5', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 16:02:27');
INSERT INTO `tb_log` VALUES ('ba895ccf74804df0970a336ef6c06955', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-08-31 17:39:13');
INSERT INTO `tb_log` VALUES ('baf571858d0d413d9b577e4da5d04758', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 19:35:41');
INSERT INTO `tb_log` VALUES ('bc342009d775494ca391d5958eadcd40', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 14:05:58');
INSERT INTO `tb_log` VALUES ('bd19df70a4a04bcfbbac9399c8b1586d', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-06 19:28:59');
INSERT INTO `tb_log` VALUES ('bd682e04510147ff87c975877c2c2cc7', 'guojingyu', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-09 23:41:59');
INSERT INTO `tb_log` VALUES ('be634d638c214307b0e47805a0cdaafa', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-08 20:00:31');
INSERT INTO `tb_log` VALUES ('bf6407ccaade4a4a8467c0f2a6d034bf', 'guojingyu', '修改角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-09 23:41:54');
INSERT INTO `tb_log` VALUES ('c022a56bffd94da79ca633ee63125865', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-06 14:38:19');
INSERT INTO `tb_log` VALUES ('c0c21eeb28814f158dc4ba13430875bf', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 20:30:05');
INSERT INTO `tb_log` VALUES ('c0d29ec4a3b546c58fe886b54866c9aa', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 20:48:13');
INSERT INTO `tb_log` VALUES ('c126494f66734a8aaa46e711b3ee5ac9', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:20:19');
INSERT INTO `tb_log` VALUES ('c128f81e8713418fbb3615f6aa06b1d7', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-07 14:43:42');
INSERT INTO `tb_log` VALUES ('c1a6c8465a4e4d58bc470a63549ce429', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-09 23:15:33');
INSERT INTO `tb_log` VALUES ('c241e8bb19da4efc941fabf0fea05473', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-08 22:02:56');
INSERT INTO `tb_log` VALUES ('c265c6ba72de4e04a282febf6d284aad', 'fengjianke', '删除角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 14:30:26');
INSERT INTO `tb_log` VALUES ('c2beed6c0f8043ba8e34f049ef598f7c', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 21:08:29');
INSERT INTO `tb_log` VALUES ('c2d39ee3347c4ed98a0cf7219fe5ad6d', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 20:31:56');
INSERT INTO `tb_log` VALUES ('c2f64f3963d6403196f046bf8cf30d46', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:16:56');
INSERT INTO `tb_log` VALUES ('c35a5f9430c8492280b61266b1d815f0', 'guojingyu', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:51:51');
INSERT INTO `tb_log` VALUES ('c35ab6d1322140b2a7c20ce683731986', 'admin100', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-03 11:28:27');
INSERT INTO `tb_log` VALUES ('c3800b6f83204e18bafe2d570249b70a', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:49:02');
INSERT INTO `tb_log` VALUES ('c3c41409177147d7a19fb9a1a07a3d0c', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-04 16:16:11');
INSERT INTO `tb_log` VALUES ('c3f92aa232f2409aa23310116b274e28', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-07 13:53:49');
INSERT INTO `tb_log` VALUES ('c4536fb75c484e57895a0c176aaa951a', 'guojingyu', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:49:04');
INSERT INTO `tb_log` VALUES ('c48cc4617c7141e19c93f231f80d3adb', 'fengjianke', '新增角色', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:28:38');
INSERT INTO `tb_log` VALUES ('c52c44177af44acb9310d5cc989e0080', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-01 14:05:52');
INSERT INTO `tb_log` VALUES ('c561cabbcfa24401b3a1726dc963f52c', 'admin100', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:42:47');
INSERT INTO `tb_log` VALUES ('c5d168f1995b4e77831c7311e2eb9456', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 22:13:30');
INSERT INTO `tb_log` VALUES ('c6a6a754c910447288692922cabc54e3', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-09 22:23:05');
INSERT INTO `tb_log` VALUES ('c6bc45885ce644eeb100d04f376bb191', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 20:31:52');
INSERT INTO `tb_log` VALUES ('c7bbdc1d6b8a4655ad3a3f86d6d8e6d5', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 20:23:07');
INSERT INTO `tb_log` VALUES ('c7cbaaf154ea4094b562e724a7b0479f', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 20:30:19');
INSERT INTO `tb_log` VALUES ('c814bf14643843cd8c54d4c238d83e5e', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 20:50:08');
INSERT INTO `tb_log` VALUES ('c981e72fe3a84a95a1f2a7fd2c4f8e9a', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-03 11:25:12');
INSERT INTO `tb_log` VALUES ('c9b5848e65fd463a9459272c8f7121ce', 'guojingyu', '新增用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:11:56');
INSERT INTO `tb_log` VALUES ('ca11a042c6d7437f843516eb65fa97f2', 'fengjianke', '新增用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-03 11:14:59');
INSERT INTO `tb_log` VALUES ('ca872f89f117457c85fab15d472856ca', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:38:22');
INSERT INTO `tb_log` VALUES ('cb4f2b9160844da593eacdb248f8035a', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 20:26:52');
INSERT INTO `tb_log` VALUES ('cbbbe8f60c4e495990a2294fea8e68cb', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:39:04');
INSERT INTO `tb_log` VALUES ('cc6413f8abd044249284f9dc0fcc9475', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:51:39');
INSERT INTO `tb_log` VALUES ('cd6bfef839fb43dbb538c82b6ffc4827', 'guojingyu', '保存角色授权', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-10 00:35:26');
INSERT INTO `tb_log` VALUES ('cd7a4e002f3947fdb4e4c24ac9c25878', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:39:15');
INSERT INTO `tb_log` VALUES ('cdd6f4ece881484b87307dbe5de15baa', 'guojingyu', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:42:24');
INSERT INTO `tb_log` VALUES ('cde291bdd24343de8f2f7499090a8678', 'fengjianke', '删除角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 14:52:43');
INSERT INTO `tb_log` VALUES ('cec450b2ea5f409993649d1b08db4322', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 22:58:16');
INSERT INTO `tb_log` VALUES ('cef3730bb9994b37a90719a6b8e0935a', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:20:31');
INSERT INTO `tb_log` VALUES ('d033cc16ed3b4d19be0530b5e058fc7a', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 20:55:28');
INSERT INTO `tb_log` VALUES ('d0a8669015cd416ca3504002e674c2ce', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 13:56:29');
INSERT INTO `tb_log` VALUES ('d100f91f7d18463e97336f6b93b6c6c3', 'guojingyu', '保存角色授权', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-09 23:49:04');
INSERT INTO `tb_log` VALUES ('d17ac6c6f7cb431c89b41f63ed45564c', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:42:17');
INSERT INTO `tb_log` VALUES ('d1f8b1e75b8d4faeae8df935c0684f80', 'guojingyu', '新增用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 16:39:07');
INSERT INTO `tb_log` VALUES ('d24cee2fb6bd4fcab7683bf755096305', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 20:52:52');
INSERT INTO `tb_log` VALUES ('d2841938482e4d1082dee303cda09cf7', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 22:43:42');
INSERT INTO `tb_log` VALUES ('d2ec7adbe7dd4e19998a9b3f1b61d207', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-07 14:13:05');
INSERT INTO `tb_log` VALUES ('d2f919524e5a4dc5b46a92251634759b', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:50:18');
INSERT INTO `tb_log` VALUES ('d34f5c58034d4caea56db37abd9c5823', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-04 13:47:14');
INSERT INTO `tb_log` VALUES ('d496085275aa4ea1846268b68ebd76e6', 'guojingyu', '编辑用户', '系统管理', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-09 23:42:29');
INSERT INTO `tb_log` VALUES ('d5042953282d4143908d61b2bf729221', 'fengjianke', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 15:04:29');
INSERT INTO `tb_log` VALUES ('d50823c16eb346469caeccec0c2ad1b4', 'guojingyu', '保存角色授权', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-09 23:42:13');
INSERT INTO `tb_log` VALUES ('d610066bbda547ff99e66c4e71a710ef', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 20:40:22');
INSERT INTO `tb_log` VALUES ('d621594c689647289df672e04e459772', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 14:44:44');
INSERT INTO `tb_log` VALUES ('d667d2cacca94d118c42637176fdcc5f', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 14:13:41');
INSERT INTO `tb_log` VALUES ('d82ad33b06bd48c69fcfd224e1e376a3', 'guojingyu', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:12:45');
INSERT INTO `tb_log` VALUES ('d899fea020fa46928aefdf371817d579', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-01 16:02:04');
INSERT INTO `tb_log` VALUES ('d8d54528c58d4b16b948930eed55261f', 'fengjianke', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:41:56');
INSERT INTO `tb_log` VALUES ('d9bfafe7a39843cab666d25392862fc3', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-09 22:20:01');
INSERT INTO `tb_log` VALUES ('d9f7dd0391754456830c768246d08300', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-07 14:38:31');
INSERT INTO `tb_log` VALUES ('db9dc1c90c1141e08f795bbb7b131ce9', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 21:14:02');
INSERT INTO `tb_log` VALUES ('dc93134255334de0ba415458a3b784b6', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 20:58:14');
INSERT INTO `tb_log` VALUES ('dcc4a919bad84b19b5d6527d1fe76930', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:41:52');
INSERT INTO `tb_log` VALUES ('dd61c18b7ba64626a66c93ec8a7a3466', 'guojingyu', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:48:37');
INSERT INTO `tb_log` VALUES ('de59ed36ba794355af279351b94fc839', 'admin100', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:49:16');
INSERT INTO `tb_log` VALUES ('de8f1f6bf7c849dea22109431e1d2f1b', 'fengjianke', '保存角色授权', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:28:23');
INSERT INTO `tb_log` VALUES ('de9533039025416ca32925c5713f7c92', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:26:55');
INSERT INTO `tb_log` VALUES ('de9eca6985244d7d8c10b62a13994bb9', 'fengjianke', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-03 11:24:36');
INSERT INTO `tb_log` VALUES ('df04688eef624298bacea52ba4a9d3d6', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-09 23:26:27');
INSERT INTO `tb_log` VALUES ('df6359bb9b1841019b7e27f3c489e3eb', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-03 11:18:06');
INSERT INTO `tb_log` VALUES ('dfc09e0c2954409f9c68cfe20ec3f08b', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:20:38');
INSERT INTO `tb_log` VALUES ('e01f695ea14341af896f8c63874bcc40', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:13:17');
INSERT INTO `tb_log` VALUES ('e07bb771448a40cda33d385537e59b2a', 'zhangyin', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:39:11');
INSERT INTO `tb_log` VALUES ('e18d4c4122dd48b49d61e76298234fc1', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-08 23:52:17');
INSERT INTO `tb_log` VALUES ('e2eb3eda43cf4ae2bc662708c8a18a4d', 'fengjianke', '删除用户', '系统管理', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-01 14:32:05');
INSERT INTO `tb_log` VALUES ('e3247d30d9464868a04b9e5c2eccb4ef', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 21:08:33');
INSERT INTO `tb_log` VALUES ('e3489d7c943245e6a175110335fc7371', 'admin100', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:38:54');
INSERT INTO `tb_log` VALUES ('e34b34e40ffd4f0791e3bea327a005d8', 'admin100', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 23:43:30');
INSERT INTO `tb_log` VALUES ('e35caff08e27462b82650a13d4d32511', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:28:11');
INSERT INTO `tb_log` VALUES ('e43d8559ad38485c9af324884bb12e72', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:25:17');
INSERT INTO `tb_log` VALUES ('e4542a56ccd746f1946acc43983853c1', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:50:42');
INSERT INTO `tb_log` VALUES ('e4ca8673190440bfa2f9f757ac34f4ee', 'fengjianke', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:39:00');
INSERT INTO `tb_log` VALUES ('e58bc6e3f8e941cca9bb32656238d4f8', 'guojingyu', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:50:29');
INSERT INTO `tb_log` VALUES ('e5a502449a264f47a9209ed23c83a38d', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:34:57');
INSERT INTO `tb_log` VALUES ('e5ce75aed0104263864aa874a9badd69', 'fengjianke', '删除角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-06 14:54:04');
INSERT INTO `tb_log` VALUES ('e605754a2dc34397ac54919f182f3f6a', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 20:58:58');
INSERT INTO `tb_log` VALUES ('e6452335871542db9c273ee42827c937', 'guojingyu', '新增用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 16:47:51');
INSERT INTO `tb_log` VALUES ('e6880a76dad74772bcc506d0a5853f57', 'fengjianke', '保存角色授权', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:11:53');
INSERT INTO `tb_log` VALUES ('e6a4ff0e5bea439cb7765246c5de0a0a', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-09 23:05:46');
INSERT INTO `tb_log` VALUES ('e763e9912fda4fdb82fe2fbeb9ce8eb3', 'admin100', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:35:56');
INSERT INTO `tb_log` VALUES ('e7a6f44b9639427c8db78cdb69eb5dbf', 'guojingyu', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:46:16');
INSERT INTO `tb_log` VALUES ('e8681c2585914144983a8cf46f68608d', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 14:34:23');
INSERT INTO `tb_log` VALUES ('e87195ef706c417684996a38eca9541e', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 20:45:37');
INSERT INTO `tb_log` VALUES ('e8ed398d9886458a873803a8a7433c49', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 20:35:20');
INSERT INTO `tb_log` VALUES ('e8fe89d86fb64b868590a1813f4d15e7', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-01 15:10:52');
INSERT INTO `tb_log` VALUES ('e9225d78244743b7a98410f651601164', 'fengjianke', '保存角色授权', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 22:26:10');
INSERT INTO `tb_log` VALUES ('e932fa33b4f640759c640f7b3fcd1bed', 'admin100', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:38:59');
INSERT INTO `tb_log` VALUES ('ea4af8efc22b4ba0a9da5de637dac35b', 'fengjianke', '个人资料', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:39:32');
INSERT INTO `tb_log` VALUES ('eac194265c4c49959f6ba04aa3935d3c', 'admin100', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:36:01');
INSERT INTO `tb_log` VALUES ('eb4b6d0cde2942289821ca7132306e2a', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 20:26:33');
INSERT INTO `tb_log` VALUES ('eb513030cff849e7904620bf19c2bcca', 'guojingyu', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-09 23:41:39');
INSERT INTO `tb_log` VALUES ('ebd26d361dbe4d14961610110c4d6c7a', 'fengjianke', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-04 16:30:53');
INSERT INTO `tb_log` VALUES ('ebee262895234999bce51aa39a3c5d60', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-07 14:33:50');
INSERT INTO `tb_log` VALUES ('ec0e485ac42d4b76bd727c0e5e40539e', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-08-31 17:33:57');
INSERT INTO `tb_log` VALUES ('ed5dbce4e984474189b96fc3f77ad217', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-09 23:59:42');
INSERT INTO `tb_log` VALUES ('ed6d37469486442c8b69b953b55d2a45', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-04 16:41:04');
INSERT INTO `tb_log` VALUES ('ee01384a7fe24e75b698aed91f96d8a7', 'guojingyu', '保存角色授权', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:40:05');
INSERT INTO `tb_log` VALUES ('ee170409f0ff4e19b520bf4ec9d42688', 'fengjianke', '新增角色', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:39:18');
INSERT INTO `tb_log` VALUES ('eea2e55823fb4332aa9dfb696c4d44e4', 'fengjianke', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:36:22');
INSERT INTO `tb_log` VALUES ('efa0740665c84c15bfbb7e746bfafc97', 'fengjianke', '编辑用户', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-01 15:11:50');
INSERT INTO `tb_log` VALUES ('efd605e88e7546e38425a762cb4d81ef', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:23:33');
INSERT INTO `tb_log` VALUES ('f178322d19e24194bce3ae53eea5b811', 'guojingyu', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:25:23');
INSERT INTO `tb_log` VALUES ('f18b8f3f2768405cb021c7a9f336b133', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 21:05:50');
INSERT INTO `tb_log` VALUES ('f26ef5299efe4b49833e3e69ea274a9a', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 20:20:56');
INSERT INTO `tb_log` VALUES ('f2b48252ed5a40b98002957897d3a427', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-07 14:13:02');
INSERT INTO `tb_log` VALUES ('f33297fe67ac47b98ce3001b3b692c4b', 'zhangyin', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 23:39:08');
INSERT INTO `tb_log` VALUES ('f356e244023b467485e358a3664cb665', 'guojingyu', '保存角色授权', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:51:34');
INSERT INTO `tb_log` VALUES ('f4ff34b96da641f7857786e1b41f71ba', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:05:50');
INSERT INTO `tb_log` VALUES ('f52ab81f7b4d4d9a9c9cbe4f7a3bc880', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-09 23:48:31');
INSERT INTO `tb_log` VALUES ('f55cfa280803458183ac82b348774d97', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:10:27');
INSERT INTO `tb_log` VALUES ('f5ebe81931064266b0cf448253a62c71', 'guojingyu', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:49:52');
INSERT INTO `tb_log` VALUES ('f67b3782566e4e25ae7c51219eb726e2', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-07 14:34:15');
INSERT INTO `tb_log` VALUES ('f7137258ff874b65904456716a49f3fa', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:10:38');
INSERT INTO `tb_log` VALUES ('f8879fdb1d2542cd8116f035d2dc4b54', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:28:36');
INSERT INTO `tb_log` VALUES ('f8a3c1e6c2ac4664a2508a28f04d0660', 'fengjianke', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 19:51:18');
INSERT INTO `tb_log` VALUES ('f8dce5a375454527a722eb55e4c847e5', 'fengjianke', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 22:45:36');
INSERT INTO `tb_log` VALUES ('f9213aefd3f44c5a87258398dcae7cf9', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-08-31 16:47:46');
INSERT INTO `tb_log` VALUES ('fb61cb68bbe4464fbd29f5f44bbff8cc', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-08-31 17:40:47');
INSERT INTO `tb_log` VALUES ('fb6b505078024dd0aa69080b44c13ac0', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-06 14:16:19');
INSERT INTO `tb_log` VALUES ('fbbd9d87f1bc4e089d4f5925d2e88e1c', 'guojingyu', '菜单列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:18:13');
INSERT INTO `tb_log` VALUES ('fc2a55d63af247b1b9b13aa952309c70', 'fengjianke', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-08 20:24:00');
INSERT INTO `tb_log` VALUES ('fcacfa9289be4056b8a53832a8ebddda', 'guojingyu', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:25:54');
INSERT INTO `tb_log` VALUES ('fcc979553ace427eb15f2651c4c3e99b', 'zhangyin', '授权角色', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:44:28');
INSERT INTO `tb_log` VALUES ('fd221c562ce04d73912fd6cafddeed0a', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-09-09 23:20:27');
INSERT INTO `tb_log` VALUES ('fd789428479f4093bba2d33312adc4e3', 'fengjianke', '保存角色授权', '系统设置', '用户操作', '0:0:0:0:0:0:0:1', '2018-09-08 23:37:52');
INSERT INTO `tb_log` VALUES ('fe45ebf1cecd49b1994758fa941d9892', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-10 00:27:15');
INSERT INTO `tb_log` VALUES ('fe7f1514e9cb47bb97a168a6ba2e2bef', 'guojingyu', '角色列表', '系统设置', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-09 22:39:04');
INSERT INTO `tb_log` VALUES ('ff8a05f6c80b4b7395566abe7613b248', 'guojingyu', '用户登录', '登录模块', '用户登录', '0:0:0:0:0:0:0:1', '2018-08-31 16:12:22');
INSERT INTO `tb_log` VALUES ('ffaf64d2880f485e8407321299a6aab4', 'guojingyu', '保存用户', '系统管理', '用户操作', '0:0:0:0:0:0:0:1', '2018-08-31 17:05:48');
INSERT INTO `tb_log` VALUES ('ffc20bb23b764f8c8427385e7bf96304', 'fengjianke', '用户列表', '系统管理', '访问页面', '0:0:0:0:0:0:0:1', '2018-09-04 16:16:14');

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `id` char(32) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `type` varchar(50) DEFAULT NULL COMMENT '菜单类型',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单链接',
  `permission` varchar(100) DEFAULT NULL COMMENT '权限',
  `parent_id` char(32) DEFAULT '0' COMMENT '菜单父id',
  `sort` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `external` tinyint(1) unsigned DEFAULT NULL COMMENT '是否外部链接',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '是否可用',
  `icon` varchar(100) DEFAULT NULL COMMENT '菜单图标',
  `create_time` varchar(100) DEFAULT NULL COMMENT '添加时间',
  `update_time` varchar(100) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_resource_parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('12eec0311b924e7295b9ed012c146b1e', '系统管理', '1', '#', null, '0', '1', '0', '1', 'fa fa-cog', '2018-06-26 16:34:47', '2018-06-26 16:34:51');
INSERT INTO `tb_menu` VALUES ('176f429c452a4c25a3d62fdb7046ceee', '角色管理', '2', '/role/roleList.do', 'roles', '12eec0311b924e7295b9ed012c146b1e', '2', '0', '1', 'fa fa-users', '2018-06-26 16:42:04', '2018-06-26 16:42:08');
INSERT INTO `tb_menu` VALUES ('2072c54cf37d4cd7aa89031444b6508b', '编辑菜单', '3', null, 'menu:edit', '64a4e5b75d004e1a88187596416bbac7', '2', '0', '1', null, '2018-06-26 16:45:36', '2018-06-26 16:45:36');
INSERT INTO `tb_menu` VALUES ('24367928751f4785a93207109c43c2df', '公告管理', '2', '/notice/noticeList.do', 'notices', 'e4e9eebc446b4aa1a21d1dfe520071e4', '2', '0', '1', 'fa fa-bell', '2018-06-26 16:51:18', '2018-06-26 16:51:18');
INSERT INTO `tb_menu` VALUES ('3cb404e2ace848f5a10473e63a3912c9', '监控中心', '1', '#', null, '0', '4', '0', '1', 'fa fa-server', '2018-06-26 17:00:47', '2018-06-26 17:00:47');
INSERT INTO `tb_menu` VALUES ('478e761ff7714eba8fec05df3fb73f8b', '新增用户', '3', null, 'user:add', '87f3749f220e4238b2cbe3291f79be9c', '1', '0', '1', null, '2018-06-26 16:45:36', '2018-06-26 16:45:36');
INSERT INTO `tb_menu` VALUES ('4ee8d46653f74758adb4c108f3fa9952', '编辑用户', '3', null, 'user:edit', '87f3749f220e4238b2cbe3291f79be9c', '2', '0', '1', null, '2018-06-26 16:45:36', '2018-06-26 16:45:36');
INSERT INTO `tb_menu` VALUES ('4f369fe5fe4045678f5a59725a182ae0', 'druid监控', '2', '/druid.do', 'druids', '3cb404e2ace848f5a10473e63a3912c9', '1', '0', '1', '&#xe628;', '2018-06-26 17:00:47', '2018-06-26 17:00:47');
INSERT INTO `tb_menu` VALUES ('50f877a1dd024758ad261bc9de636f81', '新增角色', '3', null, 'role:add', '176f429c452a4c25a3d62fdb7046ceee', '1', '0', '1', null, '2018-06-26 16:45:36', '2018-06-26 16:45:36');
INSERT INTO `tb_menu` VALUES ('5213720c2d4b4864831cfe8f4b7c2721', '删除角色', '3', null, 'role:delete', '176f429c452a4c25a3d62fdb7046ceee', '3', '0', '1', null, '2018-06-26 16:45:36', '2018-06-26 16:45:36');
INSERT INTO `tb_menu` VALUES ('64a4e5b75d004e1a88187596416bbac7', '菜单管理', '2', '/menu/menuList.do', 'menus', '12eec0311b924e7295b9ed012c146b1e', '3', '0', '1', 'fa fa-bars', '2018-06-26 16:43:51', '2018-06-26 16:43:51');
INSERT INTO `tb_menu` VALUES ('87619941983d47e7bf5825df037a4e0d', '评论管理', '2', '/comment/commentList.do', 'comments', 'e4e9eebc446b4aa1a21d1dfe520071e4', '1', '0', '1', 'fa fa-commenting', '2018-06-26 16:50:24', '2018-06-26 16:50:24');
INSERT INTO `tb_menu` VALUES ('87f3749f220e4238b2cbe3291f79be9c', '用户管理', '2', '/user/userList.do', 'users', '12eec0311b924e7295b9ed012c146b1e', '1', '0', '1', 'fa fa-user-o', '2018-06-26 16:40:23', '2018-06-26 16:40:23');
INSERT INTO `tb_menu` VALUES ('8dbe8d1e5082446586d2ed8c836127ed', '友情链接', '2', '/link/linkList.do', 'links', 'e4e9eebc446b4aa1a21d1dfe520071e4', '3', '0', '1', 'fa fa-link', '2018-06-26 17:00:47', '2018-06-26 17:00:47');
INSERT INTO `tb_menu` VALUES ('a3337e2a2ba24c439fcb1234d32c6db4', '授权角色', '3', null, 'role:authorize', '176f429c452a4c25a3d62fdb7046ceee', '4', '0', '1', null, '2018-06-26 16:45:36', '2018-06-26 16:45:36');
INSERT INTO `tb_menu` VALUES ('a7663e2c271d46308cd4832eb88afc18', '分类列表', '2', '/type/typeList.do', 'types', 'eddaf4420bf54586a515232ddffa35b4', '2', '0', '1', 'fa fa-th-large', '2018-06-26 16:46:39', '2018-06-26 16:46:39');
INSERT INTO `tb_menu` VALUES ('ad34648974834fee831a145a4a91bd8c', '编辑角色', '3', null, 'role:edit', '176f429c452a4c25a3d62fdb7046ceee', '2', '0', '1', null, '2018-06-26 16:45:36', '2018-06-26 16:45:36');
INSERT INTO `tb_menu` VALUES ('ae39fe7375b341a8ac85f00437c23795', '批量删除菜单', '3', null, 'menu:batchDelete', '64a4e5b75d004e1a88187596416bbac7', '4', '0', '1', null, '2018-06-26 16:45:36', '2018-06-26 16:45:36');
INSERT INTO `tb_menu` VALUES ('ae96ab9af207429ebd5056c60c02f012', '标签列表', '2', '/tag/tagList.do', 'tags', 'eddaf4420bf54586a515232ddffa35b4', '3', '0', '1', 'fa fa-tag', '2018-06-26 16:47:21', '2018-06-26 16:47:21');
INSERT INTO `tb_menu` VALUES ('c485fba406e94cf882db90405ce15c1e', '删除菜单', '3', null, 'menu:delete', '64a4e5b75d004e1a88187596416bbac7', '3', '0', '1', null, '2018-06-26 16:45:36', '2018-06-26 16:45:36');
INSERT INTO `tb_menu` VALUES ('cce8064257a94841a4f0580906ee5a11', '新增菜单', '3', null, 'menu:add', '64a4e5b75d004e1a88187596416bbac7', '1', '0', '1', null, '2018-06-26 16:45:36', '2018-06-26 16:45:36');
INSERT INTO `tb_menu` VALUES ('e4e9eebc446b4aa1a21d1dfe520071e4', '网站管理', '1', '#', null, '0', '3', '0', '1', 'fa fa-globe', '2018-06-26 16:48:20', '2018-06-26 16:48:20');
INSERT INTO `tb_menu` VALUES ('eddaf4420bf54586a515232ddffa35b4', '文章管理', '1', '#', null, '0', '2', '0', '1', 'fa fa-list', '2018-06-26 16:44:40', '2018-06-26 16:44:40');
INSERT INTO `tb_menu` VALUES ('f28a287666744139a854e5691c8f1ea9', '文章列表', '2', '/article/articleList.do', 'articles', 'eddaf4420bf54586a515232ddffa35b4', '1', '0', '1', 'fa fa-file', '2018-06-26 16:45:36', '2018-06-26 16:45:36');
INSERT INTO `tb_menu` VALUES ('faf947ffae4c40f282ce012e9828b932', '删除用户', '3', null, 'user:delete', '87f3749f220e4238b2cbe3291f79be9c', '3', '0', '1', null, '2018-06-26 16:45:36', '2018-06-26 16:45:36');

-- ----------------------------
-- Table structure for tb_notice
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice`;
CREATE TABLE `tb_notice` (
  `id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL COMMENT '被通知的用户ID',
  `status` tinyint(2) DEFAULT NULL COMMENT '通知状态',
  `title` varchar(200) DEFAULT NULL COMMENT '通知的标题',
  `content` varchar(2000) DEFAULT NULL COMMENT '通知的内容',
  `create_time` varchar(100) DEFAULT NULL COMMENT '添加时间',
  `update_time` varchar(100) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_notice
-- ----------------------------

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `id` char(32) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '角色名',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否可用：1可用，0不可用',
  `create_time` varchar(100) DEFAULT NULL COMMENT '添加时间',
  `update_time` varchar(100) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1968e5ba69f64c96810260426e0d880f', '管理员', '普通管理员', '1', '2018-06-30 14:12:03', '2018-06-30 14:12:08');
INSERT INTO `tb_role` VALUES ('19c3fd54ef6d442a9312108316190491', '超级管理员', '系统管理员，拥有最高权限', '1', '2018-06-26 14:12:03', '2018-06-26 14:12:08');
INSERT INTO `tb_role` VALUES ('32879c0d028a4b8a9383f2bcb15b5908', '版主', '虽然不知道干嘛用的', '1', '2018-09-09 23:41:54', '2018-09-09 23:41:54');
INSERT INTO `tb_role` VALUES ('5a3737ed25db4946a7b62f58340ccab9', '博客管理员', '负责维护博客', '1', '2018-09-06 14:54:20', '2018-09-06 14:54:20');

-- ----------------------------
-- Table structure for tb_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_menu`;
CREATE TABLE `tb_role_menu` (
  `id` char(32) NOT NULL,
  `role_id` char(32) NOT NULL COMMENT '角色id',
  `menu_id` char(32) NOT NULL COMMENT '菜单id',
  `create_time` varchar(100) DEFAULT NULL COMMENT '添加时间',
  `update_time` varchar(100) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_role_menu
-- ----------------------------
INSERT INTO `tb_role_menu` VALUES ('085d997fd6ee4ac6adfc88d5803c8c77', '19c3fd54ef6d442a9312108316190491', 'ad34648974834fee831a145a4a91bd8c', '2018-09-08 23:50:23', '2018-09-08 23:50:23');
INSERT INTO `tb_role_menu` VALUES ('226da35470e74e47a28ef98fc5b58ced', '32879c0d028a4b8a9383f2bcb15b5908', '4ee8d46653f74758adb4c108f3fa9952', '2018-09-10 00:35:25', '2018-09-10 00:35:25');
INSERT INTO `tb_role_menu` VALUES ('31a6cb50b34a4a56a84374d3e368794c', '19c3fd54ef6d442a9312108316190491', 'c485fba406e94cf882db90405ce15c1e', '2018-09-08 23:50:24', '2018-09-08 23:50:24');
INSERT INTO `tb_role_menu` VALUES ('33e83ef03f61471ba7ee4b1a7ca1cb68', '19c3fd54ef6d442a9312108316190491', '87619941983d47e7bf5825df037a4e0d', '2018-09-08 23:50:24', '2018-09-08 23:50:24');
INSERT INTO `tb_role_menu` VALUES ('356c9086b84646ef8b96f52aaf0a14e9', '19c3fd54ef6d442a9312108316190491', '8dbe8d1e5082446586d2ed8c836127ed', '2018-09-08 23:50:24', '2018-09-08 23:50:24');
INSERT INTO `tb_role_menu` VALUES ('38114a30b36346878890b441ce96271b', '19c3fd54ef6d442a9312108316190491', 'ae96ab9af207429ebd5056c60c02f012', '2018-09-08 23:50:24', '2018-09-08 23:50:24');
INSERT INTO `tb_role_menu` VALUES ('3a5759873f094c22b11a9caf08f48cb8', '32879c0d028a4b8a9383f2bcb15b5908', '176f429c452a4c25a3d62fdb7046ceee', '2018-09-10 00:35:25', '2018-09-10 00:35:25');
INSERT INTO `tb_role_menu` VALUES ('4580a599e8054e8cb279f79edbcedcc5', '5a3737ed25db4946a7b62f58340ccab9', 'a7663e2c271d46308cd4832eb88afc18', '2018-09-08 23:51:34', '2018-09-08 23:51:34');
INSERT INTO `tb_role_menu` VALUES ('485e57f063e24972bb9e2d04b442f678', '19c3fd54ef6d442a9312108316190491', '176f429c452a4c25a3d62fdb7046ceee', '2018-09-08 23:50:23', '2018-09-08 23:50:23');
INSERT INTO `tb_role_menu` VALUES ('4a421498165b4b89874a99a63114ef9a', '19c3fd54ef6d442a9312108316190491', '24367928751f4785a93207109c43c2df', '2018-09-08 23:50:24', '2018-09-08 23:50:24');
INSERT INTO `tb_role_menu` VALUES ('51a037392d584beb97b96e18be5ea737', '5a3737ed25db4946a7b62f58340ccab9', 'eddaf4420bf54586a515232ddffa35b4', '2018-09-08 23:51:34', '2018-09-08 23:51:34');
INSERT INTO `tb_role_menu` VALUES ('570f729c8b534e4bb57ef1c855789dd7', '19c3fd54ef6d442a9312108316190491', 'f28a287666744139a854e5691c8f1ea9', '2018-09-08 23:50:24', '2018-09-08 23:50:24');
INSERT INTO `tb_role_menu` VALUES ('5f86cb4b6c7a4f59a2651f04ca11fdb2', '19c3fd54ef6d442a9312108316190491', '64a4e5b75d004e1a88187596416bbac7', '2018-09-08 23:50:23', '2018-09-08 23:50:23');
INSERT INTO `tb_role_menu` VALUES ('63d44935efc6417a8a9720815161549a', '19c3fd54ef6d442a9312108316190491', 'eddaf4420bf54586a515232ddffa35b4', '2018-09-08 23:50:24', '2018-09-08 23:50:24');
INSERT INTO `tb_role_menu` VALUES ('6ae8a8a7c5c645d3a79424f4515a42da', '5a3737ed25db4946a7b62f58340ccab9', 'f28a287666744139a854e5691c8f1ea9', '2018-09-08 23:51:34', '2018-09-08 23:51:34');
INSERT INTO `tb_role_menu` VALUES ('76d87891b9954895ba394f9c4b6dc8a8', '1968e5ba69f64c96810260426e0d880f', '12eec0311b924e7295b9ed012c146b1e', '2018-09-08 23:51:24', '2018-09-08 23:51:24');
INSERT INTO `tb_role_menu` VALUES ('7a53ad4ec50d4d7fb547cf0cc20cebbb', '19c3fd54ef6d442a9312108316190491', '3cb404e2ace848f5a10473e63a3912c9', '2018-09-08 23:50:24', '2018-09-08 23:50:24');
INSERT INTO `tb_role_menu` VALUES ('7aa56e903a7443449cc6bad9a06863c5', '32879c0d028a4b8a9383f2bcb15b5908', '64a4e5b75d004e1a88187596416bbac7', '2018-09-10 00:35:25', '2018-09-10 00:35:25');
INSERT INTO `tb_role_menu` VALUES ('7ad562e4e6a34eecbd762fb8b0ec758e', '19c3fd54ef6d442a9312108316190491', '2072c54cf37d4cd7aa89031444b6508b', '2018-09-08 23:50:24', '2018-09-08 23:50:24');
INSERT INTO `tb_role_menu` VALUES ('7c1c555fc9ca4d74b24a843a8d3190c6', '1968e5ba69f64c96810260426e0d880f', 'faf947ffae4c40f282ce012e9828b932', '2018-09-08 23:51:24', '2018-09-08 23:51:24');
INSERT INTO `tb_role_menu` VALUES ('80aacfcddebc4e198f30344339dcf956', '32879c0d028a4b8a9383f2bcb15b5908', '478e761ff7714eba8fec05df3fb73f8b', '2018-09-10 00:35:25', '2018-09-10 00:35:25');
INSERT INTO `tb_role_menu` VALUES ('825c3336f7594851a124afd35c74bf59', '19c3fd54ef6d442a9312108316190491', '478e761ff7714eba8fec05df3fb73f8b', '2018-09-08 23:50:23', '2018-09-08 23:50:23');
INSERT INTO `tb_role_menu` VALUES ('84194b666dbc44ff970bfde2f5a9f721', '5a3737ed25db4946a7b62f58340ccab9', 'ae96ab9af207429ebd5056c60c02f012', '2018-09-08 23:51:34', '2018-09-08 23:51:34');
INSERT INTO `tb_role_menu` VALUES ('8603ba08e04c417a95dc041e6de2d1c1', '19c3fd54ef6d442a9312108316190491', '12eec0311b924e7295b9ed012c146b1e', '2018-09-08 23:50:23', '2018-09-08 23:50:23');
INSERT INTO `tb_role_menu` VALUES ('87757f80b46b4ebe981dee92cc21cf2c', '19c3fd54ef6d442a9312108316190491', '50f877a1dd024758ad261bc9de636f81', '2018-09-08 23:50:23', '2018-09-08 23:50:23');
INSERT INTO `tb_role_menu` VALUES ('895edc6c099d45a4a6647c5a12650b61', '19c3fd54ef6d442a9312108316190491', 'faf947ffae4c40f282ce012e9828b932', '2018-09-08 23:50:23', '2018-09-08 23:50:23');
INSERT INTO `tb_role_menu` VALUES ('92231c8dd6fa41cf9d815a6cca47e5e6', '32879c0d028a4b8a9383f2bcb15b5908', '12eec0311b924e7295b9ed012c146b1e', '2018-09-10 00:35:25', '2018-09-10 00:35:25');
INSERT INTO `tb_role_menu` VALUES ('950d656d785749d4bf306f62ef392859', '1968e5ba69f64c96810260426e0d880f', '478e761ff7714eba8fec05df3fb73f8b', '2018-09-08 23:51:24', '2018-09-08 23:51:24');
INSERT INTO `tb_role_menu` VALUES ('a3414fca7cfe46d2b4a49c24ae95687d', '19c3fd54ef6d442a9312108316190491', '4ee8d46653f74758adb4c108f3fa9952', '2018-09-08 23:50:23', '2018-09-08 23:50:23');
INSERT INTO `tb_role_menu` VALUES ('a74d23e60295485c81b5c3f0a16e6c30', '19c3fd54ef6d442a9312108316190491', 'a7663e2c271d46308cd4832eb88afc18', '2018-09-08 23:50:24', '2018-09-08 23:50:24');
INSERT INTO `tb_role_menu` VALUES ('b1992c107ec94d1189f04c6b4a105241', '1968e5ba69f64c96810260426e0d880f', '4ee8d46653f74758adb4c108f3fa9952', '2018-09-08 23:51:24', '2018-09-08 23:51:24');
INSERT INTO `tb_role_menu` VALUES ('bb1504cc3e74447f980eef94f8b3a5a3', '19c3fd54ef6d442a9312108316190491', '4f369fe5fe4045678f5a59725a182ae0', '2018-09-08 23:50:24', '2018-09-08 23:50:24');
INSERT INTO `tb_role_menu` VALUES ('c28f871aead646d1bd4794c5b68fd8dc', '1968e5ba69f64c96810260426e0d880f', '87f3749f220e4238b2cbe3291f79be9c', '2018-09-08 23:51:24', '2018-09-08 23:51:24');
INSERT INTO `tb_role_menu` VALUES ('c3739e23b1a5410680538dd3823cef26', '19c3fd54ef6d442a9312108316190491', '5213720c2d4b4864831cfe8f4b7c2721', '2018-09-08 23:50:23', '2018-09-08 23:50:23');
INSERT INTO `tb_role_menu` VALUES ('c5b6aca4196e424492769e37d594dd45', '19c3fd54ef6d442a9312108316190491', 'e4e9eebc446b4aa1a21d1dfe520071e4', '2018-09-08 23:50:24', '2018-09-08 23:50:24');
INSERT INTO `tb_role_menu` VALUES ('d84937e9410b4432abaedcdeef8fb632', '19c3fd54ef6d442a9312108316190491', 'cce8064257a94841a4f0580906ee5a11', '2018-09-08 23:50:23', '2018-09-08 23:50:23');
INSERT INTO `tb_role_menu` VALUES ('dad8521c15fc427ba1742f059413910b', '19c3fd54ef6d442a9312108316190491', 'a3337e2a2ba24c439fcb1234d32c6db4', '2018-09-08 23:50:23', '2018-09-08 23:50:23');
INSERT INTO `tb_role_menu` VALUES ('ddef338383e8447a87191eb08993e5c0', '19c3fd54ef6d442a9312108316190491', '87f3749f220e4238b2cbe3291f79be9c', '2018-09-08 23:50:23', '2018-09-08 23:50:23');
INSERT INTO `tb_role_menu` VALUES ('e9ab64b21808406c9b3c1ef449a1c81b', '32879c0d028a4b8a9383f2bcb15b5908', '87f3749f220e4238b2cbe3291f79be9c', '2018-09-10 00:35:25', '2018-09-10 00:35:25');
INSERT INTO `tb_role_menu` VALUES ('ef51efe3871d4e139bb7970cacb99961', '32879c0d028a4b8a9383f2bcb15b5908', 'faf947ffae4c40f282ce012e9828b932', '2018-09-10 00:35:25', '2018-09-10 00:35:25');
INSERT INTO `tb_role_menu` VALUES ('fc3f6096fb3f4a6686219301d95fe860', '19c3fd54ef6d442a9312108316190491', 'ae39fe7375b341a8ac85f00437c23795', '2018-09-08 23:50:24', '2018-09-08 23:50:24');

-- ----------------------------
-- Table structure for tb_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_config`;
CREATE TABLE `tb_sys_config` (
  `id` char(32) NOT NULL,
  `home_desc` varchar(255) DEFAULT NULL COMMENT '首页描述',
  `home_keywords` varchar(255) DEFAULT NULL COMMENT '首页关键字',
  `domain` varchar(255) DEFAULT NULL COMMENT '根域名',
  `site_url` varchar(255) DEFAULT NULL COMMENT '网站地址',
  `site_name` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `site_desc` varchar(255) DEFAULT NULL COMMENT '站点描述',
  `site_favicon` varchar(255) DEFAULT NULL COMMENT '站点LOGO',
  `static_web_site` varchar(255) DEFAULT NULL COMMENT '资源文件（js、css等的路径）',
  `author_name` varchar(100) DEFAULT NULL COMMENT '站长名称',
  `author_email` varchar(100) DEFAULT NULL COMMENT '站长邮箱',
  `qq` varchar(255) DEFAULT NULL COMMENT 'QQ',
  `weibo` varchar(255) DEFAULT NULL COMMENT '微博',
  `comment` tinyint(1) unsigned DEFAULT '1' COMMENT '是否开启评论:1开启，0不开启',
  `create_time` varchar(100) DEFAULT NULL COMMENT '添加时间',
  `update_time` varchar(100) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_sys_config
-- ----------------------------

-- ----------------------------
-- Table structure for tb_tags
-- ----------------------------
DROP TABLE IF EXISTS `tb_tags`;
CREATE TABLE `tb_tags` (
  `id` char(32) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '书签名',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_time` varchar(100) DEFAULT NULL COMMENT '添加时间',
  `update_time` varchar(100) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_tags
-- ----------------------------

-- ----------------------------
-- Table structure for tb_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_type`;
CREATE TABLE `tb_type` (
  `id` char(32) NOT NULL,
  `pid` char(32) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '文章类型名',
  `description` varchar(200) DEFAULT NULL COMMENT '类型介绍',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '是否可用',
  `create_time` varchar(100) DEFAULT NULL COMMENT '添加时间',
  `update_time` varchar(100) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_type
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` char(32) NOT NULL,
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '登录密码',
  `nickname` varchar(30) DEFAULT '' COMMENT '昵称',
  `mobile` varchar(30) DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `qq` varchar(20) DEFAULT NULL COMMENT 'QQ',
  `birthday` varchar(100) DEFAULT NULL COMMENT '生日',
  `gender` tinyint(2) unsigned DEFAULT NULL COMMENT '性别:1男，2女',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `company` varchar(100) DEFAULT NULL COMMENT '公司',
  `blog` varchar(255) DEFAULT NULL COMMENT '个人博客地址',
  `location` varchar(255) DEFAULT NULL COMMENT '地址',
  `source` enum('GITHUB','WEIBO','QQ','ZHYD') DEFAULT 'ZHYD' COMMENT '用户来源(默认ZHYD=本网站注册用户)',
  `privacy` tinyint(1) DEFAULT NULL COMMENT '隐私（1：公开，0：不公开）',
  `notification` tinyint(1) unsigned DEFAULT NULL COMMENT '通知：(1：通知显示消息详情，2：通知不显示详情)',
  `score` int(10) unsigned DEFAULT '0' COMMENT '金币值',
  `experience` int(10) unsigned DEFAULT '0' COMMENT '经验值',
  `reg_ip` varchar(30) DEFAULT NULL COMMENT '注册IP',
  `last_login_ip` varchar(30) DEFAULT NULL COMMENT '最近登录IP',
  `last_login_time` varchar(100) DEFAULT NULL COMMENT '最近登录时间',
  `login_count` int(10) unsigned DEFAULT '0' COMMENT '登录次数',
  `remark` varchar(100) DEFAULT NULL COMMENT '用户备注',
  `status` tinyint(1) DEFAULT NULL COMMENT '用户状态：1启用，0禁用',
  `create_time` varchar(100) DEFAULT NULL COMMENT '注册时间',
  `update_time` varchar(100) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ck_username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('b03840956b6b4fe8af018eded5fc07cb', 'guojingyu', 'OzOob9+JHU9MIIShmFNT5g==', '郭靖宇', '13721549833', 'gmh0612@163.com', '974691001', '1994-06-12', '1', 'http://www.itaka.top/group1/M00/00/00/rBCOOVuIEk-AHwcSAALfi1p0EVA819.jpg?0.8253788568882827', '南京欣网互联网络科技有限公司', 'www.itaka.top/blog', '南京市浦口区威尼斯水城', 'ZHYD', '0', '1', '5', '5', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '2018-09-09 23:59:42', '210', '哈哈哈哈哈哈', '1', '2018-06-20 22:01:07', '2018-09-09 23:59:42');
INSERT INTO `tb_user` VALUES ('bbd64af879c34c299ec6d9218fb57146', 'zhangyin', 'OzOob9+JHU9MIIShmFNT5g==', '张印', '15044088483', '1325887925@qq.com', '1325887925', '1994-05-24', '1', 'http://www.itaka.top/group1/M00/00/00/rBCOOVuI1vSAIAV8AAD_WKdVZKk408.jpg', '不知道什么公司', '没有', '127.0.0.1:8080', null, null, null, '0', '10', null, '0:0:0:0:0:0:0:1', '2018-09-08 23:40:21', '2', '一个逗比web前端', '1', '2018-08-31 17:16:35', '2018-09-08 23:40:21');
INSERT INTO `tb_user` VALUES ('edb7d0fe8ef94038896d5a018b1deac0', 'fengjianke', 'OzOob9+JHU9MIIShmFNT5g==', '冯建可', '13321331233', '2276102241@qq.com', '2276102241', '1994-05-27', '1', 'http://www.itaka.top/group1/M00/00/00/rBCOOVuI1vSAIAV8AAD_WKdVZKk408.jpg', '不知道什么公司', '', '', null, null, null, '0', '10', null, '0:0:0:0:0:0:0:1', '2018-09-08 23:52:17', '24', '欣网最佳员工', '1', '2018-08-31 17:35:42', '2018-09-08 23:52:17');
INSERT INTO `tb_user` VALUES ('3c8c27830ab940d49e91b9abbd75ff06', 'admin100', 'OzOob9+JHU9MIIShmFNT5g==', '系统管理员', '13721549833', 'admin@163.com', '974691001', '1994-06-12', '1', 'http://www.itaka.top/group1/M00/00/00/rBCOOVuI1vSAIAV8AAD_WKdVZKk408.jpg', '博彦科技有限公司', '', '', null, null, null, '0', '10', null, '0:0:0:0:0:0:0:1', '2018-09-10 00:35:34', '4', '高级开发经理', '1', '2018-09-03 11:18:03', '2018-09-10 00:35:34');

-- ----------------------------
-- Table structure for tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role` (
  `id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL COMMENT '用户id',
  `role_id` char(32) NOT NULL COMMENT '角色id',
  `create_time` varchar(100) DEFAULT NULL COMMENT '添加时间',
  `update_time` varchar(100) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_user_role
-- ----------------------------
INSERT INTO `tb_user_role` VALUES ('2c0a60ee19bb40ff81270681c02b66cf', 'b03840956b6b4fe8af018eded5fc07cb', '19c3fd54ef6d442a9312108316190491', '2018-06-26 14:14:53', '2018-06-26 14:14:56');
INSERT INTO `tb_user_role` VALUES ('2e5063ada9b14429b7d061e84f09d7b9', 'b03840956b6b4fe8af018eded5fc07cb', '1968e5ba69f64c96810260426e0d880f', '2018-06-26 14:14:53', '2018-06-26 14:14:56');
INSERT INTO `tb_user_role` VALUES ('8c1bacdfcc554163bfea33770974d549', 'bbd64af879c34c299ec6d9218fb57146', '5a3737ed25db4946a7b62f58340ccab9', '2018-09-08 23:38:45', '2018-09-08 23:38:45');
INSERT INTO `tb_user_role` VALUES ('a1445987ec4b4a3e97371e9b6bd136f0', 'edb7d0fe8ef94038896d5a018b1deac0', '5a3737ed25db4946a7b62f58340ccab9', '2018-09-08 23:52:03', '2018-09-08 23:52:03');
INSERT INTO `tb_user_role` VALUES ('eb31a503c0484caf8bb3c12348b7a655', '3c8c27830ab940d49e91b9abbd75ff06', '32879c0d028a4b8a9383f2bcb15b5908', '2018-09-09 23:42:29', '2018-09-09 23:42:29');
