/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : unicmf

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 24/05/2020 07:47:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cmf_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `cmf_admin_menu`;
CREATE TABLE `cmf_admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父菜单id',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT 10000 COMMENT '排序',
  `app` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `controller`(`controller`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 332 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后台菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_admin_menu
-- ----------------------------
INSERT INTO `cmf_admin_menu` VALUES (1, 0, 0, 1, 20, 'admin', 'Plugin', 'default', '', '插件中心', 'cloud', '插件中心');
INSERT INTO `cmf_admin_menu` VALUES (2, 1, 1, 1, 10000, 'admin', 'Hook', 'index', '', '钩子管理', '', '钩子管理');
INSERT INTO `cmf_admin_menu` VALUES (3, 2, 1, 0, 10000, 'admin', 'Hook', 'plugins', '', '钩子插件管理', '', '钩子插件管理');
INSERT INTO `cmf_admin_menu` VALUES (4, 2, 2, 0, 10000, 'admin', 'Hook', 'pluginListOrder', '', '钩子插件排序', '', '钩子插件排序');
INSERT INTO `cmf_admin_menu` VALUES (5, 2, 1, 0, 10000, 'admin', 'Hook', 'sync', '', '同步钩子', '', '同步钩子');
INSERT INTO `cmf_admin_menu` VALUES (6, 0, 0, 1, 0, 'admin', 'Setting', 'default', '', '设置', 'cogs', '系统设置入口');
INSERT INTO `cmf_admin_menu` VALUES (7, 6, 1, 1, 50, 'admin', 'Link', 'index', '', '友情链接', '', '友情链接管理');
INSERT INTO `cmf_admin_menu` VALUES (8, 7, 1, 0, 10000, 'admin', 'Link', 'add', '', '添加友情链接', '', '添加友情链接');
INSERT INTO `cmf_admin_menu` VALUES (9, 7, 2, 0, 10000, 'admin', 'Link', 'addPost', '', '添加友情链接提交保存', '', '添加友情链接提交保存');
INSERT INTO `cmf_admin_menu` VALUES (10, 7, 1, 0, 10000, 'admin', 'Link', 'edit', '', '编辑友情链接', '', '编辑友情链接');
INSERT INTO `cmf_admin_menu` VALUES (11, 7, 2, 0, 10000, 'admin', 'Link', 'editPost', '', '编辑友情链接提交保存', '', '编辑友情链接提交保存');
INSERT INTO `cmf_admin_menu` VALUES (12, 7, 2, 0, 10000, 'admin', 'Link', 'delete', '', '删除友情链接', '', '删除友情链接');
INSERT INTO `cmf_admin_menu` VALUES (13, 7, 2, 0, 10000, 'admin', 'Link', 'listOrder', '', '友情链接排序', '', '友情链接排序');
INSERT INTO `cmf_admin_menu` VALUES (14, 7, 2, 0, 10000, 'admin', 'Link', 'toggle', '', '友情链接显示隐藏', '', '友情链接显示隐藏');
INSERT INTO `cmf_admin_menu` VALUES (15, 6, 1, 1, 10, 'admin', 'Mailer', 'index', '', '邮箱配置', '', '邮箱配置');
INSERT INTO `cmf_admin_menu` VALUES (16, 15, 2, 0, 10000, 'admin', 'Mailer', 'indexPost', '', '邮箱配置提交保存', '', '邮箱配置提交保存');
INSERT INTO `cmf_admin_menu` VALUES (17, 15, 1, 0, 10000, 'admin', 'Mailer', 'template', '', '邮件模板', '', '邮件模板');
INSERT INTO `cmf_admin_menu` VALUES (18, 15, 2, 0, 10000, 'admin', 'Mailer', 'templatePost', '', '邮件模板提交', '', '邮件模板提交');
INSERT INTO `cmf_admin_menu` VALUES (19, 15, 1, 0, 10000, 'admin', 'Mailer', 'test', '', '邮件发送测试', '', '邮件发送测试');
INSERT INTO `cmf_admin_menu` VALUES (20, 6, 1, 0, 10000, 'admin', 'Menu', 'index', '', '后台菜单', '', '后台菜单管理');
INSERT INTO `cmf_admin_menu` VALUES (21, 20, 1, 0, 10000, 'admin', 'Menu', 'lists', '', '所有菜单', '', '后台所有菜单列表');
INSERT INTO `cmf_admin_menu` VALUES (22, 20, 1, 0, 10000, 'admin', 'Menu', 'add', '', '后台菜单添加', '', '后台菜单添加');
INSERT INTO `cmf_admin_menu` VALUES (23, 20, 2, 0, 10000, 'admin', 'Menu', 'addPost', '', '后台菜单添加提交保存', '', '后台菜单添加提交保存');
INSERT INTO `cmf_admin_menu` VALUES (24, 20, 1, 0, 10000, 'admin', 'Menu', 'edit', '', '后台菜单编辑', '', '后台菜单编辑');
INSERT INTO `cmf_admin_menu` VALUES (25, 20, 2, 0, 10000, 'admin', 'Menu', 'editPost', '', '后台菜单编辑提交保存', '', '后台菜单编辑提交保存');
INSERT INTO `cmf_admin_menu` VALUES (26, 20, 2, 0, 10000, 'admin', 'Menu', 'delete', '', '后台菜单删除', '', '后台菜单删除');
INSERT INTO `cmf_admin_menu` VALUES (27, 20, 2, 0, 10000, 'admin', 'Menu', 'listOrder', '', '后台菜单排序', '', '后台菜单排序');
INSERT INTO `cmf_admin_menu` VALUES (28, 20, 1, 0, 10000, 'admin', 'Menu', 'getActions', '', '导入新后台菜单', '', '导入新后台菜单');
INSERT INTO `cmf_admin_menu` VALUES (29, 6, 1, 1, 30, 'admin', 'Nav', 'index', '', '导航管理', '', '导航管理');
INSERT INTO `cmf_admin_menu` VALUES (30, 29, 1, 0, 10000, 'admin', 'Nav', 'add', '', '添加导航', '', '添加导航');
INSERT INTO `cmf_admin_menu` VALUES (31, 29, 2, 0, 10000, 'admin', 'Nav', 'addPost', '', '添加导航提交保存', '', '添加导航提交保存');
INSERT INTO `cmf_admin_menu` VALUES (32, 29, 1, 0, 10000, 'admin', 'Nav', 'edit', '', '编辑导航', '', '编辑导航');
INSERT INTO `cmf_admin_menu` VALUES (33, 29, 2, 0, 10000, 'admin', 'Nav', 'editPost', '', '编辑导航提交保存', '', '编辑导航提交保存');
INSERT INTO `cmf_admin_menu` VALUES (34, 29, 2, 0, 10000, 'admin', 'Nav', 'delete', '', '删除导航', '', '删除导航');
INSERT INTO `cmf_admin_menu` VALUES (35, 29, 1, 0, 10000, 'admin', 'NavMenu', 'index', '', '导航菜单', '', '导航菜单');
INSERT INTO `cmf_admin_menu` VALUES (36, 35, 1, 0, 10000, 'admin', 'NavMenu', 'add', '', '添加导航菜单', '', '添加导航菜单');
INSERT INTO `cmf_admin_menu` VALUES (37, 35, 2, 0, 10000, 'admin', 'NavMenu', 'addPost', '', '添加导航菜单提交保存', '', '添加导航菜单提交保存');
INSERT INTO `cmf_admin_menu` VALUES (38, 35, 1, 0, 10000, 'admin', 'NavMenu', 'edit', '', '编辑导航菜单', '', '编辑导航菜单');
INSERT INTO `cmf_admin_menu` VALUES (39, 35, 2, 0, 10000, 'admin', 'NavMenu', 'editPost', '', '编辑导航菜单提交保存', '', '编辑导航菜单提交保存');
INSERT INTO `cmf_admin_menu` VALUES (40, 35, 2, 0, 10000, 'admin', 'NavMenu', 'delete', '', '删除导航菜单', '', '删除导航菜单');
INSERT INTO `cmf_admin_menu` VALUES (41, 35, 2, 0, 10000, 'admin', 'NavMenu', 'listOrder', '', '导航菜单排序', '', '导航菜单排序');
INSERT INTO `cmf_admin_menu` VALUES (42, 1, 1, 1, 10000, 'admin', 'Plugin', 'index', '', '插件列表', '', '插件列表');
INSERT INTO `cmf_admin_menu` VALUES (43, 42, 2, 0, 10000, 'admin', 'Plugin', 'toggle', '', '插件启用禁用', '', '插件启用禁用');
INSERT INTO `cmf_admin_menu` VALUES (44, 42, 1, 0, 10000, 'admin', 'Plugin', 'setting', '', '插件设置', '', '插件设置');
INSERT INTO `cmf_admin_menu` VALUES (45, 42, 2, 0, 10000, 'admin', 'Plugin', 'settingPost', '', '插件设置提交', '', '插件设置提交');
INSERT INTO `cmf_admin_menu` VALUES (46, 42, 2, 0, 10000, 'admin', 'Plugin', 'install', '', '插件安装', '', '插件安装');
INSERT INTO `cmf_admin_menu` VALUES (47, 42, 2, 0, 10000, 'admin', 'Plugin', 'update', '', '插件更新', '', '插件更新');
INSERT INTO `cmf_admin_menu` VALUES (48, 42, 2, 0, 10000, 'admin', 'Plugin', 'uninstall', '', '卸载插件', '', '卸载插件');
INSERT INTO `cmf_admin_menu` VALUES (49, 110, 0, 1, 10000, 'admin', 'User', 'default', '', '管理组', '', '管理组');
INSERT INTO `cmf_admin_menu` VALUES (50, 49, 1, 1, 10000, 'admin', 'Rbac', 'index', '', '角色管理', '', '角色管理');
INSERT INTO `cmf_admin_menu` VALUES (51, 50, 1, 0, 10000, 'admin', 'Rbac', 'roleAdd', '', '添加角色', '', '添加角色');
INSERT INTO `cmf_admin_menu` VALUES (52, 50, 2, 0, 10000, 'admin', 'Rbac', 'roleAddPost', '', '添加角色提交', '', '添加角色提交');
INSERT INTO `cmf_admin_menu` VALUES (53, 50, 1, 0, 10000, 'admin', 'Rbac', 'roleEdit', '', '编辑角色', '', '编辑角色');
INSERT INTO `cmf_admin_menu` VALUES (54, 50, 2, 0, 10000, 'admin', 'Rbac', 'roleEditPost', '', '编辑角色提交', '', '编辑角色提交');
INSERT INTO `cmf_admin_menu` VALUES (55, 50, 2, 0, 10000, 'admin', 'Rbac', 'roleDelete', '', '删除角色', '', '删除角色');
INSERT INTO `cmf_admin_menu` VALUES (56, 50, 1, 0, 10000, 'admin', 'Rbac', 'authorize', '', '设置角色权限', '', '设置角色权限');
INSERT INTO `cmf_admin_menu` VALUES (57, 50, 2, 0, 10000, 'admin', 'Rbac', 'authorizePost', '', '角色授权提交', '', '角色授权提交');
INSERT INTO `cmf_admin_menu` VALUES (58, 0, 1, 0, 10000, 'admin', 'RecycleBin', 'index', '', '回收站', '', '回收站');
INSERT INTO `cmf_admin_menu` VALUES (59, 58, 2, 0, 10000, 'admin', 'RecycleBin', 'restore', '', '回收站还原', '', '回收站还原');
INSERT INTO `cmf_admin_menu` VALUES (60, 58, 2, 0, 10000, 'admin', 'RecycleBin', 'delete', '', '回收站彻底删除', '', '回收站彻底删除');
INSERT INTO `cmf_admin_menu` VALUES (61, 6, 1, 1, 10000, 'admin', 'Route', 'index', '', 'URL美化', '', 'URL规则管理');
INSERT INTO `cmf_admin_menu` VALUES (62, 61, 1, 0, 10000, 'admin', 'Route', 'add', '', '添加路由规则', '', '添加路由规则');
INSERT INTO `cmf_admin_menu` VALUES (63, 61, 2, 0, 10000, 'admin', 'Route', 'addPost', '', '添加路由规则提交', '', '添加路由规则提交');
INSERT INTO `cmf_admin_menu` VALUES (64, 61, 1, 0, 10000, 'admin', 'Route', 'edit', '', '路由规则编辑', '', '路由规则编辑');
INSERT INTO `cmf_admin_menu` VALUES (65, 61, 2, 0, 10000, 'admin', 'Route', 'editPost', '', '路由规则编辑提交', '', '路由规则编辑提交');
INSERT INTO `cmf_admin_menu` VALUES (66, 61, 2, 0, 10000, 'admin', 'Route', 'delete', '', '路由规则删除', '', '路由规则删除');
INSERT INTO `cmf_admin_menu` VALUES (67, 61, 2, 0, 10000, 'admin', 'Route', 'ban', '', '路由规则禁用', '', '路由规则禁用');
INSERT INTO `cmf_admin_menu` VALUES (68, 61, 2, 0, 10000, 'admin', 'Route', 'open', '', '路由规则启用', '', '路由规则启用');
INSERT INTO `cmf_admin_menu` VALUES (69, 61, 2, 0, 10000, 'admin', 'Route', 'listOrder', '', '路由规则排序', '', '路由规则排序');
INSERT INTO `cmf_admin_menu` VALUES (70, 61, 1, 0, 10000, 'admin', 'Route', 'select', '', '选择URL', '', '选择URL');
INSERT INTO `cmf_admin_menu` VALUES (71, 6, 1, 1, 0, 'admin', 'Setting', 'site', '', '网站信息', '', '网站信息');
INSERT INTO `cmf_admin_menu` VALUES (72, 71, 2, 0, 10000, 'admin', 'Setting', 'sitePost', '', '网站信息设置提交', '', '网站信息设置提交');
INSERT INTO `cmf_admin_menu` VALUES (73, 6, 1, 0, 10000, 'admin', 'Setting', 'password', '', '密码修改', '', '密码修改');
INSERT INTO `cmf_admin_menu` VALUES (74, 73, 2, 0, 10000, 'admin', 'Setting', 'passwordPost', '', '密码修改提交', '', '密码修改提交');
INSERT INTO `cmf_admin_menu` VALUES (75, 6, 1, 1, 10000, 'admin', 'Setting', 'upload', '', '上传设置', '', '上传设置');
INSERT INTO `cmf_admin_menu` VALUES (76, 75, 2, 0, 10000, 'admin', 'Setting', 'uploadPost', '', '上传设置提交', '', '上传设置提交');
INSERT INTO `cmf_admin_menu` VALUES (77, 6, 1, 0, 10000, 'admin', 'Setting', 'clearCache', '', '清除缓存', '', '清除缓存');
INSERT INTO `cmf_admin_menu` VALUES (78, 6, 1, 1, 40, 'admin', 'Slide', 'index', '', '幻灯片管理', '', '幻灯片管理');
INSERT INTO `cmf_admin_menu` VALUES (79, 78, 1, 0, 10000, 'admin', 'Slide', 'add', '', '添加幻灯片', '', '添加幻灯片');
INSERT INTO `cmf_admin_menu` VALUES (80, 78, 2, 0, 10000, 'admin', 'Slide', 'addPost', '', '添加幻灯片提交', '', '添加幻灯片提交');
INSERT INTO `cmf_admin_menu` VALUES (81, 78, 1, 0, 10000, 'admin', 'Slide', 'edit', '', '编辑幻灯片', '', '编辑幻灯片');
INSERT INTO `cmf_admin_menu` VALUES (82, 78, 2, 0, 10000, 'admin', 'Slide', 'editPost', '', '编辑幻灯片提交', '', '编辑幻灯片提交');
INSERT INTO `cmf_admin_menu` VALUES (83, 78, 2, 0, 10000, 'admin', 'Slide', 'delete', '', '删除幻灯片', '', '删除幻灯片');
INSERT INTO `cmf_admin_menu` VALUES (84, 78, 1, 0, 10000, 'admin', 'SlideItem', 'index', '', '幻灯片页面列表', '', '幻灯片页面列表');
INSERT INTO `cmf_admin_menu` VALUES (85, 84, 1, 0, 10000, 'admin', 'SlideItem', 'add', '', '幻灯片页面添加', '', '幻灯片页面添加');
INSERT INTO `cmf_admin_menu` VALUES (86, 84, 2, 0, 10000, 'admin', 'SlideItem', 'addPost', '', '幻灯片页面添加提交', '', '幻灯片页面添加提交');
INSERT INTO `cmf_admin_menu` VALUES (87, 84, 1, 0, 10000, 'admin', 'SlideItem', 'edit', '', '幻灯片页面编辑', '', '幻灯片页面编辑');
INSERT INTO `cmf_admin_menu` VALUES (88, 84, 2, 0, 10000, 'admin', 'SlideItem', 'editPost', '', '幻灯片页面编辑提交', '', '幻灯片页面编辑提交');
INSERT INTO `cmf_admin_menu` VALUES (89, 84, 2, 0, 10000, 'admin', 'SlideItem', 'delete', '', '幻灯片页面删除', '', '幻灯片页面删除');
INSERT INTO `cmf_admin_menu` VALUES (90, 84, 2, 0, 10000, 'admin', 'SlideItem', 'ban', '', '幻灯片页面隐藏', '', '幻灯片页面隐藏');
INSERT INTO `cmf_admin_menu` VALUES (91, 84, 2, 0, 10000, 'admin', 'SlideItem', 'cancelBan', '', '幻灯片页面显示', '', '幻灯片页面显示');
INSERT INTO `cmf_admin_menu` VALUES (92, 84, 2, 0, 10000, 'admin', 'SlideItem', 'listOrder', '', '幻灯片页面排序', '', '幻灯片页面排序');
INSERT INTO `cmf_admin_menu` VALUES (93, 6, 1, 1, 10000, 'admin', 'Storage', 'index', '', '文件存储', '', '文件存储');
INSERT INTO `cmf_admin_menu` VALUES (94, 93, 2, 0, 10000, 'admin', 'Storage', 'settingPost', '', '文件存储设置提交', '', '文件存储设置提交');
INSERT INTO `cmf_admin_menu` VALUES (95, 6, 1, 1, 20, 'admin', 'Theme', 'index', '', '模板管理', '', '模板管理');
INSERT INTO `cmf_admin_menu` VALUES (96, 95, 1, 0, 10000, 'admin', 'Theme', 'install', '', '安装模板', '', '安装模板');
INSERT INTO `cmf_admin_menu` VALUES (97, 95, 2, 0, 10000, 'admin', 'Theme', 'uninstall', '', '卸载模板', '', '卸载模板');
INSERT INTO `cmf_admin_menu` VALUES (98, 95, 2, 0, 10000, 'admin', 'Theme', 'installTheme', '', '模板安装', '', '模板安装');
INSERT INTO `cmf_admin_menu` VALUES (99, 95, 2, 0, 10000, 'admin', 'Theme', 'update', '', '模板更新', '', '模板更新');
INSERT INTO `cmf_admin_menu` VALUES (100, 95, 2, 0, 10000, 'admin', 'Theme', 'active', '', '启用模板', '', '启用模板');
INSERT INTO `cmf_admin_menu` VALUES (101, 95, 1, 0, 10000, 'admin', 'Theme', 'files', '', '模板文件列表', '', '启用模板');
INSERT INTO `cmf_admin_menu` VALUES (102, 95, 1, 0, 10000, 'admin', 'Theme', 'fileSetting', '', '模板文件设置', '', '模板文件设置');
INSERT INTO `cmf_admin_menu` VALUES (103, 95, 1, 0, 10000, 'admin', 'Theme', 'fileArrayData', '', '模板文件数组数据列表', '', '模板文件数组数据列表');
INSERT INTO `cmf_admin_menu` VALUES (104, 95, 2, 0, 10000, 'admin', 'Theme', 'fileArrayDataEdit', '', '模板文件数组数据添加编辑', '', '模板文件数组数据添加编辑');
INSERT INTO `cmf_admin_menu` VALUES (105, 95, 2, 0, 10000, 'admin', 'Theme', 'fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '', '模板文件数组数据添加编辑提交保存');
INSERT INTO `cmf_admin_menu` VALUES (106, 95, 2, 0, 10000, 'admin', 'Theme', 'fileArrayDataDelete', '', '模板文件数组数据删除', '', '模板文件数组数据删除');
INSERT INTO `cmf_admin_menu` VALUES (107, 95, 2, 0, 10000, 'admin', 'Theme', 'settingPost', '', '模板文件编辑提交保存', '', '模板文件编辑提交保存');
INSERT INTO `cmf_admin_menu` VALUES (108, 95, 1, 0, 10000, 'admin', 'Theme', 'dataSource', '', '模板文件设置数据源', '', '模板文件设置数据源');
INSERT INTO `cmf_admin_menu` VALUES (109, 95, 1, 0, 10000, 'admin', 'Theme', 'design', '', '模板设计', '', '模板设计');
INSERT INTO `cmf_admin_menu` VALUES (110, 0, 0, 1, 10, 'user', 'AdminIndex', 'default', '', '用户管理', 'group', '用户管理');
INSERT INTO `cmf_admin_menu` VALUES (111, 49, 1, 1, 10000, 'admin', 'User', 'index', '', '管理员', '', '管理员管理');
INSERT INTO `cmf_admin_menu` VALUES (112, 111, 1, 0, 10000, 'admin', 'User', 'add', '', '管理员添加', '', '管理员添加');
INSERT INTO `cmf_admin_menu` VALUES (113, 111, 2, 0, 10000, 'admin', 'User', 'addPost', '', '管理员添加提交', '', '管理员添加提交');
INSERT INTO `cmf_admin_menu` VALUES (114, 111, 1, 0, 10000, 'admin', 'User', 'edit', '', '管理员编辑', '', '管理员编辑');
INSERT INTO `cmf_admin_menu` VALUES (115, 111, 2, 0, 10000, 'admin', 'User', 'editPost', '', '管理员编辑提交', '', '管理员编辑提交');
INSERT INTO `cmf_admin_menu` VALUES (116, 111, 1, 0, 10000, 'admin', 'User', 'userInfo', '', '个人信息', '', '管理员个人信息修改');
INSERT INTO `cmf_admin_menu` VALUES (117, 111, 2, 0, 10000, 'admin', 'User', 'userInfoPost', '', '管理员个人信息修改提交', '', '管理员个人信息修改提交');
INSERT INTO `cmf_admin_menu` VALUES (118, 111, 2, 0, 10000, 'admin', 'User', 'delete', '', '管理员删除', '', '管理员删除');
INSERT INTO `cmf_admin_menu` VALUES (119, 111, 2, 0, 10000, 'admin', 'User', 'ban', '', '停用管理员', '', '停用管理员');
INSERT INTO `cmf_admin_menu` VALUES (120, 111, 2, 0, 10000, 'admin', 'User', 'cancelBan', '', '启用管理员', '', '启用管理员');
INSERT INTO `cmf_admin_menu` VALUES (121, 0, 1, 0, 10000, 'user', 'AdminAsset', 'index', '', '资源管理', 'file', '资源管理列表');
INSERT INTO `cmf_admin_menu` VALUES (122, 121, 2, 0, 10000, 'user', 'AdminAsset', 'delete', '', '删除文件', '', '删除文件');
INSERT INTO `cmf_admin_menu` VALUES (123, 110, 0, 1, 10000, 'user', 'AdminIndex', 'default1', '', '用户组', '', '用户组');
INSERT INTO `cmf_admin_menu` VALUES (124, 123, 1, 1, 10000, 'user', 'AdminIndex', 'index', '', '本站用户', '', '本站用户');
INSERT INTO `cmf_admin_menu` VALUES (125, 124, 2, 0, 10000, 'user', 'AdminIndex', 'ban', '', '本站用户拉黑', '', '本站用户拉黑');
INSERT INTO `cmf_admin_menu` VALUES (126, 124, 2, 0, 10000, 'user', 'AdminIndex', 'cancelBan', '', '本站用户启用', '', '本站用户启用');
INSERT INTO `cmf_admin_menu` VALUES (127, 123, 1, 1, 10000, 'user', 'AdminOauth', 'index', '', '第三方用户', '', '第三方用户');
INSERT INTO `cmf_admin_menu` VALUES (128, 127, 2, 0, 10000, 'user', 'AdminOauth', 'delete', '', '删除第三方用户绑定', '', '删除第三方用户绑定');
INSERT INTO `cmf_admin_menu` VALUES (129, 6, 1, 1, 10000, 'user', 'AdminUserAction', 'index', '', '用户操作管理', '', '用户操作管理');
INSERT INTO `cmf_admin_menu` VALUES (130, 129, 1, 0, 10000, 'user', 'AdminUserAction', 'edit', '', '编辑用户操作', '', '编辑用户操作');
INSERT INTO `cmf_admin_menu` VALUES (131, 129, 2, 0, 10000, 'user', 'AdminUserAction', 'editPost', '', '编辑用户操作提交', '', '编辑用户操作提交');
INSERT INTO `cmf_admin_menu` VALUES (132, 129, 1, 0, 10000, 'user', 'AdminUserAction', 'sync', '', '同步用户操作', '', '同步用户操作');
INSERT INTO `cmf_admin_menu` VALUES (162, 0, 0, 1, 30, 'portal', 'AdminIndex', 'default', '', '门户管理', 'th', '门户管理');
INSERT INTO `cmf_admin_menu` VALUES (163, 162, 1, 1, 10000, 'portal', 'AdminArticle', 'index', '', '文章管理', '', '文章列表');
INSERT INTO `cmf_admin_menu` VALUES (164, 163, 1, 0, 10000, 'portal', 'AdminArticle', 'add', '', '添加文章', '', '添加文章');
INSERT INTO `cmf_admin_menu` VALUES (165, 163, 2, 0, 10000, 'portal', 'AdminArticle', 'addPost', '', '添加文章提交', '', '添加文章提交');
INSERT INTO `cmf_admin_menu` VALUES (166, 163, 1, 0, 10000, 'portal', 'AdminArticle', 'edit', '', '编辑文章', '', '编辑文章');
INSERT INTO `cmf_admin_menu` VALUES (167, 163, 2, 0, 10000, 'portal', 'AdminArticle', 'editPost', '', '编辑文章提交', '', '编辑文章提交');
INSERT INTO `cmf_admin_menu` VALUES (168, 163, 2, 0, 10000, 'portal', 'AdminArticle', 'delete', '', '文章删除', '', '文章删除');
INSERT INTO `cmf_admin_menu` VALUES (169, 163, 2, 0, 10000, 'portal', 'AdminArticle', 'publish', '', '文章发布', '', '文章发布');
INSERT INTO `cmf_admin_menu` VALUES (170, 163, 2, 0, 10000, 'portal', 'AdminArticle', 'top', '', '文章置顶', '', '文章置顶');
INSERT INTO `cmf_admin_menu` VALUES (171, 163, 2, 0, 10000, 'portal', 'AdminArticle', 'recommend', '', '文章推荐', '', '文章推荐');
INSERT INTO `cmf_admin_menu` VALUES (172, 163, 2, 0, 10000, 'portal', 'AdminArticle', 'listOrder', '', '文章排序', '', '文章排序');
INSERT INTO `cmf_admin_menu` VALUES (173, 162, 1, 1, 10000, 'portal', 'AdminCategory', 'index', '', '分类管理', '', '文章分类列表');
INSERT INTO `cmf_admin_menu` VALUES (174, 173, 1, 0, 10000, 'portal', 'AdminCategory', 'add', '', '添加文章分类', '', '添加文章分类');
INSERT INTO `cmf_admin_menu` VALUES (175, 173, 2, 0, 10000, 'portal', 'AdminCategory', 'addPost', '', '添加文章分类提交', '', '添加文章分类提交');
INSERT INTO `cmf_admin_menu` VALUES (176, 173, 1, 0, 10000, 'portal', 'AdminCategory', 'edit', '', '编辑文章分类', '', '编辑文章分类');
INSERT INTO `cmf_admin_menu` VALUES (177, 173, 2, 0, 10000, 'portal', 'AdminCategory', 'editPost', '', '编辑文章分类提交', '', '编辑文章分类提交');
INSERT INTO `cmf_admin_menu` VALUES (178, 173, 1, 0, 10000, 'portal', 'AdminCategory', 'select', '', '文章分类选择对话框', '', '文章分类选择对话框');
INSERT INTO `cmf_admin_menu` VALUES (179, 173, 2, 0, 10000, 'portal', 'AdminCategory', 'listOrder', '', '文章分类排序', '', '文章分类排序');
INSERT INTO `cmf_admin_menu` VALUES (180, 173, 2, 0, 10000, 'portal', 'AdminCategory', 'toggle', '', '文章分类显示隐藏', '', '文章分类显示隐藏');
INSERT INTO `cmf_admin_menu` VALUES (181, 173, 2, 0, 10000, 'portal', 'AdminCategory', 'delete', '', '删除文章分类', '', '删除文章分类');
INSERT INTO `cmf_admin_menu` VALUES (182, 162, 1, 1, 10000, 'portal', 'AdminPage', 'index', '', '页面管理', '', '页面管理');
INSERT INTO `cmf_admin_menu` VALUES (183, 182, 1, 0, 10000, 'portal', 'AdminPage', 'add', '', '添加页面', '', '添加页面');
INSERT INTO `cmf_admin_menu` VALUES (184, 182, 2, 0, 10000, 'portal', 'AdminPage', 'addPost', '', '添加页面提交', '', '添加页面提交');
INSERT INTO `cmf_admin_menu` VALUES (185, 182, 1, 0, 10000, 'portal', 'AdminPage', 'edit', '', '编辑页面', '', '编辑页面');
INSERT INTO `cmf_admin_menu` VALUES (186, 182, 2, 0, 10000, 'portal', 'AdminPage', 'editPost', '', '编辑页面提交', '', '编辑页面提交');
INSERT INTO `cmf_admin_menu` VALUES (187, 182, 2, 0, 10000, 'portal', 'AdminPage', 'delete', '', '删除页面', '', '删除页面');
INSERT INTO `cmf_admin_menu` VALUES (188, 162, 1, 1, 10000, 'portal', 'AdminTag', 'index', '', '文章标签', '', '文章标签');
INSERT INTO `cmf_admin_menu` VALUES (189, 188, 1, 0, 10000, 'portal', 'AdminTag', 'add', '', '添加文章标签', '', '添加文章标签');
INSERT INTO `cmf_admin_menu` VALUES (190, 188, 2, 0, 10000, 'portal', 'AdminTag', 'addPost', '', '添加文章标签提交', '', '添加文章标签提交');
INSERT INTO `cmf_admin_menu` VALUES (191, 188, 2, 0, 10000, 'portal', 'AdminTag', 'upStatus', '', '更新标签状态', '', '更新标签状态');
INSERT INTO `cmf_admin_menu` VALUES (192, 188, 2, 0, 10000, 'portal', 'AdminTag', 'delete', '', '删除文章标签', '', '删除文章标签');
INSERT INTO `cmf_admin_menu` VALUES (193, 0, 0, 1, 30, 'car', 'AdminIndex', 'default', '', '车辆管理', 'car', '车辆管理');
INSERT INTO `cmf_admin_menu` VALUES (194, 193, 0, 1, 10021, 'car', 'AdminAttribute', 'default', '', '设置', 'th', '设置');
INSERT INTO `cmf_admin_menu` VALUES (195, 194, 0, 1, 30, 'car', 'AdminCarAgeRange', 'index', '', '车龄范围设置', 'age', '车龄范围设置');
INSERT INTO `cmf_admin_menu` VALUES (196, 195, 1, 0, 10000, 'car', 'AdminCarAgeRange', 'add', '', '添加车标签', '', '添加车标签');
INSERT INTO `cmf_admin_menu` VALUES (197, 195, 2, 0, 10000, 'car', 'AdminCarAgeRange', 'addPost', '', '添加车龄提交', '', '添加车龄提交');
INSERT INTO `cmf_admin_menu` VALUES (198, 195, 2, 0, 10000, 'car', 'AdminCarAgeRange', 'upStatus', '', '更新车龄状态', '', '更新车龄状态');
INSERT INTO `cmf_admin_menu` VALUES (199, 195, 2, 0, 10000, 'car', 'AdminCarAgeRange', 'delete', '', '删除车龄', '', '删除车龄');
INSERT INTO `cmf_admin_menu` VALUES (200, 195, 1, 0, 10000, 'car', 'AdminCarAgeRange', 'select', '', '车龄选择对话框', '', '车龄选择对话框');
INSERT INTO `cmf_admin_menu` VALUES (201, 195, 2, 0, 10000, 'car', 'AdminCarAgeRange', 'listOrder', '', '车龄范围排序', '', '车龄范围排序');
INSERT INTO `cmf_admin_menu` VALUES (202, 194, 0, 1, 1000, 'car', 'AdminCarArea', 'index', '', '地区设置', 'age', '地区设置');
INSERT INTO `cmf_admin_menu` VALUES (203, 202, 1, 0, 10000, 'car', 'AdminCarArea', 'add', '', '添加车地区', '', '添加车地区');
INSERT INTO `cmf_admin_menu` VALUES (204, 202, 2, 0, 10000, 'car', 'AdminCarArea', 'addPost', '', '添加车地区提交', '', '添加车地区提交');
INSERT INTO `cmf_admin_menu` VALUES (205, 202, 1, 0, 10000, 'car', 'AdminCarArea', 'edit', '', '编辑车地区', '', '编辑车地区');
INSERT INTO `cmf_admin_menu` VALUES (206, 202, 2, 0, 10000, 'car', 'AdminCarArea', 'editElement', '', '编辑车地区提交', '', '编辑车地区提交');
INSERT INTO `cmf_admin_menu` VALUES (207, 202, 1, 0, 10000, 'car', 'AdminCarArea', 'select', '', '车地区选择对话框', '', '车地区选择对话框');
INSERT INTO `cmf_admin_menu` VALUES (208, 202, 2, 0, 10000, 'car', 'AdminCarArea', 'listOrder', '', '车地区排序', '', '车地区排序');
INSERT INTO `cmf_admin_menu` VALUES (209, 202, 2, 0, 10000, 'car', 'AdminCarArea', 'toggle', '', '车地区显示隐藏', '', '车地区显示隐藏');
INSERT INTO `cmf_admin_menu` VALUES (210, 202, 2, 0, 10000, 'car', 'AdminCarArea', 'delete', '', '删除车地区', '', '删除车地区');
INSERT INTO `cmf_admin_menu` VALUES (211, 193, 1, 1, 10000, 'car', 'AdminCarBrand', 'index', '', '品牌管理', '', '车品牌列表');
INSERT INTO `cmf_admin_menu` VALUES (212, 211, 1, 0, 10000, 'car', 'AdminCarBrand', 'add', '', '添加车品牌', '', '添加车品牌');
INSERT INTO `cmf_admin_menu` VALUES (213, 211, 2, 0, 10000, 'car', 'AdminCarBrand', 'addPost', '', '添加车品牌提交', '', '添加车品牌提交');
INSERT INTO `cmf_admin_menu` VALUES (214, 211, 1, 0, 10000, 'car', 'AdminCarBrand', 'edit', '', '编辑车品牌', '', '编辑车品牌');
INSERT INTO `cmf_admin_menu` VALUES (215, 211, 2, 0, 10000, 'car', 'AdminCarBrand', 'editPost', '', '编辑车品牌提交', '', '编辑车品牌提交');
INSERT INTO `cmf_admin_menu` VALUES (216, 211, 1, 0, 10000, 'car', 'AdminCarBrand', 'select', '', '车品牌选择对话框', '', '车品牌选择对话框');
INSERT INTO `cmf_admin_menu` VALUES (217, 211, 2, 0, 10000, 'car', 'AdminCarBrand', 'listOrder', '', '车品牌排序', '', '车品牌排序');
INSERT INTO `cmf_admin_menu` VALUES (218, 211, 2, 0, 10000, 'car', 'AdminCarBrand', 'toggle', '', '车品牌显示隐藏', '', '车品牌显示隐藏');
INSERT INTO `cmf_admin_menu` VALUES (219, 211, 2, 0, 10000, 'car', 'AdminCarBrand', 'delete', '', '删除车品牌', '', '删除车品牌');
INSERT INTO `cmf_admin_menu` VALUES (220, 194, 0, 1, 1000, 'car', 'AdminCarColor', 'index', '', '颜色设置', 'age', '颜色设置');
INSERT INTO `cmf_admin_menu` VALUES (221, 220, 1, 0, 10000, 'car', 'AdminCarColor', 'add', '', '添加颜色', '', '添加颜色');
INSERT INTO `cmf_admin_menu` VALUES (222, 220, 2, 0, 10000, 'car', 'AdminCarColor', 'addPost', '', '添加颜色', '', '添加颜色');
INSERT INTO `cmf_admin_menu` VALUES (223, 220, 2, 0, 10000, 'car', 'AdminCarColor', 'upStatus', '', '更新颜色', '', '更新颜色');
INSERT INTO `cmf_admin_menu` VALUES (224, 220, 2, 0, 10000, 'car', 'AdminCarColor', 'delete', '', '删除颜色', '', '删除颜色');
INSERT INTO `cmf_admin_menu` VALUES (225, 220, 1, 0, 10000, 'car', 'AdminCarColor', 'select', '', '车颜色选择对话框', '', '车颜色选择对话框');
INSERT INTO `cmf_admin_menu` VALUES (226, 220, 2, 0, 10000, 'car', 'AdminCarColor', 'listOrder', '', '车颜色排序', '', '车颜色排序');
INSERT INTO `cmf_admin_menu` VALUES (227, 194, 0, 1, 1000, 'car', 'AdminCarCountry', 'index', '', '国别设置', 'age', '国别设置');
INSERT INTO `cmf_admin_menu` VALUES (228, 227, 1, 0, 10000, 'car', 'AdminCarCountry', 'add', '', '国别设置', '', '添加颜色');
INSERT INTO `cmf_admin_menu` VALUES (229, 227, 2, 0, 10000, 'car', 'AdminCarCountry', 'addPost', '', '国别设置', '', '国别设置');
INSERT INTO `cmf_admin_menu` VALUES (230, 227, 2, 0, 10000, 'car', 'AdminCarCountry', 'upStatus', '', '国别设置', '', '国别设置');
INSERT INTO `cmf_admin_menu` VALUES (231, 227, 2, 0, 10000, 'car', 'AdminCarCountry', 'delete', '', '删除国别', '', '删除国别');
INSERT INTO `cmf_admin_menu` VALUES (232, 227, 1, 0, 10000, 'car', 'AdminCarCountry', 'select', '', '车国别选择对话框', '', '车国别选择对话框');
INSERT INTO `cmf_admin_menu` VALUES (233, 227, 2, 0, 10000, 'car', 'AdminCarCountry', 'listOrder', '', '车国别排序', '', '车国别排序');
INSERT INTO `cmf_admin_menu` VALUES (234, 194, 0, 1, 30, 'car', 'AdminCarDisplacementRange', 'index', '', '排量范围设置', 'age', '排量范围设置');
INSERT INTO `cmf_admin_menu` VALUES (235, 234, 1, 0, 10000, 'car', 'AdminCarDisplacementRange', 'add', '', '添加排量', '', '添加排量');
INSERT INTO `cmf_admin_menu` VALUES (236, 234, 2, 0, 10000, 'car', 'AdminCarDisplacementRange', 'addPost', '', '添加排量', '', '添加排量');
INSERT INTO `cmf_admin_menu` VALUES (237, 234, 2, 0, 10000, 'car', 'AdminCarDisplacementRange', 'upStatus', '', '更新排量', '', '更新排量');
INSERT INTO `cmf_admin_menu` VALUES (238, 234, 2, 0, 10000, 'car', 'AdminCarDisplacementRange', 'delete', '', '删除排量', '', '删除排量');
INSERT INTO `cmf_admin_menu` VALUES (239, 234, 1, 0, 10000, 'car', 'AdminCarDisplacementRange', 'select', '', '车排量选择对话框', '', '车排量选择对话框');
INSERT INTO `cmf_admin_menu` VALUES (240, 234, 2, 0, 10000, 'car', 'AdminCarDisplacementRange', 'listOrder', '', '车排量排序', '', '车排量排序');
INSERT INTO `cmf_admin_menu` VALUES (241, 194, 0, 1, 1000, 'car', 'AdminCarEmissionStandard', 'index', '', '排放标准设置', 'age', '排放标准设置');
INSERT INTO `cmf_admin_menu` VALUES (242, 241, 1, 0, 10000, 'car', 'AdminCarEmissionStandard', 'add', '', '添加排放标准', '', '添加排放标准');
INSERT INTO `cmf_admin_menu` VALUES (243, 241, 2, 0, 10000, 'car', 'AdminCarEmissionStandard', 'addPost', '', '添加排放标准', '', '添加排放标准');
INSERT INTO `cmf_admin_menu` VALUES (244, 241, 2, 0, 10000, 'car', 'AdminCarEmissionStandard', 'upStatus', '', '更新排放标准', '', '更新排放标准');
INSERT INTO `cmf_admin_menu` VALUES (245, 241, 2, 0, 10000, 'car', 'AdminCarEmissionStandard', 'delete', '', '删除排放标准', '', '删除排放标准');
INSERT INTO `cmf_admin_menu` VALUES (246, 241, 1, 0, 10000, 'car', 'AdminCarEmissionStandard', 'select', '', '车排放标准选择对话框', '', '车排放标准选择对话框');
INSERT INTO `cmf_admin_menu` VALUES (247, 241, 2, 0, 10000, 'car', 'AdminCarEmissionStandard', 'listOrder', '', '车排放标准排序', '', '车排放标准排序');
INSERT INTO `cmf_admin_menu` VALUES (248, 194, 0, 1, 1000, 'car', 'AdminCarEnergy', 'index', '', '能源设置', 'age', '能源设置');
INSERT INTO `cmf_admin_menu` VALUES (249, 248, 1, 0, 10000, 'car', 'AdminCarEnergy', 'add', '', '添加能源', '', '添加能源');
INSERT INTO `cmf_admin_menu` VALUES (250, 248, 2, 0, 10000, 'car', 'AdminCarEnergy', 'addPost', '', '添加能源', '', '添加能源');
INSERT INTO `cmf_admin_menu` VALUES (251, 248, 2, 0, 10000, 'car', 'AdminCarEnergy', 'upStatus', '', '更新能源', '', '更新能源');
INSERT INTO `cmf_admin_menu` VALUES (252, 248, 2, 0, 10000, 'car', 'AdminCarEnergy', 'delete', '', '删除车能源', '', '删除车能源能源');
INSERT INTO `cmf_admin_menu` VALUES (253, 248, 1, 0, 10000, 'car', 'AdminCarEnergy', 'select', '', '车能源选择对话框', '', '车能源选择对话框');
INSERT INTO `cmf_admin_menu` VALUES (254, 248, 2, 0, 10000, 'car', 'AdminCarEnergy', 'listOrder', '', '车能源排序', '', '车能源排序');
INSERT INTO `cmf_admin_menu` VALUES (255, 194, 0, 1, 1000, 'car', 'AdminCarEngine', 'index', '', '发动机设置', 'age', '发动机设置');
INSERT INTO `cmf_admin_menu` VALUES (256, 255, 1, 0, 10000, 'car', 'AdminCarEngine', 'add', '', '添加发动机', '', '添加发动机');
INSERT INTO `cmf_admin_menu` VALUES (257, 255, 2, 0, 10000, 'car', 'AdminCarEngine', 'addPost', '', '添加发动机', '', '添加发动机');
INSERT INTO `cmf_admin_menu` VALUES (258, 255, 2, 0, 10000, 'car', 'AdminCarEngine', 'upStatus', '', '更新发动机', '', '更新发动机');
INSERT INTO `cmf_admin_menu` VALUES (259, 255, 2, 0, 10000, 'car', 'AdminCarEngine', 'delete', '', '删除车发动机', '', '删除车发动机');
INSERT INTO `cmf_admin_menu` VALUES (260, 255, 1, 0, 10000, 'car', 'AdminCarEngine', 'select', '', '车发动机选择对话框', '', '车发动机选择对话框');
INSERT INTO `cmf_admin_menu` VALUES (261, 255, 2, 0, 10000, 'car', 'AdminCarEngine', 'listOrder', '', '车发动机排序', '', '车发动机排序');
INSERT INTO `cmf_admin_menu` VALUES (262, 194, 0, 1, 1000, 'car', 'AdminCarGearbox', 'index', '', '变速箱设置', 'age', '变速箱设置');
INSERT INTO `cmf_admin_menu` VALUES (263, 262, 1, 0, 10000, 'car', 'AdminCarGearbox', 'add', '', '变速箱设置', '', '添加变速箱');
INSERT INTO `cmf_admin_menu` VALUES (264, 262, 2, 0, 10000, 'car', 'AdminCarGearbox', 'addPost', '', '变速箱设置', '', '国别设置');
INSERT INTO `cmf_admin_menu` VALUES (265, 262, 2, 0, 10000, 'car', 'AdminCarGearbox', 'upStatus', '', '变速箱设置', '', '变速箱设置');
INSERT INTO `cmf_admin_menu` VALUES (266, 262, 2, 0, 10000, 'car', 'AdminCarGearbox', 'delete', '', '删除变速箱', '', '删除变速箱');
INSERT INTO `cmf_admin_menu` VALUES (267, 262, 1, 0, 10000, 'car', 'AdminCarGearbox', 'select', '', '车变速箱选择对话框', '', '车变速箱选择对话框');
INSERT INTO `cmf_admin_menu` VALUES (268, 262, 2, 0, 10000, 'car', 'AdminCarGearbox', 'listOrder', '', '车变速箱排序', '', '车变速箱排序');
INSERT INTO `cmf_admin_menu` VALUES (269, 194, 0, 1, 1000, 'car', 'AdminCarLevel', 'index', '', '车级别设置', 'age', '车级别设置');
INSERT INTO `cmf_admin_menu` VALUES (270, 269, 1, 0, 10000, 'car', 'AdminCarLevel', 'add', '', '添加车级别', '', '添加车级别');
INSERT INTO `cmf_admin_menu` VALUES (271, 269, 2, 0, 10000, 'car', 'AdminCarLevel', 'addPost', '', '添加车级别', '', '添加车级别');
INSERT INTO `cmf_admin_menu` VALUES (272, 269, 2, 0, 10000, 'car', 'AdminCarLevel', 'upStatus', '', '更新车级别', '', '更新车级别');
INSERT INTO `cmf_admin_menu` VALUES (273, 269, 2, 0, 10000, 'car', 'AdminCarLevel', 'delete', '', '删除车级别', '', '删除车级别');
INSERT INTO `cmf_admin_menu` VALUES (274, 269, 1, 0, 10000, 'car', 'AdminCarLevel', 'select', '', '车级别选择对话框', '', '车级别选择对话框');
INSERT INTO `cmf_admin_menu` VALUES (275, 269, 2, 0, 10000, 'car', 'AdminCarLevel', 'listOrder', '', '车级别排序', '', '车级别排序');
INSERT INTO `cmf_admin_menu` VALUES (276, 194, 0, 1, 1000, 'car', 'AdminCarLightspot', 'index', '', '亮点设置', 'th', '亮点设置');
INSERT INTO `cmf_admin_menu` VALUES (277, 276, 1, 0, 10000, 'car', 'AdminCarLightspot', 'add', '', '添加亮点', '', '添加亮点');
INSERT INTO `cmf_admin_menu` VALUES (278, 276, 2, 0, 10000, 'car', 'AdminCarLightspot', 'addPost', '', '添加亮点', '', '添加亮点');
INSERT INTO `cmf_admin_menu` VALUES (279, 276, 2, 0, 10000, 'car', 'AdminCarLightspot', 'upStatus', '', '更新亮点', '', '更新亮点');
INSERT INTO `cmf_admin_menu` VALUES (280, 276, 2, 0, 10000, 'car', 'AdminCarLightspot', 'delete', '', '删除亮点', '', '删除亮点');
INSERT INTO `cmf_admin_menu` VALUES (281, 276, 1, 0, 10000, 'car', 'AdminCarLightspot', 'select', '', '车亮点选择对话框', '', '车亮点选择对话框');
INSERT INTO `cmf_admin_menu` VALUES (282, 276, 2, 0, 10000, 'car', 'AdminCarLightspot', 'listOrder', '', '车亮点排序', '', '车亮点排序');
INSERT INTO `cmf_admin_menu` VALUES (283, 194, 0, 1, 1000, 'car', 'AdminCarMileage', 'index', '', '里程设置', 'th', '里程设置');
INSERT INTO `cmf_admin_menu` VALUES (284, 283, 1, 0, 10000, 'car', 'AdminCarMileage', 'add', '', '添加车里程', '', '添加车里程');
INSERT INTO `cmf_admin_menu` VALUES (285, 283, 2, 0, 10000, 'car', 'AdminCarMileage', 'addPost', '', '添加车里程', '', '添加车里程');
INSERT INTO `cmf_admin_menu` VALUES (286, 283, 2, 0, 10000, 'car', 'AdminCarMileage', 'upStatus', '', '更新车里程', '', '更新车里程');
INSERT INTO `cmf_admin_menu` VALUES (287, 283, 2, 0, 10000, 'car', 'AdminCarMileage', 'delete', '', '删除车里程', '', '删除车里程');
INSERT INTO `cmf_admin_menu` VALUES (288, 283, 1, 0, 10000, 'car', 'AdminCarMileage', 'select', '', '车里程选择对话框', '', '车里程选择对话框');
INSERT INTO `cmf_admin_menu` VALUES (289, 283, 2, 0, 10000, 'car', 'AdminCarMileage', 'listOrder', '', '车里程排序', '', '车里程排序');
INSERT INTO `cmf_admin_menu` VALUES (290, 194, 0, 1, 30, 'car', 'AdminCarPriceRange', 'index', '', '价格范围设置', 'th', '价格范围设置');
INSERT INTO `cmf_admin_menu` VALUES (291, 290, 1, 0, 10000, 'car', 'AdminCarPriceRange', 'add', '', '添加车价', '', '添加车价');
INSERT INTO `cmf_admin_menu` VALUES (292, 290, 2, 0, 10000, 'car', 'AdminCarPriceRange', 'addPost', '', '添加车价提交', '', '添加车价提交');
INSERT INTO `cmf_admin_menu` VALUES (293, 290, 2, 0, 10000, 'car', 'AdminCarPriceRange', 'upStatus', '', '更新车价状态', '', '更新车价状态');
INSERT INTO `cmf_admin_menu` VALUES (294, 290, 2, 0, 10000, 'car', 'AdminCarPriceRange', 'delete', '', '删除车价', '', '删除车价');
INSERT INTO `cmf_admin_menu` VALUES (295, 290, 1, 0, 10000, 'car', 'AdminCarPriceRange', 'select', '', '车价格选择对话框', '', '车价格选择对话框');
INSERT INTO `cmf_admin_menu` VALUES (296, 290, 2, 0, 10000, 'car', 'AdminCarPriceRange', 'listOrder', '', '车价格排序', '', '车价格排序');
INSERT INTO `cmf_admin_menu` VALUES (297, 194, 0, 1, 1000, 'car', 'AdminCarProductionType', 'index', '', '生产方式设置', 'age', '生产方式设置');
INSERT INTO `cmf_admin_menu` VALUES (298, 297, 1, 0, 10000, 'car', 'AdminCarProductionType', 'add', '', '生产方式设置', '', '添加生产方式');
INSERT INTO `cmf_admin_menu` VALUES (299, 297, 2, 0, 10000, 'car', 'AdminCarProductionType', 'addPost', '', '生产方式设置', '', '生产方式设置');
INSERT INTO `cmf_admin_menu` VALUES (300, 297, 2, 0, 10000, 'car', 'AdminCarProductionType', 'upStatus', '', '生产方式设置', '', '生产方式设置');
INSERT INTO `cmf_admin_menu` VALUES (301, 297, 2, 0, 10000, 'car', 'AdminCarProductionType', 'delete', '', '删除生产方式', '', '删除生产方式');
INSERT INTO `cmf_admin_menu` VALUES (302, 297, 1, 0, 10000, 'car', 'AdminCarProductionType', 'select', '', '车生产方式选择对话框', '', '车生产方式选择对话框');
INSERT INTO `cmf_admin_menu` VALUES (303, 297, 2, 0, 10000, 'car', 'AdminCarProductionType', 'listOrder', '', '车生产方式排序', '', '车生产方式排序');
INSERT INTO `cmf_admin_menu` VALUES (304, 194, 0, 1, 1000, 'car', 'AdminCarSeat', 'index', '', '座位数设置', 'th', '座位数设置');
INSERT INTO `cmf_admin_menu` VALUES (305, 304, 1, 0, 10000, 'car', 'AdminCarSeat', 'add', '', '添加座位数', '', '添加座位数');
INSERT INTO `cmf_admin_menu` VALUES (306, 304, 2, 0, 10000, 'car', 'AdminCarSeat', 'addPost', '', '添加车座位数', '', '添加车座位数');
INSERT INTO `cmf_admin_menu` VALUES (307, 304, 2, 0, 10000, 'car', 'AdminCarSeat', 'upStatus', '', '更新车座位数', '', '更新车座位数');
INSERT INTO `cmf_admin_menu` VALUES (308, 304, 2, 0, 10000, 'car', 'AdminCarSeat', 'delete', '', '删除车座位数', '', '删除车座位数');
INSERT INTO `cmf_admin_menu` VALUES (309, 304, 1, 0, 10000, 'car', 'AdminCarSeat', 'select', '', '车座位数选择对话框', '', '车座位数选择对话框');
INSERT INTO `cmf_admin_menu` VALUES (310, 304, 2, 0, 10000, 'car', 'AdminCarSeat', 'listOrder', '', '车座位数排序', '', '车座位数排序');
INSERT INTO `cmf_admin_menu` VALUES (311, 193, 1, 1, 10000, 'car', 'AdminElement', 'index', '', '车管理', '', '车列表');
INSERT INTO `cmf_admin_menu` VALUES (312, 311, 1, 0, 10000, 'car', 'AdminElement', 'add', '', '添加车', '', '添加车');
INSERT INTO `cmf_admin_menu` VALUES (313, 311, 2, 0, 10000, 'car', 'AdminElement', 'addPost', '', '添加车提交', '', '添加车提交');
INSERT INTO `cmf_admin_menu` VALUES (314, 311, 1, 0, 10000, 'car', 'AdminElement', 'edit', '', '编辑车', '', '编辑车');
INSERT INTO `cmf_admin_menu` VALUES (315, 311, 2, 0, 10000, 'car', 'AdminElement', 'editElement', '', '编辑车提交', '', '编辑车提交');
INSERT INTO `cmf_admin_menu` VALUES (316, 311, 2, 0, 10000, 'car', 'AdminElement', 'delete', '', '车删除', '', '车删除');
INSERT INTO `cmf_admin_menu` VALUES (317, 311, 2, 0, 10000, 'car', 'AdminElement', 'publish', '', '车发布', '', '车发布');
INSERT INTO `cmf_admin_menu` VALUES (318, 311, 2, 0, 10000, 'car', 'AdminElement', 'top', '', '车置顶', '', '车置顶');
INSERT INTO `cmf_admin_menu` VALUES (319, 311, 2, 0, 10000, 'car', 'AdminElement', 'recommend', '', '车推荐', '', '车推荐');
INSERT INTO `cmf_admin_menu` VALUES (320, 311, 2, 0, 10000, 'car', 'AdminElement', 'listOrder', '', '车排序', '', '车排序');
INSERT INTO `cmf_admin_menu` VALUES (321, 193, 1, 1, 10000, 'car', 'AdminPage', 'index', '', '页面管理', '', '页面管理');
INSERT INTO `cmf_admin_menu` VALUES (322, 321, 1, 0, 10000, 'car', 'AdminPage', 'add', '', '添加页面', '', '添加页面');
INSERT INTO `cmf_admin_menu` VALUES (323, 321, 2, 0, 10000, 'car', 'AdminPage', 'addPost', '', '添加页面提交', '', '添加页面提交');
INSERT INTO `cmf_admin_menu` VALUES (324, 321, 1, 0, 10000, 'car', 'AdminPage', 'edit', '', '编辑页面', '', '编辑页面');
INSERT INTO `cmf_admin_menu` VALUES (325, 321, 2, 0, 10000, 'car', 'AdminPage', 'editElement', '', '编辑页面提交', '', '编辑页面提交');
INSERT INTO `cmf_admin_menu` VALUES (326, 321, 2, 0, 10000, 'car', 'AdminPage', 'delete', '', '删除页面', '', '删除页面');
INSERT INTO `cmf_admin_menu` VALUES (327, 193, 1, 1, 10000, 'car', 'AdminTag', 'index', '', '车标签', '', '车标签');
INSERT INTO `cmf_admin_menu` VALUES (328, 327, 1, 0, 10000, 'car', 'AdminTag', 'add', '', '添加车标签', '', '添加车标签');
INSERT INTO `cmf_admin_menu` VALUES (329, 327, 2, 0, 10000, 'car', 'AdminTag', 'addPost', '', '添加车标签提交', '', '添加车标签提交');
INSERT INTO `cmf_admin_menu` VALUES (330, 327, 2, 0, 10000, 'car', 'AdminTag', 'upStatus', '', '更新标签状态', '', '更新标签状态');
INSERT INTO `cmf_admin_menu` VALUES (331, 327, 2, 0, 10000, 'car', 'AdminTag', 'delete', '', '删除车标签', '', '删除车标签');

-- ----------------------------
-- Table structure for cmf_asset
-- ----------------------------
DROP TABLE IF EXISTS `cmf_asset`;
CREATE TABLE `cmf_asset`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `file_size` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小,单位B',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上传时间',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下载次数',
  `file_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `suffix` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_asset
-- ----------------------------
INSERT INTO `cmf_asset` VALUES (1, 1, 16096, 1589770211, 1, 0, 'f4568d2b019349259c2807bd1ce5e31225121308b6bd6aba6d12f6feaee39505', 'dazhong.png', 'car/20200518/088ed5fb7327ca74e75fcd94b343d007.png', 'f4568d2b019349259c2807bd1ce5e312', '5a0a8ab48b1a7d25a177aea6b82c07ba446291d3', 'png', NULL);
INSERT INTO `cmf_asset` VALUES (2, 1, 15225, 1589770264, 1, 0, '8a53347eddc273b325c131e571d61cc880f52f7c1fffdaaa4d96e64212ea42ef', 'bentian.png', 'car/20200518/4f53b6d1368b6241efe4496a1f610a1d.png', '8a53347eddc273b325c131e571d61cc8', '8732090597aa3851610c7d3aafc3258219b9f44c', 'png', NULL);
INSERT INTO `cmf_asset` VALUES (3, 1, 3971, 1589770303, 1, 0, '66c1144b6916bce597c30096104ad117f10b3cc35905901cc10894c1351e9ef1', 'aodi.png', 'car/20200518/d4e3cd5ebe317e4131d1e5d9d955397a.png', '66c1144b6916bce597c30096104ad117', '3f35e293290e79f94fc5aeacbca78a557b1db464', 'png', NULL);
INSERT INTO `cmf_asset` VALUES (4, 1, 14359, 1589770342, 1, 0, 'e8f49169e245174d711742d4944b681be043e6cd4c5195b3ac79044e55aca4a4', 'fengtian.png', 'car/20200518/690241304ad88f154309e29ae9e38eec.png', 'e8f49169e245174d711742d4944b681b', '74b7ea41e1c53692fe56b5bb539f930e35f18bb3', 'png', NULL);
INSERT INTO `cmf_asset` VALUES (5, 1, 20096, 1589770382, 1, 0, '134ad332470531ef9e89a36e8d09b5aca00230e6b3c67ad57fee30878f9f8831', 'baoma.png', 'car/20200518/559e7819b4bc68f3ebf9b9aef252e083.png', '134ad332470531ef9e89a36e8d09b5ac', '578da0cd1c4c5b8b25b918941a7ccce0240d1d1f', 'png', NULL);
INSERT INTO `cmf_asset` VALUES (6, 1, 9897, 1589770422, 1, 0, '088aa6eda79adcacddc16af4b45b51a8e156497bdc029cd99595584fea525038', 'benchi.png', 'car/20200518/5c513c75ddedccb8e2e7805bbff656f5.png', '088aa6eda79adcacddc16af4b45b51a8', '690b9027329273a3a0eb9275082337e5fae5366e', 'png', NULL);
INSERT INTO `cmf_asset` VALUES (7, 1, 11359, 1589770463, 1, 0, '9b9b1e0d3b4cd3d622294e80d85659a6ec756621c29f6df6a06ab4ca1ab257d5', 'bieke.png', 'car/20200518/78a1ea6fac99bfa93c2b78f70fd3e9bb.png', '9b9b1e0d3b4cd3d622294e80d85659a6', '7f729ff9f3e2a179caddff77804a99c6457d8322', 'png', NULL);
INSERT INTO `cmf_asset` VALUES (8, 1, 94833, 1589778107, 1, 0, 'c81970dfef8299d4ed6dfbb8c6f3a28f9fad90bc60b4730d6f5b2fd2fba80d33', 'aodi.jpeg', 'car/20200518/e0f4a1d79ef2477593963876701a5a75.jpeg', 'c81970dfef8299d4ed6dfbb8c6f3a28f', 'dcb3623c2d148a1aa769418160208295117cf5a7', 'jpeg', NULL);
INSERT INTO `cmf_asset` VALUES (9, 1, 105091, 1589822086, 1, 0, 'cb22af6025687c739c33fc49ed0c155dcc0c67dc2e234abe1228137e02d203aa', '1.jpeg', 'car/20200519/576aab07c479b224f64b68b5a3c16315.jpeg', 'cb22af6025687c739c33fc49ed0c155d', '7f2b0b6889fc011564f80785998de5703affdbd4', 'jpeg', NULL);
INSERT INTO `cmf_asset` VALUES (10, 1, 99652, 1590277503, 1, 0, 'c2b03e78305de3e4b56763062d03308f3a5f0c9bc745f08c693683a06e851658', 'dazhong.jpg', 'car/20200524/0b19154c2aeed82e92a4e1de4f286433.jpg', 'c2b03e78305de3e4b56763062d03308f', '5132916f637517a056d34b7b1a233c3f3e1c2dcf', 'jpg', NULL);

-- ----------------------------
-- Table structure for cmf_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_access`;
CREATE TABLE `cmf_auth_access`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(10) UNSIGNED NOT NULL COMMENT '角色',
  `rule_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `rule_name`(`rule_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限授权表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmf_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_rule`;
CREATE TABLE `cmf_auth_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则所属app',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `module`(`app`, `status`, `type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 332 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_auth_rule
-- ----------------------------
INSERT INTO `cmf_auth_rule` VALUES (1, 1, 'admin', 'admin_url', 'admin/Hook/index', '', '钩子管理', '');
INSERT INTO `cmf_auth_rule` VALUES (2, 1, 'admin', 'admin_url', 'admin/Hook/plugins', '', '钩子插件管理', '');
INSERT INTO `cmf_auth_rule` VALUES (3, 1, 'admin', 'admin_url', 'admin/Hook/pluginListOrder', '', '钩子插件排序', '');
INSERT INTO `cmf_auth_rule` VALUES (4, 1, 'admin', 'admin_url', 'admin/Hook/sync', '', '同步钩子', '');
INSERT INTO `cmf_auth_rule` VALUES (5, 1, 'admin', 'admin_url', 'admin/Link/index', '', '友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES (6, 1, 'admin', 'admin_url', 'admin/Link/add', '', '添加友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES (7, 1, 'admin', 'admin_url', 'admin/Link/addPost', '', '添加友情链接提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (8, 1, 'admin', 'admin_url', 'admin/Link/edit', '', '编辑友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES (9, 1, 'admin', 'admin_url', 'admin/Link/editPost', '', '编辑友情链接提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (10, 1, 'admin', 'admin_url', 'admin/Link/delete', '', '删除友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES (11, 1, 'admin', 'admin_url', 'admin/Link/listOrder', '', '友情链接排序', '');
INSERT INTO `cmf_auth_rule` VALUES (12, 1, 'admin', 'admin_url', 'admin/Link/toggle', '', '友情链接显示隐藏', '');
INSERT INTO `cmf_auth_rule` VALUES (13, 1, 'admin', 'admin_url', 'admin/Mailer/index', '', '邮箱配置', '');
INSERT INTO `cmf_auth_rule` VALUES (14, 1, 'admin', 'admin_url', 'admin/Mailer/indexPost', '', '邮箱配置提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (15, 1, 'admin', 'admin_url', 'admin/Mailer/template', '', '邮件模板', '');
INSERT INTO `cmf_auth_rule` VALUES (16, 1, 'admin', 'admin_url', 'admin/Mailer/templatePost', '', '邮件模板提交', '');
INSERT INTO `cmf_auth_rule` VALUES (17, 1, 'admin', 'admin_url', 'admin/Mailer/test', '', '邮件发送测试', '');
INSERT INTO `cmf_auth_rule` VALUES (18, 1, 'admin', 'admin_url', 'admin/Menu/index', '', '后台菜单', '');
INSERT INTO `cmf_auth_rule` VALUES (19, 1, 'admin', 'admin_url', 'admin/Menu/lists', '', '所有菜单', '');
INSERT INTO `cmf_auth_rule` VALUES (20, 1, 'admin', 'admin_url', 'admin/Menu/add', '', '后台菜单添加', '');
INSERT INTO `cmf_auth_rule` VALUES (21, 1, 'admin', 'admin_url', 'admin/Menu/addPost', '', '后台菜单添加提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (22, 1, 'admin', 'admin_url', 'admin/Menu/edit', '', '后台菜单编辑', '');
INSERT INTO `cmf_auth_rule` VALUES (23, 1, 'admin', 'admin_url', 'admin/Menu/editPost', '', '后台菜单编辑提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (24, 1, 'admin', 'admin_url', 'admin/Menu/delete', '', '后台菜单删除', '');
INSERT INTO `cmf_auth_rule` VALUES (25, 1, 'admin', 'admin_url', 'admin/Menu/listOrder', '', '后台菜单排序', '');
INSERT INTO `cmf_auth_rule` VALUES (26, 1, 'admin', 'admin_url', 'admin/Menu/getActions', '', '导入新后台菜单', '');
INSERT INTO `cmf_auth_rule` VALUES (27, 1, 'admin', 'admin_url', 'admin/Nav/index', '', '导航管理', '');
INSERT INTO `cmf_auth_rule` VALUES (28, 1, 'admin', 'admin_url', 'admin/Nav/add', '', '添加导航', '');
INSERT INTO `cmf_auth_rule` VALUES (29, 1, 'admin', 'admin_url', 'admin/Nav/addPost', '', '添加导航提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (30, 1, 'admin', 'admin_url', 'admin/Nav/edit', '', '编辑导航', '');
INSERT INTO `cmf_auth_rule` VALUES (31, 1, 'admin', 'admin_url', 'admin/Nav/editPost', '', '编辑导航提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (32, 1, 'admin', 'admin_url', 'admin/Nav/delete', '', '删除导航', '');
INSERT INTO `cmf_auth_rule` VALUES (33, 1, 'admin', 'admin_url', 'admin/NavMenu/index', '', '导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES (34, 1, 'admin', 'admin_url', 'admin/NavMenu/add', '', '添加导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES (35, 1, 'admin', 'admin_url', 'admin/NavMenu/addPost', '', '添加导航菜单提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (36, 1, 'admin', 'admin_url', 'admin/NavMenu/edit', '', '编辑导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES (37, 1, 'admin', 'admin_url', 'admin/NavMenu/editPost', '', '编辑导航菜单提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (38, 1, 'admin', 'admin_url', 'admin/NavMenu/delete', '', '删除导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES (39, 1, 'admin', 'admin_url', 'admin/NavMenu/listOrder', '', '导航菜单排序', '');
INSERT INTO `cmf_auth_rule` VALUES (40, 1, 'admin', 'admin_url', 'admin/Plugin/default', '', '插件中心', '');
INSERT INTO `cmf_auth_rule` VALUES (41, 1, 'admin', 'admin_url', 'admin/Plugin/index', '', '插件列表', '');
INSERT INTO `cmf_auth_rule` VALUES (42, 1, 'admin', 'admin_url', 'admin/Plugin/toggle', '', '插件启用禁用', '');
INSERT INTO `cmf_auth_rule` VALUES (43, 1, 'admin', 'admin_url', 'admin/Plugin/setting', '', '插件设置', '');
INSERT INTO `cmf_auth_rule` VALUES (44, 1, 'admin', 'admin_url', 'admin/Plugin/settingPost', '', '插件设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES (45, 1, 'admin', 'admin_url', 'admin/Plugin/install', '', '插件安装', '');
INSERT INTO `cmf_auth_rule` VALUES (46, 1, 'admin', 'admin_url', 'admin/Plugin/update', '', '插件更新', '');
INSERT INTO `cmf_auth_rule` VALUES (47, 1, 'admin', 'admin_url', 'admin/Plugin/uninstall', '', '卸载插件', '');
INSERT INTO `cmf_auth_rule` VALUES (48, 1, 'admin', 'admin_url', 'admin/Rbac/index', '', '角色管理', '');
INSERT INTO `cmf_auth_rule` VALUES (49, 1, 'admin', 'admin_url', 'admin/Rbac/roleAdd', '', '添加角色', '');
INSERT INTO `cmf_auth_rule` VALUES (50, 1, 'admin', 'admin_url', 'admin/Rbac/roleAddPost', '', '添加角色提交', '');
INSERT INTO `cmf_auth_rule` VALUES (51, 1, 'admin', 'admin_url', 'admin/Rbac/roleEdit', '', '编辑角色', '');
INSERT INTO `cmf_auth_rule` VALUES (52, 1, 'admin', 'admin_url', 'admin/Rbac/roleEditPost', '', '编辑角色提交', '');
INSERT INTO `cmf_auth_rule` VALUES (53, 1, 'admin', 'admin_url', 'admin/Rbac/roleDelete', '', '删除角色', '');
INSERT INTO `cmf_auth_rule` VALUES (54, 1, 'admin', 'admin_url', 'admin/Rbac/authorize', '', '设置角色权限', '');
INSERT INTO `cmf_auth_rule` VALUES (55, 1, 'admin', 'admin_url', 'admin/Rbac/authorizePost', '', '角色授权提交', '');
INSERT INTO `cmf_auth_rule` VALUES (56, 1, 'admin', 'admin_url', 'admin/RecycleBin/index', '', '回收站', '');
INSERT INTO `cmf_auth_rule` VALUES (57, 1, 'admin', 'admin_url', 'admin/RecycleBin/restore', '', '回收站还原', '');
INSERT INTO `cmf_auth_rule` VALUES (58, 1, 'admin', 'admin_url', 'admin/RecycleBin/delete', '', '回收站彻底删除', '');
INSERT INTO `cmf_auth_rule` VALUES (59, 1, 'admin', 'admin_url', 'admin/Route/index', '', 'URL美化', '');
INSERT INTO `cmf_auth_rule` VALUES (60, 1, 'admin', 'admin_url', 'admin/Route/add', '', '添加路由规则', '');
INSERT INTO `cmf_auth_rule` VALUES (61, 1, 'admin', 'admin_url', 'admin/Route/addPost', '', '添加路由规则提交', '');
INSERT INTO `cmf_auth_rule` VALUES (62, 1, 'admin', 'admin_url', 'admin/Route/edit', '', '路由规则编辑', '');
INSERT INTO `cmf_auth_rule` VALUES (63, 1, 'admin', 'admin_url', 'admin/Route/editPost', '', '路由规则编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES (64, 1, 'admin', 'admin_url', 'admin/Route/delete', '', '路由规则删除', '');
INSERT INTO `cmf_auth_rule` VALUES (65, 1, 'admin', 'admin_url', 'admin/Route/ban', '', '路由规则禁用', '');
INSERT INTO `cmf_auth_rule` VALUES (66, 1, 'admin', 'admin_url', 'admin/Route/open', '', '路由规则启用', '');
INSERT INTO `cmf_auth_rule` VALUES (67, 1, 'admin', 'admin_url', 'admin/Route/listOrder', '', '路由规则排序', '');
INSERT INTO `cmf_auth_rule` VALUES (68, 1, 'admin', 'admin_url', 'admin/Route/select', '', '选择URL', '');
INSERT INTO `cmf_auth_rule` VALUES (69, 1, 'admin', 'admin_url', 'admin/Setting/default', '', '设置', '');
INSERT INTO `cmf_auth_rule` VALUES (70, 1, 'admin', 'admin_url', 'admin/Setting/site', '', '网站信息', '');
INSERT INTO `cmf_auth_rule` VALUES (71, 1, 'admin', 'admin_url', 'admin/Setting/sitePost', '', '网站信息设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES (72, 1, 'admin', 'admin_url', 'admin/Setting/password', '', '密码修改', '');
INSERT INTO `cmf_auth_rule` VALUES (73, 1, 'admin', 'admin_url', 'admin/Setting/passwordPost', '', '密码修改提交', '');
INSERT INTO `cmf_auth_rule` VALUES (74, 1, 'admin', 'admin_url', 'admin/Setting/upload', '', '上传设置', '');
INSERT INTO `cmf_auth_rule` VALUES (75, 1, 'admin', 'admin_url', 'admin/Setting/uploadPost', '', '上传设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES (76, 1, 'admin', 'admin_url', 'admin/Setting/clearCache', '', '清除缓存', '');
INSERT INTO `cmf_auth_rule` VALUES (77, 1, 'admin', 'admin_url', 'admin/Slide/index', '', '幻灯片管理', '');
INSERT INTO `cmf_auth_rule` VALUES (78, 1, 'admin', 'admin_url', 'admin/Slide/add', '', '添加幻灯片', '');
INSERT INTO `cmf_auth_rule` VALUES (79, 1, 'admin', 'admin_url', 'admin/Slide/addPost', '', '添加幻灯片提交', '');
INSERT INTO `cmf_auth_rule` VALUES (80, 1, 'admin', 'admin_url', 'admin/Slide/edit', '', '编辑幻灯片', '');
INSERT INTO `cmf_auth_rule` VALUES (81, 1, 'admin', 'admin_url', 'admin/Slide/editPost', '', '编辑幻灯片提交', '');
INSERT INTO `cmf_auth_rule` VALUES (82, 1, 'admin', 'admin_url', 'admin/Slide/delete', '', '删除幻灯片', '');
INSERT INTO `cmf_auth_rule` VALUES (83, 1, 'admin', 'admin_url', 'admin/SlideItem/index', '', '幻灯片页面列表', '');
INSERT INTO `cmf_auth_rule` VALUES (84, 1, 'admin', 'admin_url', 'admin/SlideItem/add', '', '幻灯片页面添加', '');
INSERT INTO `cmf_auth_rule` VALUES (85, 1, 'admin', 'admin_url', 'admin/SlideItem/addPost', '', '幻灯片页面添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES (86, 1, 'admin', 'admin_url', 'admin/SlideItem/edit', '', '幻灯片页面编辑', '');
INSERT INTO `cmf_auth_rule` VALUES (87, 1, 'admin', 'admin_url', 'admin/SlideItem/editPost', '', '幻灯片页面编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES (88, 1, 'admin', 'admin_url', 'admin/SlideItem/delete', '', '幻灯片页面删除', '');
INSERT INTO `cmf_auth_rule` VALUES (89, 1, 'admin', 'admin_url', 'admin/SlideItem/ban', '', '幻灯片页面隐藏', '');
INSERT INTO `cmf_auth_rule` VALUES (90, 1, 'admin', 'admin_url', 'admin/SlideItem/cancelBan', '', '幻灯片页面显示', '');
INSERT INTO `cmf_auth_rule` VALUES (91, 1, 'admin', 'admin_url', 'admin/SlideItem/listOrder', '', '幻灯片页面排序', '');
INSERT INTO `cmf_auth_rule` VALUES (92, 1, 'admin', 'admin_url', 'admin/Storage/index', '', '文件存储', '');
INSERT INTO `cmf_auth_rule` VALUES (93, 1, 'admin', 'admin_url', 'admin/Storage/settingPost', '', '文件存储设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES (94, 1, 'admin', 'admin_url', 'admin/Theme/index', '', '模板管理', '');
INSERT INTO `cmf_auth_rule` VALUES (95, 1, 'admin', 'admin_url', 'admin/Theme/install', '', '安装模板', '');
INSERT INTO `cmf_auth_rule` VALUES (96, 1, 'admin', 'admin_url', 'admin/Theme/uninstall', '', '卸载模板', '');
INSERT INTO `cmf_auth_rule` VALUES (97, 1, 'admin', 'admin_url', 'admin/Theme/installTheme', '', '模板安装', '');
INSERT INTO `cmf_auth_rule` VALUES (98, 1, 'admin', 'admin_url', 'admin/Theme/update', '', '模板更新', '');
INSERT INTO `cmf_auth_rule` VALUES (99, 1, 'admin', 'admin_url', 'admin/Theme/active', '', '启用模板', '');
INSERT INTO `cmf_auth_rule` VALUES (100, 1, 'admin', 'admin_url', 'admin/Theme/files', '', '模板文件列表', '');
INSERT INTO `cmf_auth_rule` VALUES (101, 1, 'admin', 'admin_url', 'admin/Theme/fileSetting', '', '模板文件设置', '');
INSERT INTO `cmf_auth_rule` VALUES (102, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayData', '', '模板文件数组数据列表', '');
INSERT INTO `cmf_auth_rule` VALUES (103, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayDataEdit', '', '模板文件数组数据添加编辑', '');
INSERT INTO `cmf_auth_rule` VALUES (104, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (105, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayDataDelete', '', '模板文件数组数据删除', '');
INSERT INTO `cmf_auth_rule` VALUES (106, 1, 'admin', 'admin_url', 'admin/Theme/settingPost', '', '模板文件编辑提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (107, 1, 'admin', 'admin_url', 'admin/Theme/dataSource', '', '模板文件设置数据源', '');
INSERT INTO `cmf_auth_rule` VALUES (108, 1, 'admin', 'admin_url', 'admin/Theme/design', '', '模板设计', '');
INSERT INTO `cmf_auth_rule` VALUES (109, 1, 'admin', 'admin_url', 'admin/User/default', '', '管理组', '');
INSERT INTO `cmf_auth_rule` VALUES (110, 1, 'admin', 'admin_url', 'admin/User/index', '', '管理员', '');
INSERT INTO `cmf_auth_rule` VALUES (111, 1, 'admin', 'admin_url', 'admin/User/add', '', '管理员添加', '');
INSERT INTO `cmf_auth_rule` VALUES (112, 1, 'admin', 'admin_url', 'admin/User/addPost', '', '管理员添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES (113, 1, 'admin', 'admin_url', 'admin/User/edit', '', '管理员编辑', '');
INSERT INTO `cmf_auth_rule` VALUES (114, 1, 'admin', 'admin_url', 'admin/User/editPost', '', '管理员编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES (115, 1, 'admin', 'admin_url', 'admin/User/userInfo', '', '个人信息', '');
INSERT INTO `cmf_auth_rule` VALUES (116, 1, 'admin', 'admin_url', 'admin/User/userInfoPost', '', '管理员个人信息修改提交', '');
INSERT INTO `cmf_auth_rule` VALUES (117, 1, 'admin', 'admin_url', 'admin/User/delete', '', '管理员删除', '');
INSERT INTO `cmf_auth_rule` VALUES (118, 1, 'admin', 'admin_url', 'admin/User/ban', '', '停用管理员', '');
INSERT INTO `cmf_auth_rule` VALUES (119, 1, 'admin', 'admin_url', 'admin/User/cancelBan', '', '启用管理员', '');
INSERT INTO `cmf_auth_rule` VALUES (120, 1, 'user', 'admin_url', 'user/AdminAsset/index', '', '资源管理', '');
INSERT INTO `cmf_auth_rule` VALUES (121, 1, 'user', 'admin_url', 'user/AdminAsset/delete', '', '删除文件', '');
INSERT INTO `cmf_auth_rule` VALUES (122, 1, 'user', 'admin_url', 'user/AdminIndex/default', '', '用户管理', '');
INSERT INTO `cmf_auth_rule` VALUES (123, 1, 'user', 'admin_url', 'user/AdminIndex/default1', '', '用户组', '');
INSERT INTO `cmf_auth_rule` VALUES (124, 1, 'user', 'admin_url', 'user/AdminIndex/index', '', '本站用户', '');
INSERT INTO `cmf_auth_rule` VALUES (125, 1, 'user', 'admin_url', 'user/AdminIndex/ban', '', '本站用户拉黑', '');
INSERT INTO `cmf_auth_rule` VALUES (126, 1, 'user', 'admin_url', 'user/AdminIndex/cancelBan', '', '本站用户启用', '');
INSERT INTO `cmf_auth_rule` VALUES (127, 1, 'user', 'admin_url', 'user/AdminOauth/index', '', '第三方用户', '');
INSERT INTO `cmf_auth_rule` VALUES (128, 1, 'user', 'admin_url', 'user/AdminOauth/delete', '', '删除第三方用户绑定', '');
INSERT INTO `cmf_auth_rule` VALUES (129, 1, 'user', 'admin_url', 'user/AdminUserAction/index', '', '用户操作管理', '');
INSERT INTO `cmf_auth_rule` VALUES (130, 1, 'user', 'admin_url', 'user/AdminUserAction/edit', '', '编辑用户操作', '');
INSERT INTO `cmf_auth_rule` VALUES (131, 1, 'user', 'admin_url', 'user/AdminUserAction/editPost', '', '编辑用户操作提交', '');
INSERT INTO `cmf_auth_rule` VALUES (132, 1, 'user', 'admin_url', 'user/AdminUserAction/sync', '', '同步用户操作', '');
INSERT INTO `cmf_auth_rule` VALUES (162, 1, 'portal', 'admin_url', 'portal/AdminArticle/index', '', '文章管理', '');
INSERT INTO `cmf_auth_rule` VALUES (163, 1, 'portal', 'admin_url', 'portal/AdminArticle/add', '', '添加文章', '');
INSERT INTO `cmf_auth_rule` VALUES (164, 1, 'portal', 'admin_url', 'portal/AdminArticle/addPost', '', '添加文章提交', '');
INSERT INTO `cmf_auth_rule` VALUES (165, 1, 'portal', 'admin_url', 'portal/AdminArticle/edit', '', '编辑文章', '');
INSERT INTO `cmf_auth_rule` VALUES (166, 1, 'portal', 'admin_url', 'portal/AdminArticle/editPost', '', '编辑文章提交', '');
INSERT INTO `cmf_auth_rule` VALUES (167, 1, 'portal', 'admin_url', 'portal/AdminArticle/delete', '', '文章删除', '');
INSERT INTO `cmf_auth_rule` VALUES (168, 1, 'portal', 'admin_url', 'portal/AdminArticle/publish', '', '文章发布', '');
INSERT INTO `cmf_auth_rule` VALUES (169, 1, 'portal', 'admin_url', 'portal/AdminArticle/top', '', '文章置顶', '');
INSERT INTO `cmf_auth_rule` VALUES (170, 1, 'portal', 'admin_url', 'portal/AdminArticle/recommend', '', '文章推荐', '');
INSERT INTO `cmf_auth_rule` VALUES (171, 1, 'portal', 'admin_url', 'portal/AdminArticle/listOrder', '', '文章排序', '');
INSERT INTO `cmf_auth_rule` VALUES (172, 1, 'portal', 'admin_url', 'portal/AdminCategory/index', '', '分类管理', '');
INSERT INTO `cmf_auth_rule` VALUES (173, 1, 'portal', 'admin_url', 'portal/AdminCategory/add', '', '添加文章分类', '');
INSERT INTO `cmf_auth_rule` VALUES (174, 1, 'portal', 'admin_url', 'portal/AdminCategory/addPost', '', '添加文章分类提交', '');
INSERT INTO `cmf_auth_rule` VALUES (175, 1, 'portal', 'admin_url', 'portal/AdminCategory/edit', '', '编辑文章分类', '');
INSERT INTO `cmf_auth_rule` VALUES (176, 1, 'portal', 'admin_url', 'portal/AdminCategory/editPost', '', '编辑文章分类提交', '');
INSERT INTO `cmf_auth_rule` VALUES (177, 1, 'portal', 'admin_url', 'portal/AdminCategory/select', '', '文章分类选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES (178, 1, 'portal', 'admin_url', 'portal/AdminCategory/listOrder', '', '文章分类排序', '');
INSERT INTO `cmf_auth_rule` VALUES (179, 1, 'portal', 'admin_url', 'portal/AdminCategory/toggle', '', '文章分类显示隐藏', '');
INSERT INTO `cmf_auth_rule` VALUES (180, 1, 'portal', 'admin_url', 'portal/AdminCategory/delete', '', '删除文章分类', '');
INSERT INTO `cmf_auth_rule` VALUES (181, 1, 'portal', 'admin_url', 'portal/AdminIndex/default', '', '门户管理', '');
INSERT INTO `cmf_auth_rule` VALUES (182, 1, 'portal', 'admin_url', 'portal/AdminPage/index', '', '页面管理', '');
INSERT INTO `cmf_auth_rule` VALUES (183, 1, 'portal', 'admin_url', 'portal/AdminPage/add', '', '添加页面', '');
INSERT INTO `cmf_auth_rule` VALUES (184, 1, 'portal', 'admin_url', 'portal/AdminPage/addPost', '', '添加页面提交', '');
INSERT INTO `cmf_auth_rule` VALUES (185, 1, 'portal', 'admin_url', 'portal/AdminPage/edit', '', '编辑页面', '');
INSERT INTO `cmf_auth_rule` VALUES (186, 1, 'portal', 'admin_url', 'portal/AdminPage/editPost', '', '编辑页面提交', '');
INSERT INTO `cmf_auth_rule` VALUES (187, 1, 'portal', 'admin_url', 'portal/AdminPage/delete', '', '删除页面', '');
INSERT INTO `cmf_auth_rule` VALUES (188, 1, 'portal', 'admin_url', 'portal/AdminTag/index', '', '文章标签', '');
INSERT INTO `cmf_auth_rule` VALUES (189, 1, 'portal', 'admin_url', 'portal/AdminTag/add', '', '添加文章标签', '');
INSERT INTO `cmf_auth_rule` VALUES (190, 1, 'portal', 'admin_url', 'portal/AdminTag/addPost', '', '添加文章标签提交', '');
INSERT INTO `cmf_auth_rule` VALUES (191, 1, 'portal', 'admin_url', 'portal/AdminTag/upStatus', '', '更新标签状态', '');
INSERT INTO `cmf_auth_rule` VALUES (192, 1, 'portal', 'admin_url', 'portal/AdminTag/delete', '', '删除文章标签', '');
INSERT INTO `cmf_auth_rule` VALUES (193, 1, 'car', 'admin_url', 'car/AdminAttribute/default', '', '设置', '');
INSERT INTO `cmf_auth_rule` VALUES (194, 1, 'car', 'admin_url', 'car/AdminCarAgeRange/index', '', '车龄范围设置', '');
INSERT INTO `cmf_auth_rule` VALUES (195, 1, 'car', 'admin_url', 'car/AdminCarAgeRange/add', '', '添加车标签', '');
INSERT INTO `cmf_auth_rule` VALUES (196, 1, 'car', 'admin_url', 'car/AdminCarAgeRange/addPost', '', '添加车龄提交', '');
INSERT INTO `cmf_auth_rule` VALUES (197, 1, 'car', 'admin_url', 'car/AdminCarAgeRange/upStatus', '', '更新车龄状态', '');
INSERT INTO `cmf_auth_rule` VALUES (198, 1, 'car', 'admin_url', 'car/AdminCarAgeRange/delete', '', '删除车龄', '');
INSERT INTO `cmf_auth_rule` VALUES (199, 1, 'car', 'admin_url', 'car/AdminCarAgeRange/select', '', '车龄选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES (200, 1, 'car', 'admin_url', 'car/AdminCarAgeRange/listOrder', '', '车龄范围排序', '');
INSERT INTO `cmf_auth_rule` VALUES (201, 1, 'car', 'admin_url', 'car/AdminCarArea/index', '', '地区设置', '');
INSERT INTO `cmf_auth_rule` VALUES (202, 1, 'car', 'admin_url', 'car/AdminCarArea/add', '', '添加车地区', '');
INSERT INTO `cmf_auth_rule` VALUES (203, 1, 'car', 'admin_url', 'car/AdminCarArea/addPost', '', '添加车地区提交', '');
INSERT INTO `cmf_auth_rule` VALUES (204, 1, 'car', 'admin_url', 'car/AdminCarArea/edit', '', '编辑车地区', '');
INSERT INTO `cmf_auth_rule` VALUES (205, 1, 'car', 'admin_url', 'car/AdminCarArea/editElement', '', '编辑车地区提交', '');
INSERT INTO `cmf_auth_rule` VALUES (206, 1, 'car', 'admin_url', 'car/AdminCarArea/select', '', '车地区选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES (207, 1, 'car', 'admin_url', 'car/AdminCarArea/listOrder', '', '车地区排序', '');
INSERT INTO `cmf_auth_rule` VALUES (208, 1, 'car', 'admin_url', 'car/AdminCarArea/toggle', '', '车地区显示隐藏', '');
INSERT INTO `cmf_auth_rule` VALUES (209, 1, 'car', 'admin_url', 'car/AdminCarArea/delete', '', '删除车地区', '');
INSERT INTO `cmf_auth_rule` VALUES (210, 1, 'car', 'admin_url', 'car/AdminCarBrand/index', '', '品牌管理', '');
INSERT INTO `cmf_auth_rule` VALUES (211, 1, 'car', 'admin_url', 'car/AdminCarBrand/add', '', '添加车品牌', '');
INSERT INTO `cmf_auth_rule` VALUES (212, 1, 'car', 'admin_url', 'car/AdminCarBrand/addPost', '', '添加车品牌提交', '');
INSERT INTO `cmf_auth_rule` VALUES (213, 1, 'car', 'admin_url', 'car/AdminCarBrand/edit', '', '编辑车品牌', '');
INSERT INTO `cmf_auth_rule` VALUES (214, 1, 'car', 'admin_url', 'car/AdminCarBrand/editPost', '', '编辑车品牌提交', '');
INSERT INTO `cmf_auth_rule` VALUES (215, 1, 'car', 'admin_url', 'car/AdminCarBrand/select', '', '车品牌选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES (216, 1, 'car', 'admin_url', 'car/AdminCarBrand/listOrder', '', '车品牌排序', '');
INSERT INTO `cmf_auth_rule` VALUES (217, 1, 'car', 'admin_url', 'car/AdminCarBrand/toggle', '', '车品牌显示隐藏', '');
INSERT INTO `cmf_auth_rule` VALUES (218, 1, 'car', 'admin_url', 'car/AdminCarBrand/delete', '', '删除车品牌', '');
INSERT INTO `cmf_auth_rule` VALUES (219, 1, 'car', 'admin_url', 'car/AdminCarColor/index', '', '颜色设置', '');
INSERT INTO `cmf_auth_rule` VALUES (220, 1, 'car', 'admin_url', 'car/AdminCarColor/add', '', '添加颜色', '');
INSERT INTO `cmf_auth_rule` VALUES (221, 1, 'car', 'admin_url', 'car/AdminCarColor/addPost', '', '添加颜色', '');
INSERT INTO `cmf_auth_rule` VALUES (222, 1, 'car', 'admin_url', 'car/AdminCarColor/upStatus', '', '更新颜色', '');
INSERT INTO `cmf_auth_rule` VALUES (223, 1, 'car', 'admin_url', 'car/AdminCarColor/delete', '', '删除颜色', '');
INSERT INTO `cmf_auth_rule` VALUES (224, 1, 'car', 'admin_url', 'car/AdminCarColor/select', '', '车颜色选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES (225, 1, 'car', 'admin_url', 'car/AdminCarColor/listOrder', '', '车颜色排序', '');
INSERT INTO `cmf_auth_rule` VALUES (226, 1, 'car', 'admin_url', 'car/AdminCarCountry/index', '', '国别设置', '');
INSERT INTO `cmf_auth_rule` VALUES (227, 1, 'car', 'admin_url', 'car/AdminCarCountry/add', '', '国别设置', '');
INSERT INTO `cmf_auth_rule` VALUES (228, 1, 'car', 'admin_url', 'car/AdminCarCountry/addPost', '', '国别设置', '');
INSERT INTO `cmf_auth_rule` VALUES (229, 1, 'car', 'admin_url', 'car/AdminCarCountry/upStatus', '', '国别设置', '');
INSERT INTO `cmf_auth_rule` VALUES (230, 1, 'car', 'admin_url', 'car/AdminCarCountry/delete', '', '删除国别', '');
INSERT INTO `cmf_auth_rule` VALUES (231, 1, 'car', 'admin_url', 'car/AdminCarCountry/select', '', '车国别选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES (232, 1, 'car', 'admin_url', 'car/AdminCarCountry/listOrder', '', '车国别排序', '');
INSERT INTO `cmf_auth_rule` VALUES (233, 1, 'car', 'admin_url', 'car/AdminCarDisplacementRange/index', '', '排量范围设置', '');
INSERT INTO `cmf_auth_rule` VALUES (234, 1, 'car', 'admin_url', 'car/AdminCarDisplacementRange/add', '', '添加排量', '');
INSERT INTO `cmf_auth_rule` VALUES (235, 1, 'car', 'admin_url', 'car/AdminCarDisplacementRange/addPost', '', '添加排量', '');
INSERT INTO `cmf_auth_rule` VALUES (236, 1, 'car', 'admin_url', 'car/AdminCarDisplacementRange/upStatus', '', '更新排量', '');
INSERT INTO `cmf_auth_rule` VALUES (237, 1, 'car', 'admin_url', 'car/AdminCarDisplacementRange/delete', '', '删除排量', '');
INSERT INTO `cmf_auth_rule` VALUES (238, 1, 'car', 'admin_url', 'car/AdminCarDisplacementRange/select', '', '车排量选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES (239, 1, 'car', 'admin_url', 'car/AdminCarDisplacementRange/listOrder', '', '车排量排序', '');
INSERT INTO `cmf_auth_rule` VALUES (240, 1, 'car', 'admin_url', 'car/AdminCarEmissionStandard/index', '', '排放标准设置', '');
INSERT INTO `cmf_auth_rule` VALUES (241, 1, 'car', 'admin_url', 'car/AdminCarEmissionStandard/add', '', '添加排放标准', '');
INSERT INTO `cmf_auth_rule` VALUES (242, 1, 'car', 'admin_url', 'car/AdminCarEmissionStandard/addPost', '', '添加排放标准', '');
INSERT INTO `cmf_auth_rule` VALUES (243, 1, 'car', 'admin_url', 'car/AdminCarEmissionStandard/upStatus', '', '更新排放标准', '');
INSERT INTO `cmf_auth_rule` VALUES (244, 1, 'car', 'admin_url', 'car/AdminCarEmissionStandard/delete', '', '删除排放标准', '');
INSERT INTO `cmf_auth_rule` VALUES (245, 1, 'car', 'admin_url', 'car/AdminCarEmissionStandard/select', '', '车排放标准选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES (246, 1, 'car', 'admin_url', 'car/AdminCarEmissionStandard/listOrder', '', '车排放标准排序', '');
INSERT INTO `cmf_auth_rule` VALUES (247, 1, 'car', 'admin_url', 'car/AdminCarEnergy/index', '', '能源设置', '');
INSERT INTO `cmf_auth_rule` VALUES (248, 1, 'car', 'admin_url', 'car/AdminCarEnergy/add', '', '添加能源', '');
INSERT INTO `cmf_auth_rule` VALUES (249, 1, 'car', 'admin_url', 'car/AdminCarEnergy/addPost', '', '添加能源', '');
INSERT INTO `cmf_auth_rule` VALUES (250, 1, 'car', 'admin_url', 'car/AdminCarEnergy/upStatus', '', '更新能源', '');
INSERT INTO `cmf_auth_rule` VALUES (251, 1, 'car', 'admin_url', 'car/AdminCarEnergy/delete', '', '删除车能源', '');
INSERT INTO `cmf_auth_rule` VALUES (252, 1, 'car', 'admin_url', 'car/AdminCarEnergy/select', '', '车能源选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES (253, 1, 'car', 'admin_url', 'car/AdminCarEnergy/listOrder', '', '车能源排序', '');
INSERT INTO `cmf_auth_rule` VALUES (254, 1, 'car', 'admin_url', 'car/AdminCarEngine/index', '', '发动机设置', '');
INSERT INTO `cmf_auth_rule` VALUES (255, 1, 'car', 'admin_url', 'car/AdminCarEngine/add', '', '添加发动机', '');
INSERT INTO `cmf_auth_rule` VALUES (256, 1, 'car', 'admin_url', 'car/AdminCarEngine/addPost', '', '添加发动机', '');
INSERT INTO `cmf_auth_rule` VALUES (257, 1, 'car', 'admin_url', 'car/AdminCarEngine/upStatus', '', '更新发动机', '');
INSERT INTO `cmf_auth_rule` VALUES (258, 1, 'car', 'admin_url', 'car/AdminCarEngine/delete', '', '删除车发动机', '');
INSERT INTO `cmf_auth_rule` VALUES (259, 1, 'car', 'admin_url', 'car/AdminCarEngine/select', '', '车发动机选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES (260, 1, 'car', 'admin_url', 'car/AdminCarEngine/listOrder', '', '车发动机排序', '');
INSERT INTO `cmf_auth_rule` VALUES (261, 1, 'car', 'admin_url', 'car/AdminCarGearbox/index', '', '变速箱设置', '');
INSERT INTO `cmf_auth_rule` VALUES (262, 1, 'car', 'admin_url', 'car/AdminCarGearbox/add', '', '变速箱设置', '');
INSERT INTO `cmf_auth_rule` VALUES (263, 1, 'car', 'admin_url', 'car/AdminCarGearbox/addPost', '', '变速箱设置', '');
INSERT INTO `cmf_auth_rule` VALUES (264, 1, 'car', 'admin_url', 'car/AdminCarGearbox/upStatus', '', '变速箱设置', '');
INSERT INTO `cmf_auth_rule` VALUES (265, 1, 'car', 'admin_url', 'car/AdminCarGearbox/delete', '', '删除变速箱', '');
INSERT INTO `cmf_auth_rule` VALUES (266, 1, 'car', 'admin_url', 'car/AdminCarGearbox/select', '', '车变速箱选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES (267, 1, 'car', 'admin_url', 'car/AdminCarGearbox/listOrder', '', '车变速箱排序', '');
INSERT INTO `cmf_auth_rule` VALUES (268, 1, 'car', 'admin_url', 'car/AdminCarLevel/index', '', '车级别设置', '');
INSERT INTO `cmf_auth_rule` VALUES (269, 1, 'car', 'admin_url', 'car/AdminCarLevel/add', '', '添加车级别', '');
INSERT INTO `cmf_auth_rule` VALUES (270, 1, 'car', 'admin_url', 'car/AdminCarLevel/addPost', '', '添加车级别', '');
INSERT INTO `cmf_auth_rule` VALUES (271, 1, 'car', 'admin_url', 'car/AdminCarLevel/upStatus', '', '更新车级别', '');
INSERT INTO `cmf_auth_rule` VALUES (272, 1, 'car', 'admin_url', 'car/AdminCarLevel/delete', '', '删除车级别', '');
INSERT INTO `cmf_auth_rule` VALUES (273, 1, 'car', 'admin_url', 'car/AdminCarLevel/select', '', '车级别选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES (274, 1, 'car', 'admin_url', 'car/AdminCarLevel/listOrder', '', '车级别排序', '');
INSERT INTO `cmf_auth_rule` VALUES (275, 1, 'car', 'admin_url', 'car/AdminCarLightspot/index', '', '亮点设置', '');
INSERT INTO `cmf_auth_rule` VALUES (276, 1, 'car', 'admin_url', 'car/AdminCarLightspot/add', '', '添加亮点', '');
INSERT INTO `cmf_auth_rule` VALUES (277, 1, 'car', 'admin_url', 'car/AdminCarLightspot/addPost', '', '添加亮点', '');
INSERT INTO `cmf_auth_rule` VALUES (278, 1, 'car', 'admin_url', 'car/AdminCarLightspot/upStatus', '', '更新亮点', '');
INSERT INTO `cmf_auth_rule` VALUES (279, 1, 'car', 'admin_url', 'car/AdminCarLightspot/delete', '', '删除亮点', '');
INSERT INTO `cmf_auth_rule` VALUES (280, 1, 'car', 'admin_url', 'car/AdminCarLightspot/select', '', '车亮点选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES (281, 1, 'car', 'admin_url', 'car/AdminCarLightspot/listOrder', '', '车亮点排序', '');
INSERT INTO `cmf_auth_rule` VALUES (282, 1, 'car', 'admin_url', 'car/AdminCarMileage/index', '', '里程设置', '');
INSERT INTO `cmf_auth_rule` VALUES (283, 1, 'car', 'admin_url', 'car/AdminCarMileage/add', '', '添加车里程', '');
INSERT INTO `cmf_auth_rule` VALUES (284, 1, 'car', 'admin_url', 'car/AdminCarMileage/addPost', '', '添加车里程', '');
INSERT INTO `cmf_auth_rule` VALUES (285, 1, 'car', 'admin_url', 'car/AdminCarMileage/upStatus', '', '更新车里程', '');
INSERT INTO `cmf_auth_rule` VALUES (286, 1, 'car', 'admin_url', 'car/AdminCarMileage/delete', '', '删除车里程', '');
INSERT INTO `cmf_auth_rule` VALUES (287, 1, 'car', 'admin_url', 'car/AdminCarMileage/select', '', '车里程选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES (288, 1, 'car', 'admin_url', 'car/AdminCarMileage/listOrder', '', '车里程排序', '');
INSERT INTO `cmf_auth_rule` VALUES (289, 1, 'car', 'admin_url', 'car/AdminCarPriceRange/index', '', '价格范围设置', '');
INSERT INTO `cmf_auth_rule` VALUES (290, 1, 'car', 'admin_url', 'car/AdminCarPriceRange/add', '', '添加车价', '');
INSERT INTO `cmf_auth_rule` VALUES (291, 1, 'car', 'admin_url', 'car/AdminCarPriceRange/addPost', '', '添加车价提交', '');
INSERT INTO `cmf_auth_rule` VALUES (292, 1, 'car', 'admin_url', 'car/AdminCarPriceRange/upStatus', '', '更新车价状态', '');
INSERT INTO `cmf_auth_rule` VALUES (293, 1, 'car', 'admin_url', 'car/AdminCarPriceRange/delete', '', '删除车价', '');
INSERT INTO `cmf_auth_rule` VALUES (294, 1, 'car', 'admin_url', 'car/AdminCarPriceRange/select', '', '车价格选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES (295, 1, 'car', 'admin_url', 'car/AdminCarPriceRange/listOrder', '', '车价格排序', '');
INSERT INTO `cmf_auth_rule` VALUES (296, 1, 'car', 'admin_url', 'car/AdminCarProductionType/index', '', '生产方式设置', '');
INSERT INTO `cmf_auth_rule` VALUES (297, 1, 'car', 'admin_url', 'car/AdminCarProductionType/add', '', '生产方式设置', '');
INSERT INTO `cmf_auth_rule` VALUES (298, 1, 'car', 'admin_url', 'car/AdminCarProductionType/addPost', '', '生产方式设置', '');
INSERT INTO `cmf_auth_rule` VALUES (299, 1, 'car', 'admin_url', 'car/AdminCarProductionType/upStatus', '', '生产方式设置', '');
INSERT INTO `cmf_auth_rule` VALUES (300, 1, 'car', 'admin_url', 'car/AdminCarProductionType/delete', '', '删除生产方式', '');
INSERT INTO `cmf_auth_rule` VALUES (301, 1, 'car', 'admin_url', 'car/AdminCarProductionType/select', '', '车生产方式选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES (302, 1, 'car', 'admin_url', 'car/AdminCarProductionType/listOrder', '', '车生产方式排序', '');
INSERT INTO `cmf_auth_rule` VALUES (303, 1, 'car', 'admin_url', 'car/AdminCarSeat/index', '', '座位数设置', '');
INSERT INTO `cmf_auth_rule` VALUES (304, 1, 'car', 'admin_url', 'car/AdminCarSeat/add', '', '添加座位数', '');
INSERT INTO `cmf_auth_rule` VALUES (305, 1, 'car', 'admin_url', 'car/AdminCarSeat/addPost', '', '添加车座位数', '');
INSERT INTO `cmf_auth_rule` VALUES (306, 1, 'car', 'admin_url', 'car/AdminCarSeat/upStatus', '', '更新车座位数', '');
INSERT INTO `cmf_auth_rule` VALUES (307, 1, 'car', 'admin_url', 'car/AdminCarSeat/delete', '', '删除车座位数', '');
INSERT INTO `cmf_auth_rule` VALUES (308, 1, 'car', 'admin_url', 'car/AdminCarSeat/select', '', '车座位数选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES (309, 1, 'car', 'admin_url', 'car/AdminCarSeat/listOrder', '', '车座位数排序', '');
INSERT INTO `cmf_auth_rule` VALUES (310, 1, 'car', 'admin_url', 'car/AdminElement/index', '', '车管理', '');
INSERT INTO `cmf_auth_rule` VALUES (311, 1, 'car', 'admin_url', 'car/AdminElement/add', '', '添加车', '');
INSERT INTO `cmf_auth_rule` VALUES (312, 1, 'car', 'admin_url', 'car/AdminElement/addPost', '', '添加车提交', '');
INSERT INTO `cmf_auth_rule` VALUES (313, 1, 'car', 'admin_url', 'car/AdminElement/edit', '', '编辑车', '');
INSERT INTO `cmf_auth_rule` VALUES (314, 1, 'car', 'admin_url', 'car/AdminElement/editElement', '', '编辑车提交', '');
INSERT INTO `cmf_auth_rule` VALUES (315, 1, 'car', 'admin_url', 'car/AdminElement/delete', '', '车删除', '');
INSERT INTO `cmf_auth_rule` VALUES (316, 1, 'car', 'admin_url', 'car/AdminElement/publish', '', '车发布', '');
INSERT INTO `cmf_auth_rule` VALUES (317, 1, 'car', 'admin_url', 'car/AdminElement/top', '', '车置顶', '');
INSERT INTO `cmf_auth_rule` VALUES (318, 1, 'car', 'admin_url', 'car/AdminElement/recommend', '', '车推荐', '');
INSERT INTO `cmf_auth_rule` VALUES (319, 1, 'car', 'admin_url', 'car/AdminElement/listOrder', '', '车排序', '');
INSERT INTO `cmf_auth_rule` VALUES (320, 1, 'car', 'admin_url', 'car/AdminIndex/default', '', '车辆管理', '');
INSERT INTO `cmf_auth_rule` VALUES (321, 1, 'car', 'admin_url', 'car/AdminPage/index', '', '页面管理', '');
INSERT INTO `cmf_auth_rule` VALUES (322, 1, 'car', 'admin_url', 'car/AdminPage/add', '', '添加页面', '');
INSERT INTO `cmf_auth_rule` VALUES (323, 1, 'car', 'admin_url', 'car/AdminPage/addPost', '', '添加页面提交', '');
INSERT INTO `cmf_auth_rule` VALUES (324, 1, 'car', 'admin_url', 'car/AdminPage/edit', '', '编辑页面', '');
INSERT INTO `cmf_auth_rule` VALUES (325, 1, 'car', 'admin_url', 'car/AdminPage/editElement', '', '编辑页面提交', '');
INSERT INTO `cmf_auth_rule` VALUES (326, 1, 'car', 'admin_url', 'car/AdminPage/delete', '', '删除页面', '');
INSERT INTO `cmf_auth_rule` VALUES (327, 1, 'car', 'admin_url', 'car/AdminTag/index', '', '车标签', '');
INSERT INTO `cmf_auth_rule` VALUES (328, 1, 'car', 'admin_url', 'car/AdminTag/add', '', '添加车标签', '');
INSERT INTO `cmf_auth_rule` VALUES (329, 1, 'car', 'admin_url', 'car/AdminTag/addPost', '', '添加车标签提交', '');
INSERT INTO `cmf_auth_rule` VALUES (330, 1, 'car', 'admin_url', 'car/AdminTag/upStatus', '', '更新标签状态', '');
INSERT INTO `cmf_auth_rule` VALUES (331, 1, 'car', 'admin_url', 'car/AdminTag/delete', '', '删除车标签', '');

-- ----------------------------
-- Table structure for cmf_car_age_range
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_age_range`;
CREATE TABLE `cmf_car_age_range`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `min_age` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签文章数',
  `max_age` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_age_range
-- ----------------------------
INSERT INTO `cmf_car_age_range` VALUES (1, 1, 0, 1);
INSERT INTO `cmf_car_age_range` VALUES (2, 1, 1, 2);
INSERT INTO `cmf_car_age_range` VALUES (3, 1, 2, 3);
INSERT INTO `cmf_car_age_range` VALUES (4, 1, 3, 5);
INSERT INTO `cmf_car_age_range` VALUES (5, 1, 5, 8);
INSERT INTO `cmf_car_age_range` VALUES (6, 1, 8, 10);

-- ----------------------------
-- Table structure for cmf_car_age_range_element
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_age_range_element`;
CREATE TABLE `cmf_car_age_range_element`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `age_range_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签 id',
  `element_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`element_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_age_range_element
-- ----------------------------
INSERT INTO `cmf_car_age_range_element` VALUES (1, 1, 1, 1);
INSERT INTO `cmf_car_age_range_element` VALUES (2, 1, 2, 1);

-- ----------------------------
-- Table structure for cmf_car_area
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_area`;
CREATE TABLE `cmf_car_area`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类父id',
  `element_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类文章数',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT 10000 COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类描述',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `seo_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `list_tpl` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '扩展属性',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_area
-- ----------------------------
INSERT INTO `cmf_car_area` VALUES (1, 0, 0, 1, 0, 10000, '江苏', '', '0-1', '', '', '', 'list', 'element', '{\"thumbnail\":\"\"}');
INSERT INTO `cmf_car_area` VALUES (2, 0, 0, 1, 0, 10000, '浙江', '', '0-2', '', '', '', 'list', 'element', '{\"thumbnail\":\"\"}');
INSERT INTO `cmf_car_area` VALUES (3, 0, 0, 1, 0, 10000, '广州', '', '0-3', '', '', '', 'list', 'element', '{\"thumbnail\":\"\"}');
INSERT INTO `cmf_car_area` VALUES (4, 0, 0, 1, 0, 10000, '安徽', '', '0-4', '', '', '', 'list', 'element', '{\"thumbnail\":\"\"}');
INSERT INTO `cmf_car_area` VALUES (5, 0, 0, 1, 0, 10000, '山东', '', '0-5', '', '', '', 'list', 'element', '{\"thumbnail\":\"\"}');
INSERT INTO `cmf_car_area` VALUES (6, 1, 0, 1, 0, 10000, '苏州', '', '0-1-6', '', '', '', 'list', 'element', '{\"thumbnail\":\"\"}');
INSERT INTO `cmf_car_area` VALUES (7, 1, 0, 1, 0, 10000, '徐州', '', '0-1-7', '', '', '', 'list', 'element', '{\"thumbnail\":\"\"}');

-- ----------------------------
-- Table structure for cmf_car_area_element
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_area_element`;
CREATE TABLE `cmf_car_area_element`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `element_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '汽车id',
  `area_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '地区id',
  `list_order` float NOT NULL DEFAULT 10000 COMMENT '排序',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `term_taxonomy_id`(`area_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 分类文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_area_element
-- ----------------------------
INSERT INTO `cmf_car_area_element` VALUES (1, 2, 1, 10000, 1);
INSERT INTO `cmf_car_area_element` VALUES (2, 2, 7, 10000, 1);
INSERT INTO `cmf_car_area_element` VALUES (3, 3, 2, 10000, 1);

-- ----------------------------
-- Table structure for cmf_car_brand
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_brand`;
CREATE TABLE `cmf_car_brand`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类父id',
  `element_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类文章数',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT 10000 COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类描述',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `seo_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `list_tpl` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '扩展属性',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_brand
-- ----------------------------
INSERT INTO `cmf_car_brand` VALUES (1, 0, 0, 1, 0, 10000, '大众', '', '0-1', '', '', '', 'list', 'element', '{\"thumbnail\":\"car\\/20200518\\/088ed5fb7327ca74e75fcd94b343d007.png\"}');
INSERT INTO `cmf_car_brand` VALUES (2, 0, 0, 1, 0, 10000, '本田', '', '0-2', '', '', '', 'list', 'element', '{\"thumbnail\":\"car\\/20200518\\/4f53b6d1368b6241efe4496a1f610a1d.png\"}');
INSERT INTO `cmf_car_brand` VALUES (3, 0, 0, 1, 0, 10000, '奥迪', '', '0-3', '', '', '', 'list', 'element', '{\"thumbnail\":\"car\\/20200518\\/d4e3cd5ebe317e4131d1e5d9d955397a.png\"}');
INSERT INTO `cmf_car_brand` VALUES (4, 0, 0, 1, 0, 10000, '丰田', '', '0-4', '', '', '', 'list', 'element', '{\"thumbnail\":\"car\\/20200518\\/690241304ad88f154309e29ae9e38eec.png\"}');
INSERT INTO `cmf_car_brand` VALUES (5, 0, 0, 1, 0, 10000, '宝马', '', '0-5', '', '', '', 'list', 'element', '{\"thumbnail\":\"car\\/20200518\\/559e7819b4bc68f3ebf9b9aef252e083.png\"}');
INSERT INTO `cmf_car_brand` VALUES (6, 0, 0, 1, 0, 10000, '奔驰', '', '0-6', '', '', '', 'list', 'element', '{\"thumbnail\":\"car\\/20200518\\/5c513c75ddedccb8e2e7805bbff656f5.png\"}');
INSERT INTO `cmf_car_brand` VALUES (7, 0, 0, 1, 0, 10000, '别克', '', '0-7', '', '', '', 'list', 'element', '{\"thumbnail\":\"car\\/20200518\\/78a1ea6fac99bfa93c2b78f70fd3e9bb.png\"}');

-- ----------------------------
-- Table structure for cmf_car_brand_element
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_brand_element`;
CREATE TABLE `cmf_car_brand_element`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `element_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章id',
  `brand_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT 10000 COMMENT '排序',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `term_taxonomy_id`(`brand_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 分类文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_brand_element
-- ----------------------------
INSERT INTO `cmf_car_brand_element` VALUES (1, 1, 2, 10000, 1);
INSERT INTO `cmf_car_brand_element` VALUES (2, 2, 3, 10000, 1);
INSERT INTO `cmf_car_brand_element` VALUES (3, 3, 1, 10000, 1);

-- ----------------------------
-- Table structure for cmf_car_color
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_color`;
CREATE TABLE `cmf_car_color`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐;1:推荐;0:不推荐',
  `element_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_color
-- ----------------------------
INSERT INTO `cmf_car_color` VALUES (1, 1, 0, 0, '白色');
INSERT INTO `cmf_car_color` VALUES (2, 1, 0, 0, '黑色');
INSERT INTO `cmf_car_color` VALUES (3, 1, 0, 0, '银灰色');
INSERT INTO `cmf_car_color` VALUES (4, 1, 0, 0, '红色');
INSERT INTO `cmf_car_color` VALUES (5, 1, 0, 0, '蓝色');
INSERT INTO `cmf_car_color` VALUES (6, 1, 0, 0, '深灰色');
INSERT INTO `cmf_car_color` VALUES (7, 1, 0, 0, '绿色');
INSERT INTO `cmf_car_color` VALUES (8, 1, 0, 0, '黄色');
INSERT INTO `cmf_car_color` VALUES (9, 1, 0, 0, '香槟色');
INSERT INTO `cmf_car_color` VALUES (10, 1, 0, 0, '橙色');
INSERT INTO `cmf_car_color` VALUES (11, 1, 0, 0, '紫色');
INSERT INTO `cmf_car_color` VALUES (12, 1, 0, 0, '咖啡色');
INSERT INTO `cmf_car_color` VALUES (13, 1, 0, 0, '多彩色');

-- ----------------------------
-- Table structure for cmf_car_color_element
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_color_element`;
CREATE TABLE `cmf_car_color_element`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `color_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签 id',
  `element_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`element_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_color_element
-- ----------------------------
INSERT INTO `cmf_car_color_element` VALUES (1, 1, 1, 1);
INSERT INTO `cmf_car_color_element` VALUES (2, 4, 2, 1);
INSERT INTO `cmf_car_color_element` VALUES (3, 3, 3, 1);

-- ----------------------------
-- Table structure for cmf_car_country
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_country`;
CREATE TABLE `cmf_car_country`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐;1:推荐;0:不推荐',
  `element_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_country
-- ----------------------------
INSERT INTO `cmf_car_country` VALUES (1, 1, 0, 0, '德国');
INSERT INTO `cmf_car_country` VALUES (2, 1, 0, 0, '日本');
INSERT INTO `cmf_car_country` VALUES (3, 1, 0, 0, '美国');
INSERT INTO `cmf_car_country` VALUES (4, 1, 0, 0, '意大利');
INSERT INTO `cmf_car_country` VALUES (5, 1, 0, 0, '韩国');
INSERT INTO `cmf_car_country` VALUES (6, 1, 0, 0, '中国');
INSERT INTO `cmf_car_country` VALUES (7, 1, 0, 0, '法国');
INSERT INTO `cmf_car_country` VALUES (8, 1, 0, 0, '捷克');
INSERT INTO `cmf_car_country` VALUES (9, 1, 0, 0, '瑞典');
INSERT INTO `cmf_car_country` VALUES (10, 1, 0, 0, '英国');
INSERT INTO `cmf_car_country` VALUES (11, 1, 0, 0, '澳大利亚');
INSERT INTO `cmf_car_country` VALUES (12, 1, 0, 0, '西班牙');

-- ----------------------------
-- Table structure for cmf_car_country_element
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_country_element`;
CREATE TABLE `cmf_car_country_element`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签 id',
  `element_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`element_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_country_element
-- ----------------------------
INSERT INTO `cmf_car_country_element` VALUES (1, 2, 1, 1);
INSERT INTO `cmf_car_country_element` VALUES (2, 1, 2, 1);
INSERT INTO `cmf_car_country_element` VALUES (3, 1, 3, 1);

-- ----------------------------
-- Table structure for cmf_car_displacement_range
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_displacement_range`;
CREATE TABLE `cmf_car_displacement_range`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `min_displacement` float(20, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '标签文章数',
  `max_displacement` float(20, 2) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_displacement_range
-- ----------------------------
INSERT INTO `cmf_car_displacement_range` VALUES (1, 1, 0.00, 1.00);
INSERT INTO `cmf_car_displacement_range` VALUES (8, 1, 1.10, 1.50);
INSERT INTO `cmf_car_displacement_range` VALUES (9, 1, 1.60, 2.00);
INSERT INTO `cmf_car_displacement_range` VALUES (10, 1, 2.10, 3.00);
INSERT INTO `cmf_car_displacement_range` VALUES (11, 1, 3.10, 5.00);

-- ----------------------------
-- Table structure for cmf_car_displacement_range_element
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_displacement_range_element`;
CREATE TABLE `cmf_car_displacement_range_element`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `displacement_range_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签 id',
  `element_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`element_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_displacement_range_element
-- ----------------------------
INSERT INTO `cmf_car_displacement_range_element` VALUES (1, 9, 1, 1);
INSERT INTO `cmf_car_displacement_range_element` VALUES (2, 8, 2, 1);
INSERT INTO `cmf_car_displacement_range_element` VALUES (3, 1, 2, 1);
INSERT INTO `cmf_car_displacement_range_element` VALUES (6, 2, 1, 1);
INSERT INTO `cmf_car_displacement_range_element` VALUES (7, 8, 3, 1);

-- ----------------------------
-- Table structure for cmf_car_element
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_element`;
CREATE TABLE `cmf_car_element`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级id',
  `element_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型,1:文章;2:页面',
  `element_format` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发表者用户id',
  `element_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐;1:推荐;0:不推荐',
  `element_hits` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '查看数',
  `element_favorites` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收藏数',
  `element_like` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞数',
  `comment_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论数',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `published_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发布时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  `element_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `element_keywords` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `element_excerpt` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'post摘要',
  `element_source` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `thumbnail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `element_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '文章内容',
  `element_content_filtered` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '处理过的文章内容',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '扩展属性,如缩略图;格式为json',
  `element_age` int(255) UNSIGNED NOT NULL DEFAULT 2013 COMMENT '车龄',
  `element_sell_price` double(10, 2) UNSIGNED NOT NULL DEFAULT 8.00 COMMENT '汽车售价',
  `element_original_price` double(10, 2) UNSIGNED DEFAULT 10.00 COMMENT '汽车原价',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_status_date`(`element_type`, `element_status`, `create_time`, `id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cmf_car_element
-- ----------------------------
INSERT INTO `cmf_car_element` VALUES (1, 0, 1, 1, 1, 1, 1, 0, 1, 17, 0, 0, 0, 1589778113, 1590274872, 1589778120, 0, '16年奥迪A4L', '', '', '', 'car/20200518/e0f4a1d79ef2477593963876701a5a75.jpeg', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: &quot;&gt;明盘福利！16年16款奥迪A4L 天窗 导航 多功能方向盘 一键启动 无钥匙进入 电动座椅加热 定速巡航 抵押银行违章审车正常 车况精品 手续齐全 菏泽找我提&lt;/span&gt;&lt;/p&gt;', NULL, '{\"audio\":\"\",\"video\":\"\",\"thumbnail\":\"car\\/20200518\\/e0f4a1d79ef2477593963876701a5a75.jpeg\",\"template\":\"element\"}', 2013, 8.00, 10.00);
INSERT INTO `cmf_car_element` VALUES (2, 0, 1, 1, 1, 1, 1, 0, 1, 4, 0, 0, 0, 1589822090, 1590277176, 1589822160, 0, '14年奥迪Q3', '', '', '', 'car/20200519/576aab07c479b224f64b68b5a3c16315.jpeg', '&lt;p&gt;撒发给E&lt;/p&gt;', NULL, '{\"audio\":\"\",\"video\":\"\",\"thumbnail\":\"car\\/20200519\\/576aab07c479b224f64b68b5a3c16315.jpeg\",\"template\":\"element\"}', 2006, 9.00, 10.00);
INSERT INTO `cmf_car_element` VALUES (3, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1590277507, 1590277507, 1590277518, 0, '12年大众', '', '', '', 'car/20200524/0b19154c2aeed82e92a4e1de4f286433.jpg', '&lt;p&gt;撒旦法飞洒地方方式&lt;/p&gt;', NULL, '{\"audio\":\"\",\"video\":\"\",\"thumbnail\":\"car\\/20200524\\/0b19154c2aeed82e92a4e1de4f286433.jpg\",\"template\":\"element\"}', 2012, 2.00, 12.00);

-- ----------------------------
-- Table structure for cmf_car_emission_standard
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_emission_standard`;
CREATE TABLE `cmf_car_emission_standard`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐;1:推荐;0:不推荐',
  `element_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_emission_standard
-- ----------------------------
INSERT INTO `cmf_car_emission_standard` VALUES (1, 1, 0, 0, '国2');
INSERT INTO `cmf_car_emission_standard` VALUES (2, 1, 0, 0, '国3');
INSERT INTO `cmf_car_emission_standard` VALUES (3, 1, 0, 0, '国4');
INSERT INTO `cmf_car_emission_standard` VALUES (4, 1, 0, 0, '国5');
INSERT INTO `cmf_car_emission_standard` VALUES (5, 1, 0, 0, '欧3');
INSERT INTO `cmf_car_emission_standard` VALUES (6, 1, 0, 0, '欧4');
INSERT INTO `cmf_car_emission_standard` VALUES (7, 1, 0, 0, '欧5');
INSERT INTO `cmf_car_emission_standard` VALUES (8, 1, 0, 0, '京5');

-- ----------------------------
-- Table structure for cmf_car_emission_standard_element
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_emission_standard_element`;
CREATE TABLE `cmf_car_emission_standard_element`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emission_standard_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签 id',
  `element_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`element_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_emission_standard_element
-- ----------------------------
INSERT INTO `cmf_car_emission_standard_element` VALUES (1, 1, 1, 1);
INSERT INTO `cmf_car_emission_standard_element` VALUES (2, 1, 2, 1);
INSERT INTO `cmf_car_emission_standard_element` VALUES (3, 3, 3, 1);

-- ----------------------------
-- Table structure for cmf_car_energy
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_energy`;
CREATE TABLE `cmf_car_energy`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐;1:推荐;0:不推荐',
  `element_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_energy
-- ----------------------------
INSERT INTO `cmf_car_energy` VALUES (1, 1, 0, 0, '汽油');
INSERT INTO `cmf_car_energy` VALUES (2, 1, 0, 0, '柴油');
INSERT INTO `cmf_car_energy` VALUES (3, 1, 0, 0, '油电混动');
INSERT INTO `cmf_car_energy` VALUES (4, 1, 0, 0, '纯电动');
INSERT INTO `cmf_car_energy` VALUES (5, 1, 0, 0, '天然气');
INSERT INTO `cmf_car_energy` VALUES (6, 1, 0, 0, '插电混动');

-- ----------------------------
-- Table structure for cmf_car_energy_element
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_energy_element`;
CREATE TABLE `cmf_car_energy_element`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `energy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签 id',
  `element_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`element_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_energy_element
-- ----------------------------
INSERT INTO `cmf_car_energy_element` VALUES (1, 1, 1, 1);
INSERT INTO `cmf_car_energy_element` VALUES (3, 3, 2, 1);
INSERT INTO `cmf_car_energy_element` VALUES (4, 4, 3, 1);

-- ----------------------------
-- Table structure for cmf_car_engine
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_engine`;
CREATE TABLE `cmf_car_engine`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐;1:推荐;0:不推荐',
  `element_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_engine
-- ----------------------------
INSERT INTO `cmf_car_engine` VALUES (1, 1, 0, 0, '自然吸气');
INSERT INTO `cmf_car_engine` VALUES (2, 1, 0, 0, '涡轮增压');
INSERT INTO `cmf_car_engine` VALUES (3, 1, 0, 0, '机械增压');
INSERT INTO `cmf_car_engine` VALUES (4, 1, 0, 0, '双增压');

-- ----------------------------
-- Table structure for cmf_car_engine_element
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_engine_element`;
CREATE TABLE `cmf_car_engine_element`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `engine_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签 id',
  `element_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`element_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_engine_element
-- ----------------------------
INSERT INTO `cmf_car_engine_element` VALUES (1, 1, 1, 1);
INSERT INTO `cmf_car_engine_element` VALUES (2, 4, 2, 1);
INSERT INTO `cmf_car_engine_element` VALUES (3, 4, 3, 1);

-- ----------------------------
-- Table structure for cmf_car_gearbox
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_gearbox`;
CREATE TABLE `cmf_car_gearbox`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐;1:推荐;0:不推荐',
  `element_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_gearbox
-- ----------------------------
INSERT INTO `cmf_car_gearbox` VALUES (2, 1, 0, 0, '手动');
INSERT INTO `cmf_car_gearbox` VALUES (3, 1, 0, 0, '自动');

-- ----------------------------
-- Table structure for cmf_car_gearbox_element
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_gearbox_element`;
CREATE TABLE `cmf_car_gearbox_element`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gearbox_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签 id',
  `element_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`element_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_gearbox_element
-- ----------------------------
INSERT INTO `cmf_car_gearbox_element` VALUES (1, 2, 1, 1);
INSERT INTO `cmf_car_gearbox_element` VALUES (3, 3, 2, 1);
INSERT INTO `cmf_car_gearbox_element` VALUES (4, 2, 3, 1);

-- ----------------------------
-- Table structure for cmf_car_level
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_level`;
CREATE TABLE `cmf_car_level`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐;1:推荐;0:不推荐',
  `element_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_level
-- ----------------------------
INSERT INTO `cmf_car_level` VALUES (1, 1, 0, 0, '不限');
INSERT INTO `cmf_car_level` VALUES (2, 1, 0, 0, '微型车');
INSERT INTO `cmf_car_level` VALUES (3, 1, 0, 0, '小型车');
INSERT INTO `cmf_car_level` VALUES (4, 1, 0, 0, '紧凑型车');
INSERT INTO `cmf_car_level` VALUES (5, 1, 0, 0, '中型车');
INSERT INTO `cmf_car_level` VALUES (6, 1, 0, 0, '中大型车');
INSERT INTO `cmf_car_level` VALUES (7, 1, 0, 0, '豪华车');
INSERT INTO `cmf_car_level` VALUES (8, 1, 0, 0, 'MPV');
INSERT INTO `cmf_car_level` VALUES (9, 1, 0, 0, 'SUV');
INSERT INTO `cmf_car_level` VALUES (10, 1, 0, 0, '跑车');
INSERT INTO `cmf_car_level` VALUES (11, 1, 0, 0, '皮卡');
INSERT INTO `cmf_car_level` VALUES (12, 1, 0, 0, '面包车');

-- ----------------------------
-- Table structure for cmf_car_level_element
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_level_element`;
CREATE TABLE `cmf_car_level_element`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签 id',
  `element_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`element_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_level_element
-- ----------------------------
INSERT INTO `cmf_car_level_element` VALUES (1, 2, 1, 1);
INSERT INTO `cmf_car_level_element` VALUES (3, 2, 2, 1);
INSERT INTO `cmf_car_level_element` VALUES (4, 2, 3, 1);

-- ----------------------------
-- Table structure for cmf_car_lightspot
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_lightspot`;
CREATE TABLE `cmf_car_lightspot`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐;1:推荐;0:不推荐',
  `element_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_lightspot
-- ----------------------------
INSERT INTO `cmf_car_lightspot` VALUES (1, 1, 0, 0, '天窗');
INSERT INTO `cmf_car_lightspot` VALUES (2, 1, 0, 0, 'GPS导航');
INSERT INTO `cmf_car_lightspot` VALUES (3, 1, 0, 0, '倒车影像');
INSERT INTO `cmf_car_lightspot` VALUES (4, 1, 0, 0, '儿童锁');
INSERT INTO `cmf_car_lightspot` VALUES (5, 1, 0, 0, '涡轮增压');
INSERT INTO `cmf_car_lightspot` VALUES (6, 1, 0, 0, '无钥匙启动');
INSERT INTO `cmf_car_lightspot` VALUES (7, 1, 0, 0, '四轮碟刹');
INSERT INTO `cmf_car_lightspot` VALUES (8, 1, 0, 0, '真皮座椅');
INSERT INTO `cmf_car_lightspot` VALUES (9, 1, 0, 0, 'ESP');
INSERT INTO `cmf_car_lightspot` VALUES (10, 1, 0, 0, '氙气大灯');
INSERT INTO `cmf_car_lightspot` VALUES (11, 1, 0, 0, '定速巡航');
INSERT INTO `cmf_car_lightspot` VALUES (12, 1, 0, 0, '自动空调');
INSERT INTO `cmf_car_lightspot` VALUES (13, 1, 0, 0, '胎压监测');
INSERT INTO `cmf_car_lightspot` VALUES (14, 1, 0, 0, '自动泊车');
INSERT INTO `cmf_car_lightspot` VALUES (15, 1, 0, 0, '空气净化器');
INSERT INTO `cmf_car_lightspot` VALUES (16, 1, 0, 0, '换挡拨片');
INSERT INTO `cmf_car_lightspot` VALUES (17, 1, 0, 0, '电动座椅');
INSERT INTO `cmf_car_lightspot` VALUES (18, 1, 0, 0, '儿童座椅接口');

-- ----------------------------
-- Table structure for cmf_car_lightspot_element
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_lightspot_element`;
CREATE TABLE `cmf_car_lightspot_element`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lightspot_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签 id',
  `element_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`element_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_lightspot_element
-- ----------------------------
INSERT INTO `cmf_car_lightspot_element` VALUES (3, 0, 1, 1);
INSERT INTO `cmf_car_lightspot_element` VALUES (4, 1, 1, 1);
INSERT INTO `cmf_car_lightspot_element` VALUES (5, 1, 2, 1);
INSERT INTO `cmf_car_lightspot_element` VALUES (6, 3, 2, 1);
INSERT INTO `cmf_car_lightspot_element` VALUES (7, 3, 3, 1);
INSERT INTO `cmf_car_lightspot_element` VALUES (8, 4, 3, 1);

-- ----------------------------
-- Table structure for cmf_car_mileage
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_mileage`;
CREATE TABLE `cmf_car_mileage`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `num` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签文章数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_mileage
-- ----------------------------
INSERT INTO `cmf_car_mileage` VALUES (1, 1, 2);
INSERT INTO `cmf_car_mileage` VALUES (2, 1, 1);
INSERT INTO `cmf_car_mileage` VALUES (3, 1, 3);
INSERT INTO `cmf_car_mileage` VALUES (4, 1, 5);
INSERT INTO `cmf_car_mileage` VALUES (5, 1, 8);

-- ----------------------------
-- Table structure for cmf_car_mileage_element
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_mileage_element`;
CREATE TABLE `cmf_car_mileage_element`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mileage_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签 id',
  `element_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`element_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_mileage_element
-- ----------------------------
INSERT INTO `cmf_car_mileage_element` VALUES (2, 0, 1, 1);
INSERT INTO `cmf_car_mileage_element` VALUES (3, 0, 1, 1);
INSERT INTO `cmf_car_mileage_element` VALUES (4, 0, 1, 1);
INSERT INTO `cmf_car_mileage_element` VALUES (6, 5, 2, 1);
INSERT INTO `cmf_car_mileage_element` VALUES (7, 3, 3, 1);

-- ----------------------------
-- Table structure for cmf_car_price_range
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_price_range`;
CREATE TABLE `cmf_car_price_range`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `min_price` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签文章数',
  `max_price` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_price_range
-- ----------------------------
INSERT INTO `cmf_car_price_range` VALUES (1, 1, 0, 1);
INSERT INTO `cmf_car_price_range` VALUES (2, 1, 1, 3);
INSERT INTO `cmf_car_price_range` VALUES (3, 1, 3, 5);
INSERT INTO `cmf_car_price_range` VALUES (4, 1, 5, 10);
INSERT INTO `cmf_car_price_range` VALUES (5, 1, 10, 15);
INSERT INTO `cmf_car_price_range` VALUES (6, 1, 15, 20);
INSERT INTO `cmf_car_price_range` VALUES (7, 1, 20, 25);
INSERT INTO `cmf_car_price_range` VALUES (8, 1, 25, 30);

-- ----------------------------
-- Table structure for cmf_car_price_range_element
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_price_range_element`;
CREATE TABLE `cmf_car_price_range_element`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price_range_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签 id',
  `element_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`element_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_price_range_element
-- ----------------------------
INSERT INTO `cmf_car_price_range_element` VALUES (2, 0, 2, 1);

-- ----------------------------
-- Table structure for cmf_car_production_type
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_production_type`;
CREATE TABLE `cmf_car_production_type`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐;1:推荐;0:不推荐',
  `element_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_production_type
-- ----------------------------
INSERT INTO `cmf_car_production_type` VALUES (2, 1, 0, 0, '合资');
INSERT INTO `cmf_car_production_type` VALUES (3, 1, 0, 0, '国产');
INSERT INTO `cmf_car_production_type` VALUES (4, 1, 0, 0, '进口');

-- ----------------------------
-- Table structure for cmf_car_production_type_element
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_production_type_element`;
CREATE TABLE `cmf_car_production_type_element`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `production_type_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签 id',
  `element_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`element_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_production_type_element
-- ----------------------------
INSERT INTO `cmf_car_production_type_element` VALUES (1, 3, 2, 1);
INSERT INTO `cmf_car_production_type_element` VALUES (2, 4, 3, 1);

-- ----------------------------
-- Table structure for cmf_car_seat
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_seat`;
CREATE TABLE `cmf_car_seat`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `num` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签文章数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_seat
-- ----------------------------
INSERT INTO `cmf_car_seat` VALUES (1, 1, 2);
INSERT INTO `cmf_car_seat` VALUES (2, 1, 4);
INSERT INTO `cmf_car_seat` VALUES (3, 1, 5);
INSERT INTO `cmf_car_seat` VALUES (4, 1, 6);
INSERT INTO `cmf_car_seat` VALUES (5, 1, 7);

-- ----------------------------
-- Table structure for cmf_car_seat_element
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_seat_element`;
CREATE TABLE `cmf_car_seat_element`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seat_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签 id',
  `element_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`element_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_car_seat_element
-- ----------------------------
INSERT INTO `cmf_car_seat_element` VALUES (1, 2, 2, 1);
INSERT INTO `cmf_car_seat_element` VALUES (2, 3, 3, 1);

-- ----------------------------
-- Table structure for cmf_car_tag
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_tag`;
CREATE TABLE `cmf_car_tag`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmf_car_tag_element
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_tag_element`;
CREATE TABLE `cmf_car_tag_element`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签 id',
  `element_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`element_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmf_comment
-- ----------------------------
DROP TABLE IF EXISTS `cmf_comment`;
CREATE TABLE `cmf_comment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '被回复的评论id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发表评论的用户id',
  `to_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '被评论的用户id',
  `object_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论内容 id',
  `like_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞数',
  `dislike_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '不喜欢数',
  `floor` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '楼层数',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '原文地址',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '评论内容',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '扩展属性',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `table_id_status`(`table_name`, `object_id`, `status`) USING BTREE,
  INDEX `object_id`(`object_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmf_hook
-- ----------------------------
DROP TABLE IF EXISTS `cmf_hook`;
CREATE TABLE `cmf_hook`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统钩子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_hook
-- ----------------------------
INSERT INTO `cmf_hook` VALUES (2, 1, 0, '应用开始', 'app_begin', 'cmf', '应用开始');
INSERT INTO `cmf_hook` VALUES (3, 1, 0, '模块初始化', 'module_init', 'cmf', '模块初始化');
INSERT INTO `cmf_hook` VALUES (4, 1, 0, '控制器开始', 'action_begin', 'cmf', '控制器开始');
INSERT INTO `cmf_hook` VALUES (5, 1, 0, '视图输出过滤', 'view_filter', 'cmf', '视图输出过滤');
INSERT INTO `cmf_hook` VALUES (6, 1, 0, '应用结束', 'app_end', 'cmf', '应用结束');
INSERT INTO `cmf_hook` VALUES (7, 1, 0, '日志write方法', 'log_write', 'cmf', '日志write方法');
INSERT INTO `cmf_hook` VALUES (8, 1, 0, '输出结束', 'response_end', 'cmf', '输出结束');
INSERT INTO `cmf_hook` VALUES (9, 1, 0, '后台控制器初始化', 'admin_init', 'cmf', '后台控制器初始化');
INSERT INTO `cmf_hook` VALUES (10, 1, 0, '前台控制器初始化', 'home_init', 'cmf', '前台控制器初始化');
INSERT INTO `cmf_hook` VALUES (11, 1, 1, '发送手机验证码', 'send_mobile_verification_code', 'cmf', '发送手机验证码');
INSERT INTO `cmf_hook` VALUES (12, 3, 0, '模板 body标签开始', 'body_start', '', '模板 body标签开始');
INSERT INTO `cmf_hook` VALUES (13, 3, 0, '模板 head标签结束前', 'before_head_end', '', '模板 head标签结束前');
INSERT INTO `cmf_hook` VALUES (14, 3, 0, '模板底部开始', 'footer_start', '', '模板底部开始');
INSERT INTO `cmf_hook` VALUES (15, 3, 0, '模板底部开始之前', 'before_footer', '', '模板底部开始之前');
INSERT INTO `cmf_hook` VALUES (16, 3, 0, '模板底部结束之前', 'before_footer_end', '', '模板底部结束之前');
INSERT INTO `cmf_hook` VALUES (17, 3, 0, '模板 body 标签结束之前', 'before_body_end', '', '模板 body 标签结束之前');
INSERT INTO `cmf_hook` VALUES (18, 3, 0, '模板左边栏开始', 'left_sidebar_start', '', '模板左边栏开始');
INSERT INTO `cmf_hook` VALUES (19, 3, 0, '模板左边栏结束之前', 'before_left_sidebar_end', '', '模板左边栏结束之前');
INSERT INTO `cmf_hook` VALUES (20, 3, 0, '模板右边栏开始', 'right_sidebar_start', '', '模板右边栏开始');
INSERT INTO `cmf_hook` VALUES (21, 3, 0, '模板右边栏结束之前', 'before_right_sidebar_end', '', '模板右边栏结束之前');
INSERT INTO `cmf_hook` VALUES (22, 3, 1, '评论区', 'comment', '', '评论区');
INSERT INTO `cmf_hook` VALUES (23, 3, 1, '留言区', 'guestbook', '', '留言区');
INSERT INTO `cmf_hook` VALUES (24, 2, 0, '后台首页仪表盘', 'admin_dashboard', 'admin', '后台首页仪表盘');
INSERT INTO `cmf_hook` VALUES (25, 4, 0, '后台模板 head标签结束前', 'admin_before_head_end', '', '后台模板 head标签结束前');
INSERT INTO `cmf_hook` VALUES (26, 4, 0, '后台模板 body 标签结束之前', 'admin_before_body_end', '', '后台模板 body 标签结束之前');
INSERT INTO `cmf_hook` VALUES (27, 2, 0, '后台登录页面', 'admin_login', 'admin', '后台登录页面');
INSERT INTO `cmf_hook` VALUES (28, 1, 1, '前台模板切换', 'switch_theme', 'cmf', '前台模板切换');
INSERT INTO `cmf_hook` VALUES (29, 3, 0, '主要内容之后', 'after_content', '', '主要内容之后');
INSERT INTO `cmf_hook` VALUES (32, 2, 1, '获取上传界面', 'fetch_upload_view', 'user', '获取上传界面');
INSERT INTO `cmf_hook` VALUES (33, 3, 0, '主要内容之前', 'before_content', 'cmf', '主要内容之前');
INSERT INTO `cmf_hook` VALUES (34, 1, 0, '日志写入完成', 'log_write_done', 'cmf', '日志写入完成');
INSERT INTO `cmf_hook` VALUES (35, 1, 1, '后台模板切换', 'switch_admin_theme', 'cmf', '后台模板切换');
INSERT INTO `cmf_hook` VALUES (36, 1, 1, '验证码图片', 'captcha_image', 'cmf', '验证码图片');
INSERT INTO `cmf_hook` VALUES (37, 2, 1, '后台模板设计界面', 'admin_theme_design_view', 'admin', '后台模板设计界面');
INSERT INTO `cmf_hook` VALUES (38, 2, 1, '后台设置网站信息界面', 'admin_setting_site_view', 'admin', '后台设置网站信息界面');
INSERT INTO `cmf_hook` VALUES (39, 2, 1, '后台清除缓存界面', 'admin_setting_clear_cache_view', 'admin', '后台清除缓存界面');
INSERT INTO `cmf_hook` VALUES (40, 2, 1, '后台导航管理界面', 'admin_nav_index_view', 'admin', '后台导航管理界面');
INSERT INTO `cmf_hook` VALUES (41, 2, 1, '后台友情链接管理界面', 'admin_link_index_view', 'admin', '后台友情链接管理界面');
INSERT INTO `cmf_hook` VALUES (42, 2, 1, '后台幻灯片管理界面', 'admin_slide_index_view', 'admin', '后台幻灯片管理界面');
INSERT INTO `cmf_hook` VALUES (43, 2, 1, '后台管理员列表界面', 'admin_user_index_view', 'admin', '后台管理员列表界面');
INSERT INTO `cmf_hook` VALUES (44, 2, 1, '后台角色管理界面', 'admin_rbac_index_view', 'admin', '后台角色管理界面');
INSERT INTO `cmf_hook` VALUES (49, 2, 1, '用户管理本站用户列表界面', 'user_admin_index_view', 'user', '用户管理本站用户列表界面');
INSERT INTO `cmf_hook` VALUES (50, 2, 1, '资源管理列表界面', 'user_admin_asset_index_view', 'user', '资源管理列表界面');
INSERT INTO `cmf_hook` VALUES (51, 2, 1, '用户管理第三方用户列表界面', 'user_admin_oauth_index_view', 'user', '用户管理第三方用户列表界面');
INSERT INTO `cmf_hook` VALUES (52, 2, 1, '后台首页界面', 'admin_index_index_view', 'admin', '后台首页界面');
INSERT INTO `cmf_hook` VALUES (53, 2, 1, '后台回收站界面', 'admin_recycle_bin_index_view', 'admin', '后台回收站界面');
INSERT INTO `cmf_hook` VALUES (54, 2, 1, '后台菜单管理界面', 'admin_menu_index_view', 'admin', '后台菜单管理界面');
INSERT INTO `cmf_hook` VALUES (55, 2, 1, '后台自定义登录是否开启钩子', 'admin_custom_login_open', 'admin', '后台自定义登录是否开启钩子');
INSERT INTO `cmf_hook` VALUES (64, 2, 1, '后台幻灯片页面列表界面', 'admin_slide_item_index_view', 'admin', '后台幻灯片页面列表界面');
INSERT INTO `cmf_hook` VALUES (65, 2, 1, '后台幻灯片页面添加界面', 'admin_slide_item_add_view', 'admin', '后台幻灯片页面添加界面');
INSERT INTO `cmf_hook` VALUES (66, 2, 1, '后台幻灯片页面编辑界面', 'admin_slide_item_edit_view', 'admin', '后台幻灯片页面编辑界面');
INSERT INTO `cmf_hook` VALUES (67, 2, 1, '后台管理员添加界面', 'admin_user_add_view', 'admin', '后台管理员添加界面');
INSERT INTO `cmf_hook` VALUES (68, 2, 1, '后台管理员编辑界面', 'admin_user_edit_view', 'admin', '后台管理员编辑界面');
INSERT INTO `cmf_hook` VALUES (69, 2, 1, '后台角色添加界面', 'admin_rbac_role_add_view', 'admin', '后台角色添加界面');
INSERT INTO `cmf_hook` VALUES (70, 2, 1, '后台角色编辑界面', 'admin_rbac_role_edit_view', 'admin', '后台角色编辑界面');
INSERT INTO `cmf_hook` VALUES (71, 2, 1, '后台角色授权界面', 'admin_rbac_authorize_view', 'admin', '后台角色授权界面');
INSERT INTO `cmf_hook` VALUES (72, 2, 0, '文章显示之前', 'portal_before_assign_article', 'portal', '文章显示之前');
INSERT INTO `cmf_hook` VALUES (73, 2, 0, '后台文章保存之后', 'portal_admin_after_save_article', 'portal', '后台文章保存之后');
INSERT INTO `cmf_hook` VALUES (74, 2, 1, '门户后台文章管理列表界面', 'portal_admin_article_index_view', 'portal', '门户后台文章管理列表界面');
INSERT INTO `cmf_hook` VALUES (75, 2, 1, '门户后台文章添加界面', 'portal_admin_article_add_view', 'portal', '门户后台文章添加界面');
INSERT INTO `cmf_hook` VALUES (76, 2, 1, '门户后台文章编辑界面', 'portal_admin_article_edit_view', 'portal', '门户后台文章编辑界面');
INSERT INTO `cmf_hook` VALUES (77, 2, 1, '门户后台文章分类管理列表界面', 'portal_admin_category_index_view', 'portal', '门户后台文章分类管理列表界面');
INSERT INTO `cmf_hook` VALUES (78, 2, 1, '门户后台文章分类添加界面', 'portal_admin_category_add_view', 'portal', '门户后台文章分类添加界面');
INSERT INTO `cmf_hook` VALUES (79, 2, 1, '门户后台文章分类编辑界面', 'portal_admin_category_edit_view', 'portal', '门户后台文章分类编辑界面');
INSERT INTO `cmf_hook` VALUES (80, 2, 1, '门户后台页面管理列表界面', 'portal_admin_page_index_view', 'portal', '门户后台页面管理列表界面');
INSERT INTO `cmf_hook` VALUES (81, 2, 1, '门户后台页面添加界面', 'portal_admin_page_add_view', 'portal', '门户后台页面添加界面');
INSERT INTO `cmf_hook` VALUES (82, 2, 1, '门户后台页面编辑界面', 'portal_admin_page_edit_view', 'portal', '门户后台页面编辑界面');
INSERT INTO `cmf_hook` VALUES (83, 2, 1, '门户后台文章标签管理列表界面', 'portal_admin_tag_index_view', 'portal', '门户后台文章标签管理列表界面');
INSERT INTO `cmf_hook` VALUES (84, 4, 0, '门户后台文章添加编辑界面右侧栏', 'portal_admin_article_edit_view_right_sidebar', 'portal', '门户后台文章添加编辑界面右侧栏');
INSERT INTO `cmf_hook` VALUES (85, 4, 0, '门户后台文章添加编辑界面主要内容', 'portal_admin_article_edit_view_main', 'portal', '门户后台文章添加编辑界面主要内容');

-- ----------------------------
-- Table structure for cmf_hook_plugin
-- ----------------------------
DROP TABLE IF EXISTS `cmf_hook_plugin`;
CREATE TABLE `cmf_hook_plugin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT 10000 COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统钩子插件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmf_link
-- ----------------------------
DROP TABLE IF EXISTS `cmf_link`;
CREATE TABLE `cmf_link`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT 0 COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT 10000 COMMENT '排序',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '友情链接表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_link
-- ----------------------------
INSERT INTO `cmf_link` VALUES (1, 1, 1, 8, 'thinkcmf官网', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '');

-- ----------------------------
-- Table structure for cmf_nav
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav`;
CREATE TABLE `cmf_nav`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `is_main` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '前台导航位置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_nav
-- ----------------------------
INSERT INTO `cmf_nav` VALUES (1, 1, '主导航', '主导航');
INSERT INTO `cmf_nav` VALUES (2, 0, '底部导航', '');

-- ----------------------------
-- Table structure for cmf_nav_menu
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav_menu`;
CREATE TABLE `cmf_nav_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT 10000 COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '层级关系',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '前台导航菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_nav_menu
-- ----------------------------
INSERT INTO `cmf_nav_menu` VALUES (1, 1, 0, 1, 0, '首页', '', 'home', '', '0-1');
INSERT INTO `cmf_nav_menu` VALUES (2, 1, 0, 1, 10000, '我要买车', '', 'baidu.com', '', '');
INSERT INTO `cmf_nav_menu` VALUES (3, 1, 0, 1, 10000, '我要卖车', '', 'home', '', '');
INSERT INTO `cmf_nav_menu` VALUES (4, 1, 0, 1, 10000, '联系我们', '', 'home', '', '');
INSERT INTO `cmf_nav_menu` VALUES (5, 1, 0, 1, 10000, '文章分类一', '', '{\"action\":\"portal\\/List\\/index\",\"param\":{\"id\":1}}', '', '');

-- ----------------------------
-- Table structure for cmf_option
-- ----------------------------
DROP TABLE IF EXISTS `cmf_option`;
CREATE TABLE `cmf_option`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `option_name`(`option_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '全站配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cmf_option
-- ----------------------------
INSERT INTO `cmf_option` VALUES (1, 1, 'site_info', '{\"site_name\":\"ThinkCMF\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_seo_title\":\"ThinkCMF\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_seo_keywords\":\"ThinkCMF,php,\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6,cmf,cms,\\u7b80\\u7ea6\\u98ce, simplewind,framework\",\"site_seo_description\":\"ThinkCMF\\u662f\\u7b80\\u7ea6\\u98ce\\u7f51\\u7edc\\u79d1\\u6280\\u53d1\\u5e03\\u7684\\u4e00\\u6b3e\\u7528\\u4e8e\\u5feb\\u901f\\u5f00\\u53d1\\u7684\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\"}');

-- ----------------------------
-- Table structure for cmf_plugin
-- ----------------------------
DROP TABLE IF EXISTS `cmf_plugin`;
CREATE TABLE `cmf_plugin`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '插件安装时间',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '插件描述',
  `config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '插件配置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '插件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmf_portal_category
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_category`;
CREATE TABLE `cmf_portal_category`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类父id',
  `post_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类文章数',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT 10000 COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类描述',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `seo_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `list_tpl` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '扩展属性',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_portal_category
-- ----------------------------
INSERT INTO `cmf_portal_category` VALUES (1, 0, 0, 1, 0, 10000, '文章分类一', '', '0-1', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');

-- ----------------------------
-- Table structure for cmf_portal_category_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_category_post`;
CREATE TABLE `cmf_portal_category_post`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章id',
  `category_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT 10000 COMMENT '排序',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `term_taxonomy_id`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 分类文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_portal_category_post
-- ----------------------------
INSERT INTO `cmf_portal_category_post` VALUES (1, 1, 1, 10000, 1);
INSERT INTO `cmf_portal_category_post` VALUES (2, 2, 1, 10000, 1);
INSERT INTO `cmf_portal_category_post` VALUES (3, 3, 1, 10000, 1);
INSERT INTO `cmf_portal_category_post` VALUES (4, 4, 1, 10000, 1);

-- ----------------------------
-- Table structure for cmf_portal_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_post`;
CREATE TABLE `cmf_portal_post`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级id',
  `post_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发表者用户id',
  `post_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '查看数',
  `post_favorites` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收藏数',
  `post_like` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞数',
  `comment_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论数',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `published_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发布时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `thumbnail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `post_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '文章内容',
  `post_content_filtered` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '处理过的文章内容',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '扩展属性,如缩略图;格式为json',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_status_date`(`post_type`, `post_status`, `create_time`, `id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cmf_portal_post
-- ----------------------------
INSERT INTO `cmf_portal_post` VALUES (1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1590019592, 1590019592, 1590019677, 0, '测试文章一', '', '', '', '', '&lt;p&gt;测试文章1&lt;/p&gt;', NULL, '{\"audio\":\"\",\"video\":\"\",\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES (2, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1590019620, 1590019620, 1590019677, 0, '测试文章二', '测试文章二', '', '', '', '&lt;p&gt;撒旦法&lt;/p&gt;', NULL, '{\"audio\":\"\",\"video\":\"\",\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES (3, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1590019644, 1590019644, 1590019677, 0, '测试文章3', '', '', '', '', '&lt;p&gt;算法撒&lt;/p&gt;', NULL, '{\"audio\":\"\",\"video\":\"\",\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES (4, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1590019660, 1590019660, 1590019677, 0, '测试文章4', '', '', '', '', '&lt;p&gt;撒旦法萨芬&lt;/p&gt;', NULL, '{\"audio\":\"\",\"video\":\"\",\"thumbnail\":\"\",\"template\":\"\"}');

-- ----------------------------
-- Table structure for cmf_portal_tag
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_tag`;
CREATE TABLE `cmf_portal_tag`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'portal应用 文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_portal_tag
-- ----------------------------
INSERT INTO `cmf_portal_tag` VALUES (1, 1, 0, 0, '测试文章二');

-- ----------------------------
-- Table structure for cmf_portal_tag_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_tag_post`;
CREATE TABLE `cmf_portal_tag_post`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签 id',
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_portal_tag_post
-- ----------------------------
INSERT INTO `cmf_portal_tag_post` VALUES (1, 1, 2, 1);

-- ----------------------------
-- Table structure for cmf_recycle_bin
-- ----------------------------
DROP TABLE IF EXISTS `cmf_recycle_bin`;
CREATE TABLE `cmf_recycle_bin`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT 0 COMMENT '删除内容 id',
  `create_time` int(10) UNSIGNED DEFAULT 0 COMMENT '创建时间',
  `table_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = ' 回收站' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmf_role
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role`;
CREATE TABLE `cmf_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父角色ID',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT 0 COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_role
-- ----------------------------
INSERT INTO `cmf_role` VALUES (1, 0, 1, 1329633709, 1329633709, 0, '超级管理员', '拥有网站最高管理员权限！');
INSERT INTO `cmf_role` VALUES (2, 0, 1, 1329633709, 1329633709, 0, '普通管理员', '权限由最高管理员分配！');

-- ----------------------------
-- Table structure for cmf_role_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role_user`;
CREATE TABLE `cmf_role_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '角色 id',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmf_route
-- ----------------------------
DROP TABLE IF EXISTS `cmf_route`;
CREATE TABLE `cmf_route`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT 10000 COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'url路由表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_route
-- ----------------------------
INSERT INTO `cmf_route` VALUES (1, 5000, 1, 2, 'car/List/index?id=1', 'jiangsu');
INSERT INTO `cmf_route` VALUES (2, 4999, 1, 2, 'car/Element/index?cid=1', 'jiangsu/:id');
INSERT INTO `cmf_route` VALUES (3, 5000, 1, 2, 'car/List/index?id=2', 'zhejiang');
INSERT INTO `cmf_route` VALUES (4, 4999, 1, 2, 'car/Element/index?cid=2', 'zhejiang/:id');
INSERT INTO `cmf_route` VALUES (5, 5000, 1, 2, 'car/List/index?id=3', 'guangzhou');
INSERT INTO `cmf_route` VALUES (6, 4999, 1, 2, 'car/Element/index?cid=3', 'guangzhou/:id');
INSERT INTO `cmf_route` VALUES (7, 5000, 1, 2, 'car/List/index?id=4', 'anhui');
INSERT INTO `cmf_route` VALUES (8, 4999, 1, 2, 'car/Element/index?cid=4', 'anhui/:id');
INSERT INTO `cmf_route` VALUES (9, 5000, 1, 2, 'car/List/index?id=5', 'shandong');
INSERT INTO `cmf_route` VALUES (10, 4999, 1, 2, 'car/Element/index?cid=5', 'shandong/:id');
INSERT INTO `cmf_route` VALUES (11, 5000, 1, 2, 'car/List/index?id=6', 'suzhou');
INSERT INTO `cmf_route` VALUES (12, 4999, 1, 2, 'car/Element/index?cid=6', 'suzhou/:id');
INSERT INTO `cmf_route` VALUES (13, 5000, 1, 2, 'car/List/index?id=7', 'xuzhou');
INSERT INTO `cmf_route` VALUES (14, 4999, 1, 2, 'car/Element/index?cid=7', 'xuzhou/:id');

-- ----------------------------
-- Table structure for cmf_slide
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide`;
CREATE TABLE `cmf_slide`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '幻灯片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmf_slide_item
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide_item`;
CREATE TABLE `cmf_slide_item`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL DEFAULT 0 COMMENT '幻灯片id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT 10000 COMMENT '排序',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '幻灯片描述',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '幻灯片内容',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '扩展信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `slide_id`(`slide_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '幻灯片子项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmf_theme
-- ----------------------------
DROP TABLE IF EXISTS `cmf_theme`;
CREATE TABLE `cmf_theme`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '安装时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后升级时间',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为已编译模板',
  `theme` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_theme
-- ----------------------------
INSERT INTO `cmf_theme` VALUES (1, 0, 0, 0, 0, 'simpleboot3', 'simpleboot3', '1.0.2', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', 'zh-cn', 'ThinkCMF模板', 'ThinkCMF默认模板');
INSERT INTO `cmf_theme` VALUES (2, 0, 0, 0, 0, 'enterprise9', 'enterprise9', '1.0.0', 'http://xamclub.com', '', 'TouchAfflatus', 'http://xamclub.com', 'zh-cn', '企业商品展示模板', '企业商品展示模板');

-- ----------------------------
-- Table structure for cmf_theme_file
-- ----------------------------
DROP TABLE IF EXISTS `cmf_theme_file`;
CREATE TABLE `cmf_theme_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT 10000 COMMENT '排序',
  `theme` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_theme_file
-- ----------------------------
INSERT INTO `cmf_theme_file` VALUES (1, 0, 10, 'simpleboot3', '文章页', 'portal/Article/index', 'portal/article', '文章页模板文件', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (2, 0, 10, 'simpleboot3', '联系我们页', 'portal/Page/index', 'portal/contact', '联系我们页模板文件', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (3, 0, 5, 'simpleboot3', '首页', 'portal/Index/index', 'portal/index', '首页模板文件', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (4, 0, 10, 'simpleboot3', '文章列表页', 'portal/List/index', 'portal/list', '文章列表模板文件', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (5, 0, 10, 'simpleboot3', '单页面', 'portal/Page/index', 'portal/page', '单页面模板文件', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (6, 0, 10, 'simpleboot3', '搜索页面', 'portal/search/index', 'portal/search', '搜索模板文件', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (7, 1, 0, 'simpleboot3', '模板全局配置', 'public/Config', 'public/config', '模板全局配置文件', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (8, 1, 1, 'simpleboot3', '导航条', 'public/Nav', 'public/nav', '导航条模板文件', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (9, 0, 10, 'cartheme', '产品页', 'car/Item/index', 'car/item', '产品页模板文件', '{\"vars\":[],\"widgets\":{\"hottest_items\":{\"title\":\"\\u70ed\\u95e8\\u63a8\\u8350\",\"display\":\"1\",\"vars\":{\"hottest_items_brand_id\":{\"title\":\"\\u4ea7\\u54c1\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":[],\"widgets\":{\"hottest_items\":{\"title\":\"\\u70ed\\u95e8\\u63a8\\u8350\",\"display\":\"1\",\"vars\":{\"hottest_items_brand_id\":{\"title\":\"\\u4ea7\\u54c1\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (10, 0, 10, 'cartheme', '产品列表页', 'car/List/index', 'car/list', '产品列表模板文件', '{\"vars\":[],\"widgets\":{\"hottest_items\":{\"title\":\"\\u70ed\\u95e8\\u4ea7\\u54c1\",\"display\":\"1\",\"vars\":{\"hottest_items_brand_id\":{\"title\":\"\\u4ea7\\u54c1\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_items\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_items_brand_id\":{\"title\":\"\\u4ea7\\u54c1\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":[],\"widgets\":{\"hottest_items\":{\"title\":\"\\u70ed\\u95e8\\u4ea7\\u54c1\",\"display\":\"1\",\"vars\":{\"hottest_items_brand_id\":{\"title\":\"\\u4ea7\\u54c1\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_items\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_items_brand_id\":{\"title\":\"\\u4ea7\\u54c1\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (11, 0, 10, 'cartheme', '产品搜索页面', 'car/search/index', 'car/search', '搜索模板文件', '[]', '[]', NULL);
INSERT INTO `cmf_theme_file` VALUES (12, 0, 10, 'cartheme', '文章页', 'portal/Article/index', 'portal/article', '文章页模板文件', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_brand_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_brand_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_brand_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_brand_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (13, 0, 10, 'cartheme', '资质荣誉列表页', 'portal/List/index', 'portal/honor', '资质荣誉列表模板文件', '[]', '[]', NULL);
INSERT INTO `cmf_theme_file` VALUES (14, 0, 5, 'cartheme', '首页', 'portal/Index/index', 'portal/index', '首页模板文件', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"hot_car\":{\"title\":\"\\u70ed\\u95e8\\u63a8\\u8350\",\"display\":\"1\",\"vars\":{\"hot_car_sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"\\u6211\\u4eec\\u7528\\u5fc3\\u4e3a\\u60a8\\u505a\\u7684\\u66f4\\u597d\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"hot_car_brand_id\":{\"title\":\"\\u4ea7\\u54c1\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/Brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_news\":{\"title\":\"\\u65b0\\u95fb\\u4e2d\\u5fc3\",\"display\":\"1\",\"vars\":{\"last_news_brand_name\":{\"title\":\"\\u65b0\\u95fb\\u5206\\u7c7b\\uff08\\u4e00\\uff09\\u6807\\u9898\",\"value\":\"\\u6280\\u672f\\u8981\\u9886\",\"type\":\"text\",\"placeholder\":\"\\u65b0\\u95fb\\u5206\\u7c7b\\uff08\\u4e00\\uff09\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"last_news_brand_id\":{\"title\":\"\\u65b0\\u95fb\\u5206\\u7c7b\\uff08\\u4e00\\uff09ID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}},\"last_news_category_name2\":{\"title\":\"\\u65b0\\u95fb\\u5206\\u7c7b\\uff08\\u4e8c\\uff09\\u6807\\u9898\",\"value\":\"\\u884c\\u4e1a\\u8d44\\u8baf\",\"type\":\"text\",\"placeholder\":\"\\u65b0\\u95fb\\u5206\\u7c7b\\uff08\\u4e8c\\uff09\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"last_news_brand_id2\":{\"title\":\"\\u65b0\\u95fb\\u5206\\u7c7b\\uff08\\u4e8c\\uff09ID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"index_ad1\":{\"title\":\"\\u626b\\u4e00\\u626b\\u5173\\u6ce8\\u5fae\\u4fe1\\uff01\",\"display\":\"1\",\"vars\":{\"index_ad1_txt\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\\u6bcf\\u5468\\u6211\\u4eec\\u4f1a\\u901a\\u8fc7\\u5fae\\u4fe1\\u7ed9\\u60a8\\u63a8\\u9001\\u82d7\\u6728\\u7684\\u6700\\u65b0\\u77e5\\u8bc6\\uff0c\\u8ba9\\u60a8\\u968f\\u65f6\\u968f\\u5730\\u638c\\u63e1\\u82d7\\u6728\\u7684\\u4e00\\u7ebf\\u77e5\\u8bc6\\u3002\\u60a8\\u4e5f\\u53ef\\u4ee5\\u901a\\u8fc7\\u5fae\\u4fe1\\u4e0e\\u6211\\u4eec\\u4ea4\\u6d41\\u3002\\u5206\\u4eab\\u60a8\\u80b2\\u82d7\\u4e2d\\u9047\\u5230\\u7684\\u96be\\u9898\\uff0c\\u8ba9\\u6211\\u4eec\\u7b2c\\u4e00\\u65f6\\u95f4\\u7ed9\\u60a8\\u89e3\\u51b3\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u63cf\\u8ff0\",\"tip\":\"\",\"rule\":{\"require\":true}},\"index_ad1_img\":{\"title\":\"\\u80cc\\u666f\\u56fe\",\"name\":\"index_ad1_img\",\"value\":\"\",\"type\":\"image\",\"tip\":\"\\u53c2\\u8003\\u5c3a\\u5bf8\\uff1a1280 x 200 px\",\"rule\":[]},\"index_ad1_code\":{\"title\":\"\\u4e8c\\u7ef4\\u7801\",\"name\":\"index_ad1_code\",\"value\":\"\",\"type\":\"image\",\"tip\":\"\\u53c2\\u8003\\u5c3a\\u5bf8\\uff1a132 x 132 px\",\"rule\":[]}}},\"last_car\":{\"title\":\"\\u4ea7\\u54c1\\u4e2d\\u5fc3\",\"display\":\"1\",\"vars\":{\"last_car_brand_id\":{\"title\":\"\\u4ea7\\u54c1\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/Brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\\u9009\\u62e9\\u4e00\\u7236\\u5206\\u7c7b\\u5373\\u53ef\",\"rule\":{\"require\":true}}}},\"nursery_car\":{\"title\":\"\\u57fa\\u5730\\u5c55\\u793a\",\"display\":\"1\",\"vars\":{\"nursery_car_brand_id\":{\"title\":\"\\u4ea7\\u54c1\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/Brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"hot_car\":{\"title\":\"\\u70ed\\u95e8\\u63a8\\u8350\",\"display\":\"1\",\"vars\":{\"hot_car_sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"\\u6211\\u4eec\\u7528\\u5fc3\\u4e3a\\u60a8\\u505a\\u7684\\u66f4\\u597d\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"hot_car_brand_id\":{\"title\":\"\\u4ea7\\u54c1\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/Brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_news\":{\"title\":\"\\u65b0\\u95fb\\u4e2d\\u5fc3\",\"display\":\"1\",\"vars\":{\"last_news_brand_name\":{\"title\":\"\\u65b0\\u95fb\\u5206\\u7c7b\\uff08\\u4e00\\uff09\\u6807\\u9898\",\"value\":\"\\u6280\\u672f\\u8981\\u9886\",\"type\":\"text\",\"placeholder\":\"\\u65b0\\u95fb\\u5206\\u7c7b\\uff08\\u4e00\\uff09\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"last_news_brand_id\":{\"title\":\"\\u65b0\\u95fb\\u5206\\u7c7b\\uff08\\u4e00\\uff09ID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}},\"last_news_category_name2\":{\"title\":\"\\u65b0\\u95fb\\u5206\\u7c7b\\uff08\\u4e8c\\uff09\\u6807\\u9898\",\"value\":\"\\u884c\\u4e1a\\u8d44\\u8baf\",\"type\":\"text\",\"placeholder\":\"\\u65b0\\u95fb\\u5206\\u7c7b\\uff08\\u4e8c\\uff09\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"last_news_brand_id2\":{\"title\":\"\\u65b0\\u95fb\\u5206\\u7c7b\\uff08\\u4e8c\\uff09ID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"index_ad1\":{\"title\":\"\\u626b\\u4e00\\u626b\\u5173\\u6ce8\\u5fae\\u4fe1\\uff01\",\"display\":\"1\",\"vars\":{\"index_ad1_txt\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\\u6bcf\\u5468\\u6211\\u4eec\\u4f1a\\u901a\\u8fc7\\u5fae\\u4fe1\\u7ed9\\u60a8\\u63a8\\u9001\\u82d7\\u6728\\u7684\\u6700\\u65b0\\u77e5\\u8bc6\\uff0c\\u8ba9\\u60a8\\u968f\\u65f6\\u968f\\u5730\\u638c\\u63e1\\u82d7\\u6728\\u7684\\u4e00\\u7ebf\\u77e5\\u8bc6\\u3002\\u60a8\\u4e5f\\u53ef\\u4ee5\\u901a\\u8fc7\\u5fae\\u4fe1\\u4e0e\\u6211\\u4eec\\u4ea4\\u6d41\\u3002\\u5206\\u4eab\\u60a8\\u80b2\\u82d7\\u4e2d\\u9047\\u5230\\u7684\\u96be\\u9898\\uff0c\\u8ba9\\u6211\\u4eec\\u7b2c\\u4e00\\u65f6\\u95f4\\u7ed9\\u60a8\\u89e3\\u51b3\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u63cf\\u8ff0\",\"tip\":\"\",\"rule\":{\"require\":true}},\"index_ad1_img\":{\"title\":\"\\u80cc\\u666f\\u56fe\",\"name\":\"index_ad1_img\",\"value\":\"\",\"type\":\"image\",\"tip\":\"\\u53c2\\u8003\\u5c3a\\u5bf8\\uff1a1280 x 200 px\",\"rule\":[]},\"index_ad1_code\":{\"title\":\"\\u4e8c\\u7ef4\\u7801\",\"name\":\"index_ad1_code\",\"value\":\"\",\"type\":\"image\",\"tip\":\"\\u53c2\\u8003\\u5c3a\\u5bf8\\uff1a132 x 132 px\",\"rule\":[]}}},\"last_car\":{\"title\":\"\\u4ea7\\u54c1\\u4e2d\\u5fc3\",\"display\":\"1\",\"vars\":{\"last_car_brand_id\":{\"title\":\"\\u4ea7\\u54c1\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/Brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\\u9009\\u62e9\\u4e00\\u7236\\u5206\\u7c7b\\u5373\\u53ef\",\"rule\":{\"require\":true}}}},\"nursery_car\":{\"title\":\"\\u57fa\\u5730\\u5c55\\u793a\",\"display\":\"1\",\"vars\":{\"nursery_car_brand_id\":{\"title\":\"\\u4ea7\\u54c1\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/Brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (15, 0, 10, 'cartheme', '文章列表页', 'portal/List/index', 'portal/list', '文章列表模板文件', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_brand_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_brand_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_brand_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_brand_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (16, 0, 10, 'cartheme', '单页面', 'portal/Page/index', 'portal/page', '单页面模板文件', '{\"vars\":{\"about_nav\":{\"title\":\"\\u5355\\u9875\\u4e8c\\u7ea7\\u5bfc\\u822a\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Nav\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5bfc\\u822a\",\"tip\":\"\\u5355\\u9875\\u4e8c\\u7ea7\\u5bfc\\u822a\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"about_nav\":{\"title\":\"\\u5355\\u9875\\u4e8c\\u7ea7\\u5bfc\\u822a\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Nav\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5bfc\\u822a\",\"tip\":\"\\u5355\\u9875\\u4e8c\\u7ea7\\u5bfc\\u822a\",\"rule\":{\"require\":true}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (17, 0, 10, 'cartheme', '搜索页面', 'portal/search/index', 'portal/search', '搜索模板文件', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_brand_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_brand_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_brand_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_brand_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (18, 1, 0, 'cartheme', '模板全局配置', 'public/Config', 'public/config', '模板全局配置文件', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"},\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"\\u9996\\u9875\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]},\"company_logo\":{\"title\":\"\\u7f51\\u7ad9\\u6807\\u9898logo\",\"name\":\"company_logo\",\"value\":\"\",\"type\":\"image\",\"tip\":\"\\u53c2\\u8003\\u5c3a\\u5bf8\\uff1a313\\u00d760 px\",\"rule\":[]},\"top_nav\":{\"title\":\"\\u9876\\u90e8\\u5bfc\\u822a\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Nav\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5bfc\\u822a\",\"tip\":\"\\u9876\\u90e8\\u5bfc\\u822a\",\"rule\":{\"require\":true}},\"foot_nav\":{\"title\":\"\\u5e95\\u90e8\\u5bfc\\u822a\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Nav\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5e95\\u90e8\\u5bfc\\u822a\",\"tip\":\"\\u5e95\\u90e8\\u5bfc\\u822a\",\"rule\":{\"require\":true}},\"contact_us\":{\"title\":\"\\u5e95\\u90e8\\u8054\\u7cfb\\u4fe1\\u606f\",\"value\":[{\"title\":\"\\u9500\\u552e\\u7ecf\\u7406\\uff1a\",\"icon\":\"user\",\"content\":\"\\u9a6c\\u58eb\\u594e\"},{\"title\":\"\\u8054\\u7cfb\\u7535\\u8bdd\\uff1a\",\"icon\":\"phone\",\"content\":\"13583977017\"},{\"title\":\"\\u8054\\u7cfb\\u5730\\u5740\\uff1a\",\"icon\":\"map-marker\",\"content\":\"\\u5c71\\u4e1c\\u7701\\u4e34\\u6c82\\u5e02\\u90ef\\u57ce\\u53bf\\u65b0\\u6751\\u94f6\\u674f\\u4ea7\\u4e1a\\u5f00\\u53d1\\u533a\\u94f6\\u674f\\u6751\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u5185\\u5bb9\",\"value\":\"\",\"type\":\"text\"}},\"tip\":\"\"},\"footer_logo\":{\"title\":\"\\u5e95\\u90e8LOGO\",\"name\":\"company_logo\",\"value\":\"\",\"type\":\"image\",\"tip\":\"\\u53c2\\u8003\\u5c3a\\u5bf8\\uff1a100\\u00d7100 px\",\"rule\":[]},\"company_QRcode\":{\"title\":\"\\u516c\\u53f8\\u4e8c\\u7ef4\\u7801\",\"name\":\"company_QRcode\",\"value\":\"\",\"type\":\"image\",\"tip\":\"\\u53c2\\u8003\\u5c3a\\u5bf8\\uff1a100\\u00d7100 px\",\"rule\":[]}},\"widgets\":{\"company_phone\":{\"title\":\"\\u5168\\u56fd\\u54a8\\u8be2\\u70ed\\u7ebf\",\"display\":\"1\",\"vars\":{\"company_phone_img\":{\"title\":\"\\u56fe\\u6807\",\"name\":\"company_phone_img\",\"value\":\"\",\"type\":\"image\",\"tip\":\"\\u53c2\\u8003\\u5c3a\\u5bf8\\uff1a16\\u00d716 px\",\"rule\":[]},\"company_phone\":{\"title\":\"\\u7535\\u8bdd\",\"name\":\"company_phone\",\"value\":\"400-123-4567\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"display\":\"1\",\"vars\":{\"features\":{\"title\":\"\\u8be6\\u60c5\",\"value\":[{\"title\":\"\\u4e00\\u6d41\\u7684\\u670d\\u52a1\",\"icon\":\"\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"image\",\"tip\":\"\\u53c2\\u8003\\u5c3a\\u5bf8\\uff1a24\\u00d724 px\"}},\"tip\":\"\"}}}}}', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"},\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"\\u9996\\u9875\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]},\"company_logo\":{\"title\":\"\\u7f51\\u7ad9\\u6807\\u9898logo\",\"name\":\"company_logo\",\"value\":\"\",\"type\":\"image\",\"tip\":\"\\u53c2\\u8003\\u5c3a\\u5bf8\\uff1a313\\u00d760 px\",\"rule\":[]},\"top_nav\":{\"title\":\"\\u9876\\u90e8\\u5bfc\\u822a\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Nav\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5bfc\\u822a\",\"tip\":\"\\u9876\\u90e8\\u5bfc\\u822a\",\"rule\":{\"require\":true}},\"foot_nav\":{\"title\":\"\\u5e95\\u90e8\\u5bfc\\u822a\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Nav\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5e95\\u90e8\\u5bfc\\u822a\",\"tip\":\"\\u5e95\\u90e8\\u5bfc\\u822a\",\"rule\":{\"require\":true}},\"contact_us\":{\"title\":\"\\u5e95\\u90e8\\u8054\\u7cfb\\u4fe1\\u606f\",\"value\":[{\"title\":\"\\u9500\\u552e\\u7ecf\\u7406\\uff1a\",\"icon\":\"user\",\"content\":\"\\u9a6c\\u58eb\\u594e\"},{\"title\":\"\\u8054\\u7cfb\\u7535\\u8bdd\\uff1a\",\"icon\":\"phone\",\"content\":\"13583977017\"},{\"title\":\"\\u8054\\u7cfb\\u5730\\u5740\\uff1a\",\"icon\":\"map-marker\",\"content\":\"\\u5c71\\u4e1c\\u7701\\u4e34\\u6c82\\u5e02\\u90ef\\u57ce\\u53bf\\u65b0\\u6751\\u94f6\\u674f\\u4ea7\\u4e1a\\u5f00\\u53d1\\u533a\\u94f6\\u674f\\u6751\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u5185\\u5bb9\",\"value\":\"\",\"type\":\"text\"}},\"tip\":\"\"},\"footer_logo\":{\"title\":\"\\u5e95\\u90e8LOGO\",\"name\":\"company_logo\",\"value\":\"\",\"type\":\"image\",\"tip\":\"\\u53c2\\u8003\\u5c3a\\u5bf8\\uff1a100\\u00d7100 px\",\"rule\":[]},\"company_QRcode\":{\"title\":\"\\u516c\\u53f8\\u4e8c\\u7ef4\\u7801\",\"name\":\"company_QRcode\",\"value\":\"\",\"type\":\"image\",\"tip\":\"\\u53c2\\u8003\\u5c3a\\u5bf8\\uff1a100\\u00d7100 px\",\"rule\":[]}},\"widgets\":{\"company_phone\":{\"title\":\"\\u5168\\u56fd\\u54a8\\u8be2\\u70ed\\u7ebf\",\"display\":\"1\",\"vars\":{\"company_phone_img\":{\"title\":\"\\u56fe\\u6807\",\"name\":\"company_phone_img\",\"value\":\"\",\"type\":\"image\",\"tip\":\"\\u53c2\\u8003\\u5c3a\\u5bf8\\uff1a16\\u00d716 px\",\"rule\":[]},\"company_phone\":{\"title\":\"\\u7535\\u8bdd\",\"name\":\"company_phone\",\"value\":\"400-123-4567\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"display\":\"1\",\"vars\":{\"features\":{\"title\":\"\\u8be6\\u60c5\",\"value\":[{\"title\":\"\\u4e00\\u6d41\\u7684\\u670d\\u52a1\",\"icon\":\"\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"image\",\"tip\":\"\\u53c2\\u8003\\u5c3a\\u5bf8\\uff1a24\\u00d724 px\"}},\"tip\":\"\"}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (19, 0, 10, 'enterprise9', '联系我们页', 'car/Page/index', 'car/contact', '联系我们页模板文件', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (20, 0, 10, 'enterprise9', '车页', 'car/Element/index', 'car/element', '车页模板文件', '{\"vars\":{\"hot_elements_brand_id\":{\"title\":\"Hot Elements\\u54c1\\u724cID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"hot_elements_brand_id\":{\"title\":\"Hot Elements\\u54c1\\u724cID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (21, 0, 5, 'enterprise9', '首页', 'car/Index/index', 'car/index', '首页模板文件', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/Brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/Brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (22, 0, 10, 'enterprise9', '车列表页', 'car/List/index', 'car/list', '车列表模板文件', '{\"vars\":[],\"widgets\":{\"hottest_elements\":{\"title\":\"\\u70ed\\u95e8\\u8f66\",\"display\":\"1\",\"vars\":{\"hottest_elements_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_elements\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_elements_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":[],\"widgets\":{\"hottest_elements\":{\"title\":\"\\u70ed\\u95e8\\u8f66\",\"display\":\"1\",\"vars\":{\"hottest_elements_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_elements\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_elements_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (23, 0, 10, 'enterprise9', '单页面', 'car/Page/index', 'car/page', '单页面模板文件', '{\"widgets\":{\"hottest_elements\":{\"title\":\"\\u70ed\\u95e8\\u8f66\",\"display\":\"1\",\"vars\":{\"hottest_elements_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_elements\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_elements_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"widgets\":{\"hottest_elements\":{\"title\":\"\\u70ed\\u95e8\\u8f66\",\"display\":\"1\",\"vars\":{\"hottest_elements_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_elements\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_elements_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (24, 0, 10, 'enterprise9', '搜索页面', 'car/search/index', 'car/search', '搜索模板文件', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (25, 0, 10, 'enterprise9', '文章页', 'portal/Article/index', 'portal/article', '文章页模板文件', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (26, 0, 10, 'enterprise9', '联系我们页', 'portal/Page/index', 'portal/contact', '联系我们页模板文件', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (27, 0, 5, 'enterprise9', '首页', 'portal/Index/index', 'portal/index', '首页模板文件', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":1,\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":1,\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true},\"valueText\":\"\\u6587\\u7ae0\\u5206\\u7c7b\\u4e00\"}}},\"show_brands\":{\"title\":\"\\u54c1\\u724c\\u5c55\\u793a\",\"display\":1,\"vars\":{\"sub_title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\\u62b5\\u62bc\\u8f66\\u4fe1\\u606f\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"show_car_brand_id\":{\"title\":\"\\u6c7d\\u8f66\\u54c1\\u724cID\",\"value\":\"1,2,3,4,5,6,7\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/Brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u6c7d\\u8f66\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true},\"valueText\":\"\\u5927\\u4f17,\\u672c\\u7530,\\u5965\\u8fea,\\u4e30\\u7530,\\u5b9d\\u9a6c,\\u5954\\u9a70,\\u522b\\u514b\"}}},\"recommend_car\":{\"title\":\"\\u63a8\\u8350\\u62b5\\u62bc\\u8f66\",\"display\":1,\"vars\":{\"sub_title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\\u62b5\\u62bc\\u8f66\\u4fe1\\u606f\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"recommend_cars\":{\"title\":\"\\u6c7d\\u8f66\\u54c1\\u724cID\",\"value\":[],\"type\":\"array\",\"item\":{\"brand_id\":{\"title\":\"\\u6c7d\\u8f66\\u7c7b\\u522bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/Brand\\/index\",\"multi\":false},\"tip\":\"\\u8bf7\\u9009\\u62e9\\u6c7d\\u8f66\\u54c1\\u724c\"},\"count\":{\"title\":\"\\u6c7d\\u8f66\\u663e\\u793a\\u6570\\u91cf\",\"value\":10,\"type\":\"number\",\"tip\":\"\\u6bcf\\u4e2a\\u54c1\\u724c\\u6c7d\\u8f66\\u6570\\u91cf\"}}}}},\"newest_car\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":1,\"vars\":{\"sub_title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"newest_cars\":{\"title\":\"\\u6c7d\\u8f66\\u54c1\\u724cID\",\"value\":[{\"brand_id_text_\":\"\\u5927\\u4f17\",\"brand_id\":\"1\",\"count\":\"10\"},{\"brand_id_text_\":\"\\u672c\\u7530\",\"brand_id\":\"2\",\"count\":\"10\"},{\"brand_id_text_\":\"\\u5965\\u8fea\",\"brand_id\":\"3\",\"count\":\"10\"},{\"brand_id_text_\":\"\\u4e30\\u7530\",\"brand_id\":\"4\",\"count\":\"10\"},{\"brand_id_text_\":\"\\u5b9d\\u9a6c\",\"brand_id\":\"5\",\"count\":\"10\"},{\"brand_id_text_\":\"\\u5954\\u9a70\",\"brand_id\":\"6\",\"count\":\"10\"},{\"brand_id_text_\":\"\\u522b\\u514b\",\"brand_id\":\"7\",\"count\":\"10\"}],\"type\":\"array\",\"item\":{\"brand_id\":{\"title\":\"\\u6c7d\\u8f66\\u7c7b\\u522bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/Brand\\/index\",\"multi\":false},\"tip\":\"\\u8bf7\\u9009\\u62e9\\u6c7d\\u8f66\\u54c1\\u724c\"},\"count\":{\"title\":\"\\u6c7d\\u8f66\\u663e\\u793a\\u6570\\u91cf\",\"value\":10,\"type\":\"number\",\"tip\":\"\\u6bcf\\u4e2a\\u54c1\\u724c\\u6c7d\\u8f66\\u6570\\u91cf\"}}}}}}}', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"show_brands\":{\"title\":\"\\u54c1\\u724c\\u5c55\\u793a\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\\u62b5\\u62bc\\u8f66\\u4fe1\\u606f\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"show_car_brand_id\":{\"title\":\"\\u6c7d\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/Brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u6c7d\\u8f66\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"recommend_car\":{\"title\":\"\\u63a8\\u8350\\u62b5\\u62bc\\u8f66\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\\u62b5\\u62bc\\u8f66\\u4fe1\\u606f\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"recommend_cars\":{\"title\":\"\\u6c7d\\u8f66\\u54c1\\u724cID\",\"value\":[],\"type\":\"array\",\"item\":{\"brand_id\":{\"title\":\"\\u6c7d\\u8f66\\u7c7b\\u522bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/Brand\\/index\",\"multi\":false},\"tip\":\"\\u8bf7\\u9009\\u62e9\\u6c7d\\u8f66\\u54c1\\u724c\"},\"count\":{\"title\":\"\\u6c7d\\u8f66\\u663e\\u793a\\u6570\\u91cf\",\"value\":10,\"type\":\"number\",\"tip\":\"\\u6bcf\\u4e2a\\u54c1\\u724c\\u6c7d\\u8f66\\u6570\\u91cf\"}}}}},\"newest_car\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"newest_cars\":{\"title\":\"\\u6c7d\\u8f66\\u54c1\\u724cID\",\"value\":[],\"type\":\"array\",\"item\":{\"brand_id\":{\"title\":\"\\u6c7d\\u8f66\\u7c7b\\u522bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/Brand\\/index\",\"multi\":false},\"tip\":\"\\u8bf7\\u9009\\u62e9\\u6c7d\\u8f66\\u54c1\\u724c\"},\"count\":{\"title\":\"\\u6c7d\\u8f66\\u663e\\u793a\\u6570\\u91cf\",\"value\":10,\"type\":\"number\",\"tip\":\"\\u6bcf\\u4e2a\\u54c1\\u724c\\u6c7d\\u8f66\\u6570\\u91cf\"}}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (28, 0, 10, 'enterprise9', '文章列表页', 'portal/List/index', 'portal/list', '文章列表模板文件', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (29, 0, 10, 'enterprise9', '单页面', 'portal/Page/index', 'portal/page', '单页面模板文件', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (30, 0, 10, 'enterprise9', '搜索页面', 'portal/search/index', 'portal/search', '搜索模板文件', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (31, 1, 0, 'enterprise9', '模板全局配置', 'public/Config', 'public/config', '模板全局配置文件', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (32, 1, 1, 'enterprise9', '导航条', 'public/Nav', 'public/nav', '导航条模板文件', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"\\u5f90\\u5dde\\u62b5\\u62bc\\u8f66\\u7f51\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"\\u5f90\\u5dde\\u62b5\\u62bc\\u8f66\\u7f51\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (33, 0, 10, 'simpleboot3', '联系我们页', 'car/Page/index', 'car/contact', '联系我们页模板文件', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (34, 0, 10, 'simpleboot3', '车页', 'car/Element/index', 'car/element', '车页模板文件', '{\"vars\":{\"hot_elements_brand_id\":{\"title\":\"Hot Elements\\u54c1\\u724cID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"hot_elements_brand_id\":{\"title\":\"Hot Elements\\u54c1\\u724cID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (35, 0, 5, 'simpleboot3', '首页', 'car/Index/index', 'car/index', '首页模板文件', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (36, 0, 10, 'simpleboot3', '车列表页', 'car/List/index', 'car/list', '车列表模板文件', '{\"vars\":[],\"widgets\":{\"hottest_elements\":{\"title\":\"\\u70ed\\u95e8\\u8f66\",\"display\":\"1\",\"vars\":{\"hottest_elements_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_elements\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_elements_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":[],\"widgets\":{\"hottest_elements\":{\"title\":\"\\u70ed\\u95e8\\u8f66\",\"display\":\"1\",\"vars\":{\"hottest_elements_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_elements\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_elements_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (37, 0, 10, 'simpleboot3', '单页面', 'car/Page/index', 'car/page', '单页面模板文件', '{\"widgets\":{\"hottest_elements\":{\"title\":\"\\u70ed\\u95e8\\u8f66\",\"display\":\"1\",\"vars\":{\"hottest_elements_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_elements\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_elements_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"widgets\":{\"hottest_elements\":{\"title\":\"\\u70ed\\u95e8\\u8f66\",\"display\":\"1\",\"vars\":{\"hottest_elements_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_elements\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_elements_brand_id\":{\"title\":\"\\u8f66\\u54c1\\u724cID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"car\\/brand\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u54c1\\u724c\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (38, 0, 10, 'simpleboot3', '搜索页面', 'car/search/index', 'car/search', '搜索模板文件', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', NULL);

-- ----------------------------
-- Table structure for cmf_third_party_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_third_party_user`;
CREATE TABLE `cmf_third_party_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '本站用户id',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `expire_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'access_token过期时间',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '绑定时间',
  `login_times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录次数',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方唯一码',
  `app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '扩展信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '第三方用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmf_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user`;
CREATE TABLE `cmf_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT 0 COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT 0 COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT 0 COMMENT '用户积分',
  `coin` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '金币',
  `balance` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '注册时间',
  `user_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '扩展属性',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_login`(`user_login`) USING BTREE,
  INDEX `user_nickname`(`user_nickname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_user
-- ----------------------------
INSERT INTO `cmf_user` VALUES (1, 1, 0, 0, 1590189592, 0, 0, 0.00, 1589714024, 1, 'admin', '###f564d305997a92b5ab0cac10d819de02', 'admin', 'axuyin@163.com', '', '', '', '127.0.0.1', '', '', NULL);

-- ----------------------------
-- Table structure for cmf_user_action
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_action`;
CREATE TABLE `cmf_user_action`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT 0 COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT 0 COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT 0 COMMENT '奖励次数',
  `cycle_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '周期时间值',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '执行操作的url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户操作表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_user_action
-- ----------------------------
INSERT INTO `cmf_user_action` VALUES (1, 1, 1, 1, 2, 1, '用户登录', 'login', 'user', '');

-- ----------------------------
-- Table structure for cmf_user_action_log
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_action_log`;
CREATE TABLE `cmf_user_action_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '访问次数',
  `last_visit_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后访问时间',
  `object` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_object_action`(`user_id`, `object`, `action`) USING BTREE,
  INDEX `user_object_action_ip`(`user_id`, `object`, `action`, `ip`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '访问记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmf_user_balance_log
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_balance_log`;
CREATE TABLE `cmf_user_balance_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户 id',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `change` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '更改余额',
  `balance` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '更改后余额',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户余额变更日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmf_user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_favorite`;
CREATE TABLE `cmf_user_favorite`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户 id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `thumbnail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收藏内容的原文地址，JSON格式',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '收藏内容的描述',
  `table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) UNSIGNED DEFAULT 0 COMMENT '收藏内容原来的主键id',
  `create_time` int(10) UNSIGNED DEFAULT 0 COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmf_user_like
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_like`;
CREATE TABLE `cmf_user_like`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户 id',
  `object_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '内容原来的主键id',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '内容以前所在表,不带前缀',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '内容的原文地址，不带域名',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '内容的标题',
  `thumbnail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '内容的描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户点赞表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmf_user_login_attempt
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_login_attempt`;
CREATE TABLE `cmf_user_login_attempt`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `login_attempts` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '尝试次数',
  `attempt_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '尝试登录时间',
  `locked_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '锁定时间',
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户登录尝试表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cmf_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_score_log`;
CREATE TABLE `cmf_user_score_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int(11) NOT NULL DEFAULT 0 COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT 0 COMMENT '更改金币，可以为负',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户操作积分等奖励日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cmf_user_token
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_token`;
CREATE TABLE `cmf_user_token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `expire_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT ' 过期时间',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户客户端登录 token 表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmf_user_token
-- ----------------------------
INSERT INTO `cmf_user_token` VALUES (1, 1, 1605273955, 1589721955, '2d0a331a7833775de077885d1de8e35b1b30ff4666ff7d27bc14095fa7ced147', 'web');

-- ----------------------------
-- Table structure for cmf_verification_code
-- ----------------------------
DROP TABLE IF EXISTS `cmf_verification_code`;
CREATE TABLE `cmf_verification_code`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '当天已经发送成功的次数',
  `send_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后发送成功时间',
  `expire_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证码过期时间',
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '手机邮箱数字验证码表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
