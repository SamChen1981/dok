/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : dok

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-09-22 17:55:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dok_action
-- ----------------------------
DROP TABLE IF EXISTS `dok_action`;
CREATE TABLE `dok_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `module` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of dok_action
-- ----------------------------
INSERT INTO `dok_action` VALUES ('1', 'reg', '用户注册', '用户注册', '', '', '1', '1', '1426070545', '');
INSERT INTO `dok_action` VALUES ('2', 'input_password', '输入密码', '记录输入密码的次数。', '', '', '1', '1', '1426122119', '');
INSERT INTO `dok_action` VALUES ('3', 'user_login', '用户登录', '积分+10，每天一次', 'a:1:{i:0;a:5:{s:5:\"table\";s:6:\"member\";s:5:\"field\";s:1:\"1\";s:4:\"rule\";s:2:\"10\";s:5:\"cycle\";s:2:\"24\";s:3:\"max\";s:1:\"1\";}}', '[user|get_nickname]在[time|time_format]登录了账号', '1', '1', '1428397656', '');
INSERT INTO `dok_action` VALUES ('4', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988', '');
INSERT INTO `dok_action` VALUES ('7', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301', '');
INSERT INTO `dok_action` VALUES ('8', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392', '');

-- ----------------------------
-- Table structure for dok_action_limit
-- ----------------------------
DROP TABLE IF EXISTS `dok_action_limit`;
CREATE TABLE `dok_action_limit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `frequency` int(11) NOT NULL,
  `time_number` int(11) NOT NULL,
  `time_unit` varchar(50) NOT NULL,
  `punish` text NOT NULL,
  `if_message` tinyint(4) NOT NULL,
  `message_content` text NOT NULL,
  `action_list` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `module` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_action_limit
-- ----------------------------
INSERT INTO `dok_action_limit` VALUES ('1', 'reg', '注册限制', '1', '1', 'minute', 'warning', '0', '', '[reg]', '1', '0', '');
INSERT INTO `dok_action_limit` VALUES ('2', 'input_password', '输密码', '3', '1', 'minute', 'warning', '0', '', '[input_password]', '1', '0', '');

-- ----------------------------
-- Table structure for dok_action_log
-- ----------------------------
DROP TABLE IF EXISTS `dok_action_log`;
CREATE TABLE `dok_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of dok_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for dok_addons
-- ----------------------------
DROP TABLE IF EXISTS `dok_addons`;
CREATE TABLE `dok_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of dok_addons
-- ----------------------------
INSERT INTO `dok_addons` VALUES ('1', 'CheckIn', '签到', '签到插件', '1', '{\"random\":\"1\"}', 'xjw129xjt(肖骏涛)', '0.1', '1432791968', '0');
INSERT INTO `dok_addons` VALUES ('2', 'Support', '赞', '赞的功能', '1', 'null', '嘉兴想天信息科技有限公司', '0.1', '1432792013', '0');
INSERT INTO `dok_addons` VALUES ('3', 'SuperLinks', '合作单位', '合作单位', '1', '{\"random\":\"1\"}', '苏南 newsn.net', '0.1', '1432792019', '1');
INSERT INTO `dok_addons` VALUES ('4', 'Report', '举报后台', '可举报不法数据', '1', '{\"meta\":\"\"}', '想天科技xuminwei', '0.1', '1432792026', '1');
INSERT INTO `dok_addons` VALUES ('5', 'LocalComment', '本地评论', '本地评论插件，不依赖社会化评论平台', '1', '{\"can_guest_comment\":\"0\"}', 'caipeichao', '0.1', '1432792035', '0');
INSERT INTO `dok_addons` VALUES ('6', 'ChinaCity', '中国省市区三级联动', '每个系统都需要的一个中国省市区三级联动插件。想天-駿濤修改，将镇级地区移除', '1', 'null', 'i友街', '2.0', '1432792040', '0');
INSERT INTO `dok_addons` VALUES ('7', 'Recommend', '推荐关注', '可选择多种方法推荐用户', '1', '{\"howToRecommend\":\"1\",\"howManyRecommend\":\"1\",\"recommendUser\":\"1\"}', '嘉兴想天信息科技有限公司', '0.1', '1432792055', '1');
INSERT INTO `dok_addons` VALUES ('8', 'SyncLogin', '同步登陆', '同步登陆', '1', '{\"type\":null,\"meta\":\"\",\"bind\":\"0\",\"QqKEY\":\"\",\"QqSecret\":\"\",\"SinaKEY\":\"\",\"SinaSecret\":\"\",\"WeixinKEY\":\"\",\"WeixinSecret\":\"\"}', 'xjw129xjt', '0.1', '1432792112', '0');

-- ----------------------------
-- Table structure for dok_adv
-- ----------------------------
DROP TABLE IF EXISTS `dok_adv`;
CREATE TABLE `dok_adv` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '广告名称',
  `pos_id` int(11) NOT NULL COMMENT '广告位置',
  `data` text NOT NULL COMMENT '图片地址',
  `click_count` int(11) NOT NULL COMMENT '点击量',
  `url` varchar(500) NOT NULL COMMENT '链接地址',
  `sort` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) unsigned DEFAULT '0' COMMENT '结束时间',
  `target` varchar(20) DEFAULT '_blank',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告表';

-- ----------------------------
-- Records of dok_adv
-- ----------------------------

-- ----------------------------
-- Table structure for dok_adv_pos
-- ----------------------------
DROP TABLE IF EXISTS `dok_adv_pos`;
CREATE TABLE `dok_adv_pos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL,
  `title` char(80) NOT NULL DEFAULT '' COMMENT '广告位置名称',
  `path` varchar(100) NOT NULL COMMENT '所在路径 模块/控制器/方法',
  `type` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '广告位类型 \r\n1.单图\r\n2.多图\r\n3.文字链接\r\n4.代码',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `data` varchar(500) NOT NULL COMMENT '额外的数据',
  `width` char(20) NOT NULL DEFAULT '' COMMENT '广告位置宽度',
  `height` char(20) NOT NULL DEFAULT '' COMMENT '广告位置高度',
  `margin` varchar(50) NOT NULL COMMENT '边缘',
  `padding` varchar(50) NOT NULL COMMENT '留白',
  `theme` varchar(50) NOT NULL DEFAULT 'all' COMMENT '适用主题，默认为all，通用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告位置表';

-- ----------------------------
-- Records of dok_adv_pos
-- ----------------------------
INSERT INTO `dok_adv_pos` VALUES ('1', 'slider', '首页轮播图', 'Home/Index/home', '2', '1', '{\"style\":1}', '1120px', '300px', '0 0 15px 0', '', 'all');

-- ----------------------------
-- Table structure for dok_attachment
-- ----------------------------
DROP TABLE IF EXISTS `dok_attachment`;
CREATE TABLE `dok_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of dok_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for dok_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `dok_auth_extend`;
CREATE TABLE `dok_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of dok_auth_extend
-- ----------------------------
INSERT INTO `dok_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `dok_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `dok_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `dok_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `dok_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `dok_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `dok_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `dok_auth_extend` VALUES ('1', '37', '1');

-- ----------------------------
-- Table structure for dok_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `dok_auth_group`;
CREATE TABLE `dok_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` text NOT NULL COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_auth_group
-- ----------------------------
INSERT INTO `dok_auth_group` VALUES ('1', 'admin', '1', '普通用户', '', '1', ',338,340,341,344,10000');
INSERT INTO `dok_auth_group` VALUES ('2', 'admin', '1', 'VIP', '', '1', ',338,340,341,344,10000');

-- ----------------------------
-- Table structure for dok_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `dok_auth_group_access`;
CREATE TABLE `dok_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_auth_group_access
-- ----------------------------
INSERT INTO `dok_auth_group_access` VALUES ('1', '1');

-- ----------------------------
-- Table structure for dok_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `dok_auth_rule`;
CREATE TABLE `dok_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_auth_rule
-- ----------------------------
INSERT INTO `dok_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '资讯', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '插件', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('17', 'admin', '1', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('224', 'admin', '1', 'Admin/SEO/editRule', '新增、编辑', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('225', 'admin', '1', 'Admin/SEO/sortRule', '排序', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('226', 'admin', '1', 'Admin/SEO/index', 'SEO规则管理', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('230', 'admin', '1', 'Admin/SEO/ruleTrash', 'SEO规则回收站', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('231', 'admin', '1', 'Admin/Rank/userList', '查看用户', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('232', 'admin', '1', 'Admin/Rank/userRankList', '用户头衔列表', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('233', 'admin', '1', 'Admin/Rank/userAddRank', '关联新头衔', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('234', 'admin', '1', 'Admin/Rank/userChangeRank', '编辑头衔关联', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('239', 'admin', '1', 'Admin/Rank/index', '头衔列表', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('242', 'admin', '1', 'Admin/Rank/editRank', '添加头衔', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('251', 'admin', '2', 'Admin/SEO/index', 'SEO', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('252', 'admin', '2', 'Admin/Rank/index', '头衔', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('255', 'admin', '1', 'Admin/User/profile', '扩展资料', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('256', 'admin', '1', 'Admin/User/editProfile', '添加、编辑分组', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('257', 'admin', '1', 'Admin/User/sortProfile', '分组排序', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('258', 'admin', '1', 'Admin/User/field', '字段列表', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('259', 'admin', '1', 'Admin/User/editFieldSetting', '添加、编辑字段', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('260', 'admin', '1', 'Admin/User/sortField', '字段排序', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('261', 'admin', '1', 'Admin/Update/quick', '全部补丁', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('262', 'admin', '1', 'Admin/Update/addpack', '新增补丁', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('263', 'admin', '1', 'Admin/User/expandinfo_select', '用户扩展资料列表', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('264', 'admin', '1', 'Admin/User/expandinfo_details', '扩展资料详情', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('278', 'admin', '1', 'Admin/Rank/rankVerify', '待审核用户头衔', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('279', 'admin', '1', 'Admin/Rank/rankVerifyFailure', '被驳回的头衔申请', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('297', 'Home', '1', 'deleteLocalComment', '删除本地评论', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('313', 'admin', '1', 'Admin/module/install', '模块安装', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('315', 'admin', '1', 'Admin/module/lists', '模块管理', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('316', 'admin', '1', 'Admin/module/uninstall', '卸载模块', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('317', 'admin', '1', 'Admin/AuthManager/addNode', '新增权限节点', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('318', 'admin', '1', 'Admin/AuthManager/accessUser', '前台权限管理', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('319', 'admin', '1', 'Admin/User/changeGroup', '转移用户组', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('320', 'admin', '1', 'Admin/AuthManager/deleteNode', '删除权限节点', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('322', 'admin', '2', 'Admin/module/lists', '模块管理', '-1', '');
INSERT INTO `dok_auth_rule` VALUES ('346', 'admin', '1', 'Admin/UserConfig/index', '用户注册配置', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('347', 'admin', '1', 'Admin/User/scoreList', '积分类型列表', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('348', 'admin', '1', 'Admin/user/editScoreType', '新增/编辑类型', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('349', 'admin', '1', 'Admin/user/recharge', '充值积分', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('350', 'admin', '1', 'Admin/Authorize/ssoSetting', '单点登录配置', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('351', 'admin', '1', 'Admin/Authorize/ssolist', '应用列表', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('352', 'admin', '1', 'Admin/authorize/editssoapp', '新增/编辑应用', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('353', 'admin', '1', 'Admin/ActionLimit/limitList', '行为限制列表', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('354', 'admin', '1', 'Admin/ActionLimit/editLimit', '新增/编辑行为限制', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('355', 'admin', '1', 'Admin/Role/index', '角色列表', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('356', 'admin', '1', 'Admin/Role/editRole', '编辑角色', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('357', 'admin', '1', 'Admin/Role/setStatus', '启用、禁用、删除角色', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('358', 'admin', '1', 'Admin/Role/sort', '角色排序', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('359', 'admin', '1', 'Admin/Role/configScore', '默认积分配置', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('360', 'admin', '1', 'Admin/Role/configAuth', '默认权限配置', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('361', 'admin', '1', 'Admin/Role/configAvatar', '默认头像配置', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('362', 'admin', '1', 'Admin/Role/configRank', '默认头衔配置', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('363', 'admin', '1', 'Admin/Role/configField', '默认字段管理', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('364', 'admin', '1', 'Admin/Role/group', '角色分组', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('365', 'admin', '1', 'Admin/Role/editGroup', '编辑分组', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('366', 'admin', '1', 'Admin/Role/deleteGroup', '删除分组', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('367', 'admin', '1', 'Admin/Role/config', '角色基本信息配置', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('368', 'admin', '1', 'Admin/Role/userList', '用户列表', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('369', 'admin', '1', 'Admin/Role/setUserStatus', '设置用户状态', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('370', 'admin', '1', 'Admin/Role/setUserAudit', '审核用户', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('371', 'admin', '1', 'Admin/Role/changeRole', '迁移用户', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('372', 'admin', '1', 'Admin/Role/uploadPicture', '上传默认头像', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('373', 'admin', '1', 'Admin/Invite/index', '类型管理', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('374', 'admin', '1', 'Admin/Invite/invite', '邀请码管理', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('375', 'admin', '1', 'Admin/Invite/config', '基础配置', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('376', 'admin', '1', 'Admin/Invite/buyLog', '兑换记录', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('377', 'admin', '1', 'Admin/Invite/inviteLog', '邀请记录', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('378', 'admin', '1', 'Admin/Invite/userInfo', '用户信息', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('379', 'admin', '1', 'Admin/Invite/edit', '编辑邀请注册类型', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('380', 'admin', '1', 'Admin/Invite/setStatus', '删除邀请', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('381', 'admin', '1', 'Admin/Invite/delete', '删除邀请码', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('382', 'admin', '1', 'Admin/Invite/createCode', '生成邀请码', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('383', 'admin', '1', 'Admin/Invite/deleteTrue', '删除无用邀请码', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('384', 'admin', '1', 'Admin/Invite/cvs', '导出cvs', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('385', 'admin', '1', 'Admin/Invite/editUserInfo', '用户信息编辑', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('386', 'admin', '1', 'Admin/Action/remove', '删除日志', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('387', 'admin', '1', 'Admin/Action/clear', '清空日志', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('388', 'admin', '1', 'Admin/User/setTypeStatus', '设置积分状态', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('389', 'admin', '1', 'Admin/User/delType', '删除积分类型', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('390', 'admin', '1', 'Admin/User/getNickname', '充值积分', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('391', 'admin', '1', 'Admin/Menu/del', '删除菜单', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('392', 'admin', '1', 'Admin/Menu/toogleDev', '设置开发者模式可见', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('393', 'admin', '1', 'Admin/Menu/toogleHide', '设置显示隐藏', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('394', 'admin', '1', 'Admin/ActionLimit/setLimitStatus', '行为限制启用、禁用、删除', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('395', 'admin', '1', 'Admin/SEO/setRuleStatus', '启用、禁用、删除、回收站还原', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('396', 'admin', '1', 'Admin/SEO/doClear', '回收站彻底删除', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('397', 'admin', '1', 'Admin/Role/initUnhaveUser', '初始化无角色用户', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('398', 'admin', '1', 'Admin/Addons/delHook', '删除钩子', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('399', 'admin', '1', 'Admin/Update/usePack', '使用补丁', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('400', 'admin', '1', 'Admin/Update/view', '查看补丁', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('401', 'admin', '1', 'Admin/Update/delPack', '删除补丁', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('402', 'admin', '1', 'Admin/UserTag/userTag', '标签列表', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('403', 'admin', '1', 'Admin/UserTag/add', '添加分类、标签', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('404', 'admin', '1', 'Admin/UserTag/setStatus', '设置分类、标签状态', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('405', 'admin', '1', 'Admin/UserTag/tagTrash', '分类、标签回收站', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('406', 'admin', '1', 'Admin/UserTag/userTagClear', '测底删除回收站内容', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('407', 'admin', '1', 'Admin/role/configusertag', '可拥有标签配置', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('408', 'admin', '1', 'Admin/Module/edit', '编辑模块', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('409', 'admin', '1', 'Admin/Config/website', '网站信息', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('410', 'admin', '1', 'Admin/Theme/setTheme', '使用主题', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('411', 'admin', '1', 'Admin/Theme/lookTheme', '查看主题', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('412', 'admin', '1', 'Admin/Theme/packageDownload', '主题打包下载', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('413', 'admin', '1', 'Admin/Theme/delete', '卸载删除主题', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('414', 'admin', '1', 'Admin/Theme/add', '上传安装主题', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('415', 'admin', '2', 'Admin/Home/config', '网站主页', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('416', 'admin', '1', 'Admin/Home/config', '基本设置', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('423', 'admin', '1', 'Admin/People/config', '基本设置', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('425', 'admin', '2', 'Admin/authorize/ssoSetting', '授权', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('426', 'admin', '2', 'Admin/Role/index', '角色', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('427', 'admin', '1', 'Admin/Theme/tpls', '主题管理', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('428', 'admin', '2', 'Admin/ActionLimit/limitList', '安全', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('430', 'admin', '2', 'Admin/People/config', '会员展示', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('431', 'admin', '1', 'Admin/Index/index', '后台入口', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('10000', 'Issue', '1', 'addIssueContent', '专辑投稿权限', '1', '');
INSERT INTO `dok_auth_rule` VALUES ('10001', 'Issue', '1', 'editIssueContent', '编辑专辑内容（管理）', '1', '');

-- ----------------------------
-- Table structure for dok_autoreply
-- ----------------------------
DROP TABLE IF EXISTS `dok_autoreply`;
CREATE TABLE `dok_autoreply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `mp_id` int(10) NOT NULL COMMENT '公众号ID',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '自定义回复类型',
  `keyword_id` int(10) NOT NULL COMMENT '关键词ID',
  `content` varchar(255) NOT NULL COMMENT '自动回复内容',
  `status` tinyint(4) NOT NULL COMMENT '2:未审核，1：启用，0：禁用，-1：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_autoreply
-- ----------------------------

-- ----------------------------
-- Table structure for dok_avatar
-- ----------------------------
DROP TABLE IF EXISTS `dok_avatar`;
CREATE TABLE `dok_avatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `path` varchar(200) NOT NULL,
  `driver` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_temp` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_avatar
-- ----------------------------

-- ----------------------------
-- Table structure for dok_channel
-- ----------------------------
DROP TABLE IF EXISTS `dok_channel`;
CREATE TABLE `dok_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  `color` varchar(30) NOT NULL,
  `band_color` varchar(30) NOT NULL,
  `band_text` varchar(30) NOT NULL,
  `icon` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_channel
-- ----------------------------
INSERT INTO `dok_channel` VALUES ('1', '0', '专辑', 'Issue/index/index', '1', '0', '0', '1', '0', '', '', '', '');
INSERT INTO `dok_channel` VALUES ('2', '0', '首页', 'Home/Index/index', '2', '0', '0', '1', '0', '#000000', '#000000', '', 'home');
INSERT INTO `dok_channel` VALUES ('3', '0', '找人', 'People/index/index', '3', '0', '0', '1', '0', '', '', '', 'group');

-- ----------------------------
-- Table structure for dok_checkin
-- ----------------------------
DROP TABLE IF EXISTS `dok_checkin`;
CREATE TABLE `dok_checkin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_checkin
-- ----------------------------

-- ----------------------------
-- Table structure for dok_config
-- ----------------------------
DROP TABLE IF EXISTS `dok_config`;
CREATE TABLE `dok_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(500) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=10015 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_config
-- ----------------------------
INSERT INTO `dok_config` VALUES ('100', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '11');
INSERT INTO `dok_config` VALUES ('101', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举\r\n8:多选框', '8');
INSERT INTO `dok_config` VALUES ('102', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n5:邮件', '15');
INSERT INTO `dok_config` VALUES ('103', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '17');
INSERT INTO `dok_config` VALUES ('104', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '20');
INSERT INTO `dok_config` VALUES ('105', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '24');
INSERT INTO `dok_config` VALUES ('107', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '13');
INSERT INTO `dok_config` VALUES ('108', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/Backup', '16');
INSERT INTO `dok_config` VALUES ('109', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '18');
INSERT INTO `dok_config` VALUES ('110', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '22');
INSERT INTO `dok_config` VALUES ('111', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '25');
INSERT INTO `dok_config` VALUES ('112', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '26');
INSERT INTO `dok_config` VALUES ('113', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '2');
INSERT INTO `dok_config` VALUES ('114', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '3');
INSERT INTO `dok_config` VALUES ('115', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '27');
INSERT INTO `dok_config` VALUES ('116', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '7');
INSERT INTO `dok_config` VALUES ('117', 'MAIL_TYPE', '4', '邮件类型', '5', '1:SMTP 模块发送\r\n2:mail() 函数发送', '如果您选择了采用服务器内置的 Mail 服务，您不需要填写下面的内容', '1388332882', '1388931416', '1', '1', '0');
INSERT INTO `dok_config` VALUES ('118', 'MAIL_SMTP_HOST', '1', 'SMTP 服务器', '5', '', 'SMTP服务器', '1388332932', '1388332932', '1', '', '0');
INSERT INTO `dok_config` VALUES ('119', 'MAIL_SMTP_PORT', '0', 'SMTP服务器端口', '5', '', '默认25', '1388332975', '1388332975', '1', '25', '0');
INSERT INTO `dok_config` VALUES ('120', 'MAIL_SMTP_USER', '1', 'SMTP服务器用户名', '5', '', '填写完整用户名', '1388333010', '1388333010', '1', '', '0');
INSERT INTO `dok_config` VALUES ('121', 'MAIL_SMTP_PASS', '6', 'SMTP服务器密码', '5', '', '填写您的密码', '1388333057', '1389187088', '1', '', '0');
INSERT INTO `dok_config` VALUES ('122', 'MAIL_USER_PASS', '5', '密码找回模板', '0', '', '支持HTML代码', '1388583989', '1388672614', '1', '密码找回111223333555111', '0');
INSERT INTO `dok_config` VALUES ('123', 'PIC_FILE_PATH', '1', '图片文件保存根目录', '4', '', '图片文件保存根目录./目录/', '1388673255', '1388673255', '1', './Uploads/', '0');
INSERT INTO `dok_config` VALUES ('124', 'COUNT_DAY', '0', '后台首页统计用户增长天数', '0', '', '默认统计最近半个月的用户数增长情况', '1420791945', '1420876261', '1', '2', '0');
INSERT INTO `dok_config` VALUES ('125', 'MAIL_USER_REG', '5', '注册邮件模板', '3', '', '支持HTML代码', '1388337307', '1389532335', '1', '<a href=\"http://www.opensns.cn\" target=\"_blank\">点击进入</a><span style=\"color:#E53333;\">当您收到这封邮件，表明您已注册成功，以上为您的用户名和密码。。。。祝您生活愉快····</span>', '55');
INSERT INTO `dok_config` VALUES ('126', 'USER_NAME_BAOLIU', '1', '保留用户名和昵称', '3', '', '禁止注册用户名和昵称，包含这些即无法注册,用\" , \"号隔开，用户只能是英文，下划线_，数字等', '1388845937', '1388845937', '1', '管理员,测试,admin,垃圾', '0');
INSERT INTO `dok_config` VALUES ('128', 'VERIFY_OPEN', '8', '验证码配置', '4', 'reg:注册显示\r\nlogin:登陆显示\r\nreset:密码重置', '验证码配置', '1388500332', '1405561711', '1', '', '0');
INSERT INTO `dok_config` VALUES ('129', 'VERIFY_TYPE', '4', '验证码类型', '4', '1:中文\r\n2:英文\r\n3:数字\r\n4:英文+数字', '验证码类型', '1388500873', '1405561731', '1', '4', '0');
INSERT INTO `dok_config` VALUES ('130', 'NO_BODY_TLE', '2', '空白说明', '2', '', '空白说明', '1392216444', '1392981305', '1', '呵呵，暂时没有内容哦！！', '0');
INSERT INTO `dok_config` VALUES ('131', 'USER_RESPASS', '5', '密码找回模板', '3', '', '密码找回文本', '1396191234', '1396191234', '1', '<span style=\"color:#009900;\">请点击以下链接找回密码，如无反应，请将链接地址复制到浏览器中打开(下次登录前有效)</span>', '0');
INSERT INTO `dok_config` VALUES ('132', 'COUNT_CODE', '2', '统计代码', '1', '', '用于统计网站访问量的第三方代码，推荐CNZZ统计', '1403058890', '1403058890', '1', '', '12');
INSERT INTO `dok_config` VALUES ('134', 'URL_MODEL', '4', 'URL模式', '4', '2:REWRITE模式(开启伪静态)\r\n3:兼容模式', '选择Rewrite模式则开启伪静态，在开启伪静态之前需要先<a href=\"http://v2.opensns.cn/index.php?s=/news/index/detail/id/128.html\" target=\"_blank\">设置伪静态</a>或者阅读/Rewrite/readme.txt中的说明，默认建议开启兼容模式', '1421027546', '1421027676', '1', '3', '0');
INSERT INTO `dok_config` VALUES ('135', 'DEFUALT_HOME_URL', '1', '登录前首页Url', '1', '', '支持形如weibo/index/index的ThinkPhp路由写法，支持普通的url写法，不填则显示默认聚合首页', '1417509438', '1427340006', '1', '', '1');
INSERT INTO `dok_config` VALUES ('137', 'WEB_SITE_CLOSE_HINT', '2', '关站提示文字', '1', '', '站点关闭后的提示文字。', '1433731248', '1433731287', '1', '网站正在更新维护，请稍候再试。', '4');
INSERT INTO `dok_config` VALUES ('138', 'SESSION_PREFIX', '1', '网站前台session前缀', '1', '', '当多个网站在同一个根域名下请保证每个网站的前缀不同', '1436923664', '1436923664', '1', 'opencenter', '20');
INSERT INTO `dok_config` VALUES ('139', 'COOKIE_PREFIX', '1', '网站前台cookie前缀', '1', '', '当多个网站在同一个根域名下请保证每个网站的前缀不同', '1436923664', '1436923664', '1', 'opencenter_', '21');
INSERT INTO `dok_config` VALUES ('140', 'MAIL_SMTP_CE', '1', '邮件发送测试', '5', '', '填写测试邮件地址', '1388334529', '1388584028', '1', '', '11');
INSERT INTO `dok_config` VALUES ('1000', '_USERCONFIG_REG_SWITCH', '0', '', '0', '', '', '1427094903', '1427094903', '1', 'username', '0');
INSERT INTO `dok_config` VALUES ('10000', '_CONFIG_WEB_SITE_NAME', '0', '', '0', '', '', '1452489485', '1452489485', '1', 'OpenCenter v2轻量化社交框架', '0');
INSERT INTO `dok_config` VALUES ('10001', '_CONFIG_ICP', '0', '', '0', '', '', '1452489485', '1452489485', '1', '沪ICP备12007XXX号', '0');
INSERT INTO `dok_config` VALUES ('10002', '_CONFIG_LOGO', '0', '', '0', '', '', '1452489485', '1452489485', '1', '1', '0');
INSERT INTO `dok_config` VALUES ('10003', '_CONFIG_QRCODE', '0', '', '0', '', '', '1452489485', '1452489485', '1', '', '0');
INSERT INTO `dok_config` VALUES ('10014', '_CONFIG_ABOUT_US', '0', '', '0', '', '', '1452489485', '1452489485', '1', '<p>&nbsp; 嘉兴想天信息科技有限公司是一家专注于为客户提供专业的社交方案。公司秉持简洁、高效、创新，不断为客户创造奇迹。旗下产品有OpenSNS开源社交系统和OpenCenter开源用户和后台管理系统。</p>', '0');
INSERT INTO `dok_config` VALUES ('10013', '_CONFIG_SUBSCRIB_US', '0', '', '0', '', '', '1452489485', '1452489485', '1', '<p>业务QQ：276905621</p><p>联系地址：浙江省桐乡市环城南路1号电子商务中心</p><p>联系电话：0573-88037510</p>', '0');
INSERT INTO `dok_config` VALUES ('10012', '_CONFIG_COPY_RIGHT', '0', '', '0', '', '', '1452489485', '1452489485', '1', '<p>Copyright ©2013-2014 <a href=\"http://www.ourstu.com\" target=\"_blank\">嘉兴想天信息科技有限公司</a></p>', '0');
INSERT INTO `dok_config` VALUES ('1008', '_HOME_LOGO', '0', '', '0', '', '', '1432791820', '1432791820', '1', '', '0');
INSERT INTO `dok_config` VALUES ('1009', '_HOME_ENTER_URL', '0', '', '0', '', '', '1432791820', '1432791820', '1', '', '0');
INSERT INTO `dok_config` VALUES ('1010', '_HOME_BLOCK', '0', '', '0', '', '', '1432791820', '1432791820', '1', '[{\"data-id\":\"disable\",\"title\":\"禁用\",\"items\":[]},{\"data-id\":\"enable\",\"title\":\"启用\",\"items\":[{\"data-id\":\"slider\",\"title\":\"轮播\"},{\"data-id\":\"Weibo\",\"title\":\"微博\"},{\"data-id\":\"People\",\"title\":\"会员展示\"}]}]', '0');
INSERT INTO `dok_config` VALUES ('1011', '_HOME_PIC1', '0', '', '0', '', '', '1432791820', '1432791820', '1', '', '0');
INSERT INTO `dok_config` VALUES ('1012', '_HOME_URL1', '0', '', '0', '', '', '1432791820', '1432791820', '1', '', '0');
INSERT INTO `dok_config` VALUES ('1013', '_HOME_TITLE1', '0', '', '0', '', '', '1432791820', '1432791820', '1', '', '0');
INSERT INTO `dok_config` VALUES ('1014', '_HOME_PIC2', '0', '', '0', '', '', '1432791820', '1432791820', '1', '', '0');
INSERT INTO `dok_config` VALUES ('1015', '_HOME_URL2', '0', '', '0', '', '', '1432791820', '1432791820', '1', '', '0');
INSERT INTO `dok_config` VALUES ('1016', '_HOME_TITLE2', '0', '', '0', '', '', '1432791820', '1432791820', '1', '', '0');
INSERT INTO `dok_config` VALUES ('1017', '_HOME_PIC3', '0', '', '0', '', '', '1432791820', '1432791820', '1', '', '0');
INSERT INTO `dok_config` VALUES ('1018', '_HOME_URL3', '0', '', '0', '', '', '1432791820', '1432791820', '1', '', '0');
INSERT INTO `dok_config` VALUES ('1019', '_HOME_TITLE3', '0', '', '0', '', '', '1432791820', '1432791820', '1', '', '0');
INSERT INTO `dok_config` VALUES ('10004', '_CONFIG_JUMP_BACKGROUND', '0', '', '0', '', '', '1452489485', '1452489485', '1', '', '0');
INSERT INTO `dok_config` VALUES ('10005', '_CONFIG_SUCCESS_WAIT_TIME', '0', '', '0', '', '', '1452489485', '1452489485', '1', '2', '0');
INSERT INTO `dok_config` VALUES ('10006', '_CONFIG_ERROR_WAIT_TIME', '0', '', '0', '', '', '1452489485', '1452489485', '1', '5', '0');
INSERT INTO `dok_config` VALUES ('10007', '_CONFIG_OPEN_IM', '0', '', '0', '', '', '1452489485', '1452489485', '1', '1', '0');
INSERT INTO `dok_config` VALUES ('10008', '_CONFIG_GET_INFORMATION', '0', '', '0', '', '', '1452489485', '1452489485', '1', '1', '0');
INSERT INTO `dok_config` VALUES ('10009', '_CONFIG_GET_INFORMATION_INTERNAL', '0', '', '0', '', '', '1452489485', '1452489485', '1', '10', '0');
INSERT INTO `dok_config` VALUES ('10010', '_CONFIG_PICTURE_UPLOAD_DRIVER', '0', '', '0', '', '', '1452489485', '1452489485', '1', 'local', '0');
INSERT INTO `dok_config` VALUES ('10011', '_CONFIG_DOWNLOAD_UPLOAD_DRIVER', '0', '', '0', '', '', '1452489485', '1452489485', '1', 'local', '0');

-- ----------------------------
-- Table structure for dok_district
-- ----------------------------
DROP TABLE IF EXISTS `dok_district`;
CREATE TABLE `dok_district` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `upid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=910007 DEFAULT CHARSET=utf8 COMMENT='中国省市区乡镇数据表';

-- ----------------------------
-- Records of dok_district
-- ----------------------------
INSERT INTO `dok_district` VALUES ('110000', '北京市', '1', '0');
INSERT INTO `dok_district` VALUES ('120000', '天津市', '1', '0');
INSERT INTO `dok_district` VALUES ('130000', '河北省', '1', '0');
INSERT INTO `dok_district` VALUES ('140000', '山西省', '1', '0');
INSERT INTO `dok_district` VALUES ('150000', '内蒙古', '1', '0');
INSERT INTO `dok_district` VALUES ('210000', '辽宁省', '1', '0');
INSERT INTO `dok_district` VALUES ('220000', '吉林省', '1', '0');
INSERT INTO `dok_district` VALUES ('230000', '黑龙江', '1', '0');
INSERT INTO `dok_district` VALUES ('310000', '上海市', '1', '0');
INSERT INTO `dok_district` VALUES ('320000', '江苏省', '1', '0');
INSERT INTO `dok_district` VALUES ('330000', '浙江省', '1', '0');
INSERT INTO `dok_district` VALUES ('340000', '安徽省', '1', '0');
INSERT INTO `dok_district` VALUES ('350000', '福建省', '1', '0');
INSERT INTO `dok_district` VALUES ('360000', '江西省', '1', '0');
INSERT INTO `dok_district` VALUES ('370000', '山东省', '1', '0');
INSERT INTO `dok_district` VALUES ('410000', '河南省', '1', '0');
INSERT INTO `dok_district` VALUES ('420000', '湖北省', '1', '0');
INSERT INTO `dok_district` VALUES ('430000', '湖南省', '1', '0');
INSERT INTO `dok_district` VALUES ('440000', '广东省', '1', '0');
INSERT INTO `dok_district` VALUES ('450000', '广西省', '1', '0');
INSERT INTO `dok_district` VALUES ('460000', '海南省', '1', '0');
INSERT INTO `dok_district` VALUES ('500000', '重庆市', '1', '0');
INSERT INTO `dok_district` VALUES ('510000', '四川省', '1', '0');
INSERT INTO `dok_district` VALUES ('520000', '贵州省', '1', '0');
INSERT INTO `dok_district` VALUES ('530000', '云南省', '1', '0');
INSERT INTO `dok_district` VALUES ('540000', '西　藏', '1', '0');
INSERT INTO `dok_district` VALUES ('610000', '陕西省', '1', '0');
INSERT INTO `dok_district` VALUES ('620000', '甘肃省', '1', '0');
INSERT INTO `dok_district` VALUES ('630000', '青海省', '1', '0');
INSERT INTO `dok_district` VALUES ('640000', '宁　夏', '1', '0');
INSERT INTO `dok_district` VALUES ('650000', '新　疆', '1', '0');
INSERT INTO `dok_district` VALUES ('710000', '台湾省', '1', '0');
INSERT INTO `dok_district` VALUES ('810000', '香　港', '1', '0');
INSERT INTO `dok_district` VALUES ('820000', '澳　门', '1', '0');
INSERT INTO `dok_district` VALUES ('110100', '北京市', '2', '110000');
INSERT INTO `dok_district` VALUES ('110200', '县', '2', '110000');
INSERT INTO `dok_district` VALUES ('120100', '市辖区', '2', '120000');
INSERT INTO `dok_district` VALUES ('120200', '县', '2', '120000');
INSERT INTO `dok_district` VALUES ('130100', '石家庄市', '2', '130000');
INSERT INTO `dok_district` VALUES ('130200', '唐山市', '2', '130000');
INSERT INTO `dok_district` VALUES ('130300', '秦皇岛市', '2', '130000');
INSERT INTO `dok_district` VALUES ('130400', '邯郸市', '2', '130000');
INSERT INTO `dok_district` VALUES ('130500', '邢台市', '2', '130000');
INSERT INTO `dok_district` VALUES ('130600', '保定市', '2', '130000');
INSERT INTO `dok_district` VALUES ('130700', '张家口市', '2', '130000');
INSERT INTO `dok_district` VALUES ('130800', '承德市', '2', '130000');
INSERT INTO `dok_district` VALUES ('130900', '沧州市', '2', '130000');
INSERT INTO `dok_district` VALUES ('131000', '廊坊市', '2', '130000');
INSERT INTO `dok_district` VALUES ('131100', '衡水市', '2', '130000');
INSERT INTO `dok_district` VALUES ('140100', '太原市', '2', '140000');
INSERT INTO `dok_district` VALUES ('140200', '大同市', '2', '140000');
INSERT INTO `dok_district` VALUES ('140300', '阳泉市', '2', '140000');
INSERT INTO `dok_district` VALUES ('140400', '长治市', '2', '140000');
INSERT INTO `dok_district` VALUES ('140500', '晋城市', '2', '140000');
INSERT INTO `dok_district` VALUES ('140600', '朔州市', '2', '140000');
INSERT INTO `dok_district` VALUES ('140700', '晋中市', '2', '140000');
INSERT INTO `dok_district` VALUES ('140800', '运城市', '2', '140000');
INSERT INTO `dok_district` VALUES ('140900', '忻州市', '2', '140000');
INSERT INTO `dok_district` VALUES ('141000', '临汾市', '2', '140000');
INSERT INTO `dok_district` VALUES ('141100', '吕梁市', '2', '140000');
INSERT INTO `dok_district` VALUES ('150100', '呼和浩特市', '2', '150000');
INSERT INTO `dok_district` VALUES ('150200', '包头市', '2', '150000');
INSERT INTO `dok_district` VALUES ('150300', '乌海市', '2', '150000');
INSERT INTO `dok_district` VALUES ('150400', '赤峰市', '2', '150000');
INSERT INTO `dok_district` VALUES ('150500', '通辽市', '2', '150000');
INSERT INTO `dok_district` VALUES ('150600', '鄂尔多斯市', '2', '150000');
INSERT INTO `dok_district` VALUES ('150700', '呼伦贝尔市', '2', '150000');
INSERT INTO `dok_district` VALUES ('150800', '巴彦淖尔市', '2', '150000');
INSERT INTO `dok_district` VALUES ('150900', '乌兰察布市', '2', '150000');
INSERT INTO `dok_district` VALUES ('152200', '兴安盟', '2', '150000');
INSERT INTO `dok_district` VALUES ('152500', '锡林郭勒盟', '2', '150000');
INSERT INTO `dok_district` VALUES ('152900', '阿拉善盟', '2', '150000');
INSERT INTO `dok_district` VALUES ('210100', '沈阳市', '2', '210000');
INSERT INTO `dok_district` VALUES ('210200', '大连市', '2', '210000');
INSERT INTO `dok_district` VALUES ('210300', '鞍山市', '2', '210000');
INSERT INTO `dok_district` VALUES ('210400', '抚顺市', '2', '210000');
INSERT INTO `dok_district` VALUES ('210500', '本溪市', '2', '210000');
INSERT INTO `dok_district` VALUES ('210600', '丹东市', '2', '210000');
INSERT INTO `dok_district` VALUES ('210700', '锦州市', '2', '210000');
INSERT INTO `dok_district` VALUES ('210800', '营口市', '2', '210000');
INSERT INTO `dok_district` VALUES ('210900', '阜新市', '2', '210000');
INSERT INTO `dok_district` VALUES ('211000', '辽阳市', '2', '210000');
INSERT INTO `dok_district` VALUES ('211100', '盘锦市', '2', '210000');
INSERT INTO `dok_district` VALUES ('211200', '铁岭市', '2', '210000');
INSERT INTO `dok_district` VALUES ('211300', '朝阳市', '2', '210000');
INSERT INTO `dok_district` VALUES ('211400', '葫芦岛市', '2', '210000');
INSERT INTO `dok_district` VALUES ('220100', '长春市', '2', '220000');
INSERT INTO `dok_district` VALUES ('220200', '吉林市', '2', '220000');
INSERT INTO `dok_district` VALUES ('220300', '四平市', '2', '220000');
INSERT INTO `dok_district` VALUES ('220400', '辽源市', '2', '220000');
INSERT INTO `dok_district` VALUES ('220500', '通化市', '2', '220000');
INSERT INTO `dok_district` VALUES ('220600', '白山市', '2', '220000');
INSERT INTO `dok_district` VALUES ('220700', '松原市', '2', '220000');
INSERT INTO `dok_district` VALUES ('220800', '白城市', '2', '220000');
INSERT INTO `dok_district` VALUES ('222400', '延边朝鲜族自治州', '2', '220000');
INSERT INTO `dok_district` VALUES ('230100', '哈尔滨市', '2', '230000');
INSERT INTO `dok_district` VALUES ('230200', '齐齐哈尔市', '2', '230000');
INSERT INTO `dok_district` VALUES ('230300', '鸡西市', '2', '230000');
INSERT INTO `dok_district` VALUES ('230400', '鹤岗市', '2', '230000');
INSERT INTO `dok_district` VALUES ('230500', '双鸭山市', '2', '230000');
INSERT INTO `dok_district` VALUES ('230600', '大庆市', '2', '230000');
INSERT INTO `dok_district` VALUES ('230700', '伊春市', '2', '230000');
INSERT INTO `dok_district` VALUES ('230800', '佳木斯市', '2', '230000');
INSERT INTO `dok_district` VALUES ('230900', '七台河市', '2', '230000');
INSERT INTO `dok_district` VALUES ('231000', '牡丹江市', '2', '230000');
INSERT INTO `dok_district` VALUES ('231100', '黑河市', '2', '230000');
INSERT INTO `dok_district` VALUES ('231200', '绥化市', '2', '230000');
INSERT INTO `dok_district` VALUES ('232700', '大兴安岭地区', '2', '230000');
INSERT INTO `dok_district` VALUES ('310100', '市辖区', '2', '310000');
INSERT INTO `dok_district` VALUES ('310200', '县', '2', '310000');
INSERT INTO `dok_district` VALUES ('320100', '南京市', '2', '320000');
INSERT INTO `dok_district` VALUES ('320200', '无锡市', '2', '320000');
INSERT INTO `dok_district` VALUES ('320300', '徐州市', '2', '320000');
INSERT INTO `dok_district` VALUES ('320400', '常州市', '2', '320000');
INSERT INTO `dok_district` VALUES ('320500', '苏州市', '2', '320000');
INSERT INTO `dok_district` VALUES ('320600', '南通市', '2', '320000');
INSERT INTO `dok_district` VALUES ('320700', '连云港市', '2', '320000');
INSERT INTO `dok_district` VALUES ('320800', '淮安市', '2', '320000');
INSERT INTO `dok_district` VALUES ('320900', '盐城市', '2', '320000');
INSERT INTO `dok_district` VALUES ('321000', '扬州市', '2', '320000');
INSERT INTO `dok_district` VALUES ('321100', '镇江市', '2', '320000');
INSERT INTO `dok_district` VALUES ('321200', '泰州市', '2', '320000');
INSERT INTO `dok_district` VALUES ('321300', '宿迁市', '2', '320000');
INSERT INTO `dok_district` VALUES ('330100', '杭州市', '2', '330000');
INSERT INTO `dok_district` VALUES ('330200', '宁波市', '2', '330000');
INSERT INTO `dok_district` VALUES ('330300', '温州市', '2', '330000');
INSERT INTO `dok_district` VALUES ('330400', '嘉兴市', '2', '330000');
INSERT INTO `dok_district` VALUES ('330500', '湖州市', '2', '330000');
INSERT INTO `dok_district` VALUES ('330600', '绍兴市', '2', '330000');
INSERT INTO `dok_district` VALUES ('330700', '金华市', '2', '330000');
INSERT INTO `dok_district` VALUES ('330800', '衢州市', '2', '330000');
INSERT INTO `dok_district` VALUES ('330900', '舟山市', '2', '330000');
INSERT INTO `dok_district` VALUES ('331000', '台州市', '2', '330000');
INSERT INTO `dok_district` VALUES ('331100', '丽水市', '2', '330000');
INSERT INTO `dok_district` VALUES ('340100', '合肥市', '2', '340000');
INSERT INTO `dok_district` VALUES ('340200', '芜湖市', '2', '340000');
INSERT INTO `dok_district` VALUES ('340300', '蚌埠市', '2', '340000');
INSERT INTO `dok_district` VALUES ('340400', '淮南市', '2', '340000');
INSERT INTO `dok_district` VALUES ('340500', '马鞍山市', '2', '340000');
INSERT INTO `dok_district` VALUES ('340600', '淮北市', '2', '340000');
INSERT INTO `dok_district` VALUES ('340700', '铜陵市', '2', '340000');
INSERT INTO `dok_district` VALUES ('340800', '安庆市', '2', '340000');
INSERT INTO `dok_district` VALUES ('341000', '黄山市', '2', '340000');
INSERT INTO `dok_district` VALUES ('341100', '滁州市', '2', '340000');
INSERT INTO `dok_district` VALUES ('341200', '阜阳市', '2', '340000');
INSERT INTO `dok_district` VALUES ('341300', '宿州市', '2', '340000');
INSERT INTO `dok_district` VALUES ('341500', '六安市', '2', '340000');
INSERT INTO `dok_district` VALUES ('341600', '亳州市', '2', '340000');
INSERT INTO `dok_district` VALUES ('341700', '池州市', '2', '340000');
INSERT INTO `dok_district` VALUES ('341800', '宣城市', '2', '340000');
INSERT INTO `dok_district` VALUES ('350100', '福州市', '2', '350000');
INSERT INTO `dok_district` VALUES ('350200', '厦门市', '2', '350000');
INSERT INTO `dok_district` VALUES ('350300', '莆田市', '2', '350000');
INSERT INTO `dok_district` VALUES ('350400', '三明市', '2', '350000');
INSERT INTO `dok_district` VALUES ('350500', '泉州市', '2', '350000');
INSERT INTO `dok_district` VALUES ('350600', '漳州市', '2', '350000');
INSERT INTO `dok_district` VALUES ('350700', '南平市', '2', '350000');
INSERT INTO `dok_district` VALUES ('350800', '龙岩市', '2', '350000');
INSERT INTO `dok_district` VALUES ('350900', '宁德市', '2', '350000');
INSERT INTO `dok_district` VALUES ('360100', '南昌市', '2', '360000');
INSERT INTO `dok_district` VALUES ('360200', '景德镇市', '2', '360000');
INSERT INTO `dok_district` VALUES ('360300', '萍乡市', '2', '360000');
INSERT INTO `dok_district` VALUES ('360400', '九江市', '2', '360000');
INSERT INTO `dok_district` VALUES ('360500', '新余市', '2', '360000');
INSERT INTO `dok_district` VALUES ('360600', '鹰潭市', '2', '360000');
INSERT INTO `dok_district` VALUES ('360700', '赣州市', '2', '360000');
INSERT INTO `dok_district` VALUES ('360800', '吉安市', '2', '360000');
INSERT INTO `dok_district` VALUES ('360900', '宜春市', '2', '360000');
INSERT INTO `dok_district` VALUES ('361000', '抚州市', '2', '360000');
INSERT INTO `dok_district` VALUES ('361100', '上饶市', '2', '360000');
INSERT INTO `dok_district` VALUES ('370100', '济南市', '2', '370000');
INSERT INTO `dok_district` VALUES ('370200', '青岛市', '2', '370000');
INSERT INTO `dok_district` VALUES ('370300', '淄博市', '2', '370000');
INSERT INTO `dok_district` VALUES ('370400', '枣庄市', '2', '370000');
INSERT INTO `dok_district` VALUES ('370500', '东营市', '2', '370000');
INSERT INTO `dok_district` VALUES ('370600', '烟台市', '2', '370000');
INSERT INTO `dok_district` VALUES ('370700', '潍坊市', '2', '370000');
INSERT INTO `dok_district` VALUES ('370800', '济宁市', '2', '370000');
INSERT INTO `dok_district` VALUES ('370900', '泰安市', '2', '370000');
INSERT INTO `dok_district` VALUES ('371000', '威海市', '2', '370000');
INSERT INTO `dok_district` VALUES ('371100', '日照市', '2', '370000');
INSERT INTO `dok_district` VALUES ('371200', '莱芜市', '2', '370000');
INSERT INTO `dok_district` VALUES ('371300', '临沂市', '2', '370000');
INSERT INTO `dok_district` VALUES ('371400', '德州市', '2', '370000');
INSERT INTO `dok_district` VALUES ('371500', '聊城市', '2', '370000');
INSERT INTO `dok_district` VALUES ('371600', '滨州市', '2', '370000');
INSERT INTO `dok_district` VALUES ('371700', '菏泽市', '2', '370000');
INSERT INTO `dok_district` VALUES ('410100', '郑州市', '2', '410000');
INSERT INTO `dok_district` VALUES ('410200', '开封市', '2', '410000');
INSERT INTO `dok_district` VALUES ('410300', '洛阳市', '2', '410000');
INSERT INTO `dok_district` VALUES ('410400', '平顶山市', '2', '410000');
INSERT INTO `dok_district` VALUES ('410500', '安阳市', '2', '410000');
INSERT INTO `dok_district` VALUES ('410600', '鹤壁市', '2', '410000');
INSERT INTO `dok_district` VALUES ('410700', '新乡市', '2', '410000');
INSERT INTO `dok_district` VALUES ('410800', '焦作市', '2', '410000');
INSERT INTO `dok_district` VALUES ('410900', '濮阳市', '2', '410000');
INSERT INTO `dok_district` VALUES ('411000', '许昌市', '2', '410000');
INSERT INTO `dok_district` VALUES ('411100', '漯河市', '2', '410000');
INSERT INTO `dok_district` VALUES ('411200', '三门峡市', '2', '410000');
INSERT INTO `dok_district` VALUES ('411300', '南阳市', '2', '410000');
INSERT INTO `dok_district` VALUES ('411400', '商丘市', '2', '410000');
INSERT INTO `dok_district` VALUES ('411500', '信阳市', '2', '410000');
INSERT INTO `dok_district` VALUES ('411600', '周口市', '2', '410000');
INSERT INTO `dok_district` VALUES ('411700', '驻马店市', '2', '410000');
INSERT INTO `dok_district` VALUES ('420100', '武汉市', '2', '420000');
INSERT INTO `dok_district` VALUES ('420200', '黄石市', '2', '420000');
INSERT INTO `dok_district` VALUES ('420300', '十堰市', '2', '420000');
INSERT INTO `dok_district` VALUES ('420500', '宜昌市', '2', '420000');
INSERT INTO `dok_district` VALUES ('420600', '襄樊市', '2', '420000');
INSERT INTO `dok_district` VALUES ('420700', '鄂州市', '2', '420000');
INSERT INTO `dok_district` VALUES ('420800', '荆门市', '2', '420000');
INSERT INTO `dok_district` VALUES ('420900', '孝感市', '2', '420000');
INSERT INTO `dok_district` VALUES ('421000', '荆州市', '2', '420000');
INSERT INTO `dok_district` VALUES ('421100', '黄冈市', '2', '420000');
INSERT INTO `dok_district` VALUES ('421200', '咸宁市', '2', '420000');
INSERT INTO `dok_district` VALUES ('421300', '随州市', '2', '420000');
INSERT INTO `dok_district` VALUES ('422800', '恩施土家族苗族自治州', '2', '420000');
INSERT INTO `dok_district` VALUES ('429000', '省直辖行政单位', '2', '420000');
INSERT INTO `dok_district` VALUES ('430100', '长沙市', '2', '430000');
INSERT INTO `dok_district` VALUES ('430200', '株洲市', '2', '430000');
INSERT INTO `dok_district` VALUES ('430300', '湘潭市', '2', '430000');
INSERT INTO `dok_district` VALUES ('430400', '衡阳市', '2', '430000');
INSERT INTO `dok_district` VALUES ('430500', '邵阳市', '2', '430000');
INSERT INTO `dok_district` VALUES ('430600', '岳阳市', '2', '430000');
INSERT INTO `dok_district` VALUES ('430700', '常德市', '2', '430000');
INSERT INTO `dok_district` VALUES ('430800', '张家界市', '2', '430000');
INSERT INTO `dok_district` VALUES ('430900', '益阳市', '2', '430000');
INSERT INTO `dok_district` VALUES ('431000', '郴州市', '2', '430000');
INSERT INTO `dok_district` VALUES ('431100', '永州市', '2', '430000');
INSERT INTO `dok_district` VALUES ('431200', '怀化市', '2', '430000');
INSERT INTO `dok_district` VALUES ('431300', '娄底市', '2', '430000');
INSERT INTO `dok_district` VALUES ('433100', '湘西土家族苗族自治州', '2', '430000');
INSERT INTO `dok_district` VALUES ('440100', '广州市', '2', '440000');
INSERT INTO `dok_district` VALUES ('440200', '韶关市', '2', '440000');
INSERT INTO `dok_district` VALUES ('440300', '深圳市', '2', '440000');
INSERT INTO `dok_district` VALUES ('440400', '珠海市', '2', '440000');
INSERT INTO `dok_district` VALUES ('440500', '汕头市', '2', '440000');
INSERT INTO `dok_district` VALUES ('440600', '佛山市', '2', '440000');
INSERT INTO `dok_district` VALUES ('440700', '江门市', '2', '440000');
INSERT INTO `dok_district` VALUES ('440800', '湛江市', '2', '440000');
INSERT INTO `dok_district` VALUES ('440900', '茂名市', '2', '440000');
INSERT INTO `dok_district` VALUES ('441200', '肇庆市', '2', '440000');
INSERT INTO `dok_district` VALUES ('441300', '惠州市', '2', '440000');
INSERT INTO `dok_district` VALUES ('441400', '梅州市', '2', '440000');
INSERT INTO `dok_district` VALUES ('441500', '汕尾市', '2', '440000');
INSERT INTO `dok_district` VALUES ('441600', '河源市', '2', '440000');
INSERT INTO `dok_district` VALUES ('441700', '阳江市', '2', '440000');
INSERT INTO `dok_district` VALUES ('441800', '清远市', '2', '440000');
INSERT INTO `dok_district` VALUES ('441900', '东莞市', '2', '440000');
INSERT INTO `dok_district` VALUES ('442000', '中山市', '2', '440000');
INSERT INTO `dok_district` VALUES ('445100', '潮州市', '2', '440000');
INSERT INTO `dok_district` VALUES ('445200', '揭阳市', '2', '440000');
INSERT INTO `dok_district` VALUES ('445300', '云浮市', '2', '440000');
INSERT INTO `dok_district` VALUES ('450100', '南宁市', '2', '450000');
INSERT INTO `dok_district` VALUES ('450200', '柳州市', '2', '450000');
INSERT INTO `dok_district` VALUES ('450300', '桂林市', '2', '450000');
INSERT INTO `dok_district` VALUES ('450400', '梧州市', '2', '450000');
INSERT INTO `dok_district` VALUES ('450500', '北海市', '2', '450000');
INSERT INTO `dok_district` VALUES ('450600', '防城港市', '2', '450000');
INSERT INTO `dok_district` VALUES ('450700', '钦州市', '2', '450000');
INSERT INTO `dok_district` VALUES ('450800', '贵港市', '2', '450000');
INSERT INTO `dok_district` VALUES ('450900', '玉林市', '2', '450000');
INSERT INTO `dok_district` VALUES ('451000', '百色市', '2', '450000');
INSERT INTO `dok_district` VALUES ('451100', '贺州市', '2', '450000');
INSERT INTO `dok_district` VALUES ('451200', '河池市', '2', '450000');
INSERT INTO `dok_district` VALUES ('451300', '来宾市', '2', '450000');
INSERT INTO `dok_district` VALUES ('451400', '崇左市', '2', '450000');
INSERT INTO `dok_district` VALUES ('460100', '海口市', '2', '460000');
INSERT INTO `dok_district` VALUES ('460200', '三亚市', '2', '460000');
INSERT INTO `dok_district` VALUES ('469000', '省直辖县级行政单位', '2', '460000');
INSERT INTO `dok_district` VALUES ('500100', '市辖区', '2', '500000');
INSERT INTO `dok_district` VALUES ('500200', '县', '2', '500000');
INSERT INTO `dok_district` VALUES ('500300', '市', '2', '500000');
INSERT INTO `dok_district` VALUES ('510100', '成都市', '2', '510000');
INSERT INTO `dok_district` VALUES ('510300', '自贡市', '2', '510000');
INSERT INTO `dok_district` VALUES ('510400', '攀枝花市', '2', '510000');
INSERT INTO `dok_district` VALUES ('510500', '泸州市', '2', '510000');
INSERT INTO `dok_district` VALUES ('510600', '德阳市', '2', '510000');
INSERT INTO `dok_district` VALUES ('510700', '绵阳市', '2', '510000');
INSERT INTO `dok_district` VALUES ('510800', '广元市', '2', '510000');
INSERT INTO `dok_district` VALUES ('510900', '遂宁市', '2', '510000');
INSERT INTO `dok_district` VALUES ('511000', '内江市', '2', '510000');
INSERT INTO `dok_district` VALUES ('511100', '乐山市', '2', '510000');
INSERT INTO `dok_district` VALUES ('511300', '南充市', '2', '510000');
INSERT INTO `dok_district` VALUES ('511400', '眉山市', '2', '510000');
INSERT INTO `dok_district` VALUES ('511500', '宜宾市', '2', '510000');
INSERT INTO `dok_district` VALUES ('511600', '广安市', '2', '510000');
INSERT INTO `dok_district` VALUES ('511700', '达州市', '2', '510000');
INSERT INTO `dok_district` VALUES ('511800', '雅安市', '2', '510000');
INSERT INTO `dok_district` VALUES ('511900', '巴中市', '2', '510000');
INSERT INTO `dok_district` VALUES ('512000', '资阳市', '2', '510000');
INSERT INTO `dok_district` VALUES ('513200', '阿坝藏族羌族自治州', '2', '510000');
INSERT INTO `dok_district` VALUES ('513300', '甘孜藏族自治州', '2', '510000');
INSERT INTO `dok_district` VALUES ('513400', '凉山彝族自治州', '2', '510000');
INSERT INTO `dok_district` VALUES ('520100', '贵阳市', '2', '520000');
INSERT INTO `dok_district` VALUES ('520200', '六盘水市', '2', '520000');
INSERT INTO `dok_district` VALUES ('520300', '遵义市', '2', '520000');
INSERT INTO `dok_district` VALUES ('520400', '安顺市', '2', '520000');
INSERT INTO `dok_district` VALUES ('522200', '铜仁地区', '2', '520000');
INSERT INTO `dok_district` VALUES ('522300', '黔西南布依族苗族自治州', '2', '520000');
INSERT INTO `dok_district` VALUES ('522400', '毕节地区', '2', '520000');
INSERT INTO `dok_district` VALUES ('522600', '黔东南苗族侗族自治州', '2', '520000');
INSERT INTO `dok_district` VALUES ('522700', '黔南布依族苗族自治州', '2', '520000');
INSERT INTO `dok_district` VALUES ('530100', '昆明市', '2', '530000');
INSERT INTO `dok_district` VALUES ('530300', '曲靖市', '2', '530000');
INSERT INTO `dok_district` VALUES ('530400', '玉溪市', '2', '530000');
INSERT INTO `dok_district` VALUES ('530500', '保山市', '2', '530000');
INSERT INTO `dok_district` VALUES ('530600', '昭通市', '2', '530000');
INSERT INTO `dok_district` VALUES ('530700', '丽江市', '2', '530000');
INSERT INTO `dok_district` VALUES ('530800', '思茅市', '2', '530000');
INSERT INTO `dok_district` VALUES ('530900', '临沧市', '2', '530000');
INSERT INTO `dok_district` VALUES ('532300', '楚雄彝族自治州', '2', '530000');
INSERT INTO `dok_district` VALUES ('532500', '红河哈尼族彝族自治州', '2', '530000');
INSERT INTO `dok_district` VALUES ('532600', '文山壮族苗族自治州', '2', '530000');
INSERT INTO `dok_district` VALUES ('532800', '西双版纳傣族自治州', '2', '530000');
INSERT INTO `dok_district` VALUES ('532900', '大理白族自治州', '2', '530000');
INSERT INTO `dok_district` VALUES ('533100', '德宏傣族景颇族自治州', '2', '530000');
INSERT INTO `dok_district` VALUES ('533300', '怒江傈僳族自治州', '2', '530000');
INSERT INTO `dok_district` VALUES ('533400', '迪庆藏族自治州', '2', '530000');
INSERT INTO `dok_district` VALUES ('540100', '拉萨市', '2', '540000');
INSERT INTO `dok_district` VALUES ('542100', '昌都地区', '2', '540000');
INSERT INTO `dok_district` VALUES ('542200', '山南地区', '2', '540000');
INSERT INTO `dok_district` VALUES ('542300', '日喀则地区', '2', '540000');
INSERT INTO `dok_district` VALUES ('542400', '那曲地区', '2', '540000');
INSERT INTO `dok_district` VALUES ('542500', '阿里地区', '2', '540000');
INSERT INTO `dok_district` VALUES ('542600', '林芝地区', '2', '540000');
INSERT INTO `dok_district` VALUES ('610100', '西安市', '2', '610000');
INSERT INTO `dok_district` VALUES ('610200', '铜川市', '2', '610000');
INSERT INTO `dok_district` VALUES ('610300', '宝鸡市', '2', '610000');
INSERT INTO `dok_district` VALUES ('610400', '咸阳市', '2', '610000');
INSERT INTO `dok_district` VALUES ('610500', '渭南市', '2', '610000');
INSERT INTO `dok_district` VALUES ('610600', '延安市', '2', '610000');
INSERT INTO `dok_district` VALUES ('610700', '汉中市', '2', '610000');
INSERT INTO `dok_district` VALUES ('610800', '榆林市', '2', '610000');
INSERT INTO `dok_district` VALUES ('610900', '安康市', '2', '610000');
INSERT INTO `dok_district` VALUES ('611000', '商洛市', '2', '610000');
INSERT INTO `dok_district` VALUES ('620100', '兰州市', '2', '620000');
INSERT INTO `dok_district` VALUES ('620200', '嘉峪关市', '2', '620000');
INSERT INTO `dok_district` VALUES ('620300', '金昌市', '2', '620000');
INSERT INTO `dok_district` VALUES ('620400', '白银市', '2', '620000');
INSERT INTO `dok_district` VALUES ('620500', '天水市', '2', '620000');
INSERT INTO `dok_district` VALUES ('620600', '武威市', '2', '620000');
INSERT INTO `dok_district` VALUES ('620700', '张掖市', '2', '620000');
INSERT INTO `dok_district` VALUES ('620800', '平凉市', '2', '620000');
INSERT INTO `dok_district` VALUES ('620900', '酒泉市', '2', '620000');
INSERT INTO `dok_district` VALUES ('621000', '庆阳市', '2', '620000');
INSERT INTO `dok_district` VALUES ('621100', '定西市', '2', '620000');
INSERT INTO `dok_district` VALUES ('621200', '陇南市', '2', '620000');
INSERT INTO `dok_district` VALUES ('622900', '临夏回族自治州', '2', '620000');
INSERT INTO `dok_district` VALUES ('623000', '甘南藏族自治州', '2', '620000');
INSERT INTO `dok_district` VALUES ('630100', '西宁市', '2', '630000');
INSERT INTO `dok_district` VALUES ('632100', '海东地区', '2', '630000');
INSERT INTO `dok_district` VALUES ('632200', '海北藏族自治州', '2', '630000');
INSERT INTO `dok_district` VALUES ('632300', '黄南藏族自治州', '2', '630000');
INSERT INTO `dok_district` VALUES ('632500', '海南藏族自治州', '2', '630000');
INSERT INTO `dok_district` VALUES ('632600', '果洛藏族自治州', '2', '630000');
INSERT INTO `dok_district` VALUES ('632700', '玉树藏族自治州', '2', '630000');
INSERT INTO `dok_district` VALUES ('632800', '海西蒙古族藏族自治州', '2', '630000');
INSERT INTO `dok_district` VALUES ('640100', '银川市', '2', '640000');
INSERT INTO `dok_district` VALUES ('640200', '石嘴山市', '2', '640000');
INSERT INTO `dok_district` VALUES ('640300', '吴忠市', '2', '640000');
INSERT INTO `dok_district` VALUES ('640400', '固原市', '2', '640000');
INSERT INTO `dok_district` VALUES ('640500', '中卫市', '2', '640000');
INSERT INTO `dok_district` VALUES ('650100', '乌鲁木齐市', '2', '650000');
INSERT INTO `dok_district` VALUES ('650200', '克拉玛依市', '2', '650000');
INSERT INTO `dok_district` VALUES ('652100', '吐鲁番地区', '2', '650000');
INSERT INTO `dok_district` VALUES ('652200', '哈密地区', '2', '650000');
INSERT INTO `dok_district` VALUES ('652300', '昌吉回族自治州', '2', '650000');
INSERT INTO `dok_district` VALUES ('652700', '博尔塔拉蒙古自治州', '2', '650000');
INSERT INTO `dok_district` VALUES ('652800', '巴音郭楞蒙古自治州', '2', '650000');
INSERT INTO `dok_district` VALUES ('652900', '阿克苏地区', '2', '650000');
INSERT INTO `dok_district` VALUES ('653000', '克孜勒苏柯尔克孜自治州', '2', '650000');
INSERT INTO `dok_district` VALUES ('653100', '喀什地区', '2', '650000');
INSERT INTO `dok_district` VALUES ('653200', '和田地区', '2', '650000');
INSERT INTO `dok_district` VALUES ('654000', '伊犁哈萨克自治州', '2', '650000');
INSERT INTO `dok_district` VALUES ('654200', '塔城地区', '2', '650000');
INSERT INTO `dok_district` VALUES ('654300', '阿勒泰地区', '2', '650000');
INSERT INTO `dok_district` VALUES ('659000', '省直辖行政单位', '2', '650000');
INSERT INTO `dok_district` VALUES ('110101', '东城区', '3', '110100');
INSERT INTO `dok_district` VALUES ('110102', '西城区', '3', '110100');
INSERT INTO `dok_district` VALUES ('110103', '崇文区', '3', '110100');
INSERT INTO `dok_district` VALUES ('110104', '宣武区', '3', '110100');
INSERT INTO `dok_district` VALUES ('110105', '朝阳区', '3', '110100');
INSERT INTO `dok_district` VALUES ('110106', '丰台区', '3', '110100');
INSERT INTO `dok_district` VALUES ('110107', '石景山区', '3', '110100');
INSERT INTO `dok_district` VALUES ('110108', '海淀区', '3', '110100');
INSERT INTO `dok_district` VALUES ('110109', '门头沟区', '3', '110100');
INSERT INTO `dok_district` VALUES ('110111', '房山区', '3', '110100');
INSERT INTO `dok_district` VALUES ('110112', '通州区', '3', '110100');
INSERT INTO `dok_district` VALUES ('110113', '顺义区', '3', '110100');
INSERT INTO `dok_district` VALUES ('110114', '昌平区', '3', '110100');
INSERT INTO `dok_district` VALUES ('110115', '大兴区', '3', '110100');
INSERT INTO `dok_district` VALUES ('110116', '怀柔区', '3', '110100');
INSERT INTO `dok_district` VALUES ('110117', '平谷区', '3', '110100');
INSERT INTO `dok_district` VALUES ('110228', '密云县', '3', '110200');
INSERT INTO `dok_district` VALUES ('110229', '延庆县', '3', '110200');
INSERT INTO `dok_district` VALUES ('120101', '和平区', '3', '120100');
INSERT INTO `dok_district` VALUES ('120102', '河东区', '3', '120100');
INSERT INTO `dok_district` VALUES ('120103', '河西区', '3', '120100');
INSERT INTO `dok_district` VALUES ('120104', '南开区', '3', '120100');
INSERT INTO `dok_district` VALUES ('120105', '河北区', '3', '120100');
INSERT INTO `dok_district` VALUES ('120106', '红桥区', '3', '120100');
INSERT INTO `dok_district` VALUES ('120107', '塘沽区', '3', '120100');
INSERT INTO `dok_district` VALUES ('120108', '汉沽区', '3', '120100');
INSERT INTO `dok_district` VALUES ('120109', '大港区', '3', '120100');
INSERT INTO `dok_district` VALUES ('120110', '东丽区', '3', '120100');
INSERT INTO `dok_district` VALUES ('120111', '西青区', '3', '120100');
INSERT INTO `dok_district` VALUES ('120112', '津南区', '3', '120100');
INSERT INTO `dok_district` VALUES ('120113', '北辰区', '3', '120100');
INSERT INTO `dok_district` VALUES ('120114', '武清区', '3', '120100');
INSERT INTO `dok_district` VALUES ('120115', '宝坻区', '3', '120100');
INSERT INTO `dok_district` VALUES ('120221', '宁河县', '3', '120200');
INSERT INTO `dok_district` VALUES ('120223', '静海县', '3', '120200');
INSERT INTO `dok_district` VALUES ('120225', '蓟　县', '3', '120200');
INSERT INTO `dok_district` VALUES ('130101', '市辖区', '3', '130100');
INSERT INTO `dok_district` VALUES ('130102', '长安区', '3', '130100');
INSERT INTO `dok_district` VALUES ('130103', '桥东区', '3', '130100');
INSERT INTO `dok_district` VALUES ('130104', '桥西区', '3', '130100');
INSERT INTO `dok_district` VALUES ('130105', '新华区', '3', '130100');
INSERT INTO `dok_district` VALUES ('130107', '井陉矿区', '3', '130100');
INSERT INTO `dok_district` VALUES ('130108', '裕华区', '3', '130100');
INSERT INTO `dok_district` VALUES ('130121', '井陉县', '3', '130100');
INSERT INTO `dok_district` VALUES ('130123', '正定县', '3', '130100');
INSERT INTO `dok_district` VALUES ('130124', '栾城县', '3', '130100');
INSERT INTO `dok_district` VALUES ('130125', '行唐县', '3', '130100');
INSERT INTO `dok_district` VALUES ('130126', '灵寿县', '3', '130100');
INSERT INTO `dok_district` VALUES ('130127', '高邑县', '3', '130100');
INSERT INTO `dok_district` VALUES ('130128', '深泽县', '3', '130100');
INSERT INTO `dok_district` VALUES ('130129', '赞皇县', '3', '130100');
INSERT INTO `dok_district` VALUES ('130130', '无极县', '3', '130100');
INSERT INTO `dok_district` VALUES ('130131', '平山县', '3', '130100');
INSERT INTO `dok_district` VALUES ('130132', '元氏县', '3', '130100');
INSERT INTO `dok_district` VALUES ('130133', '赵　县', '3', '130100');
INSERT INTO `dok_district` VALUES ('130181', '辛集市', '3', '130100');
INSERT INTO `dok_district` VALUES ('130182', '藁城市', '3', '130100');
INSERT INTO `dok_district` VALUES ('130183', '晋州市', '3', '130100');
INSERT INTO `dok_district` VALUES ('130184', '新乐市', '3', '130100');
INSERT INTO `dok_district` VALUES ('130185', '鹿泉市', '3', '130100');
INSERT INTO `dok_district` VALUES ('130201', '市辖区', '3', '130200');
INSERT INTO `dok_district` VALUES ('130202', '路南区', '3', '130200');
INSERT INTO `dok_district` VALUES ('130203', '路北区', '3', '130200');
INSERT INTO `dok_district` VALUES ('130204', '古冶区', '3', '130200');
INSERT INTO `dok_district` VALUES ('130205', '开平区', '3', '130200');
INSERT INTO `dok_district` VALUES ('130207', '丰南区', '3', '130200');
INSERT INTO `dok_district` VALUES ('130208', '丰润区', '3', '130200');
INSERT INTO `dok_district` VALUES ('130223', '滦　县', '3', '130200');
INSERT INTO `dok_district` VALUES ('130224', '滦南县', '3', '130200');
INSERT INTO `dok_district` VALUES ('130225', '乐亭县', '3', '130200');
INSERT INTO `dok_district` VALUES ('130227', '迁西县', '3', '130200');
INSERT INTO `dok_district` VALUES ('130229', '玉田县', '3', '130200');
INSERT INTO `dok_district` VALUES ('130230', '唐海县', '3', '130200');
INSERT INTO `dok_district` VALUES ('130281', '遵化市', '3', '130200');
INSERT INTO `dok_district` VALUES ('130283', '迁安市', '3', '130200');
INSERT INTO `dok_district` VALUES ('130301', '市辖区', '3', '130300');
INSERT INTO `dok_district` VALUES ('130302', '海港区', '3', '130300');
INSERT INTO `dok_district` VALUES ('130303', '山海关区', '3', '130300');
INSERT INTO `dok_district` VALUES ('130304', '北戴河区', '3', '130300');
INSERT INTO `dok_district` VALUES ('130321', '青龙满族自治县', '3', '130300');
INSERT INTO `dok_district` VALUES ('130322', '昌黎县', '3', '130300');
INSERT INTO `dok_district` VALUES ('130323', '抚宁县', '3', '130300');
INSERT INTO `dok_district` VALUES ('130324', '卢龙县', '3', '130300');
INSERT INTO `dok_district` VALUES ('130401', '市辖区', '3', '130400');
INSERT INTO `dok_district` VALUES ('130402', '邯山区', '3', '130400');
INSERT INTO `dok_district` VALUES ('130403', '丛台区', '3', '130400');
INSERT INTO `dok_district` VALUES ('130404', '复兴区', '3', '130400');
INSERT INTO `dok_district` VALUES ('130406', '峰峰矿区', '3', '130400');
INSERT INTO `dok_district` VALUES ('130421', '邯郸县', '3', '130400');
INSERT INTO `dok_district` VALUES ('130423', '临漳县', '3', '130400');
INSERT INTO `dok_district` VALUES ('130424', '成安县', '3', '130400');
INSERT INTO `dok_district` VALUES ('130425', '大名县', '3', '130400');
INSERT INTO `dok_district` VALUES ('130426', '涉　县', '3', '130400');
INSERT INTO `dok_district` VALUES ('130427', '磁　县', '3', '130400');
INSERT INTO `dok_district` VALUES ('130428', '肥乡县', '3', '130400');
INSERT INTO `dok_district` VALUES ('130429', '永年县', '3', '130400');
INSERT INTO `dok_district` VALUES ('130430', '邱　县', '3', '130400');
INSERT INTO `dok_district` VALUES ('130431', '鸡泽县', '3', '130400');
INSERT INTO `dok_district` VALUES ('130432', '广平县', '3', '130400');
INSERT INTO `dok_district` VALUES ('130433', '馆陶县', '3', '130400');
INSERT INTO `dok_district` VALUES ('130434', '魏　县', '3', '130400');
INSERT INTO `dok_district` VALUES ('130435', '曲周县', '3', '130400');
INSERT INTO `dok_district` VALUES ('130481', '武安市', '3', '130400');
INSERT INTO `dok_district` VALUES ('130501', '市辖区', '3', '130500');
INSERT INTO `dok_district` VALUES ('130502', '桥东区', '3', '130500');
INSERT INTO `dok_district` VALUES ('130503', '桥西区', '3', '130500');
INSERT INTO `dok_district` VALUES ('130521', '邢台县', '3', '130500');
INSERT INTO `dok_district` VALUES ('130522', '临城县', '3', '130500');
INSERT INTO `dok_district` VALUES ('130523', '内丘县', '3', '130500');
INSERT INTO `dok_district` VALUES ('130524', '柏乡县', '3', '130500');
INSERT INTO `dok_district` VALUES ('130525', '隆尧县', '3', '130500');
INSERT INTO `dok_district` VALUES ('130526', '任　县', '3', '130500');
INSERT INTO `dok_district` VALUES ('130527', '南和县', '3', '130500');
INSERT INTO `dok_district` VALUES ('130528', '宁晋县', '3', '130500');
INSERT INTO `dok_district` VALUES ('130529', '巨鹿县', '3', '130500');
INSERT INTO `dok_district` VALUES ('130530', '新河县', '3', '130500');
INSERT INTO `dok_district` VALUES ('130531', '广宗县', '3', '130500');
INSERT INTO `dok_district` VALUES ('130532', '平乡县', '3', '130500');
INSERT INTO `dok_district` VALUES ('130533', '威　县', '3', '130500');
INSERT INTO `dok_district` VALUES ('130534', '清河县', '3', '130500');
INSERT INTO `dok_district` VALUES ('130535', '临西县', '3', '130500');
INSERT INTO `dok_district` VALUES ('130581', '南宫市', '3', '130500');
INSERT INTO `dok_district` VALUES ('130582', '沙河市', '3', '130500');
INSERT INTO `dok_district` VALUES ('130601', '市辖区', '3', '130600');
INSERT INTO `dok_district` VALUES ('130602', '新市区', '3', '130600');
INSERT INTO `dok_district` VALUES ('130603', '北市区', '3', '130600');
INSERT INTO `dok_district` VALUES ('130604', '南市区', '3', '130600');
INSERT INTO `dok_district` VALUES ('130621', '满城县', '3', '130600');
INSERT INTO `dok_district` VALUES ('130622', '清苑县', '3', '130600');
INSERT INTO `dok_district` VALUES ('130623', '涞水县', '3', '130600');
INSERT INTO `dok_district` VALUES ('130624', '阜平县', '3', '130600');
INSERT INTO `dok_district` VALUES ('130625', '徐水县', '3', '130600');
INSERT INTO `dok_district` VALUES ('130626', '定兴县', '3', '130600');
INSERT INTO `dok_district` VALUES ('130627', '唐　县', '3', '130600');
INSERT INTO `dok_district` VALUES ('130628', '高阳县', '3', '130600');
INSERT INTO `dok_district` VALUES ('130629', '容城县', '3', '130600');
INSERT INTO `dok_district` VALUES ('130630', '涞源县', '3', '130600');
INSERT INTO `dok_district` VALUES ('130631', '望都县', '3', '130600');
INSERT INTO `dok_district` VALUES ('130632', '安新县', '3', '130600');
INSERT INTO `dok_district` VALUES ('130633', '易　县', '3', '130600');
INSERT INTO `dok_district` VALUES ('130634', '曲阳县', '3', '130600');
INSERT INTO `dok_district` VALUES ('130635', '蠡　县', '3', '130600');
INSERT INTO `dok_district` VALUES ('130636', '顺平县', '3', '130600');
INSERT INTO `dok_district` VALUES ('130637', '博野县', '3', '130600');
INSERT INTO `dok_district` VALUES ('130638', '雄　县', '3', '130600');
INSERT INTO `dok_district` VALUES ('130681', '涿州市', '3', '130600');
INSERT INTO `dok_district` VALUES ('130682', '定州市', '3', '130600');
INSERT INTO `dok_district` VALUES ('130683', '安国市', '3', '130600');
INSERT INTO `dok_district` VALUES ('130684', '高碑店市', '3', '130600');
INSERT INTO `dok_district` VALUES ('130701', '市辖区', '3', '130700');
INSERT INTO `dok_district` VALUES ('130702', '桥东区', '3', '130700');
INSERT INTO `dok_district` VALUES ('130703', '桥西区', '3', '130700');
INSERT INTO `dok_district` VALUES ('130705', '宣化区', '3', '130700');
INSERT INTO `dok_district` VALUES ('130706', '下花园区', '3', '130700');
INSERT INTO `dok_district` VALUES ('130721', '宣化县', '3', '130700');
INSERT INTO `dok_district` VALUES ('130722', '张北县', '3', '130700');
INSERT INTO `dok_district` VALUES ('130723', '康保县', '3', '130700');
INSERT INTO `dok_district` VALUES ('130724', '沽源县', '3', '130700');
INSERT INTO `dok_district` VALUES ('130725', '尚义县', '3', '130700');
INSERT INTO `dok_district` VALUES ('130726', '蔚　县', '3', '130700');
INSERT INTO `dok_district` VALUES ('130727', '阳原县', '3', '130700');
INSERT INTO `dok_district` VALUES ('130728', '怀安县', '3', '130700');
INSERT INTO `dok_district` VALUES ('130729', '万全县', '3', '130700');
INSERT INTO `dok_district` VALUES ('130730', '怀来县', '3', '130700');
INSERT INTO `dok_district` VALUES ('130731', '涿鹿县', '3', '130700');
INSERT INTO `dok_district` VALUES ('130732', '赤城县', '3', '130700');
INSERT INTO `dok_district` VALUES ('130733', '崇礼县', '3', '130700');
INSERT INTO `dok_district` VALUES ('130801', '市辖区', '3', '130800');
INSERT INTO `dok_district` VALUES ('130802', '双桥区', '3', '130800');
INSERT INTO `dok_district` VALUES ('130803', '双滦区', '3', '130800');
INSERT INTO `dok_district` VALUES ('130804', '鹰手营子矿区', '3', '130800');
INSERT INTO `dok_district` VALUES ('130821', '承德县', '3', '130800');
INSERT INTO `dok_district` VALUES ('130822', '兴隆县', '3', '130800');
INSERT INTO `dok_district` VALUES ('130823', '平泉县', '3', '130800');
INSERT INTO `dok_district` VALUES ('130824', '滦平县', '3', '130800');
INSERT INTO `dok_district` VALUES ('130825', '隆化县', '3', '130800');
INSERT INTO `dok_district` VALUES ('130826', '丰宁满族自治县', '3', '130800');
INSERT INTO `dok_district` VALUES ('130827', '宽城满族自治县', '3', '130800');
INSERT INTO `dok_district` VALUES ('130828', '围场满族蒙古族自治县', '3', '130800');
INSERT INTO `dok_district` VALUES ('130901', '市辖区', '3', '130900');
INSERT INTO `dok_district` VALUES ('130902', '新华区', '3', '130900');
INSERT INTO `dok_district` VALUES ('130903', '运河区', '3', '130900');
INSERT INTO `dok_district` VALUES ('130921', '沧　县', '3', '130900');
INSERT INTO `dok_district` VALUES ('130922', '青　县', '3', '130900');
INSERT INTO `dok_district` VALUES ('130923', '东光县', '3', '130900');
INSERT INTO `dok_district` VALUES ('130924', '海兴县', '3', '130900');
INSERT INTO `dok_district` VALUES ('130925', '盐山县', '3', '130900');
INSERT INTO `dok_district` VALUES ('130926', '肃宁县', '3', '130900');
INSERT INTO `dok_district` VALUES ('130927', '南皮县', '3', '130900');
INSERT INTO `dok_district` VALUES ('130928', '吴桥县', '3', '130900');
INSERT INTO `dok_district` VALUES ('130929', '献　县', '3', '130900');
INSERT INTO `dok_district` VALUES ('130930', '孟村回族自治县', '3', '130900');
INSERT INTO `dok_district` VALUES ('130981', '泊头市', '3', '130900');
INSERT INTO `dok_district` VALUES ('130982', '任丘市', '3', '130900');
INSERT INTO `dok_district` VALUES ('130983', '黄骅市', '3', '130900');
INSERT INTO `dok_district` VALUES ('130984', '河间市', '3', '130900');
INSERT INTO `dok_district` VALUES ('131001', '市辖区', '3', '131000');
INSERT INTO `dok_district` VALUES ('131002', '安次区', '3', '131000');
INSERT INTO `dok_district` VALUES ('131003', '广阳区', '3', '131000');
INSERT INTO `dok_district` VALUES ('131022', '固安县', '3', '131000');
INSERT INTO `dok_district` VALUES ('131023', '永清县', '3', '131000');
INSERT INTO `dok_district` VALUES ('131024', '香河县', '3', '131000');
INSERT INTO `dok_district` VALUES ('131025', '大城县', '3', '131000');
INSERT INTO `dok_district` VALUES ('131026', '文安县', '3', '131000');
INSERT INTO `dok_district` VALUES ('131028', '大厂回族自治县', '3', '131000');
INSERT INTO `dok_district` VALUES ('131081', '霸州市', '3', '131000');
INSERT INTO `dok_district` VALUES ('131082', '三河市', '3', '131000');
INSERT INTO `dok_district` VALUES ('131101', '市辖区', '3', '131100');
INSERT INTO `dok_district` VALUES ('131102', '桃城区', '3', '131100');
INSERT INTO `dok_district` VALUES ('131121', '枣强县', '3', '131100');
INSERT INTO `dok_district` VALUES ('131122', '武邑县', '3', '131100');
INSERT INTO `dok_district` VALUES ('131123', '武强县', '3', '131100');
INSERT INTO `dok_district` VALUES ('131124', '饶阳县', '3', '131100');
INSERT INTO `dok_district` VALUES ('131125', '安平县', '3', '131100');
INSERT INTO `dok_district` VALUES ('131126', '故城县', '3', '131100');
INSERT INTO `dok_district` VALUES ('131127', '景　县', '3', '131100');
INSERT INTO `dok_district` VALUES ('131128', '阜城县', '3', '131100');
INSERT INTO `dok_district` VALUES ('131181', '冀州市', '3', '131100');
INSERT INTO `dok_district` VALUES ('131182', '深州市', '3', '131100');
INSERT INTO `dok_district` VALUES ('140101', '市辖区', '3', '140100');
INSERT INTO `dok_district` VALUES ('140105', '小店区', '3', '140100');
INSERT INTO `dok_district` VALUES ('140106', '迎泽区', '3', '140100');
INSERT INTO `dok_district` VALUES ('140107', '杏花岭区', '3', '140100');
INSERT INTO `dok_district` VALUES ('140108', '尖草坪区', '3', '140100');
INSERT INTO `dok_district` VALUES ('140109', '万柏林区', '3', '140100');
INSERT INTO `dok_district` VALUES ('140110', '晋源区', '3', '140100');
INSERT INTO `dok_district` VALUES ('140121', '清徐县', '3', '140100');
INSERT INTO `dok_district` VALUES ('140122', '阳曲县', '3', '140100');
INSERT INTO `dok_district` VALUES ('140123', '娄烦县', '3', '140100');
INSERT INTO `dok_district` VALUES ('140181', '古交市', '3', '140100');
INSERT INTO `dok_district` VALUES ('140201', '市辖区', '3', '140200');
INSERT INTO `dok_district` VALUES ('140202', '城　区', '3', '140200');
INSERT INTO `dok_district` VALUES ('140203', '矿　区', '3', '140200');
INSERT INTO `dok_district` VALUES ('140211', '南郊区', '3', '140200');
INSERT INTO `dok_district` VALUES ('140212', '新荣区', '3', '140200');
INSERT INTO `dok_district` VALUES ('140221', '阳高县', '3', '140200');
INSERT INTO `dok_district` VALUES ('140222', '天镇县', '3', '140200');
INSERT INTO `dok_district` VALUES ('140223', '广灵县', '3', '140200');
INSERT INTO `dok_district` VALUES ('140224', '灵丘县', '3', '140200');
INSERT INTO `dok_district` VALUES ('140225', '浑源县', '3', '140200');
INSERT INTO `dok_district` VALUES ('140226', '左云县', '3', '140200');
INSERT INTO `dok_district` VALUES ('140227', '大同县', '3', '140200');
INSERT INTO `dok_district` VALUES ('140301', '市辖区', '3', '140300');
INSERT INTO `dok_district` VALUES ('140302', '城　区', '3', '140300');
INSERT INTO `dok_district` VALUES ('140303', '矿　区', '3', '140300');
INSERT INTO `dok_district` VALUES ('140311', '郊　区', '3', '140300');
INSERT INTO `dok_district` VALUES ('140321', '平定县', '3', '140300');
INSERT INTO `dok_district` VALUES ('140322', '盂　县', '3', '140300');
INSERT INTO `dok_district` VALUES ('140401', '市辖区', '3', '140400');
INSERT INTO `dok_district` VALUES ('140402', '城　区', '3', '140400');
INSERT INTO `dok_district` VALUES ('140411', '郊　区', '3', '140400');
INSERT INTO `dok_district` VALUES ('140421', '长治县', '3', '140400');
INSERT INTO `dok_district` VALUES ('140423', '襄垣县', '3', '140400');
INSERT INTO `dok_district` VALUES ('140424', '屯留县', '3', '140400');
INSERT INTO `dok_district` VALUES ('140425', '平顺县', '3', '140400');
INSERT INTO `dok_district` VALUES ('140426', '黎城县', '3', '140400');
INSERT INTO `dok_district` VALUES ('140427', '壶关县', '3', '140400');
INSERT INTO `dok_district` VALUES ('140428', '长子县', '3', '140400');
INSERT INTO `dok_district` VALUES ('140429', '武乡县', '3', '140400');
INSERT INTO `dok_district` VALUES ('140430', '沁　县', '3', '140400');
INSERT INTO `dok_district` VALUES ('140431', '沁源县', '3', '140400');
INSERT INTO `dok_district` VALUES ('140481', '潞城市', '3', '140400');
INSERT INTO `dok_district` VALUES ('140501', '市辖区', '3', '140500');
INSERT INTO `dok_district` VALUES ('140502', '城　区', '3', '140500');
INSERT INTO `dok_district` VALUES ('140521', '沁水县', '3', '140500');
INSERT INTO `dok_district` VALUES ('140522', '阳城县', '3', '140500');
INSERT INTO `dok_district` VALUES ('140524', '陵川县', '3', '140500');
INSERT INTO `dok_district` VALUES ('140525', '泽州县', '3', '140500');
INSERT INTO `dok_district` VALUES ('140581', '高平市', '3', '140500');
INSERT INTO `dok_district` VALUES ('140601', '市辖区', '3', '140600');
INSERT INTO `dok_district` VALUES ('140602', '朔城区', '3', '140600');
INSERT INTO `dok_district` VALUES ('140603', '平鲁区', '3', '140600');
INSERT INTO `dok_district` VALUES ('140621', '山阴县', '3', '140600');
INSERT INTO `dok_district` VALUES ('140622', '应　县', '3', '140600');
INSERT INTO `dok_district` VALUES ('140623', '右玉县', '3', '140600');
INSERT INTO `dok_district` VALUES ('140624', '怀仁县', '3', '140600');
INSERT INTO `dok_district` VALUES ('140701', '市辖区', '3', '140700');
INSERT INTO `dok_district` VALUES ('140702', '榆次区', '3', '140700');
INSERT INTO `dok_district` VALUES ('140721', '榆社县', '3', '140700');
INSERT INTO `dok_district` VALUES ('140722', '左权县', '3', '140700');
INSERT INTO `dok_district` VALUES ('140723', '和顺县', '3', '140700');
INSERT INTO `dok_district` VALUES ('140724', '昔阳县', '3', '140700');
INSERT INTO `dok_district` VALUES ('140725', '寿阳县', '3', '140700');
INSERT INTO `dok_district` VALUES ('140726', '太谷县', '3', '140700');
INSERT INTO `dok_district` VALUES ('140727', '祁　县', '3', '140700');
INSERT INTO `dok_district` VALUES ('140728', '平遥县', '3', '140700');
INSERT INTO `dok_district` VALUES ('140729', '灵石县', '3', '140700');
INSERT INTO `dok_district` VALUES ('140781', '介休市', '3', '140700');
INSERT INTO `dok_district` VALUES ('140801', '市辖区', '3', '140800');
INSERT INTO `dok_district` VALUES ('140802', '盐湖区', '3', '140800');
INSERT INTO `dok_district` VALUES ('140821', '临猗县', '3', '140800');
INSERT INTO `dok_district` VALUES ('140822', '万荣县', '3', '140800');
INSERT INTO `dok_district` VALUES ('140823', '闻喜县', '3', '140800');
INSERT INTO `dok_district` VALUES ('140824', '稷山县', '3', '140800');
INSERT INTO `dok_district` VALUES ('140825', '新绛县', '3', '140800');
INSERT INTO `dok_district` VALUES ('140826', '绛　县', '3', '140800');
INSERT INTO `dok_district` VALUES ('140827', '垣曲县', '3', '140800');
INSERT INTO `dok_district` VALUES ('140828', '夏　县', '3', '140800');
INSERT INTO `dok_district` VALUES ('140829', '平陆县', '3', '140800');
INSERT INTO `dok_district` VALUES ('140830', '芮城县', '3', '140800');
INSERT INTO `dok_district` VALUES ('140881', '永济市', '3', '140800');
INSERT INTO `dok_district` VALUES ('140882', '河津市', '3', '140800');
INSERT INTO `dok_district` VALUES ('140901', '市辖区', '3', '140900');
INSERT INTO `dok_district` VALUES ('140902', '忻府区', '3', '140900');
INSERT INTO `dok_district` VALUES ('140921', '定襄县', '3', '140900');
INSERT INTO `dok_district` VALUES ('140922', '五台县', '3', '140900');
INSERT INTO `dok_district` VALUES ('140923', '代　县', '3', '140900');
INSERT INTO `dok_district` VALUES ('140924', '繁峙县', '3', '140900');
INSERT INTO `dok_district` VALUES ('140925', '宁武县', '3', '140900');
INSERT INTO `dok_district` VALUES ('140926', '静乐县', '3', '140900');
INSERT INTO `dok_district` VALUES ('140927', '神池县', '3', '140900');
INSERT INTO `dok_district` VALUES ('140928', '五寨县', '3', '140900');
INSERT INTO `dok_district` VALUES ('140929', '岢岚县', '3', '140900');
INSERT INTO `dok_district` VALUES ('140930', '河曲县', '3', '140900');
INSERT INTO `dok_district` VALUES ('140931', '保德县', '3', '140900');
INSERT INTO `dok_district` VALUES ('140932', '偏关县', '3', '140900');
INSERT INTO `dok_district` VALUES ('140981', '原平市', '3', '140900');
INSERT INTO `dok_district` VALUES ('141001', '市辖区', '3', '141000');
INSERT INTO `dok_district` VALUES ('141002', '尧都区', '3', '141000');
INSERT INTO `dok_district` VALUES ('141021', '曲沃县', '3', '141000');
INSERT INTO `dok_district` VALUES ('141022', '翼城县', '3', '141000');
INSERT INTO `dok_district` VALUES ('141023', '襄汾县', '3', '141000');
INSERT INTO `dok_district` VALUES ('141024', '洪洞县', '3', '141000');
INSERT INTO `dok_district` VALUES ('141025', '古　县', '3', '141000');
INSERT INTO `dok_district` VALUES ('141026', '安泽县', '3', '141000');
INSERT INTO `dok_district` VALUES ('141027', '浮山县', '3', '141000');
INSERT INTO `dok_district` VALUES ('141028', '吉　县', '3', '141000');
INSERT INTO `dok_district` VALUES ('141029', '乡宁县', '3', '141000');
INSERT INTO `dok_district` VALUES ('141030', '大宁县', '3', '141000');
INSERT INTO `dok_district` VALUES ('141031', '隰　县', '3', '141000');
INSERT INTO `dok_district` VALUES ('141032', '永和县', '3', '141000');
INSERT INTO `dok_district` VALUES ('141033', '蒲　县', '3', '141000');
INSERT INTO `dok_district` VALUES ('141034', '汾西县', '3', '141000');
INSERT INTO `dok_district` VALUES ('141081', '侯马市', '3', '141000');
INSERT INTO `dok_district` VALUES ('141082', '霍州市', '3', '141000');
INSERT INTO `dok_district` VALUES ('141101', '市辖区', '3', '141100');
INSERT INTO `dok_district` VALUES ('141102', '离石区', '3', '141100');
INSERT INTO `dok_district` VALUES ('141121', '文水县', '3', '141100');
INSERT INTO `dok_district` VALUES ('141122', '交城县', '3', '141100');
INSERT INTO `dok_district` VALUES ('141123', '兴　县', '3', '141100');
INSERT INTO `dok_district` VALUES ('141124', '临　县', '3', '141100');
INSERT INTO `dok_district` VALUES ('141125', '柳林县', '3', '141100');
INSERT INTO `dok_district` VALUES ('141126', '石楼县', '3', '141100');
INSERT INTO `dok_district` VALUES ('141127', '岚　县', '3', '141100');
INSERT INTO `dok_district` VALUES ('141128', '方山县', '3', '141100');
INSERT INTO `dok_district` VALUES ('141129', '中阳县', '3', '141100');
INSERT INTO `dok_district` VALUES ('141130', '交口县', '3', '141100');
INSERT INTO `dok_district` VALUES ('141181', '孝义市', '3', '141100');
INSERT INTO `dok_district` VALUES ('141182', '汾阳市', '3', '141100');
INSERT INTO `dok_district` VALUES ('150101', '市辖区', '3', '150100');
INSERT INTO `dok_district` VALUES ('150102', '新城区', '3', '150100');
INSERT INTO `dok_district` VALUES ('150103', '回民区', '3', '150100');
INSERT INTO `dok_district` VALUES ('150104', '玉泉区', '3', '150100');
INSERT INTO `dok_district` VALUES ('150105', '赛罕区', '3', '150100');
INSERT INTO `dok_district` VALUES ('150121', '土默特左旗', '3', '150100');
INSERT INTO `dok_district` VALUES ('150122', '托克托县', '3', '150100');
INSERT INTO `dok_district` VALUES ('150123', '和林格尔县', '3', '150100');
INSERT INTO `dok_district` VALUES ('150124', '清水河县', '3', '150100');
INSERT INTO `dok_district` VALUES ('150125', '武川县', '3', '150100');
INSERT INTO `dok_district` VALUES ('150201', '市辖区', '3', '150200');
INSERT INTO `dok_district` VALUES ('150202', '东河区', '3', '150200');
INSERT INTO `dok_district` VALUES ('150203', '昆都仑区', '3', '150200');
INSERT INTO `dok_district` VALUES ('150204', '青山区', '3', '150200');
INSERT INTO `dok_district` VALUES ('150205', '石拐区', '3', '150200');
INSERT INTO `dok_district` VALUES ('150206', '白云矿区', '3', '150200');
INSERT INTO `dok_district` VALUES ('150207', '九原区', '3', '150200');
INSERT INTO `dok_district` VALUES ('150221', '土默特右旗', '3', '150200');
INSERT INTO `dok_district` VALUES ('150222', '固阳县', '3', '150200');
INSERT INTO `dok_district` VALUES ('150223', '达尔罕茂明安联合旗', '3', '150200');
INSERT INTO `dok_district` VALUES ('150301', '市辖区', '3', '150300');
INSERT INTO `dok_district` VALUES ('150302', '海勃湾区', '3', '150300');
INSERT INTO `dok_district` VALUES ('150303', '海南区', '3', '150300');
INSERT INTO `dok_district` VALUES ('150304', '乌达区', '3', '150300');
INSERT INTO `dok_district` VALUES ('150401', '市辖区', '3', '150400');
INSERT INTO `dok_district` VALUES ('150402', '红山区', '3', '150400');
INSERT INTO `dok_district` VALUES ('150403', '元宝山区', '3', '150400');
INSERT INTO `dok_district` VALUES ('150404', '松山区', '3', '150400');
INSERT INTO `dok_district` VALUES ('150421', '阿鲁科尔沁旗', '3', '150400');
INSERT INTO `dok_district` VALUES ('150422', '巴林左旗', '3', '150400');
INSERT INTO `dok_district` VALUES ('150423', '巴林右旗', '3', '150400');
INSERT INTO `dok_district` VALUES ('150424', '林西县', '3', '150400');
INSERT INTO `dok_district` VALUES ('150425', '克什克腾旗', '3', '150400');
INSERT INTO `dok_district` VALUES ('150426', '翁牛特旗', '3', '150400');
INSERT INTO `dok_district` VALUES ('150428', '喀喇沁旗', '3', '150400');
INSERT INTO `dok_district` VALUES ('150429', '宁城县', '3', '150400');
INSERT INTO `dok_district` VALUES ('150430', '敖汉旗', '3', '150400');
INSERT INTO `dok_district` VALUES ('150501', '市辖区', '3', '150500');
INSERT INTO `dok_district` VALUES ('150502', '科尔沁区', '3', '150500');
INSERT INTO `dok_district` VALUES ('150521', '科尔沁左翼中旗', '3', '150500');
INSERT INTO `dok_district` VALUES ('150522', '科尔沁左翼后旗', '3', '150500');
INSERT INTO `dok_district` VALUES ('150523', '开鲁县', '3', '150500');
INSERT INTO `dok_district` VALUES ('150524', '库伦旗', '3', '150500');
INSERT INTO `dok_district` VALUES ('150525', '奈曼旗', '3', '150500');
INSERT INTO `dok_district` VALUES ('150526', '扎鲁特旗', '3', '150500');
INSERT INTO `dok_district` VALUES ('150581', '霍林郭勒市', '3', '150500');
INSERT INTO `dok_district` VALUES ('150602', '东胜区', '3', '150600');
INSERT INTO `dok_district` VALUES ('150621', '达拉特旗', '3', '150600');
INSERT INTO `dok_district` VALUES ('150622', '准格尔旗', '3', '150600');
INSERT INTO `dok_district` VALUES ('150623', '鄂托克前旗', '3', '150600');
INSERT INTO `dok_district` VALUES ('150624', '鄂托克旗', '3', '150600');
INSERT INTO `dok_district` VALUES ('150625', '杭锦旗', '3', '150600');
INSERT INTO `dok_district` VALUES ('150626', '乌审旗', '3', '150600');
INSERT INTO `dok_district` VALUES ('150627', '伊金霍洛旗', '3', '150600');
INSERT INTO `dok_district` VALUES ('150701', '市辖区', '3', '150700');
INSERT INTO `dok_district` VALUES ('150702', '海拉尔区', '3', '150700');
INSERT INTO `dok_district` VALUES ('150721', '阿荣旗', '3', '150700');
INSERT INTO `dok_district` VALUES ('150722', '莫力达瓦达斡尔族自治旗', '3', '150700');
INSERT INTO `dok_district` VALUES ('150723', '鄂伦春自治旗', '3', '150700');
INSERT INTO `dok_district` VALUES ('150724', '鄂温克族自治旗', '3', '150700');
INSERT INTO `dok_district` VALUES ('150725', '陈巴尔虎旗', '3', '150700');
INSERT INTO `dok_district` VALUES ('150726', '新巴尔虎左旗', '3', '150700');
INSERT INTO `dok_district` VALUES ('150727', '新巴尔虎右旗', '3', '150700');
INSERT INTO `dok_district` VALUES ('150781', '满洲里市', '3', '150700');
INSERT INTO `dok_district` VALUES ('150782', '牙克石市', '3', '150700');
INSERT INTO `dok_district` VALUES ('150783', '扎兰屯市', '3', '150700');
INSERT INTO `dok_district` VALUES ('150784', '额尔古纳市', '3', '150700');
INSERT INTO `dok_district` VALUES ('150785', '根河市', '3', '150700');
INSERT INTO `dok_district` VALUES ('150801', '市辖区', '3', '150800');
INSERT INTO `dok_district` VALUES ('150802', '临河区', '3', '150800');
INSERT INTO `dok_district` VALUES ('150821', '五原县', '3', '150800');
INSERT INTO `dok_district` VALUES ('150822', '磴口县', '3', '150800');
INSERT INTO `dok_district` VALUES ('150823', '乌拉特前旗', '3', '150800');
INSERT INTO `dok_district` VALUES ('150824', '乌拉特中旗', '3', '150800');
INSERT INTO `dok_district` VALUES ('150825', '乌拉特后旗', '3', '150800');
INSERT INTO `dok_district` VALUES ('150826', '杭锦后旗', '3', '150800');
INSERT INTO `dok_district` VALUES ('150901', '市辖区', '3', '150900');
INSERT INTO `dok_district` VALUES ('150902', '集宁区', '3', '150900');
INSERT INTO `dok_district` VALUES ('150921', '卓资县', '3', '150900');
INSERT INTO `dok_district` VALUES ('150922', '化德县', '3', '150900');
INSERT INTO `dok_district` VALUES ('150923', '商都县', '3', '150900');
INSERT INTO `dok_district` VALUES ('150924', '兴和县', '3', '150900');
INSERT INTO `dok_district` VALUES ('150925', '凉城县', '3', '150900');
INSERT INTO `dok_district` VALUES ('150926', '察哈尔右翼前旗', '3', '150900');
INSERT INTO `dok_district` VALUES ('150927', '察哈尔右翼中旗', '3', '150900');
INSERT INTO `dok_district` VALUES ('150928', '察哈尔右翼后旗', '3', '150900');
INSERT INTO `dok_district` VALUES ('150929', '四子王旗', '3', '150900');
INSERT INTO `dok_district` VALUES ('150981', '丰镇市', '3', '150900');
INSERT INTO `dok_district` VALUES ('152201', '乌兰浩特市', '3', '152200');
INSERT INTO `dok_district` VALUES ('152202', '阿尔山市', '3', '152200');
INSERT INTO `dok_district` VALUES ('152221', '科尔沁右翼前旗', '3', '152200');
INSERT INTO `dok_district` VALUES ('152222', '科尔沁右翼中旗', '3', '152200');
INSERT INTO `dok_district` VALUES ('152223', '扎赉特旗', '3', '152200');
INSERT INTO `dok_district` VALUES ('152224', '突泉县', '3', '152200');
INSERT INTO `dok_district` VALUES ('152501', '二连浩特市', '3', '152500');
INSERT INTO `dok_district` VALUES ('152502', '锡林浩特市', '3', '152500');
INSERT INTO `dok_district` VALUES ('152522', '阿巴嘎旗', '3', '152500');
INSERT INTO `dok_district` VALUES ('152523', '苏尼特左旗', '3', '152500');
INSERT INTO `dok_district` VALUES ('152524', '苏尼特右旗', '3', '152500');
INSERT INTO `dok_district` VALUES ('152525', '东乌珠穆沁旗', '3', '152500');
INSERT INTO `dok_district` VALUES ('152526', '西乌珠穆沁旗', '3', '152500');
INSERT INTO `dok_district` VALUES ('152527', '太仆寺旗', '3', '152500');
INSERT INTO `dok_district` VALUES ('152528', '镶黄旗', '3', '152500');
INSERT INTO `dok_district` VALUES ('152529', '正镶白旗', '3', '152500');
INSERT INTO `dok_district` VALUES ('152530', '正蓝旗', '3', '152500');
INSERT INTO `dok_district` VALUES ('152531', '多伦县', '3', '152500');
INSERT INTO `dok_district` VALUES ('152921', '阿拉善左旗', '3', '152900');
INSERT INTO `dok_district` VALUES ('152922', '阿拉善右旗', '3', '152900');
INSERT INTO `dok_district` VALUES ('152923', '额济纳旗', '3', '152900');
INSERT INTO `dok_district` VALUES ('210101', '市辖区', '3', '210100');
INSERT INTO `dok_district` VALUES ('210102', '和平区', '3', '210100');
INSERT INTO `dok_district` VALUES ('210103', '沈河区', '3', '210100');
INSERT INTO `dok_district` VALUES ('210104', '大东区', '3', '210100');
INSERT INTO `dok_district` VALUES ('210105', '皇姑区', '3', '210100');
INSERT INTO `dok_district` VALUES ('210106', '铁西区', '3', '210100');
INSERT INTO `dok_district` VALUES ('210111', '苏家屯区', '3', '210100');
INSERT INTO `dok_district` VALUES ('210112', '东陵区', '3', '210100');
INSERT INTO `dok_district` VALUES ('210113', '新城子区', '3', '210100');
INSERT INTO `dok_district` VALUES ('210114', '于洪区', '3', '210100');
INSERT INTO `dok_district` VALUES ('210122', '辽中县', '3', '210100');
INSERT INTO `dok_district` VALUES ('210123', '康平县', '3', '210100');
INSERT INTO `dok_district` VALUES ('210124', '法库县', '3', '210100');
INSERT INTO `dok_district` VALUES ('210181', '新民市', '3', '210100');
INSERT INTO `dok_district` VALUES ('210201', '市辖区', '3', '210200');
INSERT INTO `dok_district` VALUES ('210202', '中山区', '3', '210200');
INSERT INTO `dok_district` VALUES ('210203', '西岗区', '3', '210200');
INSERT INTO `dok_district` VALUES ('210204', '沙河口区', '3', '210200');
INSERT INTO `dok_district` VALUES ('210211', '甘井子区', '3', '210200');
INSERT INTO `dok_district` VALUES ('210212', '旅顺口区', '3', '210200');
INSERT INTO `dok_district` VALUES ('210213', '金州区', '3', '210200');
INSERT INTO `dok_district` VALUES ('210224', '长海县', '3', '210200');
INSERT INTO `dok_district` VALUES ('210281', '瓦房店市', '3', '210200');
INSERT INTO `dok_district` VALUES ('210282', '普兰店市', '3', '210200');
INSERT INTO `dok_district` VALUES ('210283', '庄河市', '3', '210200');
INSERT INTO `dok_district` VALUES ('210301', '市辖区', '3', '210300');
INSERT INTO `dok_district` VALUES ('210302', '铁东区', '3', '210300');
INSERT INTO `dok_district` VALUES ('210303', '铁西区', '3', '210300');
INSERT INTO `dok_district` VALUES ('210304', '立山区', '3', '210300');
INSERT INTO `dok_district` VALUES ('210311', '千山区', '3', '210300');
INSERT INTO `dok_district` VALUES ('210321', '台安县', '3', '210300');
INSERT INTO `dok_district` VALUES ('210323', '岫岩满族自治县', '3', '210300');
INSERT INTO `dok_district` VALUES ('210381', '海城市', '3', '210300');
INSERT INTO `dok_district` VALUES ('210401', '市辖区', '3', '210400');
INSERT INTO `dok_district` VALUES ('210402', '新抚区', '3', '210400');
INSERT INTO `dok_district` VALUES ('210403', '东洲区', '3', '210400');
INSERT INTO `dok_district` VALUES ('210404', '望花区', '3', '210400');
INSERT INTO `dok_district` VALUES ('210411', '顺城区', '3', '210400');
INSERT INTO `dok_district` VALUES ('210421', '抚顺县', '3', '210400');
INSERT INTO `dok_district` VALUES ('210422', '新宾满族自治县', '3', '210400');
INSERT INTO `dok_district` VALUES ('210423', '清原满族自治县', '3', '210400');
INSERT INTO `dok_district` VALUES ('210501', '市辖区', '3', '210500');
INSERT INTO `dok_district` VALUES ('210502', '平山区', '3', '210500');
INSERT INTO `dok_district` VALUES ('210503', '溪湖区', '3', '210500');
INSERT INTO `dok_district` VALUES ('210504', '明山区', '3', '210500');
INSERT INTO `dok_district` VALUES ('210505', '南芬区', '3', '210500');
INSERT INTO `dok_district` VALUES ('210521', '本溪满族自治县', '3', '210500');
INSERT INTO `dok_district` VALUES ('210522', '桓仁满族自治县', '3', '210500');
INSERT INTO `dok_district` VALUES ('210601', '市辖区', '3', '210600');
INSERT INTO `dok_district` VALUES ('210602', '元宝区', '3', '210600');
INSERT INTO `dok_district` VALUES ('210603', '振兴区', '3', '210600');
INSERT INTO `dok_district` VALUES ('210604', '振安区', '3', '210600');
INSERT INTO `dok_district` VALUES ('210624', '宽甸满族自治县', '3', '210600');
INSERT INTO `dok_district` VALUES ('210681', '东港市', '3', '210600');
INSERT INTO `dok_district` VALUES ('210682', '凤城市', '3', '210600');
INSERT INTO `dok_district` VALUES ('210701', '市辖区', '3', '210700');
INSERT INTO `dok_district` VALUES ('210702', '古塔区', '3', '210700');
INSERT INTO `dok_district` VALUES ('210703', '凌河区', '3', '210700');
INSERT INTO `dok_district` VALUES ('210711', '太和区', '3', '210700');
INSERT INTO `dok_district` VALUES ('210726', '黑山县', '3', '210700');
INSERT INTO `dok_district` VALUES ('210727', '义　县', '3', '210700');
INSERT INTO `dok_district` VALUES ('210781', '凌海市', '3', '210700');
INSERT INTO `dok_district` VALUES ('210782', '北宁市', '3', '210700');
INSERT INTO `dok_district` VALUES ('210801', '市辖区', '3', '210800');
INSERT INTO `dok_district` VALUES ('210802', '站前区', '3', '210800');
INSERT INTO `dok_district` VALUES ('210803', '西市区', '3', '210800');
INSERT INTO `dok_district` VALUES ('210804', '鲅鱼圈区', '3', '210800');
INSERT INTO `dok_district` VALUES ('210811', '老边区', '3', '210800');
INSERT INTO `dok_district` VALUES ('210881', '盖州市', '3', '210800');
INSERT INTO `dok_district` VALUES ('210882', '大石桥市', '3', '210800');
INSERT INTO `dok_district` VALUES ('210901', '市辖区', '3', '210900');
INSERT INTO `dok_district` VALUES ('210902', '海州区', '3', '210900');
INSERT INTO `dok_district` VALUES ('210903', '新邱区', '3', '210900');
INSERT INTO `dok_district` VALUES ('210904', '太平区', '3', '210900');
INSERT INTO `dok_district` VALUES ('210905', '清河门区', '3', '210900');
INSERT INTO `dok_district` VALUES ('210911', '细河区', '3', '210900');
INSERT INTO `dok_district` VALUES ('210921', '阜新蒙古族自治县', '3', '210900');
INSERT INTO `dok_district` VALUES ('210922', '彰武县', '3', '210900');
INSERT INTO `dok_district` VALUES ('211001', '市辖区', '3', '211000');
INSERT INTO `dok_district` VALUES ('211002', '白塔区', '3', '211000');
INSERT INTO `dok_district` VALUES ('211003', '文圣区', '3', '211000');
INSERT INTO `dok_district` VALUES ('211004', '宏伟区', '3', '211000');
INSERT INTO `dok_district` VALUES ('211005', '弓长岭区', '3', '211000');
INSERT INTO `dok_district` VALUES ('211011', '太子河区', '3', '211000');
INSERT INTO `dok_district` VALUES ('211021', '辽阳县', '3', '211000');
INSERT INTO `dok_district` VALUES ('211081', '灯塔市', '3', '211000');
INSERT INTO `dok_district` VALUES ('211101', '市辖区', '3', '211100');
INSERT INTO `dok_district` VALUES ('211102', '双台子区', '3', '211100');
INSERT INTO `dok_district` VALUES ('211103', '兴隆台区', '3', '211100');
INSERT INTO `dok_district` VALUES ('211121', '大洼县', '3', '211100');
INSERT INTO `dok_district` VALUES ('211122', '盘山县', '3', '211100');
INSERT INTO `dok_district` VALUES ('211201', '市辖区', '3', '211200');
INSERT INTO `dok_district` VALUES ('211202', '银州区', '3', '211200');
INSERT INTO `dok_district` VALUES ('211204', '清河区', '3', '211200');
INSERT INTO `dok_district` VALUES ('211221', '铁岭县', '3', '211200');
INSERT INTO `dok_district` VALUES ('211223', '西丰县', '3', '211200');
INSERT INTO `dok_district` VALUES ('211224', '昌图县', '3', '211200');
INSERT INTO `dok_district` VALUES ('211281', '调兵山市', '3', '211200');
INSERT INTO `dok_district` VALUES ('211282', '开原市', '3', '211200');
INSERT INTO `dok_district` VALUES ('211301', '市辖区', '3', '211300');
INSERT INTO `dok_district` VALUES ('211302', '双塔区', '3', '211300');
INSERT INTO `dok_district` VALUES ('211303', '龙城区', '3', '211300');
INSERT INTO `dok_district` VALUES ('211321', '朝阳县', '3', '211300');
INSERT INTO `dok_district` VALUES ('211322', '建平县', '3', '211300');
INSERT INTO `dok_district` VALUES ('211324', '喀喇沁左翼蒙古族自治县', '3', '211300');
INSERT INTO `dok_district` VALUES ('211381', '北票市', '3', '211300');
INSERT INTO `dok_district` VALUES ('211382', '凌源市', '3', '211300');
INSERT INTO `dok_district` VALUES ('211401', '市辖区', '3', '211400');
INSERT INTO `dok_district` VALUES ('211402', '连山区', '3', '211400');
INSERT INTO `dok_district` VALUES ('211403', '龙港区', '3', '211400');
INSERT INTO `dok_district` VALUES ('211404', '南票区', '3', '211400');
INSERT INTO `dok_district` VALUES ('211421', '绥中县', '3', '211400');
INSERT INTO `dok_district` VALUES ('211422', '建昌县', '3', '211400');
INSERT INTO `dok_district` VALUES ('211481', '兴城市', '3', '211400');
INSERT INTO `dok_district` VALUES ('220101', '市辖区', '3', '220100');
INSERT INTO `dok_district` VALUES ('220102', '南关区', '3', '220100');
INSERT INTO `dok_district` VALUES ('220103', '宽城区', '3', '220100');
INSERT INTO `dok_district` VALUES ('220104', '朝阳区', '3', '220100');
INSERT INTO `dok_district` VALUES ('220105', '二道区', '3', '220100');
INSERT INTO `dok_district` VALUES ('220106', '绿园区', '3', '220100');
INSERT INTO `dok_district` VALUES ('220112', '双阳区', '3', '220100');
INSERT INTO `dok_district` VALUES ('220122', '农安县', '3', '220100');
INSERT INTO `dok_district` VALUES ('220181', '九台市', '3', '220100');
INSERT INTO `dok_district` VALUES ('220182', '榆树市', '3', '220100');
INSERT INTO `dok_district` VALUES ('220183', '德惠市', '3', '220100');
INSERT INTO `dok_district` VALUES ('220201', '市辖区', '3', '220200');
INSERT INTO `dok_district` VALUES ('220202', '昌邑区', '3', '220200');
INSERT INTO `dok_district` VALUES ('220203', '龙潭区', '3', '220200');
INSERT INTO `dok_district` VALUES ('220204', '船营区', '3', '220200');
INSERT INTO `dok_district` VALUES ('220211', '丰满区', '3', '220200');
INSERT INTO `dok_district` VALUES ('220221', '永吉县', '3', '220200');
INSERT INTO `dok_district` VALUES ('220281', '蛟河市', '3', '220200');
INSERT INTO `dok_district` VALUES ('220282', '桦甸市', '3', '220200');
INSERT INTO `dok_district` VALUES ('220283', '舒兰市', '3', '220200');
INSERT INTO `dok_district` VALUES ('220284', '磐石市', '3', '220200');
INSERT INTO `dok_district` VALUES ('220301', '市辖区', '3', '220300');
INSERT INTO `dok_district` VALUES ('220302', '铁西区', '3', '220300');
INSERT INTO `dok_district` VALUES ('220303', '铁东区', '3', '220300');
INSERT INTO `dok_district` VALUES ('220322', '梨树县', '3', '220300');
INSERT INTO `dok_district` VALUES ('220323', '伊通满族自治县', '3', '220300');
INSERT INTO `dok_district` VALUES ('220381', '公主岭市', '3', '220300');
INSERT INTO `dok_district` VALUES ('220382', '双辽市', '3', '220300');
INSERT INTO `dok_district` VALUES ('220401', '市辖区', '3', '220400');
INSERT INTO `dok_district` VALUES ('220402', '龙山区', '3', '220400');
INSERT INTO `dok_district` VALUES ('220403', '西安区', '3', '220400');
INSERT INTO `dok_district` VALUES ('220421', '东丰县', '3', '220400');
INSERT INTO `dok_district` VALUES ('220422', '东辽县', '3', '220400');
INSERT INTO `dok_district` VALUES ('220501', '市辖区', '3', '220500');
INSERT INTO `dok_district` VALUES ('220502', '东昌区', '3', '220500');
INSERT INTO `dok_district` VALUES ('220503', '二道江区', '3', '220500');
INSERT INTO `dok_district` VALUES ('220521', '通化县', '3', '220500');
INSERT INTO `dok_district` VALUES ('220523', '辉南县', '3', '220500');
INSERT INTO `dok_district` VALUES ('220524', '柳河县', '3', '220500');
INSERT INTO `dok_district` VALUES ('220581', '梅河口市', '3', '220500');
INSERT INTO `dok_district` VALUES ('220582', '集安市', '3', '220500');
INSERT INTO `dok_district` VALUES ('220601', '市辖区', '3', '220600');
INSERT INTO `dok_district` VALUES ('220602', '八道江区', '3', '220600');
INSERT INTO `dok_district` VALUES ('220621', '抚松县', '3', '220600');
INSERT INTO `dok_district` VALUES ('220622', '靖宇县', '3', '220600');
INSERT INTO `dok_district` VALUES ('220623', '长白朝鲜族自治县', '3', '220600');
INSERT INTO `dok_district` VALUES ('220625', '江源县', '3', '220600');
INSERT INTO `dok_district` VALUES ('220681', '临江市', '3', '220600');
INSERT INTO `dok_district` VALUES ('220701', '市辖区', '3', '220700');
INSERT INTO `dok_district` VALUES ('220702', '宁江区', '3', '220700');
INSERT INTO `dok_district` VALUES ('220721', '前郭尔罗斯蒙古族自治县', '3', '220700');
INSERT INTO `dok_district` VALUES ('220722', '长岭县', '3', '220700');
INSERT INTO `dok_district` VALUES ('220723', '乾安县', '3', '220700');
INSERT INTO `dok_district` VALUES ('220724', '扶余县', '3', '220700');
INSERT INTO `dok_district` VALUES ('220801', '市辖区', '3', '220800');
INSERT INTO `dok_district` VALUES ('220802', '洮北区', '3', '220800');
INSERT INTO `dok_district` VALUES ('220821', '镇赉县', '3', '220800');
INSERT INTO `dok_district` VALUES ('220822', '通榆县', '3', '220800');
INSERT INTO `dok_district` VALUES ('220881', '洮南市', '3', '220800');
INSERT INTO `dok_district` VALUES ('220882', '大安市', '3', '220800');
INSERT INTO `dok_district` VALUES ('222401', '延吉市', '3', '222400');
INSERT INTO `dok_district` VALUES ('222402', '图们市', '3', '222400');
INSERT INTO `dok_district` VALUES ('222403', '敦化市', '3', '222400');
INSERT INTO `dok_district` VALUES ('222404', '珲春市', '3', '222400');
INSERT INTO `dok_district` VALUES ('222405', '龙井市', '3', '222400');
INSERT INTO `dok_district` VALUES ('222406', '和龙市', '3', '222400');
INSERT INTO `dok_district` VALUES ('222424', '汪清县', '3', '222400');
INSERT INTO `dok_district` VALUES ('222426', '安图县', '3', '222400');
INSERT INTO `dok_district` VALUES ('230101', '市辖区', '3', '230100');
INSERT INTO `dok_district` VALUES ('230102', '道里区', '3', '230100');
INSERT INTO `dok_district` VALUES ('230103', '南岗区', '3', '230100');
INSERT INTO `dok_district` VALUES ('230104', '道外区', '3', '230100');
INSERT INTO `dok_district` VALUES ('230106', '香坊区', '3', '230100');
INSERT INTO `dok_district` VALUES ('230107', '动力区', '3', '230100');
INSERT INTO `dok_district` VALUES ('230108', '平房区', '3', '230100');
INSERT INTO `dok_district` VALUES ('230109', '松北区', '3', '230100');
INSERT INTO `dok_district` VALUES ('230111', '呼兰区', '3', '230100');
INSERT INTO `dok_district` VALUES ('230123', '依兰县', '3', '230100');
INSERT INTO `dok_district` VALUES ('230124', '方正县', '3', '230100');
INSERT INTO `dok_district` VALUES ('230125', '宾　县', '3', '230100');
INSERT INTO `dok_district` VALUES ('230126', '巴彦县', '3', '230100');
INSERT INTO `dok_district` VALUES ('230127', '木兰县', '3', '230100');
INSERT INTO `dok_district` VALUES ('230128', '通河县', '3', '230100');
INSERT INTO `dok_district` VALUES ('230129', '延寿县', '3', '230100');
INSERT INTO `dok_district` VALUES ('230181', '阿城市', '3', '230100');
INSERT INTO `dok_district` VALUES ('230182', '双城市', '3', '230100');
INSERT INTO `dok_district` VALUES ('230183', '尚志市', '3', '230100');
INSERT INTO `dok_district` VALUES ('230184', '五常市', '3', '230100');
INSERT INTO `dok_district` VALUES ('230201', '市辖区', '3', '230200');
INSERT INTO `dok_district` VALUES ('230202', '龙沙区', '3', '230200');
INSERT INTO `dok_district` VALUES ('230203', '建华区', '3', '230200');
INSERT INTO `dok_district` VALUES ('230204', '铁锋区', '3', '230200');
INSERT INTO `dok_district` VALUES ('230205', '昂昂溪区', '3', '230200');
INSERT INTO `dok_district` VALUES ('230206', '富拉尔基区', '3', '230200');
INSERT INTO `dok_district` VALUES ('230207', '碾子山区', '3', '230200');
INSERT INTO `dok_district` VALUES ('230208', '梅里斯达斡尔族区', '3', '230200');
INSERT INTO `dok_district` VALUES ('230221', '龙江县', '3', '230200');
INSERT INTO `dok_district` VALUES ('230223', '依安县', '3', '230200');
INSERT INTO `dok_district` VALUES ('230224', '泰来县', '3', '230200');
INSERT INTO `dok_district` VALUES ('230225', '甘南县', '3', '230200');
INSERT INTO `dok_district` VALUES ('230227', '富裕县', '3', '230200');
INSERT INTO `dok_district` VALUES ('230229', '克山县', '3', '230200');
INSERT INTO `dok_district` VALUES ('230230', '克东县', '3', '230200');
INSERT INTO `dok_district` VALUES ('230231', '拜泉县', '3', '230200');
INSERT INTO `dok_district` VALUES ('230281', '讷河市', '3', '230200');
INSERT INTO `dok_district` VALUES ('230301', '市辖区', '3', '230300');
INSERT INTO `dok_district` VALUES ('230302', '鸡冠区', '3', '230300');
INSERT INTO `dok_district` VALUES ('230303', '恒山区', '3', '230300');
INSERT INTO `dok_district` VALUES ('230304', '滴道区', '3', '230300');
INSERT INTO `dok_district` VALUES ('230305', '梨树区', '3', '230300');
INSERT INTO `dok_district` VALUES ('230306', '城子河区', '3', '230300');
INSERT INTO `dok_district` VALUES ('230307', '麻山区', '3', '230300');
INSERT INTO `dok_district` VALUES ('230321', '鸡东县', '3', '230300');
INSERT INTO `dok_district` VALUES ('230381', '虎林市', '3', '230300');
INSERT INTO `dok_district` VALUES ('230382', '密山市', '3', '230300');
INSERT INTO `dok_district` VALUES ('230401', '市辖区', '3', '230400');
INSERT INTO `dok_district` VALUES ('230402', '向阳区', '3', '230400');
INSERT INTO `dok_district` VALUES ('230403', '工农区', '3', '230400');
INSERT INTO `dok_district` VALUES ('230404', '南山区', '3', '230400');
INSERT INTO `dok_district` VALUES ('230405', '兴安区', '3', '230400');
INSERT INTO `dok_district` VALUES ('230406', '东山区', '3', '230400');
INSERT INTO `dok_district` VALUES ('230407', '兴山区', '3', '230400');
INSERT INTO `dok_district` VALUES ('230421', '萝北县', '3', '230400');
INSERT INTO `dok_district` VALUES ('230422', '绥滨县', '3', '230400');
INSERT INTO `dok_district` VALUES ('230501', '市辖区', '3', '230500');
INSERT INTO `dok_district` VALUES ('230502', '尖山区', '3', '230500');
INSERT INTO `dok_district` VALUES ('230503', '岭东区', '3', '230500');
INSERT INTO `dok_district` VALUES ('230505', '四方台区', '3', '230500');
INSERT INTO `dok_district` VALUES ('230506', '宝山区', '3', '230500');
INSERT INTO `dok_district` VALUES ('230521', '集贤县', '3', '230500');
INSERT INTO `dok_district` VALUES ('230522', '友谊县', '3', '230500');
INSERT INTO `dok_district` VALUES ('230523', '宝清县', '3', '230500');
INSERT INTO `dok_district` VALUES ('230524', '饶河县', '3', '230500');
INSERT INTO `dok_district` VALUES ('230601', '市辖区', '3', '230600');
INSERT INTO `dok_district` VALUES ('230602', '萨尔图区', '3', '230600');
INSERT INTO `dok_district` VALUES ('230603', '龙凤区', '3', '230600');
INSERT INTO `dok_district` VALUES ('230604', '让胡路区', '3', '230600');
INSERT INTO `dok_district` VALUES ('230605', '红岗区', '3', '230600');
INSERT INTO `dok_district` VALUES ('230606', '大同区', '3', '230600');
INSERT INTO `dok_district` VALUES ('230621', '肇州县', '3', '230600');
INSERT INTO `dok_district` VALUES ('230622', '肇源县', '3', '230600');
INSERT INTO `dok_district` VALUES ('230623', '林甸县', '3', '230600');
INSERT INTO `dok_district` VALUES ('230624', '杜尔伯特蒙古族自治县', '3', '230600');
INSERT INTO `dok_district` VALUES ('230701', '市辖区', '3', '230700');
INSERT INTO `dok_district` VALUES ('230702', '伊春区', '3', '230700');
INSERT INTO `dok_district` VALUES ('230703', '南岔区', '3', '230700');
INSERT INTO `dok_district` VALUES ('230704', '友好区', '3', '230700');
INSERT INTO `dok_district` VALUES ('230705', '西林区', '3', '230700');
INSERT INTO `dok_district` VALUES ('230706', '翠峦区', '3', '230700');
INSERT INTO `dok_district` VALUES ('230707', '新青区', '3', '230700');
INSERT INTO `dok_district` VALUES ('230708', '美溪区', '3', '230700');
INSERT INTO `dok_district` VALUES ('230709', '金山屯区', '3', '230700');
INSERT INTO `dok_district` VALUES ('230710', '五营区', '3', '230700');
INSERT INTO `dok_district` VALUES ('230711', '乌马河区', '3', '230700');
INSERT INTO `dok_district` VALUES ('230712', '汤旺河区', '3', '230700');
INSERT INTO `dok_district` VALUES ('230713', '带岭区', '3', '230700');
INSERT INTO `dok_district` VALUES ('230714', '乌伊岭区', '3', '230700');
INSERT INTO `dok_district` VALUES ('230715', '红星区', '3', '230700');
INSERT INTO `dok_district` VALUES ('230716', '上甘岭区', '3', '230700');
INSERT INTO `dok_district` VALUES ('230722', '嘉荫县', '3', '230700');
INSERT INTO `dok_district` VALUES ('230781', '铁力市', '3', '230700');
INSERT INTO `dok_district` VALUES ('230801', '市辖区', '3', '230800');
INSERT INTO `dok_district` VALUES ('230802', '永红区', '3', '230800');
INSERT INTO `dok_district` VALUES ('230803', '向阳区', '3', '230800');
INSERT INTO `dok_district` VALUES ('230804', '前进区', '3', '230800');
INSERT INTO `dok_district` VALUES ('230805', '东风区', '3', '230800');
INSERT INTO `dok_district` VALUES ('230811', '郊　区', '3', '230800');
INSERT INTO `dok_district` VALUES ('230822', '桦南县', '3', '230800');
INSERT INTO `dok_district` VALUES ('230826', '桦川县', '3', '230800');
INSERT INTO `dok_district` VALUES ('230828', '汤原县', '3', '230800');
INSERT INTO `dok_district` VALUES ('230833', '抚远县', '3', '230800');
INSERT INTO `dok_district` VALUES ('230881', '同江市', '3', '230800');
INSERT INTO `dok_district` VALUES ('230882', '富锦市', '3', '230800');
INSERT INTO `dok_district` VALUES ('230901', '市辖区', '3', '230900');
INSERT INTO `dok_district` VALUES ('230902', '新兴区', '3', '230900');
INSERT INTO `dok_district` VALUES ('230903', '桃山区', '3', '230900');
INSERT INTO `dok_district` VALUES ('230904', '茄子河区', '3', '230900');
INSERT INTO `dok_district` VALUES ('230921', '勃利县', '3', '230900');
INSERT INTO `dok_district` VALUES ('231001', '市辖区', '3', '231000');
INSERT INTO `dok_district` VALUES ('231002', '东安区', '3', '231000');
INSERT INTO `dok_district` VALUES ('231003', '阳明区', '3', '231000');
INSERT INTO `dok_district` VALUES ('231004', '爱民区', '3', '231000');
INSERT INTO `dok_district` VALUES ('231005', '西安区', '3', '231000');
INSERT INTO `dok_district` VALUES ('231024', '东宁县', '3', '231000');
INSERT INTO `dok_district` VALUES ('231025', '林口县', '3', '231000');
INSERT INTO `dok_district` VALUES ('231081', '绥芬河市', '3', '231000');
INSERT INTO `dok_district` VALUES ('231083', '海林市', '3', '231000');
INSERT INTO `dok_district` VALUES ('231084', '宁安市', '3', '231000');
INSERT INTO `dok_district` VALUES ('231085', '穆棱市', '3', '231000');
INSERT INTO `dok_district` VALUES ('231101', '市辖区', '3', '231100');
INSERT INTO `dok_district` VALUES ('231102', '爱辉区', '3', '231100');
INSERT INTO `dok_district` VALUES ('231121', '嫩江县', '3', '231100');
INSERT INTO `dok_district` VALUES ('231123', '逊克县', '3', '231100');
INSERT INTO `dok_district` VALUES ('231124', '孙吴县', '3', '231100');
INSERT INTO `dok_district` VALUES ('231181', '北安市', '3', '231100');
INSERT INTO `dok_district` VALUES ('231182', '五大连池市', '3', '231100');
INSERT INTO `dok_district` VALUES ('231201', '市辖区', '3', '231200');
INSERT INTO `dok_district` VALUES ('231202', '北林区', '3', '231200');
INSERT INTO `dok_district` VALUES ('231221', '望奎县', '3', '231200');
INSERT INTO `dok_district` VALUES ('231222', '兰西县', '3', '231200');
INSERT INTO `dok_district` VALUES ('231223', '青冈县', '3', '231200');
INSERT INTO `dok_district` VALUES ('231224', '庆安县', '3', '231200');
INSERT INTO `dok_district` VALUES ('231225', '明水县', '3', '231200');
INSERT INTO `dok_district` VALUES ('231226', '绥棱县', '3', '231200');
INSERT INTO `dok_district` VALUES ('231281', '安达市', '3', '231200');
INSERT INTO `dok_district` VALUES ('231282', '肇东市', '3', '231200');
INSERT INTO `dok_district` VALUES ('231283', '海伦市', '3', '231200');
INSERT INTO `dok_district` VALUES ('232721', '呼玛县', '3', '232700');
INSERT INTO `dok_district` VALUES ('232722', '塔河县', '3', '232700');
INSERT INTO `dok_district` VALUES ('232723', '漠河县', '3', '232700');
INSERT INTO `dok_district` VALUES ('310101', '黄浦区', '3', '310100');
INSERT INTO `dok_district` VALUES ('310103', '卢湾区', '3', '310100');
INSERT INTO `dok_district` VALUES ('310104', '徐汇区', '3', '310100');
INSERT INTO `dok_district` VALUES ('310105', '长宁区', '3', '310100');
INSERT INTO `dok_district` VALUES ('310106', '静安区', '3', '310100');
INSERT INTO `dok_district` VALUES ('310107', '普陀区', '3', '310100');
INSERT INTO `dok_district` VALUES ('310108', '闸北区', '3', '310100');
INSERT INTO `dok_district` VALUES ('310109', '虹口区', '3', '310100');
INSERT INTO `dok_district` VALUES ('310110', '杨浦区', '3', '310100');
INSERT INTO `dok_district` VALUES ('310112', '闵行区', '3', '310100');
INSERT INTO `dok_district` VALUES ('310113', '宝山区', '3', '310100');
INSERT INTO `dok_district` VALUES ('310114', '嘉定区', '3', '310100');
INSERT INTO `dok_district` VALUES ('310115', '浦东新区', '3', '310100');
INSERT INTO `dok_district` VALUES ('310116', '金山区', '3', '310100');
INSERT INTO `dok_district` VALUES ('310117', '松江区', '3', '310100');
INSERT INTO `dok_district` VALUES ('310118', '青浦区', '3', '310100');
INSERT INTO `dok_district` VALUES ('310119', '南汇区', '3', '310100');
INSERT INTO `dok_district` VALUES ('310120', '奉贤区', '3', '310100');
INSERT INTO `dok_district` VALUES ('310230', '崇明县', '3', '310200');
INSERT INTO `dok_district` VALUES ('320101', '市辖区', '3', '320100');
INSERT INTO `dok_district` VALUES ('320102', '玄武区', '3', '320100');
INSERT INTO `dok_district` VALUES ('320103', '白下区', '3', '320100');
INSERT INTO `dok_district` VALUES ('320104', '秦淮区', '3', '320100');
INSERT INTO `dok_district` VALUES ('320105', '建邺区', '3', '320100');
INSERT INTO `dok_district` VALUES ('320106', '鼓楼区', '3', '320100');
INSERT INTO `dok_district` VALUES ('320107', '下关区', '3', '320100');
INSERT INTO `dok_district` VALUES ('320111', '浦口区', '3', '320100');
INSERT INTO `dok_district` VALUES ('320113', '栖霞区', '3', '320100');
INSERT INTO `dok_district` VALUES ('320114', '雨花台区', '3', '320100');
INSERT INTO `dok_district` VALUES ('320115', '江宁区', '3', '320100');
INSERT INTO `dok_district` VALUES ('320116', '六合区', '3', '320100');
INSERT INTO `dok_district` VALUES ('320124', '溧水县', '3', '320100');
INSERT INTO `dok_district` VALUES ('320125', '高淳县', '3', '320100');
INSERT INTO `dok_district` VALUES ('320201', '市辖区', '3', '320200');
INSERT INTO `dok_district` VALUES ('320202', '崇安区', '3', '320200');
INSERT INTO `dok_district` VALUES ('320203', '南长区', '3', '320200');
INSERT INTO `dok_district` VALUES ('320204', '北塘区', '3', '320200');
INSERT INTO `dok_district` VALUES ('320205', '锡山区', '3', '320200');
INSERT INTO `dok_district` VALUES ('320206', '惠山区', '3', '320200');
INSERT INTO `dok_district` VALUES ('320211', '滨湖区', '3', '320200');
INSERT INTO `dok_district` VALUES ('320281', '江阴市', '3', '320200');
INSERT INTO `dok_district` VALUES ('320282', '宜兴市', '3', '320200');
INSERT INTO `dok_district` VALUES ('320301', '市辖区', '3', '320300');
INSERT INTO `dok_district` VALUES ('320302', '鼓楼区', '3', '320300');
INSERT INTO `dok_district` VALUES ('320303', '云龙区', '3', '320300');
INSERT INTO `dok_district` VALUES ('320304', '九里区', '3', '320300');
INSERT INTO `dok_district` VALUES ('320305', '贾汪区', '3', '320300');
INSERT INTO `dok_district` VALUES ('320311', '泉山区', '3', '320300');
INSERT INTO `dok_district` VALUES ('320321', '丰　县', '3', '320300');
INSERT INTO `dok_district` VALUES ('320322', '沛　县', '3', '320300');
INSERT INTO `dok_district` VALUES ('320323', '铜山县', '3', '320300');
INSERT INTO `dok_district` VALUES ('320324', '睢宁县', '3', '320300');
INSERT INTO `dok_district` VALUES ('320381', '新沂市', '3', '320300');
INSERT INTO `dok_district` VALUES ('320382', '邳州市', '3', '320300');
INSERT INTO `dok_district` VALUES ('320401', '市辖区', '3', '320400');
INSERT INTO `dok_district` VALUES ('320402', '天宁区', '3', '320400');
INSERT INTO `dok_district` VALUES ('320404', '钟楼区', '3', '320400');
INSERT INTO `dok_district` VALUES ('320405', '戚墅堰区', '3', '320400');
INSERT INTO `dok_district` VALUES ('320411', '新北区', '3', '320400');
INSERT INTO `dok_district` VALUES ('320412', '武进区', '3', '320400');
INSERT INTO `dok_district` VALUES ('320481', '溧阳市', '3', '320400');
INSERT INTO `dok_district` VALUES ('320482', '金坛市', '3', '320400');
INSERT INTO `dok_district` VALUES ('320501', '市辖区', '3', '320500');
INSERT INTO `dok_district` VALUES ('320502', '沧浪区', '3', '320500');
INSERT INTO `dok_district` VALUES ('320503', '平江区', '3', '320500');
INSERT INTO `dok_district` VALUES ('320504', '金阊区', '3', '320500');
INSERT INTO `dok_district` VALUES ('320505', '虎丘区', '3', '320500');
INSERT INTO `dok_district` VALUES ('320506', '吴中区', '3', '320500');
INSERT INTO `dok_district` VALUES ('320507', '相城区', '3', '320500');
INSERT INTO `dok_district` VALUES ('320581', '常熟市', '3', '320500');
INSERT INTO `dok_district` VALUES ('320582', '张家港市', '3', '320500');
INSERT INTO `dok_district` VALUES ('320583', '昆山市', '3', '320500');
INSERT INTO `dok_district` VALUES ('320584', '吴江市', '3', '320500');
INSERT INTO `dok_district` VALUES ('320585', '太仓市', '3', '320500');
INSERT INTO `dok_district` VALUES ('320601', '市辖区', '3', '320600');
INSERT INTO `dok_district` VALUES ('320602', '崇川区', '3', '320600');
INSERT INTO `dok_district` VALUES ('320611', '港闸区', '3', '320600');
INSERT INTO `dok_district` VALUES ('320621', '海安县', '3', '320600');
INSERT INTO `dok_district` VALUES ('320623', '如东县', '3', '320600');
INSERT INTO `dok_district` VALUES ('320681', '启东市', '3', '320600');
INSERT INTO `dok_district` VALUES ('320682', '如皋市', '3', '320600');
INSERT INTO `dok_district` VALUES ('320683', '通州市', '3', '320600');
INSERT INTO `dok_district` VALUES ('320684', '海门市', '3', '320600');
INSERT INTO `dok_district` VALUES ('320701', '市辖区', '3', '320700');
INSERT INTO `dok_district` VALUES ('320703', '连云区', '3', '320700');
INSERT INTO `dok_district` VALUES ('320705', '新浦区', '3', '320700');
INSERT INTO `dok_district` VALUES ('320706', '海州区', '3', '320700');
INSERT INTO `dok_district` VALUES ('320721', '赣榆县', '3', '320700');
INSERT INTO `dok_district` VALUES ('320722', '东海县', '3', '320700');
INSERT INTO `dok_district` VALUES ('320723', '灌云县', '3', '320700');
INSERT INTO `dok_district` VALUES ('320724', '灌南县', '3', '320700');
INSERT INTO `dok_district` VALUES ('320801', '市辖区', '3', '320800');
INSERT INTO `dok_district` VALUES ('320802', '清河区', '3', '320800');
INSERT INTO `dok_district` VALUES ('320803', '楚州区', '3', '320800');
INSERT INTO `dok_district` VALUES ('320804', '淮阴区', '3', '320800');
INSERT INTO `dok_district` VALUES ('320811', '清浦区', '3', '320800');
INSERT INTO `dok_district` VALUES ('320826', '涟水县', '3', '320800');
INSERT INTO `dok_district` VALUES ('320829', '洪泽县', '3', '320800');
INSERT INTO `dok_district` VALUES ('320830', '盱眙县', '3', '320800');
INSERT INTO `dok_district` VALUES ('320831', '金湖县', '3', '320800');
INSERT INTO `dok_district` VALUES ('320901', '市辖区', '3', '320900');
INSERT INTO `dok_district` VALUES ('320902', '亭湖区', '3', '320900');
INSERT INTO `dok_district` VALUES ('320903', '盐都区', '3', '320900');
INSERT INTO `dok_district` VALUES ('320921', '响水县', '3', '320900');
INSERT INTO `dok_district` VALUES ('320922', '滨海县', '3', '320900');
INSERT INTO `dok_district` VALUES ('320923', '阜宁县', '3', '320900');
INSERT INTO `dok_district` VALUES ('320924', '射阳县', '3', '320900');
INSERT INTO `dok_district` VALUES ('320925', '建湖县', '3', '320900');
INSERT INTO `dok_district` VALUES ('320981', '东台市', '3', '320900');
INSERT INTO `dok_district` VALUES ('320982', '大丰市', '3', '320900');
INSERT INTO `dok_district` VALUES ('321001', '市辖区', '3', '321000');
INSERT INTO `dok_district` VALUES ('321002', '广陵区', '3', '321000');
INSERT INTO `dok_district` VALUES ('321003', '邗江区', '3', '321000');
INSERT INTO `dok_district` VALUES ('321011', '郊　区', '3', '321000');
INSERT INTO `dok_district` VALUES ('321023', '宝应县', '3', '321000');
INSERT INTO `dok_district` VALUES ('321081', '仪征市', '3', '321000');
INSERT INTO `dok_district` VALUES ('321084', '高邮市', '3', '321000');
INSERT INTO `dok_district` VALUES ('321088', '江都市', '3', '321000');
INSERT INTO `dok_district` VALUES ('321101', '市辖区', '3', '321100');
INSERT INTO `dok_district` VALUES ('321102', '京口区', '3', '321100');
INSERT INTO `dok_district` VALUES ('321111', '润州区', '3', '321100');
INSERT INTO `dok_district` VALUES ('321112', '丹徒区', '3', '321100');
INSERT INTO `dok_district` VALUES ('321181', '丹阳市', '3', '321100');
INSERT INTO `dok_district` VALUES ('321182', '扬中市', '3', '321100');
INSERT INTO `dok_district` VALUES ('321183', '句容市', '3', '321100');
INSERT INTO `dok_district` VALUES ('321201', '市辖区', '3', '321200');
INSERT INTO `dok_district` VALUES ('321202', '海陵区', '3', '321200');
INSERT INTO `dok_district` VALUES ('321203', '高港区', '3', '321200');
INSERT INTO `dok_district` VALUES ('321281', '兴化市', '3', '321200');
INSERT INTO `dok_district` VALUES ('321282', '靖江市', '3', '321200');
INSERT INTO `dok_district` VALUES ('321283', '泰兴市', '3', '321200');
INSERT INTO `dok_district` VALUES ('321284', '姜堰市', '3', '321200');
INSERT INTO `dok_district` VALUES ('321301', '市辖区', '3', '321300');
INSERT INTO `dok_district` VALUES ('321302', '宿城区', '3', '321300');
INSERT INTO `dok_district` VALUES ('321311', '宿豫区', '3', '321300');
INSERT INTO `dok_district` VALUES ('321322', '沭阳县', '3', '321300');
INSERT INTO `dok_district` VALUES ('321323', '泗阳县', '3', '321300');
INSERT INTO `dok_district` VALUES ('321324', '泗洪县', '3', '321300');
INSERT INTO `dok_district` VALUES ('330101', '市辖区', '3', '330100');
INSERT INTO `dok_district` VALUES ('330102', '上城区', '3', '330100');
INSERT INTO `dok_district` VALUES ('330103', '下城区', '3', '330100');
INSERT INTO `dok_district` VALUES ('330104', '江干区', '3', '330100');
INSERT INTO `dok_district` VALUES ('330105', '拱墅区', '3', '330100');
INSERT INTO `dok_district` VALUES ('330106', '西湖区', '3', '330100');
INSERT INTO `dok_district` VALUES ('330108', '滨江区', '3', '330100');
INSERT INTO `dok_district` VALUES ('330109', '萧山区', '3', '330100');
INSERT INTO `dok_district` VALUES ('330110', '余杭区', '3', '330100');
INSERT INTO `dok_district` VALUES ('330122', '桐庐县', '3', '330100');
INSERT INTO `dok_district` VALUES ('330127', '淳安县', '3', '330100');
INSERT INTO `dok_district` VALUES ('330182', '建德市', '3', '330100');
INSERT INTO `dok_district` VALUES ('330183', '富阳市', '3', '330100');
INSERT INTO `dok_district` VALUES ('330185', '临安市', '3', '330100');
INSERT INTO `dok_district` VALUES ('330201', '市辖区', '3', '330200');
INSERT INTO `dok_district` VALUES ('330203', '海曙区', '3', '330200');
INSERT INTO `dok_district` VALUES ('330204', '江东区', '3', '330200');
INSERT INTO `dok_district` VALUES ('330205', '江北区', '3', '330200');
INSERT INTO `dok_district` VALUES ('330206', '北仑区', '3', '330200');
INSERT INTO `dok_district` VALUES ('330211', '镇海区', '3', '330200');
INSERT INTO `dok_district` VALUES ('330212', '鄞州区', '3', '330200');
INSERT INTO `dok_district` VALUES ('330225', '象山县', '3', '330200');
INSERT INTO `dok_district` VALUES ('330226', '宁海县', '3', '330200');
INSERT INTO `dok_district` VALUES ('330281', '余姚市', '3', '330200');
INSERT INTO `dok_district` VALUES ('330282', '慈溪市', '3', '330200');
INSERT INTO `dok_district` VALUES ('330283', '奉化市', '3', '330200');
INSERT INTO `dok_district` VALUES ('330301', '市辖区', '3', '330300');
INSERT INTO `dok_district` VALUES ('330302', '鹿城区', '3', '330300');
INSERT INTO `dok_district` VALUES ('330303', '龙湾区', '3', '330300');
INSERT INTO `dok_district` VALUES ('330304', '瓯海区', '3', '330300');
INSERT INTO `dok_district` VALUES ('330322', '洞头县', '3', '330300');
INSERT INTO `dok_district` VALUES ('330324', '永嘉县', '3', '330300');
INSERT INTO `dok_district` VALUES ('330326', '平阳县', '3', '330300');
INSERT INTO `dok_district` VALUES ('330327', '苍南县', '3', '330300');
INSERT INTO `dok_district` VALUES ('330328', '文成县', '3', '330300');
INSERT INTO `dok_district` VALUES ('330329', '泰顺县', '3', '330300');
INSERT INTO `dok_district` VALUES ('330381', '瑞安市', '3', '330300');
INSERT INTO `dok_district` VALUES ('330382', '乐清市', '3', '330300');
INSERT INTO `dok_district` VALUES ('330401', '市辖区', '3', '330400');
INSERT INTO `dok_district` VALUES ('330402', '秀城区', '3', '330400');
INSERT INTO `dok_district` VALUES ('330411', '秀洲区', '3', '330400');
INSERT INTO `dok_district` VALUES ('330421', '嘉善县', '3', '330400');
INSERT INTO `dok_district` VALUES ('330424', '海盐县', '3', '330400');
INSERT INTO `dok_district` VALUES ('330481', '海宁市', '3', '330400');
INSERT INTO `dok_district` VALUES ('330482', '平湖市', '3', '330400');
INSERT INTO `dok_district` VALUES ('330483', '桐乡市', '3', '330400');
INSERT INTO `dok_district` VALUES ('330501', '市辖区', '3', '330500');
INSERT INTO `dok_district` VALUES ('330502', '吴兴区', '3', '330500');
INSERT INTO `dok_district` VALUES ('330503', '南浔区', '3', '330500');
INSERT INTO `dok_district` VALUES ('330521', '德清县', '3', '330500');
INSERT INTO `dok_district` VALUES ('330522', '长兴县', '3', '330500');
INSERT INTO `dok_district` VALUES ('330523', '安吉县', '3', '330500');
INSERT INTO `dok_district` VALUES ('330601', '市辖区', '3', '330600');
INSERT INTO `dok_district` VALUES ('330602', '越城区', '3', '330600');
INSERT INTO `dok_district` VALUES ('330621', '绍兴县', '3', '330600');
INSERT INTO `dok_district` VALUES ('330624', '新昌县', '3', '330600');
INSERT INTO `dok_district` VALUES ('330681', '诸暨市', '3', '330600');
INSERT INTO `dok_district` VALUES ('330682', '上虞市', '3', '330600');
INSERT INTO `dok_district` VALUES ('330683', '嵊州市', '3', '330600');
INSERT INTO `dok_district` VALUES ('330701', '市辖区', '3', '330700');
INSERT INTO `dok_district` VALUES ('330702', '婺城区', '3', '330700');
INSERT INTO `dok_district` VALUES ('330703', '金东区', '3', '330700');
INSERT INTO `dok_district` VALUES ('330723', '武义县', '3', '330700');
INSERT INTO `dok_district` VALUES ('330726', '浦江县', '3', '330700');
INSERT INTO `dok_district` VALUES ('330727', '磐安县', '3', '330700');
INSERT INTO `dok_district` VALUES ('330781', '兰溪市', '3', '330700');
INSERT INTO `dok_district` VALUES ('330782', '义乌市', '3', '330700');
INSERT INTO `dok_district` VALUES ('330783', '东阳市', '3', '330700');
INSERT INTO `dok_district` VALUES ('330784', '永康市', '3', '330700');
INSERT INTO `dok_district` VALUES ('330801', '市辖区', '3', '330800');
INSERT INTO `dok_district` VALUES ('330802', '柯城区', '3', '330800');
INSERT INTO `dok_district` VALUES ('330803', '衢江区', '3', '330800');
INSERT INTO `dok_district` VALUES ('330822', '常山县', '3', '330800');
INSERT INTO `dok_district` VALUES ('330824', '开化县', '3', '330800');
INSERT INTO `dok_district` VALUES ('330825', '龙游县', '3', '330800');
INSERT INTO `dok_district` VALUES ('330881', '江山市', '3', '330800');
INSERT INTO `dok_district` VALUES ('330901', '市辖区', '3', '330900');
INSERT INTO `dok_district` VALUES ('330902', '定海区', '3', '330900');
INSERT INTO `dok_district` VALUES ('330903', '普陀区', '3', '330900');
INSERT INTO `dok_district` VALUES ('330921', '岱山县', '3', '330900');
INSERT INTO `dok_district` VALUES ('330922', '嵊泗县', '3', '330900');
INSERT INTO `dok_district` VALUES ('331001', '市辖区', '3', '331000');
INSERT INTO `dok_district` VALUES ('331002', '椒江区', '3', '331000');
INSERT INTO `dok_district` VALUES ('331003', '黄岩区', '3', '331000');
INSERT INTO `dok_district` VALUES ('331004', '路桥区', '3', '331000');
INSERT INTO `dok_district` VALUES ('331021', '玉环县', '3', '331000');
INSERT INTO `dok_district` VALUES ('331022', '三门县', '3', '331000');
INSERT INTO `dok_district` VALUES ('331023', '天台县', '3', '331000');
INSERT INTO `dok_district` VALUES ('331024', '仙居县', '3', '331000');
INSERT INTO `dok_district` VALUES ('331081', '温岭市', '3', '331000');
INSERT INTO `dok_district` VALUES ('331082', '临海市', '3', '331000');
INSERT INTO `dok_district` VALUES ('331101', '市辖区', '3', '331100');
INSERT INTO `dok_district` VALUES ('331102', '莲都区', '3', '331100');
INSERT INTO `dok_district` VALUES ('331121', '青田县', '3', '331100');
INSERT INTO `dok_district` VALUES ('331122', '缙云县', '3', '331100');
INSERT INTO `dok_district` VALUES ('331123', '遂昌县', '3', '331100');
INSERT INTO `dok_district` VALUES ('331124', '松阳县', '3', '331100');
INSERT INTO `dok_district` VALUES ('331125', '云和县', '3', '331100');
INSERT INTO `dok_district` VALUES ('331126', '庆元县', '3', '331100');
INSERT INTO `dok_district` VALUES ('331127', '景宁畲族自治县', '3', '331100');
INSERT INTO `dok_district` VALUES ('331181', '龙泉市', '3', '331100');
INSERT INTO `dok_district` VALUES ('340101', '市辖区', '3', '340100');
INSERT INTO `dok_district` VALUES ('340102', '瑶海区', '3', '340100');
INSERT INTO `dok_district` VALUES ('340103', '庐阳区', '3', '340100');
INSERT INTO `dok_district` VALUES ('340104', '蜀山区', '3', '340100');
INSERT INTO `dok_district` VALUES ('340111', '包河区', '3', '340100');
INSERT INTO `dok_district` VALUES ('340121', '长丰县', '3', '340100');
INSERT INTO `dok_district` VALUES ('340122', '肥东县', '3', '340100');
INSERT INTO `dok_district` VALUES ('340123', '肥西县', '3', '340100');
INSERT INTO `dok_district` VALUES ('340201', '市辖区', '3', '340200');
INSERT INTO `dok_district` VALUES ('340202', '镜湖区', '3', '340200');
INSERT INTO `dok_district` VALUES ('340203', '马塘区', '3', '340200');
INSERT INTO `dok_district` VALUES ('340204', '新芜区', '3', '340200');
INSERT INTO `dok_district` VALUES ('340207', '鸠江区', '3', '340200');
INSERT INTO `dok_district` VALUES ('340221', '芜湖县', '3', '340200');
INSERT INTO `dok_district` VALUES ('340222', '繁昌县', '3', '340200');
INSERT INTO `dok_district` VALUES ('340223', '南陵县', '3', '340200');
INSERT INTO `dok_district` VALUES ('340301', '市辖区', '3', '340300');
INSERT INTO `dok_district` VALUES ('340302', '龙子湖区', '3', '340300');
INSERT INTO `dok_district` VALUES ('340303', '蚌山区', '3', '340300');
INSERT INTO `dok_district` VALUES ('340304', '禹会区', '3', '340300');
INSERT INTO `dok_district` VALUES ('340311', '淮上区', '3', '340300');
INSERT INTO `dok_district` VALUES ('340321', '怀远县', '3', '340300');
INSERT INTO `dok_district` VALUES ('340322', '五河县', '3', '340300');
INSERT INTO `dok_district` VALUES ('340323', '固镇县', '3', '340300');
INSERT INTO `dok_district` VALUES ('340401', '市辖区', '3', '340400');
INSERT INTO `dok_district` VALUES ('340402', '大通区', '3', '340400');
INSERT INTO `dok_district` VALUES ('340403', '田家庵区', '3', '340400');
INSERT INTO `dok_district` VALUES ('340404', '谢家集区', '3', '340400');
INSERT INTO `dok_district` VALUES ('340405', '八公山区', '3', '340400');
INSERT INTO `dok_district` VALUES ('340406', '潘集区', '3', '340400');
INSERT INTO `dok_district` VALUES ('340421', '凤台县', '3', '340400');
INSERT INTO `dok_district` VALUES ('340501', '市辖区', '3', '340500');
INSERT INTO `dok_district` VALUES ('340502', '金家庄区', '3', '340500');
INSERT INTO `dok_district` VALUES ('340503', '花山区', '3', '340500');
INSERT INTO `dok_district` VALUES ('340504', '雨山区', '3', '340500');
INSERT INTO `dok_district` VALUES ('340521', '当涂县', '3', '340500');
INSERT INTO `dok_district` VALUES ('340601', '市辖区', '3', '340600');
INSERT INTO `dok_district` VALUES ('340602', '杜集区', '3', '340600');
INSERT INTO `dok_district` VALUES ('340603', '相山区', '3', '340600');
INSERT INTO `dok_district` VALUES ('340604', '烈山区', '3', '340600');
INSERT INTO `dok_district` VALUES ('340621', '濉溪县', '3', '340600');
INSERT INTO `dok_district` VALUES ('340701', '市辖区', '3', '340700');
INSERT INTO `dok_district` VALUES ('340702', '铜官山区', '3', '340700');
INSERT INTO `dok_district` VALUES ('340703', '狮子山区', '3', '340700');
INSERT INTO `dok_district` VALUES ('340711', '郊　区', '3', '340700');
INSERT INTO `dok_district` VALUES ('340721', '铜陵县', '3', '340700');
INSERT INTO `dok_district` VALUES ('340801', '市辖区', '3', '340800');
INSERT INTO `dok_district` VALUES ('340802', '迎江区', '3', '340800');
INSERT INTO `dok_district` VALUES ('340803', '大观区', '3', '340800');
INSERT INTO `dok_district` VALUES ('340811', '郊　区', '3', '340800');
INSERT INTO `dok_district` VALUES ('340822', '怀宁县', '3', '340800');
INSERT INTO `dok_district` VALUES ('340823', '枞阳县', '3', '340800');
INSERT INTO `dok_district` VALUES ('340824', '潜山县', '3', '340800');
INSERT INTO `dok_district` VALUES ('340825', '太湖县', '3', '340800');
INSERT INTO `dok_district` VALUES ('340826', '宿松县', '3', '340800');
INSERT INTO `dok_district` VALUES ('340827', '望江县', '3', '340800');
INSERT INTO `dok_district` VALUES ('340828', '岳西县', '3', '340800');
INSERT INTO `dok_district` VALUES ('340881', '桐城市', '3', '340800');
INSERT INTO `dok_district` VALUES ('341001', '市辖区', '3', '341000');
INSERT INTO `dok_district` VALUES ('341002', '屯溪区', '3', '341000');
INSERT INTO `dok_district` VALUES ('341003', '黄山区', '3', '341000');
INSERT INTO `dok_district` VALUES ('341004', '徽州区', '3', '341000');
INSERT INTO `dok_district` VALUES ('341021', '歙　县', '3', '341000');
INSERT INTO `dok_district` VALUES ('341022', '休宁县', '3', '341000');
INSERT INTO `dok_district` VALUES ('341023', '黟　县', '3', '341000');
INSERT INTO `dok_district` VALUES ('341024', '祁门县', '3', '341000');
INSERT INTO `dok_district` VALUES ('341101', '市辖区', '3', '341100');
INSERT INTO `dok_district` VALUES ('341102', '琅琊区', '3', '341100');
INSERT INTO `dok_district` VALUES ('341103', '南谯区', '3', '341100');
INSERT INTO `dok_district` VALUES ('341122', '来安县', '3', '341100');
INSERT INTO `dok_district` VALUES ('341124', '全椒县', '3', '341100');
INSERT INTO `dok_district` VALUES ('341125', '定远县', '3', '341100');
INSERT INTO `dok_district` VALUES ('341126', '凤阳县', '3', '341100');
INSERT INTO `dok_district` VALUES ('341181', '天长市', '3', '341100');
INSERT INTO `dok_district` VALUES ('341182', '明光市', '3', '341100');
INSERT INTO `dok_district` VALUES ('341201', '市辖区', '3', '341200');
INSERT INTO `dok_district` VALUES ('341202', '颍州区', '3', '341200');
INSERT INTO `dok_district` VALUES ('341203', '颍东区', '3', '341200');
INSERT INTO `dok_district` VALUES ('341204', '颍泉区', '3', '341200');
INSERT INTO `dok_district` VALUES ('341221', '临泉县', '3', '341200');
INSERT INTO `dok_district` VALUES ('341222', '太和县', '3', '341200');
INSERT INTO `dok_district` VALUES ('341225', '阜南县', '3', '341200');
INSERT INTO `dok_district` VALUES ('341226', '颍上县', '3', '341200');
INSERT INTO `dok_district` VALUES ('341282', '界首市', '3', '341200');
INSERT INTO `dok_district` VALUES ('341301', '市辖区', '3', '341300');
INSERT INTO `dok_district` VALUES ('341302', '墉桥区', '3', '341300');
INSERT INTO `dok_district` VALUES ('341321', '砀山县', '3', '341300');
INSERT INTO `dok_district` VALUES ('341322', '萧　县', '3', '341300');
INSERT INTO `dok_district` VALUES ('341323', '灵璧县', '3', '341300');
INSERT INTO `dok_district` VALUES ('341324', '泗　县', '3', '341300');
INSERT INTO `dok_district` VALUES ('341401', '庐江县', '3', '340100');
INSERT INTO `dok_district` VALUES ('341402', '巢湖市', '3', '340100');
INSERT INTO `dok_district` VALUES ('341422', '无为县', '3', '340200');
INSERT INTO `dok_district` VALUES ('341423', '含山县', '3', '340500');
INSERT INTO `dok_district` VALUES ('341424', '和　县', '3', '340500');
INSERT INTO `dok_district` VALUES ('341501', '市辖区', '3', '341500');
INSERT INTO `dok_district` VALUES ('341502', '金安区', '3', '341500');
INSERT INTO `dok_district` VALUES ('341503', '裕安区', '3', '341500');
INSERT INTO `dok_district` VALUES ('341521', '寿　县', '3', '341500');
INSERT INTO `dok_district` VALUES ('341522', '霍邱县', '3', '341500');
INSERT INTO `dok_district` VALUES ('341523', '舒城县', '3', '341500');
INSERT INTO `dok_district` VALUES ('341524', '金寨县', '3', '341500');
INSERT INTO `dok_district` VALUES ('341525', '霍山县', '3', '341500');
INSERT INTO `dok_district` VALUES ('341601', '市辖区', '3', '341600');
INSERT INTO `dok_district` VALUES ('341602', '谯城区', '3', '341600');
INSERT INTO `dok_district` VALUES ('341621', '涡阳县', '3', '341600');
INSERT INTO `dok_district` VALUES ('341622', '蒙城县', '3', '341600');
INSERT INTO `dok_district` VALUES ('341623', '利辛县', '3', '341600');
INSERT INTO `dok_district` VALUES ('341701', '市辖区', '3', '341700');
INSERT INTO `dok_district` VALUES ('341702', '贵池区', '3', '341700');
INSERT INTO `dok_district` VALUES ('341721', '东至县', '3', '341700');
INSERT INTO `dok_district` VALUES ('341722', '石台县', '3', '341700');
INSERT INTO `dok_district` VALUES ('341723', '青阳县', '3', '341700');
INSERT INTO `dok_district` VALUES ('341801', '市辖区', '3', '341800');
INSERT INTO `dok_district` VALUES ('341802', '宣州区', '3', '341800');
INSERT INTO `dok_district` VALUES ('341821', '郎溪县', '3', '341800');
INSERT INTO `dok_district` VALUES ('341822', '广德县', '3', '341800');
INSERT INTO `dok_district` VALUES ('341823', '泾　县', '3', '341800');
INSERT INTO `dok_district` VALUES ('341824', '绩溪县', '3', '341800');
INSERT INTO `dok_district` VALUES ('341825', '旌德县', '3', '341800');
INSERT INTO `dok_district` VALUES ('341881', '宁国市', '3', '341800');
INSERT INTO `dok_district` VALUES ('350101', '市辖区', '3', '350100');
INSERT INTO `dok_district` VALUES ('350102', '鼓楼区', '3', '350100');
INSERT INTO `dok_district` VALUES ('350103', '台江区', '3', '350100');
INSERT INTO `dok_district` VALUES ('350104', '仓山区', '3', '350100');
INSERT INTO `dok_district` VALUES ('350105', '马尾区', '3', '350100');
INSERT INTO `dok_district` VALUES ('350111', '晋安区', '3', '350100');
INSERT INTO `dok_district` VALUES ('350121', '闽侯县', '3', '350100');
INSERT INTO `dok_district` VALUES ('350122', '连江县', '3', '350100');
INSERT INTO `dok_district` VALUES ('350123', '罗源县', '3', '350100');
INSERT INTO `dok_district` VALUES ('350124', '闽清县', '3', '350100');
INSERT INTO `dok_district` VALUES ('350125', '永泰县', '3', '350100');
INSERT INTO `dok_district` VALUES ('350128', '平潭县', '3', '350100');
INSERT INTO `dok_district` VALUES ('350181', '福清市', '3', '350100');
INSERT INTO `dok_district` VALUES ('350182', '长乐市', '3', '350100');
INSERT INTO `dok_district` VALUES ('350201', '市辖区', '3', '350200');
INSERT INTO `dok_district` VALUES ('350203', '思明区', '3', '350200');
INSERT INTO `dok_district` VALUES ('350205', '海沧区', '3', '350200');
INSERT INTO `dok_district` VALUES ('350206', '湖里区', '3', '350200');
INSERT INTO `dok_district` VALUES ('350211', '集美区', '3', '350200');
INSERT INTO `dok_district` VALUES ('350212', '同安区', '3', '350200');
INSERT INTO `dok_district` VALUES ('350213', '翔安区', '3', '350200');
INSERT INTO `dok_district` VALUES ('350301', '市辖区', '3', '350300');
INSERT INTO `dok_district` VALUES ('350302', '城厢区', '3', '350300');
INSERT INTO `dok_district` VALUES ('350303', '涵江区', '3', '350300');
INSERT INTO `dok_district` VALUES ('350304', '荔城区', '3', '350300');
INSERT INTO `dok_district` VALUES ('350305', '秀屿区', '3', '350300');
INSERT INTO `dok_district` VALUES ('350322', '仙游县', '3', '350300');
INSERT INTO `dok_district` VALUES ('350401', '市辖区', '3', '350400');
INSERT INTO `dok_district` VALUES ('350402', '梅列区', '3', '350400');
INSERT INTO `dok_district` VALUES ('350403', '三元区', '3', '350400');
INSERT INTO `dok_district` VALUES ('350421', '明溪县', '3', '350400');
INSERT INTO `dok_district` VALUES ('350423', '清流县', '3', '350400');
INSERT INTO `dok_district` VALUES ('350424', '宁化县', '3', '350400');
INSERT INTO `dok_district` VALUES ('350425', '大田县', '3', '350400');
INSERT INTO `dok_district` VALUES ('350426', '尤溪县', '3', '350400');
INSERT INTO `dok_district` VALUES ('350427', '沙　县', '3', '350400');
INSERT INTO `dok_district` VALUES ('350428', '将乐县', '3', '350400');
INSERT INTO `dok_district` VALUES ('350429', '泰宁县', '3', '350400');
INSERT INTO `dok_district` VALUES ('350430', '建宁县', '3', '350400');
INSERT INTO `dok_district` VALUES ('350481', '永安市', '3', '350400');
INSERT INTO `dok_district` VALUES ('350501', '市辖区', '3', '350500');
INSERT INTO `dok_district` VALUES ('350502', '鲤城区', '3', '350500');
INSERT INTO `dok_district` VALUES ('350503', '丰泽区', '3', '350500');
INSERT INTO `dok_district` VALUES ('350504', '洛江区', '3', '350500');
INSERT INTO `dok_district` VALUES ('350505', '泉港区', '3', '350500');
INSERT INTO `dok_district` VALUES ('350521', '惠安县', '3', '350500');
INSERT INTO `dok_district` VALUES ('350524', '安溪县', '3', '350500');
INSERT INTO `dok_district` VALUES ('350525', '永春县', '3', '350500');
INSERT INTO `dok_district` VALUES ('350526', '德化县', '3', '350500');
INSERT INTO `dok_district` VALUES ('350527', '金门县', '3', '350500');
INSERT INTO `dok_district` VALUES ('350581', '石狮市', '3', '350500');
INSERT INTO `dok_district` VALUES ('350582', '晋江市', '3', '350500');
INSERT INTO `dok_district` VALUES ('350583', '南安市', '3', '350500');
INSERT INTO `dok_district` VALUES ('350601', '市辖区', '3', '350600');
INSERT INTO `dok_district` VALUES ('350602', '芗城区', '3', '350600');
INSERT INTO `dok_district` VALUES ('350603', '龙文区', '3', '350600');
INSERT INTO `dok_district` VALUES ('350622', '云霄县', '3', '350600');
INSERT INTO `dok_district` VALUES ('350623', '漳浦县', '3', '350600');
INSERT INTO `dok_district` VALUES ('350624', '诏安县', '3', '350600');
INSERT INTO `dok_district` VALUES ('350625', '长泰县', '3', '350600');
INSERT INTO `dok_district` VALUES ('350626', '东山县', '3', '350600');
INSERT INTO `dok_district` VALUES ('350627', '南靖县', '3', '350600');
INSERT INTO `dok_district` VALUES ('350628', '平和县', '3', '350600');
INSERT INTO `dok_district` VALUES ('350629', '华安县', '3', '350600');
INSERT INTO `dok_district` VALUES ('350681', '龙海市', '3', '350600');
INSERT INTO `dok_district` VALUES ('350701', '市辖区', '3', '350700');
INSERT INTO `dok_district` VALUES ('350702', '延平区', '3', '350700');
INSERT INTO `dok_district` VALUES ('350721', '顺昌县', '3', '350700');
INSERT INTO `dok_district` VALUES ('350722', '浦城县', '3', '350700');
INSERT INTO `dok_district` VALUES ('350723', '光泽县', '3', '350700');
INSERT INTO `dok_district` VALUES ('350724', '松溪县', '3', '350700');
INSERT INTO `dok_district` VALUES ('350725', '政和县', '3', '350700');
INSERT INTO `dok_district` VALUES ('350781', '邵武市', '3', '350700');
INSERT INTO `dok_district` VALUES ('350782', '武夷山市', '3', '350700');
INSERT INTO `dok_district` VALUES ('350783', '建瓯市', '3', '350700');
INSERT INTO `dok_district` VALUES ('350784', '建阳市', '3', '350700');
INSERT INTO `dok_district` VALUES ('350801', '市辖区', '3', '350800');
INSERT INTO `dok_district` VALUES ('350802', '新罗区', '3', '350800');
INSERT INTO `dok_district` VALUES ('350821', '长汀县', '3', '350800');
INSERT INTO `dok_district` VALUES ('350822', '永定县', '3', '350800');
INSERT INTO `dok_district` VALUES ('350823', '上杭县', '3', '350800');
INSERT INTO `dok_district` VALUES ('350824', '武平县', '3', '350800');
INSERT INTO `dok_district` VALUES ('350825', '连城县', '3', '350800');
INSERT INTO `dok_district` VALUES ('350881', '漳平市', '3', '350800');
INSERT INTO `dok_district` VALUES ('350901', '市辖区', '3', '350900');
INSERT INTO `dok_district` VALUES ('350902', '蕉城区', '3', '350900');
INSERT INTO `dok_district` VALUES ('350921', '霞浦县', '3', '350900');
INSERT INTO `dok_district` VALUES ('350922', '古田县', '3', '350900');
INSERT INTO `dok_district` VALUES ('350923', '屏南县', '3', '350900');
INSERT INTO `dok_district` VALUES ('350924', '寿宁县', '3', '350900');
INSERT INTO `dok_district` VALUES ('350925', '周宁县', '3', '350900');
INSERT INTO `dok_district` VALUES ('350926', '柘荣县', '3', '350900');
INSERT INTO `dok_district` VALUES ('350981', '福安市', '3', '350900');
INSERT INTO `dok_district` VALUES ('350982', '福鼎市', '3', '350900');
INSERT INTO `dok_district` VALUES ('360101', '市辖区', '3', '360100');
INSERT INTO `dok_district` VALUES ('360102', '东湖区', '3', '360100');
INSERT INTO `dok_district` VALUES ('360103', '西湖区', '3', '360100');
INSERT INTO `dok_district` VALUES ('360104', '青云谱区', '3', '360100');
INSERT INTO `dok_district` VALUES ('360105', '湾里区', '3', '360100');
INSERT INTO `dok_district` VALUES ('360111', '青山湖区', '3', '360100');
INSERT INTO `dok_district` VALUES ('360121', '南昌县', '3', '360100');
INSERT INTO `dok_district` VALUES ('360122', '新建县', '3', '360100');
INSERT INTO `dok_district` VALUES ('360123', '安义县', '3', '360100');
INSERT INTO `dok_district` VALUES ('360124', '进贤县', '3', '360100');
INSERT INTO `dok_district` VALUES ('360201', '市辖区', '3', '360200');
INSERT INTO `dok_district` VALUES ('360202', '昌江区', '3', '360200');
INSERT INTO `dok_district` VALUES ('360203', '珠山区', '3', '360200');
INSERT INTO `dok_district` VALUES ('360222', '浮梁县', '3', '360200');
INSERT INTO `dok_district` VALUES ('360281', '乐平市', '3', '360200');
INSERT INTO `dok_district` VALUES ('360301', '市辖区', '3', '360300');
INSERT INTO `dok_district` VALUES ('360302', '安源区', '3', '360300');
INSERT INTO `dok_district` VALUES ('360313', '湘东区', '3', '360300');
INSERT INTO `dok_district` VALUES ('360321', '莲花县', '3', '360300');
INSERT INTO `dok_district` VALUES ('360322', '上栗县', '3', '360300');
INSERT INTO `dok_district` VALUES ('360323', '芦溪县', '3', '360300');
INSERT INTO `dok_district` VALUES ('360401', '市辖区', '3', '360400');
INSERT INTO `dok_district` VALUES ('360402', '庐山区', '3', '360400');
INSERT INTO `dok_district` VALUES ('360403', '浔阳区', '3', '360400');
INSERT INTO `dok_district` VALUES ('360421', '九江县', '3', '360400');
INSERT INTO `dok_district` VALUES ('360423', '武宁县', '3', '360400');
INSERT INTO `dok_district` VALUES ('360424', '修水县', '3', '360400');
INSERT INTO `dok_district` VALUES ('360425', '永修县', '3', '360400');
INSERT INTO `dok_district` VALUES ('360426', '德安县', '3', '360400');
INSERT INTO `dok_district` VALUES ('360427', '星子县', '3', '360400');
INSERT INTO `dok_district` VALUES ('360428', '都昌县', '3', '360400');
INSERT INTO `dok_district` VALUES ('360429', '湖口县', '3', '360400');
INSERT INTO `dok_district` VALUES ('360430', '彭泽县', '3', '360400');
INSERT INTO `dok_district` VALUES ('360481', '瑞昌市', '3', '360400');
INSERT INTO `dok_district` VALUES ('360501', '市辖区', '3', '360500');
INSERT INTO `dok_district` VALUES ('360502', '渝水区', '3', '360500');
INSERT INTO `dok_district` VALUES ('360521', '分宜县', '3', '360500');
INSERT INTO `dok_district` VALUES ('360601', '市辖区', '3', '360600');
INSERT INTO `dok_district` VALUES ('360602', '月湖区', '3', '360600');
INSERT INTO `dok_district` VALUES ('360622', '余江县', '3', '360600');
INSERT INTO `dok_district` VALUES ('360681', '贵溪市', '3', '360600');
INSERT INTO `dok_district` VALUES ('360701', '市辖区', '3', '360700');
INSERT INTO `dok_district` VALUES ('360702', '章贡区', '3', '360700');
INSERT INTO `dok_district` VALUES ('360721', '赣　县', '3', '360700');
INSERT INTO `dok_district` VALUES ('360722', '信丰县', '3', '360700');
INSERT INTO `dok_district` VALUES ('360723', '大余县', '3', '360700');
INSERT INTO `dok_district` VALUES ('360724', '上犹县', '3', '360700');
INSERT INTO `dok_district` VALUES ('360725', '崇义县', '3', '360700');
INSERT INTO `dok_district` VALUES ('360726', '安远县', '3', '360700');
INSERT INTO `dok_district` VALUES ('360727', '龙南县', '3', '360700');
INSERT INTO `dok_district` VALUES ('360728', '定南县', '3', '360700');
INSERT INTO `dok_district` VALUES ('360729', '全南县', '3', '360700');
INSERT INTO `dok_district` VALUES ('360730', '宁都县', '3', '360700');
INSERT INTO `dok_district` VALUES ('360731', '于都县', '3', '360700');
INSERT INTO `dok_district` VALUES ('360732', '兴国县', '3', '360700');
INSERT INTO `dok_district` VALUES ('360733', '会昌县', '3', '360700');
INSERT INTO `dok_district` VALUES ('360734', '寻乌县', '3', '360700');
INSERT INTO `dok_district` VALUES ('360735', '石城县', '3', '360700');
INSERT INTO `dok_district` VALUES ('360781', '瑞金市', '3', '360700');
INSERT INTO `dok_district` VALUES ('360782', '南康市', '3', '360700');
INSERT INTO `dok_district` VALUES ('360801', '市辖区', '3', '360800');
INSERT INTO `dok_district` VALUES ('360802', '吉州区', '3', '360800');
INSERT INTO `dok_district` VALUES ('360803', '青原区', '3', '360800');
INSERT INTO `dok_district` VALUES ('360821', '吉安县', '3', '360800');
INSERT INTO `dok_district` VALUES ('360822', '吉水县', '3', '360800');
INSERT INTO `dok_district` VALUES ('360823', '峡江县', '3', '360800');
INSERT INTO `dok_district` VALUES ('360824', '新干县', '3', '360800');
INSERT INTO `dok_district` VALUES ('360825', '永丰县', '3', '360800');
INSERT INTO `dok_district` VALUES ('360826', '泰和县', '3', '360800');
INSERT INTO `dok_district` VALUES ('360827', '遂川县', '3', '360800');
INSERT INTO `dok_district` VALUES ('360828', '万安县', '3', '360800');
INSERT INTO `dok_district` VALUES ('360829', '安福县', '3', '360800');
INSERT INTO `dok_district` VALUES ('360830', '永新县', '3', '360800');
INSERT INTO `dok_district` VALUES ('360881', '井冈山市', '3', '360800');
INSERT INTO `dok_district` VALUES ('360901', '市辖区', '3', '360900');
INSERT INTO `dok_district` VALUES ('360902', '袁州区', '3', '360900');
INSERT INTO `dok_district` VALUES ('360921', '奉新县', '3', '360900');
INSERT INTO `dok_district` VALUES ('360922', '万载县', '3', '360900');
INSERT INTO `dok_district` VALUES ('360923', '上高县', '3', '360900');
INSERT INTO `dok_district` VALUES ('360924', '宜丰县', '3', '360900');
INSERT INTO `dok_district` VALUES ('360925', '靖安县', '3', '360900');
INSERT INTO `dok_district` VALUES ('360926', '铜鼓县', '3', '360900');
INSERT INTO `dok_district` VALUES ('360981', '丰城市', '3', '360900');
INSERT INTO `dok_district` VALUES ('360982', '樟树市', '3', '360900');
INSERT INTO `dok_district` VALUES ('360983', '高安市', '3', '360900');
INSERT INTO `dok_district` VALUES ('361001', '市辖区', '3', '361000');
INSERT INTO `dok_district` VALUES ('361002', '临川区', '3', '361000');
INSERT INTO `dok_district` VALUES ('361021', '南城县', '3', '361000');
INSERT INTO `dok_district` VALUES ('361022', '黎川县', '3', '361000');
INSERT INTO `dok_district` VALUES ('361023', '南丰县', '3', '361000');
INSERT INTO `dok_district` VALUES ('361024', '崇仁县', '3', '361000');
INSERT INTO `dok_district` VALUES ('361025', '乐安县', '3', '361000');
INSERT INTO `dok_district` VALUES ('361026', '宜黄县', '3', '361000');
INSERT INTO `dok_district` VALUES ('361027', '金溪县', '3', '361000');
INSERT INTO `dok_district` VALUES ('361028', '资溪县', '3', '361000');
INSERT INTO `dok_district` VALUES ('361029', '东乡县', '3', '361000');
INSERT INTO `dok_district` VALUES ('361030', '广昌县', '3', '361000');
INSERT INTO `dok_district` VALUES ('361101', '市辖区', '3', '361100');
INSERT INTO `dok_district` VALUES ('361102', '信州区', '3', '361100');
INSERT INTO `dok_district` VALUES ('361121', '上饶县', '3', '361100');
INSERT INTO `dok_district` VALUES ('361122', '广丰县', '3', '361100');
INSERT INTO `dok_district` VALUES ('361123', '玉山县', '3', '361100');
INSERT INTO `dok_district` VALUES ('361124', '铅山县', '3', '361100');
INSERT INTO `dok_district` VALUES ('361125', '横峰县', '3', '361100');
INSERT INTO `dok_district` VALUES ('361126', '弋阳县', '3', '361100');
INSERT INTO `dok_district` VALUES ('361127', '余干县', '3', '361100');
INSERT INTO `dok_district` VALUES ('361128', '鄱阳县', '3', '361100');
INSERT INTO `dok_district` VALUES ('361129', '万年县', '3', '361100');
INSERT INTO `dok_district` VALUES ('361130', '婺源县', '3', '361100');
INSERT INTO `dok_district` VALUES ('361181', '德兴市', '3', '361100');
INSERT INTO `dok_district` VALUES ('370101', '市辖区', '3', '370100');
INSERT INTO `dok_district` VALUES ('370102', '历下区', '3', '370100');
INSERT INTO `dok_district` VALUES ('370103', '市中区', '3', '370100');
INSERT INTO `dok_district` VALUES ('370104', '槐荫区', '3', '370100');
INSERT INTO `dok_district` VALUES ('370105', '天桥区', '3', '370100');
INSERT INTO `dok_district` VALUES ('370112', '历城区', '3', '370100');
INSERT INTO `dok_district` VALUES ('370113', '长清区', '3', '370100');
INSERT INTO `dok_district` VALUES ('370124', '平阴县', '3', '370100');
INSERT INTO `dok_district` VALUES ('370125', '济阳县', '3', '370100');
INSERT INTO `dok_district` VALUES ('370126', '商河县', '3', '370100');
INSERT INTO `dok_district` VALUES ('370181', '章丘市', '3', '370100');
INSERT INTO `dok_district` VALUES ('370201', '市辖区', '3', '370200');
INSERT INTO `dok_district` VALUES ('370202', '市南区', '3', '370200');
INSERT INTO `dok_district` VALUES ('370203', '市北区', '3', '370200');
INSERT INTO `dok_district` VALUES ('370205', '四方区', '3', '370200');
INSERT INTO `dok_district` VALUES ('370211', '黄岛区', '3', '370200');
INSERT INTO `dok_district` VALUES ('370212', '崂山区', '3', '370200');
INSERT INTO `dok_district` VALUES ('370213', '李沧区', '3', '370200');
INSERT INTO `dok_district` VALUES ('370214', '城阳区', '3', '370200');
INSERT INTO `dok_district` VALUES ('370281', '胶州市', '3', '370200');
INSERT INTO `dok_district` VALUES ('370282', '即墨市', '3', '370200');
INSERT INTO `dok_district` VALUES ('370283', '平度市', '3', '370200');
INSERT INTO `dok_district` VALUES ('370284', '胶南市', '3', '370200');
INSERT INTO `dok_district` VALUES ('370285', '莱西市', '3', '370200');
INSERT INTO `dok_district` VALUES ('370301', '市辖区', '3', '370300');
INSERT INTO `dok_district` VALUES ('370302', '淄川区', '3', '370300');
INSERT INTO `dok_district` VALUES ('370303', '张店区', '3', '370300');
INSERT INTO `dok_district` VALUES ('370304', '博山区', '3', '370300');
INSERT INTO `dok_district` VALUES ('370305', '临淄区', '3', '370300');
INSERT INTO `dok_district` VALUES ('370306', '周村区', '3', '370300');
INSERT INTO `dok_district` VALUES ('370321', '桓台县', '3', '370300');
INSERT INTO `dok_district` VALUES ('370322', '高青县', '3', '370300');
INSERT INTO `dok_district` VALUES ('370323', '沂源县', '3', '370300');
INSERT INTO `dok_district` VALUES ('370401', '市辖区', '3', '370400');
INSERT INTO `dok_district` VALUES ('370402', '市中区', '3', '370400');
INSERT INTO `dok_district` VALUES ('370403', '薛城区', '3', '370400');
INSERT INTO `dok_district` VALUES ('370404', '峄城区', '3', '370400');
INSERT INTO `dok_district` VALUES ('370405', '台儿庄区', '3', '370400');
INSERT INTO `dok_district` VALUES ('370406', '山亭区', '3', '370400');
INSERT INTO `dok_district` VALUES ('370481', '滕州市', '3', '370400');
INSERT INTO `dok_district` VALUES ('370501', '市辖区', '3', '370500');
INSERT INTO `dok_district` VALUES ('370502', '东营区', '3', '370500');
INSERT INTO `dok_district` VALUES ('370503', '河口区', '3', '370500');
INSERT INTO `dok_district` VALUES ('370521', '垦利县', '3', '370500');
INSERT INTO `dok_district` VALUES ('370522', '利津县', '3', '370500');
INSERT INTO `dok_district` VALUES ('370523', '广饶县', '3', '370500');
INSERT INTO `dok_district` VALUES ('370601', '市辖区', '3', '370600');
INSERT INTO `dok_district` VALUES ('370602', '芝罘区', '3', '370600');
INSERT INTO `dok_district` VALUES ('370611', '福山区', '3', '370600');
INSERT INTO `dok_district` VALUES ('370612', '牟平区', '3', '370600');
INSERT INTO `dok_district` VALUES ('370613', '莱山区', '3', '370600');
INSERT INTO `dok_district` VALUES ('370634', '长岛县', '3', '370600');
INSERT INTO `dok_district` VALUES ('370681', '龙口市', '3', '370600');
INSERT INTO `dok_district` VALUES ('370682', '莱阳市', '3', '370600');
INSERT INTO `dok_district` VALUES ('370683', '莱州市', '3', '370600');
INSERT INTO `dok_district` VALUES ('370684', '蓬莱市', '3', '370600');
INSERT INTO `dok_district` VALUES ('370685', '招远市', '3', '370600');
INSERT INTO `dok_district` VALUES ('370686', '栖霞市', '3', '370600');
INSERT INTO `dok_district` VALUES ('370687', '海阳市', '3', '370600');
INSERT INTO `dok_district` VALUES ('370701', '市辖区', '3', '370700');
INSERT INTO `dok_district` VALUES ('370702', '潍城区', '3', '370700');
INSERT INTO `dok_district` VALUES ('370703', '寒亭区', '3', '370700');
INSERT INTO `dok_district` VALUES ('370704', '坊子区', '3', '370700');
INSERT INTO `dok_district` VALUES ('370705', '奎文区', '3', '370700');
INSERT INTO `dok_district` VALUES ('370724', '临朐县', '3', '370700');
INSERT INTO `dok_district` VALUES ('370725', '昌乐县', '3', '370700');
INSERT INTO `dok_district` VALUES ('370781', '青州市', '3', '370700');
INSERT INTO `dok_district` VALUES ('370782', '诸城市', '3', '370700');
INSERT INTO `dok_district` VALUES ('370783', '寿光市', '3', '370700');
INSERT INTO `dok_district` VALUES ('370784', '安丘市', '3', '370700');
INSERT INTO `dok_district` VALUES ('370785', '高密市', '3', '370700');
INSERT INTO `dok_district` VALUES ('370786', '昌邑市', '3', '370700');
INSERT INTO `dok_district` VALUES ('370801', '市辖区', '3', '370800');
INSERT INTO `dok_district` VALUES ('370802', '市中区', '3', '370800');
INSERT INTO `dok_district` VALUES ('370811', '任城区', '3', '370800');
INSERT INTO `dok_district` VALUES ('370826', '微山县', '3', '370800');
INSERT INTO `dok_district` VALUES ('370827', '鱼台县', '3', '370800');
INSERT INTO `dok_district` VALUES ('370828', '金乡县', '3', '370800');
INSERT INTO `dok_district` VALUES ('370829', '嘉祥县', '3', '370800');
INSERT INTO `dok_district` VALUES ('370830', '汶上县', '3', '370800');
INSERT INTO `dok_district` VALUES ('370831', '泗水县', '3', '370800');
INSERT INTO `dok_district` VALUES ('370832', '梁山县', '3', '370800');
INSERT INTO `dok_district` VALUES ('370881', '曲阜市', '3', '370800');
INSERT INTO `dok_district` VALUES ('370882', '兖州市', '3', '370800');
INSERT INTO `dok_district` VALUES ('370883', '邹城市', '3', '370800');
INSERT INTO `dok_district` VALUES ('370901', '市辖区', '3', '370900');
INSERT INTO `dok_district` VALUES ('370902', '泰山区', '3', '370900');
INSERT INTO `dok_district` VALUES ('370903', '岱岳区', '3', '370900');
INSERT INTO `dok_district` VALUES ('370921', '宁阳县', '3', '370900');
INSERT INTO `dok_district` VALUES ('370923', '东平县', '3', '370900');
INSERT INTO `dok_district` VALUES ('370982', '新泰市', '3', '370900');
INSERT INTO `dok_district` VALUES ('370983', '肥城市', '3', '370900');
INSERT INTO `dok_district` VALUES ('371001', '市辖区', '3', '371000');
INSERT INTO `dok_district` VALUES ('371002', '环翠区', '3', '371000');
INSERT INTO `dok_district` VALUES ('371081', '文登市', '3', '371000');
INSERT INTO `dok_district` VALUES ('371082', '荣成市', '3', '371000');
INSERT INTO `dok_district` VALUES ('371083', '乳山市', '3', '371000');
INSERT INTO `dok_district` VALUES ('371101', '市辖区', '3', '371100');
INSERT INTO `dok_district` VALUES ('371102', '东港区', '3', '371100');
INSERT INTO `dok_district` VALUES ('371103', '岚山区', '3', '371100');
INSERT INTO `dok_district` VALUES ('371121', '五莲县', '3', '371100');
INSERT INTO `dok_district` VALUES ('371122', '莒　县', '3', '371100');
INSERT INTO `dok_district` VALUES ('371201', '市辖区', '3', '371200');
INSERT INTO `dok_district` VALUES ('371202', '莱城区', '3', '371200');
INSERT INTO `dok_district` VALUES ('371203', '钢城区', '3', '371200');
INSERT INTO `dok_district` VALUES ('371301', '市辖区', '3', '371300');
INSERT INTO `dok_district` VALUES ('371302', '兰山区', '3', '371300');
INSERT INTO `dok_district` VALUES ('371311', '罗庄区', '3', '371300');
INSERT INTO `dok_district` VALUES ('371312', '河东区', '3', '371300');
INSERT INTO `dok_district` VALUES ('371321', '沂南县', '3', '371300');
INSERT INTO `dok_district` VALUES ('371322', '郯城县', '3', '371300');
INSERT INTO `dok_district` VALUES ('371323', '沂水县', '3', '371300');
INSERT INTO `dok_district` VALUES ('371324', '苍山县', '3', '371300');
INSERT INTO `dok_district` VALUES ('371325', '费　县', '3', '371300');
INSERT INTO `dok_district` VALUES ('371326', '平邑县', '3', '371300');
INSERT INTO `dok_district` VALUES ('371327', '莒南县', '3', '371300');
INSERT INTO `dok_district` VALUES ('371328', '蒙阴县', '3', '371300');
INSERT INTO `dok_district` VALUES ('371329', '临沭县', '3', '371300');
INSERT INTO `dok_district` VALUES ('371401', '市辖区', '3', '371400');
INSERT INTO `dok_district` VALUES ('371402', '德城区', '3', '371400');
INSERT INTO `dok_district` VALUES ('371421', '陵　县', '3', '371400');
INSERT INTO `dok_district` VALUES ('371422', '宁津县', '3', '371400');
INSERT INTO `dok_district` VALUES ('371423', '庆云县', '3', '371400');
INSERT INTO `dok_district` VALUES ('371424', '临邑县', '3', '371400');
INSERT INTO `dok_district` VALUES ('371425', '齐河县', '3', '371400');
INSERT INTO `dok_district` VALUES ('371426', '平原县', '3', '371400');
INSERT INTO `dok_district` VALUES ('371427', '夏津县', '3', '371400');
INSERT INTO `dok_district` VALUES ('371428', '武城县', '3', '371400');
INSERT INTO `dok_district` VALUES ('371481', '乐陵市', '3', '371400');
INSERT INTO `dok_district` VALUES ('371482', '禹城市', '3', '371400');
INSERT INTO `dok_district` VALUES ('371501', '市辖区', '3', '371500');
INSERT INTO `dok_district` VALUES ('371502', '东昌府区', '3', '371500');
INSERT INTO `dok_district` VALUES ('371521', '阳谷县', '3', '371500');
INSERT INTO `dok_district` VALUES ('371522', '莘　县', '3', '371500');
INSERT INTO `dok_district` VALUES ('371523', '茌平县', '3', '371500');
INSERT INTO `dok_district` VALUES ('371524', '东阿县', '3', '371500');
INSERT INTO `dok_district` VALUES ('371525', '冠　县', '3', '371500');
INSERT INTO `dok_district` VALUES ('371526', '高唐县', '3', '371500');
INSERT INTO `dok_district` VALUES ('371581', '临清市', '3', '371500');
INSERT INTO `dok_district` VALUES ('371601', '市辖区', '3', '371600');
INSERT INTO `dok_district` VALUES ('371602', '滨城区', '3', '371600');
INSERT INTO `dok_district` VALUES ('371621', '惠民县', '3', '371600');
INSERT INTO `dok_district` VALUES ('371622', '阳信县', '3', '371600');
INSERT INTO `dok_district` VALUES ('371623', '无棣县', '3', '371600');
INSERT INTO `dok_district` VALUES ('371624', '沾化县', '3', '371600');
INSERT INTO `dok_district` VALUES ('371625', '博兴县', '3', '371600');
INSERT INTO `dok_district` VALUES ('371626', '邹平县', '3', '371600');
INSERT INTO `dok_district` VALUES ('371701', '市辖区', '3', '371700');
INSERT INTO `dok_district` VALUES ('371702', '牡丹区', '3', '371700');
INSERT INTO `dok_district` VALUES ('371721', '曹　县', '3', '371700');
INSERT INTO `dok_district` VALUES ('371722', '单　县', '3', '371700');
INSERT INTO `dok_district` VALUES ('371723', '成武县', '3', '371700');
INSERT INTO `dok_district` VALUES ('371724', '巨野县', '3', '371700');
INSERT INTO `dok_district` VALUES ('371725', '郓城县', '3', '371700');
INSERT INTO `dok_district` VALUES ('371726', '鄄城县', '3', '371700');
INSERT INTO `dok_district` VALUES ('371727', '定陶县', '3', '371700');
INSERT INTO `dok_district` VALUES ('371728', '东明县', '3', '371700');
INSERT INTO `dok_district` VALUES ('410101', '市辖区', '3', '410100');
INSERT INTO `dok_district` VALUES ('410102', '中原区', '3', '410100');
INSERT INTO `dok_district` VALUES ('410103', '二七区', '3', '410100');
INSERT INTO `dok_district` VALUES ('410104', '管城回族区', '3', '410100');
INSERT INTO `dok_district` VALUES ('410105', '金水区', '3', '410100');
INSERT INTO `dok_district` VALUES ('410106', '上街区', '3', '410100');
INSERT INTO `dok_district` VALUES ('410108', '邙山区', '3', '410100');
INSERT INTO `dok_district` VALUES ('410122', '中牟县', '3', '410100');
INSERT INTO `dok_district` VALUES ('410181', '巩义市', '3', '410100');
INSERT INTO `dok_district` VALUES ('410182', '荥阳市', '3', '410100');
INSERT INTO `dok_district` VALUES ('410183', '新密市', '3', '410100');
INSERT INTO `dok_district` VALUES ('410184', '新郑市', '3', '410100');
INSERT INTO `dok_district` VALUES ('410185', '登封市', '3', '410100');
INSERT INTO `dok_district` VALUES ('410201', '市辖区', '3', '410200');
INSERT INTO `dok_district` VALUES ('410202', '龙亭区', '3', '410200');
INSERT INTO `dok_district` VALUES ('410203', '顺河回族区', '3', '410200');
INSERT INTO `dok_district` VALUES ('410204', '鼓楼区', '3', '410200');
INSERT INTO `dok_district` VALUES ('410205', '南关区', '3', '410200');
INSERT INTO `dok_district` VALUES ('410211', '郊　区', '3', '410200');
INSERT INTO `dok_district` VALUES ('410221', '杞　县', '3', '410200');
INSERT INTO `dok_district` VALUES ('410222', '通许县', '3', '410200');
INSERT INTO `dok_district` VALUES ('410223', '尉氏县', '3', '410200');
INSERT INTO `dok_district` VALUES ('410224', '开封县', '3', '410200');
INSERT INTO `dok_district` VALUES ('410225', '兰考县', '3', '410200');
INSERT INTO `dok_district` VALUES ('410301', '市辖区', '3', '410300');
INSERT INTO `dok_district` VALUES ('410302', '老城区', '3', '410300');
INSERT INTO `dok_district` VALUES ('410303', '西工区', '3', '410300');
INSERT INTO `dok_district` VALUES ('410304', '廛河回族区', '3', '410300');
INSERT INTO `dok_district` VALUES ('410305', '涧西区', '3', '410300');
INSERT INTO `dok_district` VALUES ('410306', '吉利区', '3', '410300');
INSERT INTO `dok_district` VALUES ('410307', '洛龙区', '3', '410300');
INSERT INTO `dok_district` VALUES ('410322', '孟津县', '3', '410300');
INSERT INTO `dok_district` VALUES ('410323', '新安县', '3', '410300');
INSERT INTO `dok_district` VALUES ('410324', '栾川县', '3', '410300');
INSERT INTO `dok_district` VALUES ('410325', '嵩　县', '3', '410300');
INSERT INTO `dok_district` VALUES ('410326', '汝阳县', '3', '410300');
INSERT INTO `dok_district` VALUES ('410327', '宜阳县', '3', '410300');
INSERT INTO `dok_district` VALUES ('410328', '洛宁县', '3', '410300');
INSERT INTO `dok_district` VALUES ('410329', '伊川县', '3', '410300');
INSERT INTO `dok_district` VALUES ('410381', '偃师市', '3', '410300');
INSERT INTO `dok_district` VALUES ('410401', '市辖区', '3', '410400');
INSERT INTO `dok_district` VALUES ('410402', '新华区', '3', '410400');
INSERT INTO `dok_district` VALUES ('410403', '卫东区', '3', '410400');
INSERT INTO `dok_district` VALUES ('410404', '石龙区', '3', '410400');
INSERT INTO `dok_district` VALUES ('410411', '湛河区', '3', '410400');
INSERT INTO `dok_district` VALUES ('410421', '宝丰县', '3', '410400');
INSERT INTO `dok_district` VALUES ('410422', '叶　县', '3', '410400');
INSERT INTO `dok_district` VALUES ('410423', '鲁山县', '3', '410400');
INSERT INTO `dok_district` VALUES ('410425', '郏　县', '3', '410400');
INSERT INTO `dok_district` VALUES ('410481', '舞钢市', '3', '410400');
INSERT INTO `dok_district` VALUES ('410482', '汝州市', '3', '410400');
INSERT INTO `dok_district` VALUES ('410501', '市辖区', '3', '410500');
INSERT INTO `dok_district` VALUES ('410502', '文峰区', '3', '410500');
INSERT INTO `dok_district` VALUES ('410503', '北关区', '3', '410500');
INSERT INTO `dok_district` VALUES ('410505', '殷都区', '3', '410500');
INSERT INTO `dok_district` VALUES ('410506', '龙安区', '3', '410500');
INSERT INTO `dok_district` VALUES ('410522', '安阳县', '3', '410500');
INSERT INTO `dok_district` VALUES ('410523', '汤阴县', '3', '410500');
INSERT INTO `dok_district` VALUES ('410526', '滑　县', '3', '410500');
INSERT INTO `dok_district` VALUES ('410527', '内黄县', '3', '410500');
INSERT INTO `dok_district` VALUES ('410581', '林州市', '3', '410500');
INSERT INTO `dok_district` VALUES ('410601', '市辖区', '3', '410600');
INSERT INTO `dok_district` VALUES ('410602', '鹤山区', '3', '410600');
INSERT INTO `dok_district` VALUES ('410603', '山城区', '3', '410600');
INSERT INTO `dok_district` VALUES ('410611', '淇滨区', '3', '410600');
INSERT INTO `dok_district` VALUES ('410621', '浚　县', '3', '410600');
INSERT INTO `dok_district` VALUES ('410622', '淇　县', '3', '410600');
INSERT INTO `dok_district` VALUES ('410701', '市辖区', '3', '410700');
INSERT INTO `dok_district` VALUES ('410702', '红旗区', '3', '410700');
INSERT INTO `dok_district` VALUES ('410703', '卫滨区', '3', '410700');
INSERT INTO `dok_district` VALUES ('410704', '凤泉区', '3', '410700');
INSERT INTO `dok_district` VALUES ('410711', '牧野区', '3', '410700');
INSERT INTO `dok_district` VALUES ('410721', '新乡县', '3', '410700');
INSERT INTO `dok_district` VALUES ('410724', '获嘉县', '3', '410700');
INSERT INTO `dok_district` VALUES ('410725', '原阳县', '3', '410700');
INSERT INTO `dok_district` VALUES ('410726', '延津县', '3', '410700');
INSERT INTO `dok_district` VALUES ('410727', '封丘县', '3', '410700');
INSERT INTO `dok_district` VALUES ('410728', '长垣县', '3', '410700');
INSERT INTO `dok_district` VALUES ('410781', '卫辉市', '3', '410700');
INSERT INTO `dok_district` VALUES ('410782', '辉县市', '3', '410700');
INSERT INTO `dok_district` VALUES ('410801', '市辖区', '3', '410800');
INSERT INTO `dok_district` VALUES ('410802', '解放区', '3', '410800');
INSERT INTO `dok_district` VALUES ('410803', '中站区', '3', '410800');
INSERT INTO `dok_district` VALUES ('410804', '马村区', '3', '410800');
INSERT INTO `dok_district` VALUES ('410811', '山阳区', '3', '410800');
INSERT INTO `dok_district` VALUES ('410821', '修武县', '3', '410800');
INSERT INTO `dok_district` VALUES ('410822', '博爱县', '3', '410800');
INSERT INTO `dok_district` VALUES ('410823', '武陟县', '3', '410800');
INSERT INTO `dok_district` VALUES ('410825', '温　县', '3', '410800');
INSERT INTO `dok_district` VALUES ('410881', '济源市', '3', '410800');
INSERT INTO `dok_district` VALUES ('410882', '沁阳市', '3', '410800');
INSERT INTO `dok_district` VALUES ('410883', '孟州市', '3', '410800');
INSERT INTO `dok_district` VALUES ('410901', '市辖区', '3', '410900');
INSERT INTO `dok_district` VALUES ('410902', '华龙区', '3', '410900');
INSERT INTO `dok_district` VALUES ('410922', '清丰县', '3', '410900');
INSERT INTO `dok_district` VALUES ('410923', '南乐县', '3', '410900');
INSERT INTO `dok_district` VALUES ('410926', '范　县', '3', '410900');
INSERT INTO `dok_district` VALUES ('410927', '台前县', '3', '410900');
INSERT INTO `dok_district` VALUES ('410928', '濮阳县', '3', '410900');
INSERT INTO `dok_district` VALUES ('411001', '市辖区', '3', '411000');
INSERT INTO `dok_district` VALUES ('411002', '魏都区', '3', '411000');
INSERT INTO `dok_district` VALUES ('411023', '许昌县', '3', '411000');
INSERT INTO `dok_district` VALUES ('411024', '鄢陵县', '3', '411000');
INSERT INTO `dok_district` VALUES ('411025', '襄城县', '3', '411000');
INSERT INTO `dok_district` VALUES ('411081', '禹州市', '3', '411000');
INSERT INTO `dok_district` VALUES ('411082', '长葛市', '3', '411000');
INSERT INTO `dok_district` VALUES ('411101', '市辖区', '3', '411100');
INSERT INTO `dok_district` VALUES ('411102', '源汇区', '3', '411100');
INSERT INTO `dok_district` VALUES ('411103', '郾城区', '3', '411100');
INSERT INTO `dok_district` VALUES ('411104', '召陵区', '3', '411100');
INSERT INTO `dok_district` VALUES ('411121', '舞阳县', '3', '411100');
INSERT INTO `dok_district` VALUES ('411122', '临颍县', '3', '411100');
INSERT INTO `dok_district` VALUES ('411201', '市辖区', '3', '411200');
INSERT INTO `dok_district` VALUES ('411202', '湖滨区', '3', '411200');
INSERT INTO `dok_district` VALUES ('411221', '渑池县', '3', '411200');
INSERT INTO `dok_district` VALUES ('411222', '陕　县', '3', '411200');
INSERT INTO `dok_district` VALUES ('411224', '卢氏县', '3', '411200');
INSERT INTO `dok_district` VALUES ('411281', '义马市', '3', '411200');
INSERT INTO `dok_district` VALUES ('411282', '灵宝市', '3', '411200');
INSERT INTO `dok_district` VALUES ('411301', '市辖区', '3', '411300');
INSERT INTO `dok_district` VALUES ('411302', '宛城区', '3', '411300');
INSERT INTO `dok_district` VALUES ('411303', '卧龙区', '3', '411300');
INSERT INTO `dok_district` VALUES ('411321', '南召县', '3', '411300');
INSERT INTO `dok_district` VALUES ('411322', '方城县', '3', '411300');
INSERT INTO `dok_district` VALUES ('411323', '西峡县', '3', '411300');
INSERT INTO `dok_district` VALUES ('411324', '镇平县', '3', '411300');
INSERT INTO `dok_district` VALUES ('411325', '内乡县', '3', '411300');
INSERT INTO `dok_district` VALUES ('411326', '淅川县', '3', '411300');
INSERT INTO `dok_district` VALUES ('411327', '社旗县', '3', '411300');
INSERT INTO `dok_district` VALUES ('411328', '唐河县', '3', '411300');
INSERT INTO `dok_district` VALUES ('411329', '新野县', '3', '411300');
INSERT INTO `dok_district` VALUES ('411330', '桐柏县', '3', '411300');
INSERT INTO `dok_district` VALUES ('411381', '邓州市', '3', '411300');
INSERT INTO `dok_district` VALUES ('411401', '市辖区', '3', '411400');
INSERT INTO `dok_district` VALUES ('411402', '梁园区', '3', '411400');
INSERT INTO `dok_district` VALUES ('411403', '睢阳区', '3', '411400');
INSERT INTO `dok_district` VALUES ('411421', '民权县', '3', '411400');
INSERT INTO `dok_district` VALUES ('411422', '睢　县', '3', '411400');
INSERT INTO `dok_district` VALUES ('411423', '宁陵县', '3', '411400');
INSERT INTO `dok_district` VALUES ('411424', '柘城县', '3', '411400');
INSERT INTO `dok_district` VALUES ('411425', '虞城县', '3', '411400');
INSERT INTO `dok_district` VALUES ('411426', '夏邑县', '3', '411400');
INSERT INTO `dok_district` VALUES ('411481', '永城市', '3', '411400');
INSERT INTO `dok_district` VALUES ('411501', '市辖区', '3', '411500');
INSERT INTO `dok_district` VALUES ('411502', '师河区', '3', '411500');
INSERT INTO `dok_district` VALUES ('411503', '平桥区', '3', '411500');
INSERT INTO `dok_district` VALUES ('411521', '罗山县', '3', '411500');
INSERT INTO `dok_district` VALUES ('411522', '光山县', '3', '411500');
INSERT INTO `dok_district` VALUES ('411523', '新　县', '3', '411500');
INSERT INTO `dok_district` VALUES ('411524', '商城县', '3', '411500');
INSERT INTO `dok_district` VALUES ('411525', '固始县', '3', '411500');
INSERT INTO `dok_district` VALUES ('411526', '潢川县', '3', '411500');
INSERT INTO `dok_district` VALUES ('411527', '淮滨县', '3', '411500');
INSERT INTO `dok_district` VALUES ('411528', '息　县', '3', '411500');
INSERT INTO `dok_district` VALUES ('411601', '市辖区', '3', '411600');
INSERT INTO `dok_district` VALUES ('411602', '川汇区', '3', '411600');
INSERT INTO `dok_district` VALUES ('411621', '扶沟县', '3', '411600');
INSERT INTO `dok_district` VALUES ('411622', '西华县', '3', '411600');
INSERT INTO `dok_district` VALUES ('411623', '商水县', '3', '411600');
INSERT INTO `dok_district` VALUES ('411624', '沈丘县', '3', '411600');
INSERT INTO `dok_district` VALUES ('411625', '郸城县', '3', '411600');
INSERT INTO `dok_district` VALUES ('411626', '淮阳县', '3', '411600');
INSERT INTO `dok_district` VALUES ('411627', '太康县', '3', '411600');
INSERT INTO `dok_district` VALUES ('411628', '鹿邑县', '3', '411600');
INSERT INTO `dok_district` VALUES ('411681', '项城市', '3', '411600');
INSERT INTO `dok_district` VALUES ('411701', '市辖区', '3', '411700');
INSERT INTO `dok_district` VALUES ('411702', '驿城区', '3', '411700');
INSERT INTO `dok_district` VALUES ('411721', '西平县', '3', '411700');
INSERT INTO `dok_district` VALUES ('411722', '上蔡县', '3', '411700');
INSERT INTO `dok_district` VALUES ('411723', '平舆县', '3', '411700');
INSERT INTO `dok_district` VALUES ('411724', '正阳县', '3', '411700');
INSERT INTO `dok_district` VALUES ('411725', '确山县', '3', '411700');
INSERT INTO `dok_district` VALUES ('411726', '泌阳县', '3', '411700');
INSERT INTO `dok_district` VALUES ('411727', '汝南县', '3', '411700');
INSERT INTO `dok_district` VALUES ('411728', '遂平县', '3', '411700');
INSERT INTO `dok_district` VALUES ('411729', '新蔡县', '3', '411700');
INSERT INTO `dok_district` VALUES ('420101', '市辖区', '3', '420100');
INSERT INTO `dok_district` VALUES ('420102', '江岸区', '3', '420100');
INSERT INTO `dok_district` VALUES ('420103', '江汉区', '3', '420100');
INSERT INTO `dok_district` VALUES ('420104', '乔口区', '3', '420100');
INSERT INTO `dok_district` VALUES ('420105', '汉阳区', '3', '420100');
INSERT INTO `dok_district` VALUES ('420106', '武昌区', '3', '420100');
INSERT INTO `dok_district` VALUES ('420107', '青山区', '3', '420100');
INSERT INTO `dok_district` VALUES ('420111', '洪山区', '3', '420100');
INSERT INTO `dok_district` VALUES ('420112', '东西湖区', '3', '420100');
INSERT INTO `dok_district` VALUES ('420113', '汉南区', '3', '420100');
INSERT INTO `dok_district` VALUES ('420114', '蔡甸区', '3', '420100');
INSERT INTO `dok_district` VALUES ('420115', '江夏区', '3', '420100');
INSERT INTO `dok_district` VALUES ('420116', '黄陂区', '3', '420100');
INSERT INTO `dok_district` VALUES ('420117', '新洲区', '3', '420100');
INSERT INTO `dok_district` VALUES ('420201', '市辖区', '3', '420200');
INSERT INTO `dok_district` VALUES ('420202', '黄石港区', '3', '420200');
INSERT INTO `dok_district` VALUES ('420203', '西塞山区', '3', '420200');
INSERT INTO `dok_district` VALUES ('420204', '下陆区', '3', '420200');
INSERT INTO `dok_district` VALUES ('420205', '铁山区', '3', '420200');
INSERT INTO `dok_district` VALUES ('420222', '阳新县', '3', '420200');
INSERT INTO `dok_district` VALUES ('420281', '大冶市', '3', '420200');
INSERT INTO `dok_district` VALUES ('420301', '市辖区', '3', '420300');
INSERT INTO `dok_district` VALUES ('420302', '茅箭区', '3', '420300');
INSERT INTO `dok_district` VALUES ('420303', '张湾区', '3', '420300');
INSERT INTO `dok_district` VALUES ('420321', '郧　县', '3', '420300');
INSERT INTO `dok_district` VALUES ('420322', '郧西县', '3', '420300');
INSERT INTO `dok_district` VALUES ('420323', '竹山县', '3', '420300');
INSERT INTO `dok_district` VALUES ('420324', '竹溪县', '3', '420300');
INSERT INTO `dok_district` VALUES ('420325', '房　县', '3', '420300');
INSERT INTO `dok_district` VALUES ('420381', '丹江口市', '3', '420300');
INSERT INTO `dok_district` VALUES ('420501', '市辖区', '3', '420500');
INSERT INTO `dok_district` VALUES ('420502', '西陵区', '3', '420500');
INSERT INTO `dok_district` VALUES ('420503', '伍家岗区', '3', '420500');
INSERT INTO `dok_district` VALUES ('420504', '点军区', '3', '420500');
INSERT INTO `dok_district` VALUES ('420505', '猇亭区', '3', '420500');
INSERT INTO `dok_district` VALUES ('420506', '夷陵区', '3', '420500');
INSERT INTO `dok_district` VALUES ('420525', '远安县', '3', '420500');
INSERT INTO `dok_district` VALUES ('420526', '兴山县', '3', '420500');
INSERT INTO `dok_district` VALUES ('420527', '秭归县', '3', '420500');
INSERT INTO `dok_district` VALUES ('420528', '长阳土家族自治县', '3', '420500');
INSERT INTO `dok_district` VALUES ('420529', '五峰土家族自治县', '3', '420500');
INSERT INTO `dok_district` VALUES ('420581', '宜都市', '3', '420500');
INSERT INTO `dok_district` VALUES ('420582', '当阳市', '3', '420500');
INSERT INTO `dok_district` VALUES ('420583', '枝江市', '3', '420500');
INSERT INTO `dok_district` VALUES ('420601', '市辖区', '3', '420600');
INSERT INTO `dok_district` VALUES ('420602', '襄城区', '3', '420600');
INSERT INTO `dok_district` VALUES ('420606', '樊城区', '3', '420600');
INSERT INTO `dok_district` VALUES ('420607', '襄阳区', '3', '420600');
INSERT INTO `dok_district` VALUES ('420624', '南漳县', '3', '420600');
INSERT INTO `dok_district` VALUES ('420625', '谷城县', '3', '420600');
INSERT INTO `dok_district` VALUES ('420626', '保康县', '3', '420600');
INSERT INTO `dok_district` VALUES ('420682', '老河口市', '3', '420600');
INSERT INTO `dok_district` VALUES ('420683', '枣阳市', '3', '420600');
INSERT INTO `dok_district` VALUES ('420684', '宜城市', '3', '420600');
INSERT INTO `dok_district` VALUES ('420701', '市辖区', '3', '420700');
INSERT INTO `dok_district` VALUES ('420702', '梁子湖区', '3', '420700');
INSERT INTO `dok_district` VALUES ('420703', '华容区', '3', '420700');
INSERT INTO `dok_district` VALUES ('420704', '鄂城区', '3', '420700');
INSERT INTO `dok_district` VALUES ('420801', '市辖区', '3', '420800');
INSERT INTO `dok_district` VALUES ('420802', '东宝区', '3', '420800');
INSERT INTO `dok_district` VALUES ('420804', '掇刀区', '3', '420800');
INSERT INTO `dok_district` VALUES ('420821', '京山县', '3', '420800');
INSERT INTO `dok_district` VALUES ('420822', '沙洋县', '3', '420800');
INSERT INTO `dok_district` VALUES ('420881', '钟祥市', '3', '420800');
INSERT INTO `dok_district` VALUES ('420901', '市辖区', '3', '420900');
INSERT INTO `dok_district` VALUES ('420902', '孝南区', '3', '420900');
INSERT INTO `dok_district` VALUES ('420921', '孝昌县', '3', '420900');
INSERT INTO `dok_district` VALUES ('420922', '大悟县', '3', '420900');
INSERT INTO `dok_district` VALUES ('420923', '云梦县', '3', '420900');
INSERT INTO `dok_district` VALUES ('420981', '应城市', '3', '420900');
INSERT INTO `dok_district` VALUES ('420982', '安陆市', '3', '420900');
INSERT INTO `dok_district` VALUES ('420984', '汉川市', '3', '420900');
INSERT INTO `dok_district` VALUES ('421001', '市辖区', '3', '421000');
INSERT INTO `dok_district` VALUES ('421002', '沙市区', '3', '421000');
INSERT INTO `dok_district` VALUES ('421003', '荆州区', '3', '421000');
INSERT INTO `dok_district` VALUES ('421022', '公安县', '3', '421000');
INSERT INTO `dok_district` VALUES ('421023', '监利县', '3', '421000');
INSERT INTO `dok_district` VALUES ('421024', '江陵县', '3', '421000');
INSERT INTO `dok_district` VALUES ('421081', '石首市', '3', '421000');
INSERT INTO `dok_district` VALUES ('421083', '洪湖市', '3', '421000');
INSERT INTO `dok_district` VALUES ('421087', '松滋市', '3', '421000');
INSERT INTO `dok_district` VALUES ('421101', '市辖区', '3', '421100');
INSERT INTO `dok_district` VALUES ('421102', '黄州区', '3', '421100');
INSERT INTO `dok_district` VALUES ('421121', '团风县', '3', '421100');
INSERT INTO `dok_district` VALUES ('421122', '红安县', '3', '421100');
INSERT INTO `dok_district` VALUES ('421123', '罗田县', '3', '421100');
INSERT INTO `dok_district` VALUES ('421124', '英山县', '3', '421100');
INSERT INTO `dok_district` VALUES ('421125', '浠水县', '3', '421100');
INSERT INTO `dok_district` VALUES ('421126', '蕲春县', '3', '421100');
INSERT INTO `dok_district` VALUES ('421127', '黄梅县', '3', '421100');
INSERT INTO `dok_district` VALUES ('421181', '麻城市', '3', '421100');
INSERT INTO `dok_district` VALUES ('421182', '武穴市', '3', '421100');
INSERT INTO `dok_district` VALUES ('421201', '市辖区', '3', '421200');
INSERT INTO `dok_district` VALUES ('421202', '咸安区', '3', '421200');
INSERT INTO `dok_district` VALUES ('421221', '嘉鱼县', '3', '421200');
INSERT INTO `dok_district` VALUES ('421222', '通城县', '3', '421200');
INSERT INTO `dok_district` VALUES ('421223', '崇阳县', '3', '421200');
INSERT INTO `dok_district` VALUES ('421224', '通山县', '3', '421200');
INSERT INTO `dok_district` VALUES ('421281', '赤壁市', '3', '421200');
INSERT INTO `dok_district` VALUES ('421301', '市辖区', '3', '421300');
INSERT INTO `dok_district` VALUES ('421302', '曾都区', '3', '421300');
INSERT INTO `dok_district` VALUES ('421381', '广水市', '3', '421300');
INSERT INTO `dok_district` VALUES ('422801', '恩施市', '3', '422800');
INSERT INTO `dok_district` VALUES ('422802', '利川市', '3', '422800');
INSERT INTO `dok_district` VALUES ('422822', '建始县', '3', '422800');
INSERT INTO `dok_district` VALUES ('422823', '巴东县', '3', '422800');
INSERT INTO `dok_district` VALUES ('422825', '宣恩县', '3', '422800');
INSERT INTO `dok_district` VALUES ('422826', '咸丰县', '3', '422800');
INSERT INTO `dok_district` VALUES ('422827', '来凤县', '3', '422800');
INSERT INTO `dok_district` VALUES ('422828', '鹤峰县', '3', '422800');
INSERT INTO `dok_district` VALUES ('429004', '仙桃市', '3', '429000');
INSERT INTO `dok_district` VALUES ('429005', '潜江市', '3', '429000');
INSERT INTO `dok_district` VALUES ('429006', '天门市', '3', '429000');
INSERT INTO `dok_district` VALUES ('429021', '神农架林区', '3', '429000');
INSERT INTO `dok_district` VALUES ('430101', '市辖区', '3', '430100');
INSERT INTO `dok_district` VALUES ('430102', '芙蓉区', '3', '430100');
INSERT INTO `dok_district` VALUES ('430103', '天心区', '3', '430100');
INSERT INTO `dok_district` VALUES ('430104', '岳麓区', '3', '430100');
INSERT INTO `dok_district` VALUES ('430105', '开福区', '3', '430100');
INSERT INTO `dok_district` VALUES ('430111', '雨花区', '3', '430100');
INSERT INTO `dok_district` VALUES ('430121', '长沙县', '3', '430100');
INSERT INTO `dok_district` VALUES ('430122', '望城县', '3', '430100');
INSERT INTO `dok_district` VALUES ('430124', '宁乡县', '3', '430100');
INSERT INTO `dok_district` VALUES ('430181', '浏阳市', '3', '430100');
INSERT INTO `dok_district` VALUES ('430201', '市辖区', '3', '430200');
INSERT INTO `dok_district` VALUES ('430202', '荷塘区', '3', '430200');
INSERT INTO `dok_district` VALUES ('430203', '芦淞区', '3', '430200');
INSERT INTO `dok_district` VALUES ('430204', '石峰区', '3', '430200');
INSERT INTO `dok_district` VALUES ('430211', '天元区', '3', '430200');
INSERT INTO `dok_district` VALUES ('430221', '株洲县', '3', '430200');
INSERT INTO `dok_district` VALUES ('430223', '攸　县', '3', '430200');
INSERT INTO `dok_district` VALUES ('430224', '茶陵县', '3', '430200');
INSERT INTO `dok_district` VALUES ('430225', '炎陵县', '3', '430200');
INSERT INTO `dok_district` VALUES ('430281', '醴陵市', '3', '430200');
INSERT INTO `dok_district` VALUES ('430301', '市辖区', '3', '430300');
INSERT INTO `dok_district` VALUES ('430302', '雨湖区', '3', '430300');
INSERT INTO `dok_district` VALUES ('430304', '岳塘区', '3', '430300');
INSERT INTO `dok_district` VALUES ('430321', '湘潭县', '3', '430300');
INSERT INTO `dok_district` VALUES ('430381', '湘乡市', '3', '430300');
INSERT INTO `dok_district` VALUES ('430382', '韶山市', '3', '430300');
INSERT INTO `dok_district` VALUES ('430401', '市辖区', '3', '430400');
INSERT INTO `dok_district` VALUES ('430405', '珠晖区', '3', '430400');
INSERT INTO `dok_district` VALUES ('430406', '雁峰区', '3', '430400');
INSERT INTO `dok_district` VALUES ('430407', '石鼓区', '3', '430400');
INSERT INTO `dok_district` VALUES ('430408', '蒸湘区', '3', '430400');
INSERT INTO `dok_district` VALUES ('430412', '南岳区', '3', '430400');
INSERT INTO `dok_district` VALUES ('430421', '衡阳县', '3', '430400');
INSERT INTO `dok_district` VALUES ('430422', '衡南县', '3', '430400');
INSERT INTO `dok_district` VALUES ('430423', '衡山县', '3', '430400');
INSERT INTO `dok_district` VALUES ('430424', '衡东县', '3', '430400');
INSERT INTO `dok_district` VALUES ('430426', '祁东县', '3', '430400');
INSERT INTO `dok_district` VALUES ('430481', '耒阳市', '3', '430400');
INSERT INTO `dok_district` VALUES ('430482', '常宁市', '3', '430400');
INSERT INTO `dok_district` VALUES ('430501', '市辖区', '3', '430500');
INSERT INTO `dok_district` VALUES ('430502', '双清区', '3', '430500');
INSERT INTO `dok_district` VALUES ('430503', '大祥区', '3', '430500');
INSERT INTO `dok_district` VALUES ('430511', '北塔区', '3', '430500');
INSERT INTO `dok_district` VALUES ('430521', '邵东县', '3', '430500');
INSERT INTO `dok_district` VALUES ('430522', '新邵县', '3', '430500');
INSERT INTO `dok_district` VALUES ('430523', '邵阳县', '3', '430500');
INSERT INTO `dok_district` VALUES ('430524', '隆回县', '3', '430500');
INSERT INTO `dok_district` VALUES ('430525', '洞口县', '3', '430500');
INSERT INTO `dok_district` VALUES ('430527', '绥宁县', '3', '430500');
INSERT INTO `dok_district` VALUES ('430528', '新宁县', '3', '430500');
INSERT INTO `dok_district` VALUES ('430529', '城步苗族自治县', '3', '430500');
INSERT INTO `dok_district` VALUES ('430581', '武冈市', '3', '430500');
INSERT INTO `dok_district` VALUES ('430601', '市辖区', '3', '430600');
INSERT INTO `dok_district` VALUES ('430602', '岳阳楼区', '3', '430600');
INSERT INTO `dok_district` VALUES ('430603', '云溪区', '3', '430600');
INSERT INTO `dok_district` VALUES ('430611', '君山区', '3', '430600');
INSERT INTO `dok_district` VALUES ('430621', '岳阳县', '3', '430600');
INSERT INTO `dok_district` VALUES ('430623', '华容县', '3', '430600');
INSERT INTO `dok_district` VALUES ('430624', '湘阴县', '3', '430600');
INSERT INTO `dok_district` VALUES ('430626', '平江县', '3', '430600');
INSERT INTO `dok_district` VALUES ('430681', '汨罗市', '3', '430600');
INSERT INTO `dok_district` VALUES ('430682', '临湘市', '3', '430600');
INSERT INTO `dok_district` VALUES ('430701', '市辖区', '3', '430700');
INSERT INTO `dok_district` VALUES ('430702', '武陵区', '3', '430700');
INSERT INTO `dok_district` VALUES ('430703', '鼎城区', '3', '430700');
INSERT INTO `dok_district` VALUES ('430721', '安乡县', '3', '430700');
INSERT INTO `dok_district` VALUES ('430722', '汉寿县', '3', '430700');
INSERT INTO `dok_district` VALUES ('430723', '澧　县', '3', '430700');
INSERT INTO `dok_district` VALUES ('430724', '临澧县', '3', '430700');
INSERT INTO `dok_district` VALUES ('430725', '桃源县', '3', '430700');
INSERT INTO `dok_district` VALUES ('430726', '石门县', '3', '430700');
INSERT INTO `dok_district` VALUES ('430781', '津市市', '3', '430700');
INSERT INTO `dok_district` VALUES ('430801', '市辖区', '3', '430800');
INSERT INTO `dok_district` VALUES ('430802', '永定区', '3', '430800');
INSERT INTO `dok_district` VALUES ('430811', '武陵源区', '3', '430800');
INSERT INTO `dok_district` VALUES ('430821', '慈利县', '3', '430800');
INSERT INTO `dok_district` VALUES ('430822', '桑植县', '3', '430800');
INSERT INTO `dok_district` VALUES ('430901', '市辖区', '3', '430900');
INSERT INTO `dok_district` VALUES ('430902', '资阳区', '3', '430900');
INSERT INTO `dok_district` VALUES ('430903', '赫山区', '3', '430900');
INSERT INTO `dok_district` VALUES ('430921', '南　县', '3', '430900');
INSERT INTO `dok_district` VALUES ('430922', '桃江县', '3', '430900');
INSERT INTO `dok_district` VALUES ('430923', '安化县', '3', '430900');
INSERT INTO `dok_district` VALUES ('430981', '沅江市', '3', '430900');
INSERT INTO `dok_district` VALUES ('431001', '市辖区', '3', '431000');
INSERT INTO `dok_district` VALUES ('431002', '北湖区', '3', '431000');
INSERT INTO `dok_district` VALUES ('431003', '苏仙区', '3', '431000');
INSERT INTO `dok_district` VALUES ('431021', '桂阳县', '3', '431000');
INSERT INTO `dok_district` VALUES ('431022', '宜章县', '3', '431000');
INSERT INTO `dok_district` VALUES ('431023', '永兴县', '3', '431000');
INSERT INTO `dok_district` VALUES ('431024', '嘉禾县', '3', '431000');
INSERT INTO `dok_district` VALUES ('431025', '临武县', '3', '431000');
INSERT INTO `dok_district` VALUES ('431026', '汝城县', '3', '431000');
INSERT INTO `dok_district` VALUES ('431027', '桂东县', '3', '431000');
INSERT INTO `dok_district` VALUES ('431028', '安仁县', '3', '431000');
INSERT INTO `dok_district` VALUES ('431081', '资兴市', '3', '431000');
INSERT INTO `dok_district` VALUES ('431101', '市辖区', '3', '431100');
INSERT INTO `dok_district` VALUES ('431102', '芝山区', '3', '431100');
INSERT INTO `dok_district` VALUES ('431103', '冷水滩区', '3', '431100');
INSERT INTO `dok_district` VALUES ('431121', '祁阳县', '3', '431100');
INSERT INTO `dok_district` VALUES ('431122', '东安县', '3', '431100');
INSERT INTO `dok_district` VALUES ('431123', '双牌县', '3', '431100');
INSERT INTO `dok_district` VALUES ('431124', '道　县', '3', '431100');
INSERT INTO `dok_district` VALUES ('431125', '江永县', '3', '431100');
INSERT INTO `dok_district` VALUES ('431126', '宁远县', '3', '431100');
INSERT INTO `dok_district` VALUES ('431127', '蓝山县', '3', '431100');
INSERT INTO `dok_district` VALUES ('431128', '新田县', '3', '431100');
INSERT INTO `dok_district` VALUES ('431129', '江华瑶族自治县', '3', '431100');
INSERT INTO `dok_district` VALUES ('431201', '市辖区', '3', '431200');
INSERT INTO `dok_district` VALUES ('431202', '鹤城区', '3', '431200');
INSERT INTO `dok_district` VALUES ('431221', '中方县', '3', '431200');
INSERT INTO `dok_district` VALUES ('431222', '沅陵县', '3', '431200');
INSERT INTO `dok_district` VALUES ('431223', '辰溪县', '3', '431200');
INSERT INTO `dok_district` VALUES ('431224', '溆浦县', '3', '431200');
INSERT INTO `dok_district` VALUES ('431225', '会同县', '3', '431200');
INSERT INTO `dok_district` VALUES ('431226', '麻阳苗族自治县', '3', '431200');
INSERT INTO `dok_district` VALUES ('431227', '新晃侗族自治县', '3', '431200');
INSERT INTO `dok_district` VALUES ('431228', '芷江侗族自治县', '3', '431200');
INSERT INTO `dok_district` VALUES ('431229', '靖州苗族侗族自治县', '3', '431200');
INSERT INTO `dok_district` VALUES ('431230', '通道侗族自治县', '3', '431200');
INSERT INTO `dok_district` VALUES ('431281', '洪江市', '3', '431200');
INSERT INTO `dok_district` VALUES ('431301', '市辖区', '3', '431300');
INSERT INTO `dok_district` VALUES ('431302', '娄星区', '3', '431300');
INSERT INTO `dok_district` VALUES ('431321', '双峰县', '3', '431300');
INSERT INTO `dok_district` VALUES ('431322', '新化县', '3', '431300');
INSERT INTO `dok_district` VALUES ('431381', '冷水江市', '3', '431300');
INSERT INTO `dok_district` VALUES ('431382', '涟源市', '3', '431300');
INSERT INTO `dok_district` VALUES ('433101', '吉首市', '3', '433100');
INSERT INTO `dok_district` VALUES ('433122', '泸溪县', '3', '433100');
INSERT INTO `dok_district` VALUES ('433123', '凤凰县', '3', '433100');
INSERT INTO `dok_district` VALUES ('433124', '花垣县', '3', '433100');
INSERT INTO `dok_district` VALUES ('433125', '保靖县', '3', '433100');
INSERT INTO `dok_district` VALUES ('433126', '古丈县', '3', '433100');
INSERT INTO `dok_district` VALUES ('433127', '永顺县', '3', '433100');
INSERT INTO `dok_district` VALUES ('433130', '龙山县', '3', '433100');
INSERT INTO `dok_district` VALUES ('440101', '市辖区', '3', '440100');
INSERT INTO `dok_district` VALUES ('440102', '东山区', '3', '440100');
INSERT INTO `dok_district` VALUES ('440103', '荔湾区', '3', '440100');
INSERT INTO `dok_district` VALUES ('440104', '越秀区', '3', '440100');
INSERT INTO `dok_district` VALUES ('440105', '海珠区', '3', '440100');
INSERT INTO `dok_district` VALUES ('440106', '天河区', '3', '440100');
INSERT INTO `dok_district` VALUES ('440107', '芳村区', '3', '440100');
INSERT INTO `dok_district` VALUES ('440111', '白云区', '3', '440100');
INSERT INTO `dok_district` VALUES ('440112', '黄埔区', '3', '440100');
INSERT INTO `dok_district` VALUES ('440113', '番禺区', '3', '440100');
INSERT INTO `dok_district` VALUES ('440114', '花都区', '3', '440100');
INSERT INTO `dok_district` VALUES ('440183', '增城市', '3', '440100');
INSERT INTO `dok_district` VALUES ('440184', '从化市', '3', '440100');
INSERT INTO `dok_district` VALUES ('440201', '市辖区', '3', '440200');
INSERT INTO `dok_district` VALUES ('440203', '武江区', '3', '440200');
INSERT INTO `dok_district` VALUES ('440204', '浈江区', '3', '440200');
INSERT INTO `dok_district` VALUES ('440205', '曲江区', '3', '440200');
INSERT INTO `dok_district` VALUES ('440222', '始兴县', '3', '440200');
INSERT INTO `dok_district` VALUES ('440224', '仁化县', '3', '440200');
INSERT INTO `dok_district` VALUES ('440229', '翁源县', '3', '440200');
INSERT INTO `dok_district` VALUES ('440232', '乳源瑶族自治县', '3', '440200');
INSERT INTO `dok_district` VALUES ('440233', '新丰县', '3', '440200');
INSERT INTO `dok_district` VALUES ('440281', '乐昌市', '3', '440200');
INSERT INTO `dok_district` VALUES ('440282', '南雄市', '3', '440200');
INSERT INTO `dok_district` VALUES ('440301', '市辖区', '3', '440300');
INSERT INTO `dok_district` VALUES ('440303', '罗湖区', '3', '440300');
INSERT INTO `dok_district` VALUES ('440304', '福田区', '3', '440300');
INSERT INTO `dok_district` VALUES ('440305', '南山区', '3', '440300');
INSERT INTO `dok_district` VALUES ('440306', '宝安区', '3', '440300');
INSERT INTO `dok_district` VALUES ('440307', '龙岗区', '3', '440300');
INSERT INTO `dok_district` VALUES ('440308', '盐田区', '3', '440300');
INSERT INTO `dok_district` VALUES ('440401', '市辖区', '3', '440400');
INSERT INTO `dok_district` VALUES ('440402', '香洲区', '3', '440400');
INSERT INTO `dok_district` VALUES ('440403', '斗门区', '3', '440400');
INSERT INTO `dok_district` VALUES ('440404', '金湾区', '3', '440400');
INSERT INTO `dok_district` VALUES ('440501', '市辖区', '3', '440500');
INSERT INTO `dok_district` VALUES ('440507', '龙湖区', '3', '440500');
INSERT INTO `dok_district` VALUES ('440511', '金平区', '3', '440500');
INSERT INTO `dok_district` VALUES ('440512', '濠江区', '3', '440500');
INSERT INTO `dok_district` VALUES ('440513', '潮阳区', '3', '440500');
INSERT INTO `dok_district` VALUES ('440514', '潮南区', '3', '440500');
INSERT INTO `dok_district` VALUES ('440515', '澄海区', '3', '440500');
INSERT INTO `dok_district` VALUES ('440523', '南澳县', '3', '440500');
INSERT INTO `dok_district` VALUES ('440601', '市辖区', '3', '440600');
INSERT INTO `dok_district` VALUES ('440604', '禅城区', '3', '440600');
INSERT INTO `dok_district` VALUES ('440605', '南海区', '3', '440600');
INSERT INTO `dok_district` VALUES ('440606', '顺德区', '3', '440600');
INSERT INTO `dok_district` VALUES ('440607', '三水区', '3', '440600');
INSERT INTO `dok_district` VALUES ('440608', '高明区', '3', '440600');
INSERT INTO `dok_district` VALUES ('440701', '市辖区', '3', '440700');
INSERT INTO `dok_district` VALUES ('440703', '蓬江区', '3', '440700');
INSERT INTO `dok_district` VALUES ('440704', '江海区', '3', '440700');
INSERT INTO `dok_district` VALUES ('440705', '新会区', '3', '440700');
INSERT INTO `dok_district` VALUES ('440781', '台山市', '3', '440700');
INSERT INTO `dok_district` VALUES ('440783', '开平市', '3', '440700');
INSERT INTO `dok_district` VALUES ('440784', '鹤山市', '3', '440700');
INSERT INTO `dok_district` VALUES ('440785', '恩平市', '3', '440700');
INSERT INTO `dok_district` VALUES ('440801', '市辖区', '3', '440800');
INSERT INTO `dok_district` VALUES ('440802', '赤坎区', '3', '440800');
INSERT INTO `dok_district` VALUES ('440803', '霞山区', '3', '440800');
INSERT INTO `dok_district` VALUES ('440804', '坡头区', '3', '440800');
INSERT INTO `dok_district` VALUES ('440811', '麻章区', '3', '440800');
INSERT INTO `dok_district` VALUES ('440823', '遂溪县', '3', '440800');
INSERT INTO `dok_district` VALUES ('440825', '徐闻县', '3', '440800');
INSERT INTO `dok_district` VALUES ('440881', '廉江市', '3', '440800');
INSERT INTO `dok_district` VALUES ('440882', '雷州市', '3', '440800');
INSERT INTO `dok_district` VALUES ('440883', '吴川市', '3', '440800');
INSERT INTO `dok_district` VALUES ('440901', '市辖区', '3', '440900');
INSERT INTO `dok_district` VALUES ('440902', '茂南区', '3', '440900');
INSERT INTO `dok_district` VALUES ('440903', '茂港区', '3', '440900');
INSERT INTO `dok_district` VALUES ('440923', '电白县', '3', '440900');
INSERT INTO `dok_district` VALUES ('440981', '高州市', '3', '440900');
INSERT INTO `dok_district` VALUES ('440982', '化州市', '3', '440900');
INSERT INTO `dok_district` VALUES ('440983', '信宜市', '3', '440900');
INSERT INTO `dok_district` VALUES ('441201', '市辖区', '3', '441200');
INSERT INTO `dok_district` VALUES ('441202', '端州区', '3', '441200');
INSERT INTO `dok_district` VALUES ('441203', '鼎湖区', '3', '441200');
INSERT INTO `dok_district` VALUES ('441223', '广宁县', '3', '441200');
INSERT INTO `dok_district` VALUES ('441224', '怀集县', '3', '441200');
INSERT INTO `dok_district` VALUES ('441225', '封开县', '3', '441200');
INSERT INTO `dok_district` VALUES ('441226', '德庆县', '3', '441200');
INSERT INTO `dok_district` VALUES ('441283', '高要市', '3', '441200');
INSERT INTO `dok_district` VALUES ('441284', '四会市', '3', '441200');
INSERT INTO `dok_district` VALUES ('441301', '市辖区', '3', '441300');
INSERT INTO `dok_district` VALUES ('441302', '惠城区', '3', '441300');
INSERT INTO `dok_district` VALUES ('441303', '惠阳区', '3', '441300');
INSERT INTO `dok_district` VALUES ('441322', '博罗县', '3', '441300');
INSERT INTO `dok_district` VALUES ('441323', '惠东县', '3', '441300');
INSERT INTO `dok_district` VALUES ('441324', '龙门县', '3', '441300');
INSERT INTO `dok_district` VALUES ('441401', '市辖区', '3', '441400');
INSERT INTO `dok_district` VALUES ('441402', '梅江区', '3', '441400');
INSERT INTO `dok_district` VALUES ('441421', '梅　县', '3', '441400');
INSERT INTO `dok_district` VALUES ('441422', '大埔县', '3', '441400');
INSERT INTO `dok_district` VALUES ('441423', '丰顺县', '3', '441400');
INSERT INTO `dok_district` VALUES ('441424', '五华县', '3', '441400');
INSERT INTO `dok_district` VALUES ('441426', '平远县', '3', '441400');
INSERT INTO `dok_district` VALUES ('441427', '蕉岭县', '3', '441400');
INSERT INTO `dok_district` VALUES ('441481', '兴宁市', '3', '441400');
INSERT INTO `dok_district` VALUES ('441501', '市辖区', '3', '441500');
INSERT INTO `dok_district` VALUES ('441502', '城　区', '3', '441500');
INSERT INTO `dok_district` VALUES ('441521', '海丰县', '3', '441500');
INSERT INTO `dok_district` VALUES ('441523', '陆河县', '3', '441500');
INSERT INTO `dok_district` VALUES ('441581', '陆丰市', '3', '441500');
INSERT INTO `dok_district` VALUES ('441601', '市辖区', '3', '441600');
INSERT INTO `dok_district` VALUES ('441602', '源城区', '3', '441600');
INSERT INTO `dok_district` VALUES ('441621', '紫金县', '3', '441600');
INSERT INTO `dok_district` VALUES ('441622', '龙川县', '3', '441600');
INSERT INTO `dok_district` VALUES ('441623', '连平县', '3', '441600');
INSERT INTO `dok_district` VALUES ('441624', '和平县', '3', '441600');
INSERT INTO `dok_district` VALUES ('441625', '东源县', '3', '441600');
INSERT INTO `dok_district` VALUES ('441701', '市辖区', '3', '441700');
INSERT INTO `dok_district` VALUES ('441702', '江城区', '3', '441700');
INSERT INTO `dok_district` VALUES ('441721', '阳西县', '3', '441700');
INSERT INTO `dok_district` VALUES ('441723', '阳东县', '3', '441700');
INSERT INTO `dok_district` VALUES ('441781', '阳春市', '3', '441700');
INSERT INTO `dok_district` VALUES ('441801', '市辖区', '3', '441800');
INSERT INTO `dok_district` VALUES ('441802', '清城区', '3', '441800');
INSERT INTO `dok_district` VALUES ('441821', '佛冈县', '3', '441800');
INSERT INTO `dok_district` VALUES ('441823', '阳山县', '3', '441800');
INSERT INTO `dok_district` VALUES ('441825', '连山壮族瑶族自治县', '3', '441800');
INSERT INTO `dok_district` VALUES ('441826', '连南瑶族自治县', '3', '441800');
INSERT INTO `dok_district` VALUES ('441827', '清新县', '3', '441800');
INSERT INTO `dok_district` VALUES ('441881', '英德市', '3', '441800');
INSERT INTO `dok_district` VALUES ('441882', '连州市', '3', '441800');
INSERT INTO `dok_district` VALUES ('445101', '市辖区', '3', '445100');
INSERT INTO `dok_district` VALUES ('445102', '湘桥区', '3', '445100');
INSERT INTO `dok_district` VALUES ('445121', '潮安县', '3', '445100');
INSERT INTO `dok_district` VALUES ('445122', '饶平县', '3', '445100');
INSERT INTO `dok_district` VALUES ('445201', '市辖区', '3', '445200');
INSERT INTO `dok_district` VALUES ('445202', '榕城区', '3', '445200');
INSERT INTO `dok_district` VALUES ('445221', '揭东县', '3', '445200');
INSERT INTO `dok_district` VALUES ('445222', '揭西县', '3', '445200');
INSERT INTO `dok_district` VALUES ('445224', '惠来县', '3', '445200');
INSERT INTO `dok_district` VALUES ('445281', '普宁市', '3', '445200');
INSERT INTO `dok_district` VALUES ('445301', '市辖区', '3', '445300');
INSERT INTO `dok_district` VALUES ('445302', '云城区', '3', '445300');
INSERT INTO `dok_district` VALUES ('445321', '新兴县', '3', '445300');
INSERT INTO `dok_district` VALUES ('445322', '郁南县', '3', '445300');
INSERT INTO `dok_district` VALUES ('445323', '云安县', '3', '445300');
INSERT INTO `dok_district` VALUES ('445381', '罗定市', '3', '445300');
INSERT INTO `dok_district` VALUES ('450101', '市辖区', '3', '450100');
INSERT INTO `dok_district` VALUES ('450102', '兴宁区', '3', '450100');
INSERT INTO `dok_district` VALUES ('450103', '青秀区', '3', '450100');
INSERT INTO `dok_district` VALUES ('450105', '江南区', '3', '450100');
INSERT INTO `dok_district` VALUES ('450107', '西乡塘区', '3', '450100');
INSERT INTO `dok_district` VALUES ('450108', '良庆区', '3', '450100');
INSERT INTO `dok_district` VALUES ('450109', '邕宁区', '3', '450100');
INSERT INTO `dok_district` VALUES ('450122', '武鸣县', '3', '450100');
INSERT INTO `dok_district` VALUES ('450123', '隆安县', '3', '450100');
INSERT INTO `dok_district` VALUES ('450124', '马山县', '3', '450100');
INSERT INTO `dok_district` VALUES ('450125', '上林县', '3', '450100');
INSERT INTO `dok_district` VALUES ('450126', '宾阳县', '3', '450100');
INSERT INTO `dok_district` VALUES ('450127', '横　县', '3', '450100');
INSERT INTO `dok_district` VALUES ('450201', '市辖区', '3', '450200');
INSERT INTO `dok_district` VALUES ('450202', '城中区', '3', '450200');
INSERT INTO `dok_district` VALUES ('450203', '鱼峰区', '3', '450200');
INSERT INTO `dok_district` VALUES ('450204', '柳南区', '3', '450200');
INSERT INTO `dok_district` VALUES ('450205', '柳北区', '3', '450200');
INSERT INTO `dok_district` VALUES ('450221', '柳江县', '3', '450200');
INSERT INTO `dok_district` VALUES ('450222', '柳城县', '3', '450200');
INSERT INTO `dok_district` VALUES ('450223', '鹿寨县', '3', '450200');
INSERT INTO `dok_district` VALUES ('450224', '融安县', '3', '450200');
INSERT INTO `dok_district` VALUES ('450225', '融水苗族自治县', '3', '450200');
INSERT INTO `dok_district` VALUES ('450226', '三江侗族自治县', '3', '450200');
INSERT INTO `dok_district` VALUES ('450301', '市辖区', '3', '450300');
INSERT INTO `dok_district` VALUES ('450302', '秀峰区', '3', '450300');
INSERT INTO `dok_district` VALUES ('450303', '叠彩区', '3', '450300');
INSERT INTO `dok_district` VALUES ('450304', '象山区', '3', '450300');
INSERT INTO `dok_district` VALUES ('450305', '七星区', '3', '450300');
INSERT INTO `dok_district` VALUES ('450311', '雁山区', '3', '450300');
INSERT INTO `dok_district` VALUES ('450321', '阳朔县', '3', '450300');
INSERT INTO `dok_district` VALUES ('450322', '临桂县', '3', '450300');
INSERT INTO `dok_district` VALUES ('450323', '灵川县', '3', '450300');
INSERT INTO `dok_district` VALUES ('450324', '全州县', '3', '450300');
INSERT INTO `dok_district` VALUES ('450325', '兴安县', '3', '450300');
INSERT INTO `dok_district` VALUES ('450326', '永福县', '3', '450300');
INSERT INTO `dok_district` VALUES ('450327', '灌阳县', '3', '450300');
INSERT INTO `dok_district` VALUES ('450328', '龙胜各族自治县', '3', '450300');
INSERT INTO `dok_district` VALUES ('450329', '资源县', '3', '450300');
INSERT INTO `dok_district` VALUES ('450330', '平乐县', '3', '450300');
INSERT INTO `dok_district` VALUES ('450331', '荔蒲县', '3', '450300');
INSERT INTO `dok_district` VALUES ('450332', '恭城瑶族自治县', '3', '450300');
INSERT INTO `dok_district` VALUES ('450401', '市辖区', '3', '450400');
INSERT INTO `dok_district` VALUES ('450403', '万秀区', '3', '450400');
INSERT INTO `dok_district` VALUES ('450404', '蝶山区', '3', '450400');
INSERT INTO `dok_district` VALUES ('450405', '长洲区', '3', '450400');
INSERT INTO `dok_district` VALUES ('450421', '苍梧县', '3', '450400');
INSERT INTO `dok_district` VALUES ('450422', '藤　县', '3', '450400');
INSERT INTO `dok_district` VALUES ('450423', '蒙山县', '3', '450400');
INSERT INTO `dok_district` VALUES ('450481', '岑溪市', '3', '450400');
INSERT INTO `dok_district` VALUES ('450501', '市辖区', '3', '450500');
INSERT INTO `dok_district` VALUES ('450502', '海城区', '3', '450500');
INSERT INTO `dok_district` VALUES ('450503', '银海区', '3', '450500');
INSERT INTO `dok_district` VALUES ('450512', '铁山港区', '3', '450500');
INSERT INTO `dok_district` VALUES ('450521', '合浦县', '3', '450500');
INSERT INTO `dok_district` VALUES ('450601', '市辖区', '3', '450600');
INSERT INTO `dok_district` VALUES ('450602', '港口区', '3', '450600');
INSERT INTO `dok_district` VALUES ('450603', '防城区', '3', '450600');
INSERT INTO `dok_district` VALUES ('450621', '上思县', '3', '450600');
INSERT INTO `dok_district` VALUES ('450681', '东兴市', '3', '450600');
INSERT INTO `dok_district` VALUES ('450701', '市辖区', '3', '450700');
INSERT INTO `dok_district` VALUES ('450702', '钦南区', '3', '450700');
INSERT INTO `dok_district` VALUES ('450703', '钦北区', '3', '450700');
INSERT INTO `dok_district` VALUES ('450721', '灵山县', '3', '450700');
INSERT INTO `dok_district` VALUES ('450722', '浦北县', '3', '450700');
INSERT INTO `dok_district` VALUES ('450801', '市辖区', '3', '450800');
INSERT INTO `dok_district` VALUES ('450802', '港北区', '3', '450800');
INSERT INTO `dok_district` VALUES ('450803', '港南区', '3', '450800');
INSERT INTO `dok_district` VALUES ('450804', '覃塘区', '3', '450800');
INSERT INTO `dok_district` VALUES ('450821', '平南县', '3', '450800');
INSERT INTO `dok_district` VALUES ('450881', '桂平市', '3', '450800');
INSERT INTO `dok_district` VALUES ('450901', '市辖区', '3', '450900');
INSERT INTO `dok_district` VALUES ('450902', '玉州区', '3', '450900');
INSERT INTO `dok_district` VALUES ('450921', '容　县', '3', '450900');
INSERT INTO `dok_district` VALUES ('450922', '陆川县', '3', '450900');
INSERT INTO `dok_district` VALUES ('450923', '博白县', '3', '450900');
INSERT INTO `dok_district` VALUES ('450924', '兴业县', '3', '450900');
INSERT INTO `dok_district` VALUES ('450981', '北流市', '3', '450900');
INSERT INTO `dok_district` VALUES ('451001', '市辖区', '3', '451000');
INSERT INTO `dok_district` VALUES ('451002', '右江区', '3', '451000');
INSERT INTO `dok_district` VALUES ('451021', '田阳县', '3', '451000');
INSERT INTO `dok_district` VALUES ('451022', '田东县', '3', '451000');
INSERT INTO `dok_district` VALUES ('451023', '平果县', '3', '451000');
INSERT INTO `dok_district` VALUES ('451024', '德保县', '3', '451000');
INSERT INTO `dok_district` VALUES ('451025', '靖西县', '3', '451000');
INSERT INTO `dok_district` VALUES ('451026', '那坡县', '3', '451000');
INSERT INTO `dok_district` VALUES ('451027', '凌云县', '3', '451000');
INSERT INTO `dok_district` VALUES ('451028', '乐业县', '3', '451000');
INSERT INTO `dok_district` VALUES ('451029', '田林县', '3', '451000');
INSERT INTO `dok_district` VALUES ('451030', '西林县', '3', '451000');
INSERT INTO `dok_district` VALUES ('451031', '隆林各族自治县', '3', '451000');
INSERT INTO `dok_district` VALUES ('451101', '市辖区', '3', '451100');
INSERT INTO `dok_district` VALUES ('451102', '八步区', '3', '451100');
INSERT INTO `dok_district` VALUES ('451121', '昭平县', '3', '451100');
INSERT INTO `dok_district` VALUES ('451122', '钟山县', '3', '451100');
INSERT INTO `dok_district` VALUES ('451123', '富川瑶族自治县', '3', '451100');
INSERT INTO `dok_district` VALUES ('451201', '市辖区', '3', '451200');
INSERT INTO `dok_district` VALUES ('451202', '金城江区', '3', '451200');
INSERT INTO `dok_district` VALUES ('451221', '南丹县', '3', '451200');
INSERT INTO `dok_district` VALUES ('451222', '天峨县', '3', '451200');
INSERT INTO `dok_district` VALUES ('451223', '凤山县', '3', '451200');
INSERT INTO `dok_district` VALUES ('451224', '东兰县', '3', '451200');
INSERT INTO `dok_district` VALUES ('451225', '罗城仫佬族自治县', '3', '451200');
INSERT INTO `dok_district` VALUES ('451226', '环江毛南族自治县', '3', '451200');
INSERT INTO `dok_district` VALUES ('451227', '巴马瑶族自治县', '3', '451200');
INSERT INTO `dok_district` VALUES ('451228', '都安瑶族自治县', '3', '451200');
INSERT INTO `dok_district` VALUES ('451229', '大化瑶族自治县', '3', '451200');
INSERT INTO `dok_district` VALUES ('451281', '宜州市', '3', '451200');
INSERT INTO `dok_district` VALUES ('451301', '市辖区', '3', '451300');
INSERT INTO `dok_district` VALUES ('451302', '兴宾区', '3', '451300');
INSERT INTO `dok_district` VALUES ('451321', '忻城县', '3', '451300');
INSERT INTO `dok_district` VALUES ('451322', '象州县', '3', '451300');
INSERT INTO `dok_district` VALUES ('451323', '武宣县', '3', '451300');
INSERT INTO `dok_district` VALUES ('451324', '金秀瑶族自治县', '3', '451300');
INSERT INTO `dok_district` VALUES ('451381', '合山市', '3', '451300');
INSERT INTO `dok_district` VALUES ('451401', '市辖区', '3', '451400');
INSERT INTO `dok_district` VALUES ('451402', '江洲区', '3', '451400');
INSERT INTO `dok_district` VALUES ('451421', '扶绥县', '3', '451400');
INSERT INTO `dok_district` VALUES ('451422', '宁明县', '3', '451400');
INSERT INTO `dok_district` VALUES ('451423', '龙州县', '3', '451400');
INSERT INTO `dok_district` VALUES ('451424', '大新县', '3', '451400');
INSERT INTO `dok_district` VALUES ('451425', '天等县', '3', '451400');
INSERT INTO `dok_district` VALUES ('451481', '凭祥市', '3', '451400');
INSERT INTO `dok_district` VALUES ('460101', '市辖区', '3', '460100');
INSERT INTO `dok_district` VALUES ('460105', '秀英区', '3', '460100');
INSERT INTO `dok_district` VALUES ('460106', '龙华区', '3', '460100');
INSERT INTO `dok_district` VALUES ('460107', '琼山区', '3', '460100');
INSERT INTO `dok_district` VALUES ('460108', '美兰区', '3', '460100');
INSERT INTO `dok_district` VALUES ('460201', '市辖区', '3', '460200');
INSERT INTO `dok_district` VALUES ('469001', '五指山市', '3', '469000');
INSERT INTO `dok_district` VALUES ('469002', '琼海市', '3', '469000');
INSERT INTO `dok_district` VALUES ('469003', '儋州市', '3', '469000');
INSERT INTO `dok_district` VALUES ('469005', '文昌市', '3', '469000');
INSERT INTO `dok_district` VALUES ('469006', '万宁市', '3', '469000');
INSERT INTO `dok_district` VALUES ('469007', '东方市', '3', '469000');
INSERT INTO `dok_district` VALUES ('469025', '定安县', '3', '469000');
INSERT INTO `dok_district` VALUES ('469026', '屯昌县', '3', '469000');
INSERT INTO `dok_district` VALUES ('469027', '澄迈县', '3', '469000');
INSERT INTO `dok_district` VALUES ('469028', '临高县', '3', '469000');
INSERT INTO `dok_district` VALUES ('469030', '白沙黎族自治县', '3', '469000');
INSERT INTO `dok_district` VALUES ('469031', '昌江黎族自治县', '3', '469000');
INSERT INTO `dok_district` VALUES ('469033', '乐东黎族自治县', '3', '469000');
INSERT INTO `dok_district` VALUES ('469034', '陵水黎族自治县', '3', '469000');
INSERT INTO `dok_district` VALUES ('469035', '保亭黎族苗族自治县', '3', '469000');
INSERT INTO `dok_district` VALUES ('469036', '琼中黎族苗族自治县', '3', '469000');
INSERT INTO `dok_district` VALUES ('469037', '西沙群岛', '3', '469000');
INSERT INTO `dok_district` VALUES ('469038', '南沙群岛', '3', '469000');
INSERT INTO `dok_district` VALUES ('469039', '中沙群岛的岛礁及其海域', '3', '469000');
INSERT INTO `dok_district` VALUES ('500101', '万州区', '3', '500100');
INSERT INTO `dok_district` VALUES ('500102', '涪陵区', '3', '500100');
INSERT INTO `dok_district` VALUES ('500103', '渝中区', '3', '500100');
INSERT INTO `dok_district` VALUES ('500104', '大渡口区', '3', '500100');
INSERT INTO `dok_district` VALUES ('500105', '江北区', '3', '500100');
INSERT INTO `dok_district` VALUES ('500106', '沙坪坝区', '3', '500100');
INSERT INTO `dok_district` VALUES ('500107', '九龙坡区', '3', '500100');
INSERT INTO `dok_district` VALUES ('500108', '南岸区', '3', '500100');
INSERT INTO `dok_district` VALUES ('500109', '北碚区', '3', '500100');
INSERT INTO `dok_district` VALUES ('500110', '万盛区', '3', '500100');
INSERT INTO `dok_district` VALUES ('500111', '双桥区', '3', '500100');
INSERT INTO `dok_district` VALUES ('500112', '渝北区', '3', '500100');
INSERT INTO `dok_district` VALUES ('500113', '巴南区', '3', '500100');
INSERT INTO `dok_district` VALUES ('500114', '黔江区', '3', '500100');
INSERT INTO `dok_district` VALUES ('500115', '长寿区', '3', '500100');
INSERT INTO `dok_district` VALUES ('500222', '綦江县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500223', '潼南县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500224', '铜梁县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500225', '大足县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500226', '荣昌县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500227', '璧山县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500228', '梁平县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500229', '城口县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500230', '丰都县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500231', '垫江县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500232', '武隆县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500233', '忠　县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500234', '开　县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500235', '云阳县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500236', '奉节县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500237', '巫山县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500238', '巫溪县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500240', '石柱土家族自治县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500241', '秀山土家族苗族自治县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500242', '酉阳土家族苗族自治县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500243', '彭水苗族土家族自治县', '3', '500200');
INSERT INTO `dok_district` VALUES ('500381', '江津市', '3', '500300');
INSERT INTO `dok_district` VALUES ('500382', '合川市', '3', '500300');
INSERT INTO `dok_district` VALUES ('500383', '永川市', '3', '500300');
INSERT INTO `dok_district` VALUES ('500384', '南川市', '3', '500300');
INSERT INTO `dok_district` VALUES ('510101', '市辖区', '3', '510100');
INSERT INTO `dok_district` VALUES ('510104', '锦江区', '3', '510100');
INSERT INTO `dok_district` VALUES ('510105', '青羊区', '3', '510100');
INSERT INTO `dok_district` VALUES ('510106', '金牛区', '3', '510100');
INSERT INTO `dok_district` VALUES ('510107', '武侯区', '3', '510100');
INSERT INTO `dok_district` VALUES ('510108', '成华区', '3', '510100');
INSERT INTO `dok_district` VALUES ('510112', '龙泉驿区', '3', '510100');
INSERT INTO `dok_district` VALUES ('510113', '青白江区', '3', '510100');
INSERT INTO `dok_district` VALUES ('510114', '新都区', '3', '510100');
INSERT INTO `dok_district` VALUES ('510115', '温江区', '3', '510100');
INSERT INTO `dok_district` VALUES ('510121', '金堂县', '3', '510100');
INSERT INTO `dok_district` VALUES ('510122', '双流县', '3', '510100');
INSERT INTO `dok_district` VALUES ('510124', '郫　县', '3', '510100');
INSERT INTO `dok_district` VALUES ('510129', '大邑县', '3', '510100');
INSERT INTO `dok_district` VALUES ('510131', '蒲江县', '3', '510100');
INSERT INTO `dok_district` VALUES ('510132', '新津县', '3', '510100');
INSERT INTO `dok_district` VALUES ('510181', '都江堰市', '3', '510100');
INSERT INTO `dok_district` VALUES ('510182', '彭州市', '3', '510100');
INSERT INTO `dok_district` VALUES ('510183', '邛崃市', '3', '510100');
INSERT INTO `dok_district` VALUES ('510184', '崇州市', '3', '510100');
INSERT INTO `dok_district` VALUES ('510301', '市辖区', '3', '510300');
INSERT INTO `dok_district` VALUES ('510302', '自流井区', '3', '510300');
INSERT INTO `dok_district` VALUES ('510303', '贡井区', '3', '510300');
INSERT INTO `dok_district` VALUES ('510304', '大安区', '3', '510300');
INSERT INTO `dok_district` VALUES ('510311', '沿滩区', '3', '510300');
INSERT INTO `dok_district` VALUES ('510321', '荣　县', '3', '510300');
INSERT INTO `dok_district` VALUES ('510322', '富顺县', '3', '510300');
INSERT INTO `dok_district` VALUES ('510401', '市辖区', '3', '510400');
INSERT INTO `dok_district` VALUES ('510402', '东　区', '3', '510400');
INSERT INTO `dok_district` VALUES ('510403', '西　区', '3', '510400');
INSERT INTO `dok_district` VALUES ('510411', '仁和区', '3', '510400');
INSERT INTO `dok_district` VALUES ('510421', '米易县', '3', '510400');
INSERT INTO `dok_district` VALUES ('510422', '盐边县', '3', '510400');
INSERT INTO `dok_district` VALUES ('510501', '市辖区', '3', '510500');
INSERT INTO `dok_district` VALUES ('510502', '江阳区', '3', '510500');
INSERT INTO `dok_district` VALUES ('510503', '纳溪区', '3', '510500');
INSERT INTO `dok_district` VALUES ('510504', '龙马潭区', '3', '510500');
INSERT INTO `dok_district` VALUES ('510521', '泸　县', '3', '510500');
INSERT INTO `dok_district` VALUES ('510522', '合江县', '3', '510500');
INSERT INTO `dok_district` VALUES ('510524', '叙永县', '3', '510500');
INSERT INTO `dok_district` VALUES ('510525', '古蔺县', '3', '510500');
INSERT INTO `dok_district` VALUES ('510601', '市辖区', '3', '510600');
INSERT INTO `dok_district` VALUES ('510603', '旌阳区', '3', '510600');
INSERT INTO `dok_district` VALUES ('510623', '中江县', '3', '510600');
INSERT INTO `dok_district` VALUES ('510626', '罗江县', '3', '510600');
INSERT INTO `dok_district` VALUES ('510681', '广汉市', '3', '510600');
INSERT INTO `dok_district` VALUES ('510682', '什邡市', '3', '510600');
INSERT INTO `dok_district` VALUES ('510683', '绵竹市', '3', '510600');
INSERT INTO `dok_district` VALUES ('510701', '市辖区', '3', '510700');
INSERT INTO `dok_district` VALUES ('510703', '涪城区', '3', '510700');
INSERT INTO `dok_district` VALUES ('510704', '游仙区', '3', '510700');
INSERT INTO `dok_district` VALUES ('510722', '三台县', '3', '510700');
INSERT INTO `dok_district` VALUES ('510723', '盐亭县', '3', '510700');
INSERT INTO `dok_district` VALUES ('510724', '安　县', '3', '510700');
INSERT INTO `dok_district` VALUES ('510725', '梓潼县', '3', '510700');
INSERT INTO `dok_district` VALUES ('510726', '北川羌族自治县', '3', '510700');
INSERT INTO `dok_district` VALUES ('510727', '平武县', '3', '510700');
INSERT INTO `dok_district` VALUES ('510781', '江油市', '3', '510700');
INSERT INTO `dok_district` VALUES ('510801', '市辖区', '3', '510800');
INSERT INTO `dok_district` VALUES ('510802', '市中区', '3', '510800');
INSERT INTO `dok_district` VALUES ('510811', '元坝区', '3', '510800');
INSERT INTO `dok_district` VALUES ('510812', '朝天区', '3', '510800');
INSERT INTO `dok_district` VALUES ('510821', '旺苍县', '3', '510800');
INSERT INTO `dok_district` VALUES ('510822', '青川县', '3', '510800');
INSERT INTO `dok_district` VALUES ('510823', '剑阁县', '3', '510800');
INSERT INTO `dok_district` VALUES ('510824', '苍溪县', '3', '510800');
INSERT INTO `dok_district` VALUES ('510901', '市辖区', '3', '510900');
INSERT INTO `dok_district` VALUES ('510903', '船山区', '3', '510900');
INSERT INTO `dok_district` VALUES ('510904', '安居区', '3', '510900');
INSERT INTO `dok_district` VALUES ('510921', '蓬溪县', '3', '510900');
INSERT INTO `dok_district` VALUES ('510922', '射洪县', '3', '510900');
INSERT INTO `dok_district` VALUES ('510923', '大英县', '3', '510900');
INSERT INTO `dok_district` VALUES ('511001', '市辖区', '3', '511000');
INSERT INTO `dok_district` VALUES ('511002', '市中区', '3', '511000');
INSERT INTO `dok_district` VALUES ('511011', '东兴区', '3', '511000');
INSERT INTO `dok_district` VALUES ('511024', '威远县', '3', '511000');
INSERT INTO `dok_district` VALUES ('511025', '资中县', '3', '511000');
INSERT INTO `dok_district` VALUES ('511028', '隆昌县', '3', '511000');
INSERT INTO `dok_district` VALUES ('511101', '市辖区', '3', '511100');
INSERT INTO `dok_district` VALUES ('511102', '市中区', '3', '511100');
INSERT INTO `dok_district` VALUES ('511111', '沙湾区', '3', '511100');
INSERT INTO `dok_district` VALUES ('511112', '五通桥区', '3', '511100');
INSERT INTO `dok_district` VALUES ('511113', '金口河区', '3', '511100');
INSERT INTO `dok_district` VALUES ('511123', '犍为县', '3', '511100');
INSERT INTO `dok_district` VALUES ('511124', '井研县', '3', '511100');
INSERT INTO `dok_district` VALUES ('511126', '夹江县', '3', '511100');
INSERT INTO `dok_district` VALUES ('511129', '沐川县', '3', '511100');
INSERT INTO `dok_district` VALUES ('511132', '峨边彝族自治县', '3', '511100');
INSERT INTO `dok_district` VALUES ('511133', '马边彝族自治县', '3', '511100');
INSERT INTO `dok_district` VALUES ('511181', '峨眉山市', '3', '511100');
INSERT INTO `dok_district` VALUES ('511301', '市辖区', '3', '511300');
INSERT INTO `dok_district` VALUES ('511302', '顺庆区', '3', '511300');
INSERT INTO `dok_district` VALUES ('511303', '高坪区', '3', '511300');
INSERT INTO `dok_district` VALUES ('511304', '嘉陵区', '3', '511300');
INSERT INTO `dok_district` VALUES ('511321', '南部县', '3', '511300');
INSERT INTO `dok_district` VALUES ('511322', '营山县', '3', '511300');
INSERT INTO `dok_district` VALUES ('511323', '蓬安县', '3', '511300');
INSERT INTO `dok_district` VALUES ('511324', '仪陇县', '3', '511300');
INSERT INTO `dok_district` VALUES ('511325', '西充县', '3', '511300');
INSERT INTO `dok_district` VALUES ('511381', '阆中市', '3', '511300');
INSERT INTO `dok_district` VALUES ('511401', '市辖区', '3', '511400');
INSERT INTO `dok_district` VALUES ('511402', '东坡区', '3', '511400');
INSERT INTO `dok_district` VALUES ('511421', '仁寿县', '3', '511400');
INSERT INTO `dok_district` VALUES ('511422', '彭山县', '3', '511400');
INSERT INTO `dok_district` VALUES ('511423', '洪雅县', '3', '511400');
INSERT INTO `dok_district` VALUES ('511424', '丹棱县', '3', '511400');
INSERT INTO `dok_district` VALUES ('511425', '青神县', '3', '511400');
INSERT INTO `dok_district` VALUES ('511501', '市辖区', '3', '511500');
INSERT INTO `dok_district` VALUES ('511502', '翠屏区', '3', '511500');
INSERT INTO `dok_district` VALUES ('511521', '宜宾县', '3', '511500');
INSERT INTO `dok_district` VALUES ('511522', '南溪县', '3', '511500');
INSERT INTO `dok_district` VALUES ('511523', '江安县', '3', '511500');
INSERT INTO `dok_district` VALUES ('511524', '长宁县', '3', '511500');
INSERT INTO `dok_district` VALUES ('511525', '高　县', '3', '511500');
INSERT INTO `dok_district` VALUES ('511526', '珙　县', '3', '511500');
INSERT INTO `dok_district` VALUES ('511527', '筠连县', '3', '511500');
INSERT INTO `dok_district` VALUES ('511528', '兴文县', '3', '511500');
INSERT INTO `dok_district` VALUES ('511529', '屏山县', '3', '511500');
INSERT INTO `dok_district` VALUES ('511601', '市辖区', '3', '511600');
INSERT INTO `dok_district` VALUES ('511602', '广安区', '3', '511600');
INSERT INTO `dok_district` VALUES ('511621', '岳池县', '3', '511600');
INSERT INTO `dok_district` VALUES ('511622', '武胜县', '3', '511600');
INSERT INTO `dok_district` VALUES ('511623', '邻水县', '3', '511600');
INSERT INTO `dok_district` VALUES ('511681', '华莹市', '3', '511600');
INSERT INTO `dok_district` VALUES ('511701', '市辖区', '3', '511700');
INSERT INTO `dok_district` VALUES ('511702', '通川区', '3', '511700');
INSERT INTO `dok_district` VALUES ('511721', '达　县', '3', '511700');
INSERT INTO `dok_district` VALUES ('511722', '宣汉县', '3', '511700');
INSERT INTO `dok_district` VALUES ('511723', '开江县', '3', '511700');
INSERT INTO `dok_district` VALUES ('511724', '大竹县', '3', '511700');
INSERT INTO `dok_district` VALUES ('511725', '渠　县', '3', '511700');
INSERT INTO `dok_district` VALUES ('511781', '万源市', '3', '511700');
INSERT INTO `dok_district` VALUES ('511801', '市辖区', '3', '511800');
INSERT INTO `dok_district` VALUES ('511802', '雨城区', '3', '511800');
INSERT INTO `dok_district` VALUES ('511821', '名山县', '3', '511800');
INSERT INTO `dok_district` VALUES ('511822', '荥经县', '3', '511800');
INSERT INTO `dok_district` VALUES ('511823', '汉源县', '3', '511800');
INSERT INTO `dok_district` VALUES ('511824', '石棉县', '3', '511800');
INSERT INTO `dok_district` VALUES ('511825', '天全县', '3', '511800');
INSERT INTO `dok_district` VALUES ('511826', '芦山县', '3', '511800');
INSERT INTO `dok_district` VALUES ('511827', '宝兴县', '3', '511800');
INSERT INTO `dok_district` VALUES ('511901', '市辖区', '3', '511900');
INSERT INTO `dok_district` VALUES ('511902', '巴州区', '3', '511900');
INSERT INTO `dok_district` VALUES ('511921', '通江县', '3', '511900');
INSERT INTO `dok_district` VALUES ('511922', '南江县', '3', '511900');
INSERT INTO `dok_district` VALUES ('511923', '平昌县', '3', '511900');
INSERT INTO `dok_district` VALUES ('512001', '市辖区', '3', '512000');
INSERT INTO `dok_district` VALUES ('512002', '雁江区', '3', '512000');
INSERT INTO `dok_district` VALUES ('512021', '安岳县', '3', '512000');
INSERT INTO `dok_district` VALUES ('512022', '乐至县', '3', '512000');
INSERT INTO `dok_district` VALUES ('512081', '简阳市', '3', '512000');
INSERT INTO `dok_district` VALUES ('513221', '汶川县', '3', '513200');
INSERT INTO `dok_district` VALUES ('513222', '理　县', '3', '513200');
INSERT INTO `dok_district` VALUES ('513223', '茂　县', '3', '513200');
INSERT INTO `dok_district` VALUES ('513224', '松潘县', '3', '513200');
INSERT INTO `dok_district` VALUES ('513225', '九寨沟县', '3', '513200');
INSERT INTO `dok_district` VALUES ('513226', '金川县', '3', '513200');
INSERT INTO `dok_district` VALUES ('513227', '小金县', '3', '513200');
INSERT INTO `dok_district` VALUES ('513228', '黑水县', '3', '513200');
INSERT INTO `dok_district` VALUES ('513229', '马尔康县', '3', '513200');
INSERT INTO `dok_district` VALUES ('513230', '壤塘县', '3', '513200');
INSERT INTO `dok_district` VALUES ('513231', '阿坝县', '3', '513200');
INSERT INTO `dok_district` VALUES ('513232', '若尔盖县', '3', '513200');
INSERT INTO `dok_district` VALUES ('513233', '红原县', '3', '513200');
INSERT INTO `dok_district` VALUES ('513321', '康定县', '3', '513300');
INSERT INTO `dok_district` VALUES ('513322', '泸定县', '3', '513300');
INSERT INTO `dok_district` VALUES ('513323', '丹巴县', '3', '513300');
INSERT INTO `dok_district` VALUES ('513324', '九龙县', '3', '513300');
INSERT INTO `dok_district` VALUES ('513325', '雅江县', '3', '513300');
INSERT INTO `dok_district` VALUES ('513326', '道孚县', '3', '513300');
INSERT INTO `dok_district` VALUES ('513327', '炉霍县', '3', '513300');
INSERT INTO `dok_district` VALUES ('513328', '甘孜县', '3', '513300');
INSERT INTO `dok_district` VALUES ('513329', '新龙县', '3', '513300');
INSERT INTO `dok_district` VALUES ('513330', '德格县', '3', '513300');
INSERT INTO `dok_district` VALUES ('513331', '白玉县', '3', '513300');
INSERT INTO `dok_district` VALUES ('513332', '石渠县', '3', '513300');
INSERT INTO `dok_district` VALUES ('513333', '色达县', '3', '513300');
INSERT INTO `dok_district` VALUES ('513334', '理塘县', '3', '513300');
INSERT INTO `dok_district` VALUES ('513335', '巴塘县', '3', '513300');
INSERT INTO `dok_district` VALUES ('513336', '乡城县', '3', '513300');
INSERT INTO `dok_district` VALUES ('513337', '稻城县', '3', '513300');
INSERT INTO `dok_district` VALUES ('513338', '得荣县', '3', '513300');
INSERT INTO `dok_district` VALUES ('513401', '西昌市', '3', '513400');
INSERT INTO `dok_district` VALUES ('513422', '木里藏族自治县', '3', '513400');
INSERT INTO `dok_district` VALUES ('513423', '盐源县', '3', '513400');
INSERT INTO `dok_district` VALUES ('513424', '德昌县', '3', '513400');
INSERT INTO `dok_district` VALUES ('513425', '会理县', '3', '513400');
INSERT INTO `dok_district` VALUES ('513426', '会东县', '3', '513400');
INSERT INTO `dok_district` VALUES ('513427', '宁南县', '3', '513400');
INSERT INTO `dok_district` VALUES ('513428', '普格县', '3', '513400');
INSERT INTO `dok_district` VALUES ('513429', '布拖县', '3', '513400');
INSERT INTO `dok_district` VALUES ('513430', '金阳县', '3', '513400');
INSERT INTO `dok_district` VALUES ('513431', '昭觉县', '3', '513400');
INSERT INTO `dok_district` VALUES ('513432', '喜德县', '3', '513400');
INSERT INTO `dok_district` VALUES ('513433', '冕宁县', '3', '513400');
INSERT INTO `dok_district` VALUES ('513434', '越西县', '3', '513400');
INSERT INTO `dok_district` VALUES ('513435', '甘洛县', '3', '513400');
INSERT INTO `dok_district` VALUES ('513436', '美姑县', '3', '513400');
INSERT INTO `dok_district` VALUES ('513437', '雷波县', '3', '513400');
INSERT INTO `dok_district` VALUES ('520101', '市辖区', '3', '520100');
INSERT INTO `dok_district` VALUES ('520102', '南明区', '3', '520100');
INSERT INTO `dok_district` VALUES ('520103', '云岩区', '3', '520100');
INSERT INTO `dok_district` VALUES ('520111', '花溪区', '3', '520100');
INSERT INTO `dok_district` VALUES ('520112', '乌当区', '3', '520100');
INSERT INTO `dok_district` VALUES ('520113', '白云区', '3', '520100');
INSERT INTO `dok_district` VALUES ('520114', '小河区', '3', '520100');
INSERT INTO `dok_district` VALUES ('520121', '开阳县', '3', '520100');
INSERT INTO `dok_district` VALUES ('520122', '息烽县', '3', '520100');
INSERT INTO `dok_district` VALUES ('520123', '修文县', '3', '520100');
INSERT INTO `dok_district` VALUES ('520181', '清镇市', '3', '520100');
INSERT INTO `dok_district` VALUES ('520201', '钟山区', '3', '520200');
INSERT INTO `dok_district` VALUES ('520203', '六枝特区', '3', '520200');
INSERT INTO `dok_district` VALUES ('520221', '水城县', '3', '520200');
INSERT INTO `dok_district` VALUES ('520222', '盘　县', '3', '520200');
INSERT INTO `dok_district` VALUES ('520301', '市辖区', '3', '520300');
INSERT INTO `dok_district` VALUES ('520302', '红花岗区', '3', '520300');
INSERT INTO `dok_district` VALUES ('520303', '汇川区', '3', '520300');
INSERT INTO `dok_district` VALUES ('520321', '遵义县', '3', '520300');
INSERT INTO `dok_district` VALUES ('520322', '桐梓县', '3', '520300');
INSERT INTO `dok_district` VALUES ('520323', '绥阳县', '3', '520300');
INSERT INTO `dok_district` VALUES ('520324', '正安县', '3', '520300');
INSERT INTO `dok_district` VALUES ('520325', '道真仡佬族苗族自治县', '3', '520300');
INSERT INTO `dok_district` VALUES ('520326', '务川仡佬族苗族自治县', '3', '520300');
INSERT INTO `dok_district` VALUES ('520327', '凤冈县', '3', '520300');
INSERT INTO `dok_district` VALUES ('520328', '湄潭县', '3', '520300');
INSERT INTO `dok_district` VALUES ('520329', '余庆县', '3', '520300');
INSERT INTO `dok_district` VALUES ('520330', '习水县', '3', '520300');
INSERT INTO `dok_district` VALUES ('520381', '赤水市', '3', '520300');
INSERT INTO `dok_district` VALUES ('520382', '仁怀市', '3', '520300');
INSERT INTO `dok_district` VALUES ('520401', '市辖区', '3', '520400');
INSERT INTO `dok_district` VALUES ('520402', '西秀区', '3', '520400');
INSERT INTO `dok_district` VALUES ('520421', '平坝县', '3', '520400');
INSERT INTO `dok_district` VALUES ('520422', '普定县', '3', '520400');
INSERT INTO `dok_district` VALUES ('520423', '镇宁布依族苗族自治县', '3', '520400');
INSERT INTO `dok_district` VALUES ('520424', '关岭布依族苗族自治县', '3', '520400');
INSERT INTO `dok_district` VALUES ('520425', '紫云苗族布依族自治县', '3', '520400');
INSERT INTO `dok_district` VALUES ('522201', '铜仁市', '3', '522200');
INSERT INTO `dok_district` VALUES ('522222', '江口县', '3', '522200');
INSERT INTO `dok_district` VALUES ('522223', '玉屏侗族自治县', '3', '522200');
INSERT INTO `dok_district` VALUES ('522224', '石阡县', '3', '522200');
INSERT INTO `dok_district` VALUES ('522225', '思南县', '3', '522200');
INSERT INTO `dok_district` VALUES ('522226', '印江土家族苗族自治县', '3', '522200');
INSERT INTO `dok_district` VALUES ('522227', '德江县', '3', '522200');
INSERT INTO `dok_district` VALUES ('522228', '沿河土家族自治县', '3', '522200');
INSERT INTO `dok_district` VALUES ('522229', '松桃苗族自治县', '3', '522200');
INSERT INTO `dok_district` VALUES ('522230', '万山特区', '3', '522200');
INSERT INTO `dok_district` VALUES ('522301', '兴义市', '3', '522300');
INSERT INTO `dok_district` VALUES ('522322', '兴仁县', '3', '522300');
INSERT INTO `dok_district` VALUES ('522323', '普安县', '3', '522300');
INSERT INTO `dok_district` VALUES ('522324', '晴隆县', '3', '522300');
INSERT INTO `dok_district` VALUES ('522325', '贞丰县', '3', '522300');
INSERT INTO `dok_district` VALUES ('522326', '望谟县', '3', '522300');
INSERT INTO `dok_district` VALUES ('522327', '册亨县', '3', '522300');
INSERT INTO `dok_district` VALUES ('522328', '安龙县', '3', '522300');
INSERT INTO `dok_district` VALUES ('522401', '毕节市', '3', '522400');
INSERT INTO `dok_district` VALUES ('522422', '大方县', '3', '522400');
INSERT INTO `dok_district` VALUES ('522423', '黔西县', '3', '522400');
INSERT INTO `dok_district` VALUES ('522424', '金沙县', '3', '522400');
INSERT INTO `dok_district` VALUES ('522425', '织金县', '3', '522400');
INSERT INTO `dok_district` VALUES ('522426', '纳雍县', '3', '522400');
INSERT INTO `dok_district` VALUES ('522427', '威宁彝族回族苗族自治县', '3', '522400');
INSERT INTO `dok_district` VALUES ('522428', '赫章县', '3', '522400');
INSERT INTO `dok_district` VALUES ('522601', '凯里市', '3', '522600');
INSERT INTO `dok_district` VALUES ('522622', '黄平县', '3', '522600');
INSERT INTO `dok_district` VALUES ('522623', '施秉县', '3', '522600');
INSERT INTO `dok_district` VALUES ('522624', '三穗县', '3', '522600');
INSERT INTO `dok_district` VALUES ('522625', '镇远县', '3', '522600');
INSERT INTO `dok_district` VALUES ('522626', '岑巩县', '3', '522600');
INSERT INTO `dok_district` VALUES ('522627', '天柱县', '3', '522600');
INSERT INTO `dok_district` VALUES ('522628', '锦屏县', '3', '522600');
INSERT INTO `dok_district` VALUES ('522629', '剑河县', '3', '522600');
INSERT INTO `dok_district` VALUES ('522630', '台江县', '3', '522600');
INSERT INTO `dok_district` VALUES ('522631', '黎平县', '3', '522600');
INSERT INTO `dok_district` VALUES ('522632', '榕江县', '3', '522600');
INSERT INTO `dok_district` VALUES ('522633', '从江县', '3', '522600');
INSERT INTO `dok_district` VALUES ('522634', '雷山县', '3', '522600');
INSERT INTO `dok_district` VALUES ('522635', '麻江县', '3', '522600');
INSERT INTO `dok_district` VALUES ('522636', '丹寨县', '3', '522600');
INSERT INTO `dok_district` VALUES ('522701', '都匀市', '3', '522700');
INSERT INTO `dok_district` VALUES ('522702', '福泉市', '3', '522700');
INSERT INTO `dok_district` VALUES ('522722', '荔波县', '3', '522700');
INSERT INTO `dok_district` VALUES ('522723', '贵定县', '3', '522700');
INSERT INTO `dok_district` VALUES ('522725', '瓮安县', '3', '522700');
INSERT INTO `dok_district` VALUES ('522726', '独山县', '3', '522700');
INSERT INTO `dok_district` VALUES ('522727', '平塘县', '3', '522700');
INSERT INTO `dok_district` VALUES ('522728', '罗甸县', '3', '522700');
INSERT INTO `dok_district` VALUES ('522729', '长顺县', '3', '522700');
INSERT INTO `dok_district` VALUES ('522730', '龙里县', '3', '522700');
INSERT INTO `dok_district` VALUES ('522731', '惠水县', '3', '522700');
INSERT INTO `dok_district` VALUES ('522732', '三都水族自治县', '3', '522700');
INSERT INTO `dok_district` VALUES ('530101', '市辖区', '3', '530100');
INSERT INTO `dok_district` VALUES ('530102', '五华区', '3', '530100');
INSERT INTO `dok_district` VALUES ('530103', '盘龙区', '3', '530100');
INSERT INTO `dok_district` VALUES ('530111', '官渡区', '3', '530100');
INSERT INTO `dok_district` VALUES ('530112', '西山区', '3', '530100');
INSERT INTO `dok_district` VALUES ('530113', '东川区', '3', '530100');
INSERT INTO `dok_district` VALUES ('530121', '呈贡县', '3', '530100');
INSERT INTO `dok_district` VALUES ('530122', '晋宁县', '3', '530100');
INSERT INTO `dok_district` VALUES ('530124', '富民县', '3', '530100');
INSERT INTO `dok_district` VALUES ('530125', '宜良县', '3', '530100');
INSERT INTO `dok_district` VALUES ('530126', '石林彝族自治县', '3', '530100');
INSERT INTO `dok_district` VALUES ('530127', '嵩明县', '3', '530100');
INSERT INTO `dok_district` VALUES ('530128', '禄劝彝族苗族自治县', '3', '530100');
INSERT INTO `dok_district` VALUES ('530129', '寻甸回族彝族自治县', '3', '530100');
INSERT INTO `dok_district` VALUES ('530181', '安宁市', '3', '530100');
INSERT INTO `dok_district` VALUES ('530301', '市辖区', '3', '530300');
INSERT INTO `dok_district` VALUES ('530302', '麒麟区', '3', '530300');
INSERT INTO `dok_district` VALUES ('530321', '马龙县', '3', '530300');
INSERT INTO `dok_district` VALUES ('530322', '陆良县', '3', '530300');
INSERT INTO `dok_district` VALUES ('530323', '师宗县', '3', '530300');
INSERT INTO `dok_district` VALUES ('530324', '罗平县', '3', '530300');
INSERT INTO `dok_district` VALUES ('530325', '富源县', '3', '530300');
INSERT INTO `dok_district` VALUES ('530326', '会泽县', '3', '530300');
INSERT INTO `dok_district` VALUES ('530328', '沾益县', '3', '530300');
INSERT INTO `dok_district` VALUES ('530381', '宣威市', '3', '530300');
INSERT INTO `dok_district` VALUES ('530401', '市辖区', '3', '530400');
INSERT INTO `dok_district` VALUES ('530402', '红塔区', '3', '530400');
INSERT INTO `dok_district` VALUES ('530421', '江川县', '3', '530400');
INSERT INTO `dok_district` VALUES ('530422', '澄江县', '3', '530400');
INSERT INTO `dok_district` VALUES ('530423', '通海县', '3', '530400');
INSERT INTO `dok_district` VALUES ('530424', '华宁县', '3', '530400');
INSERT INTO `dok_district` VALUES ('530425', '易门县', '3', '530400');
INSERT INTO `dok_district` VALUES ('530426', '峨山彝族自治县', '3', '530400');
INSERT INTO `dok_district` VALUES ('530427', '新平彝族傣族自治县', '3', '530400');
INSERT INTO `dok_district` VALUES ('530428', '元江哈尼族彝族傣族自治县', '3', '530400');
INSERT INTO `dok_district` VALUES ('530501', '市辖区', '3', '530500');
INSERT INTO `dok_district` VALUES ('530502', '隆阳区', '3', '530500');
INSERT INTO `dok_district` VALUES ('530521', '施甸县', '3', '530500');
INSERT INTO `dok_district` VALUES ('530522', '腾冲县', '3', '530500');
INSERT INTO `dok_district` VALUES ('530523', '龙陵县', '3', '530500');
INSERT INTO `dok_district` VALUES ('530524', '昌宁县', '3', '530500');
INSERT INTO `dok_district` VALUES ('530601', '市辖区', '3', '530600');
INSERT INTO `dok_district` VALUES ('530602', '昭阳区', '3', '530600');
INSERT INTO `dok_district` VALUES ('530621', '鲁甸县', '3', '530600');
INSERT INTO `dok_district` VALUES ('530622', '巧家县', '3', '530600');
INSERT INTO `dok_district` VALUES ('530623', '盐津县', '3', '530600');
INSERT INTO `dok_district` VALUES ('530624', '大关县', '3', '530600');
INSERT INTO `dok_district` VALUES ('530625', '永善县', '3', '530600');
INSERT INTO `dok_district` VALUES ('530626', '绥江县', '3', '530600');
INSERT INTO `dok_district` VALUES ('530627', '镇雄县', '3', '530600');
INSERT INTO `dok_district` VALUES ('530628', '彝良县', '3', '530600');
INSERT INTO `dok_district` VALUES ('530629', '威信县', '3', '530600');
INSERT INTO `dok_district` VALUES ('530630', '水富县', '3', '530600');
INSERT INTO `dok_district` VALUES ('530701', '市辖区', '3', '530700');
INSERT INTO `dok_district` VALUES ('530702', '古城区', '3', '530700');
INSERT INTO `dok_district` VALUES ('530721', '玉龙纳西族自治县', '3', '530700');
INSERT INTO `dok_district` VALUES ('530722', '永胜县', '3', '530700');
INSERT INTO `dok_district` VALUES ('530723', '华坪县', '3', '530700');
INSERT INTO `dok_district` VALUES ('530724', '宁蒗彝族自治县', '3', '530700');
INSERT INTO `dok_district` VALUES ('530801', '市辖区', '3', '530800');
INSERT INTO `dok_district` VALUES ('530802', '翠云区', '3', '530800');
INSERT INTO `dok_district` VALUES ('530821', '普洱哈尼族彝族自治县', '3', '530800');
INSERT INTO `dok_district` VALUES ('530822', '墨江哈尼族自治县', '3', '530800');
INSERT INTO `dok_district` VALUES ('530823', '景东彝族自治县', '3', '530800');
INSERT INTO `dok_district` VALUES ('530824', '景谷傣族彝族自治县', '3', '530800');
INSERT INTO `dok_district` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '3', '530800');
INSERT INTO `dok_district` VALUES ('530826', '江城哈尼族彝族自治县', '3', '530800');
INSERT INTO `dok_district` VALUES ('530827', '孟连傣族拉祜族佤族自治县', '3', '530800');
INSERT INTO `dok_district` VALUES ('530828', '澜沧拉祜族自治县', '3', '530800');
INSERT INTO `dok_district` VALUES ('530829', '西盟佤族自治县', '3', '530800');
INSERT INTO `dok_district` VALUES ('530901', '市辖区', '3', '530900');
INSERT INTO `dok_district` VALUES ('530902', '临翔区', '3', '530900');
INSERT INTO `dok_district` VALUES ('530921', '凤庆县', '3', '530900');
INSERT INTO `dok_district` VALUES ('530922', '云　县', '3', '530900');
INSERT INTO `dok_district` VALUES ('530923', '永德县', '3', '530900');
INSERT INTO `dok_district` VALUES ('530924', '镇康县', '3', '530900');
INSERT INTO `dok_district` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '3', '530900');
INSERT INTO `dok_district` VALUES ('530926', '耿马傣族佤族自治县', '3', '530900');
INSERT INTO `dok_district` VALUES ('530927', '沧源佤族自治县', '3', '530900');
INSERT INTO `dok_district` VALUES ('532301', '楚雄市', '3', '532300');
INSERT INTO `dok_district` VALUES ('532322', '双柏县', '3', '532300');
INSERT INTO `dok_district` VALUES ('532323', '牟定县', '3', '532300');
INSERT INTO `dok_district` VALUES ('532324', '南华县', '3', '532300');
INSERT INTO `dok_district` VALUES ('532325', '姚安县', '3', '532300');
INSERT INTO `dok_district` VALUES ('532326', '大姚县', '3', '532300');
INSERT INTO `dok_district` VALUES ('532327', '永仁县', '3', '532300');
INSERT INTO `dok_district` VALUES ('532328', '元谋县', '3', '532300');
INSERT INTO `dok_district` VALUES ('532329', '武定县', '3', '532300');
INSERT INTO `dok_district` VALUES ('532331', '禄丰县', '3', '532300');
INSERT INTO `dok_district` VALUES ('532501', '个旧市', '3', '532500');
INSERT INTO `dok_district` VALUES ('532502', '开远市', '3', '532500');
INSERT INTO `dok_district` VALUES ('532522', '蒙自县', '3', '532500');
INSERT INTO `dok_district` VALUES ('532523', '屏边苗族自治县', '3', '532500');
INSERT INTO `dok_district` VALUES ('532524', '建水县', '3', '532500');
INSERT INTO `dok_district` VALUES ('532525', '石屏县', '3', '532500');
INSERT INTO `dok_district` VALUES ('532526', '弥勒县', '3', '532500');
INSERT INTO `dok_district` VALUES ('532527', '泸西县', '3', '532500');
INSERT INTO `dok_district` VALUES ('532528', '元阳县', '3', '532500');
INSERT INTO `dok_district` VALUES ('532529', '红河县', '3', '532500');
INSERT INTO `dok_district` VALUES ('532530', '金平苗族瑶族傣族自治县', '3', '532500');
INSERT INTO `dok_district` VALUES ('532531', '绿春县', '3', '532500');
INSERT INTO `dok_district` VALUES ('532532', '河口瑶族自治县', '3', '532500');
INSERT INTO `dok_district` VALUES ('532621', '文山县', '3', '532600');
INSERT INTO `dok_district` VALUES ('532622', '砚山县', '3', '532600');
INSERT INTO `dok_district` VALUES ('532623', '西畴县', '3', '532600');
INSERT INTO `dok_district` VALUES ('532624', '麻栗坡县', '3', '532600');
INSERT INTO `dok_district` VALUES ('532625', '马关县', '3', '532600');
INSERT INTO `dok_district` VALUES ('532626', '丘北县', '3', '532600');
INSERT INTO `dok_district` VALUES ('532627', '广南县', '3', '532600');
INSERT INTO `dok_district` VALUES ('532628', '富宁县', '3', '532600');
INSERT INTO `dok_district` VALUES ('532801', '景洪市', '3', '532800');
INSERT INTO `dok_district` VALUES ('532822', '勐海县', '3', '532800');
INSERT INTO `dok_district` VALUES ('532823', '勐腊县', '3', '532800');
INSERT INTO `dok_district` VALUES ('532901', '大理市', '3', '532900');
INSERT INTO `dok_district` VALUES ('532922', '漾濞彝族自治县', '3', '532900');
INSERT INTO `dok_district` VALUES ('532923', '祥云县', '3', '532900');
INSERT INTO `dok_district` VALUES ('532924', '宾川县', '3', '532900');
INSERT INTO `dok_district` VALUES ('532925', '弥渡县', '3', '532900');
INSERT INTO `dok_district` VALUES ('532926', '南涧彝族自治县', '3', '532900');
INSERT INTO `dok_district` VALUES ('532927', '巍山彝族回族自治县', '3', '532900');
INSERT INTO `dok_district` VALUES ('532928', '永平县', '3', '532900');
INSERT INTO `dok_district` VALUES ('532929', '云龙县', '3', '532900');
INSERT INTO `dok_district` VALUES ('532930', '洱源县', '3', '532900');
INSERT INTO `dok_district` VALUES ('532931', '剑川县', '3', '532900');
INSERT INTO `dok_district` VALUES ('532932', '鹤庆县', '3', '532900');
INSERT INTO `dok_district` VALUES ('533102', '瑞丽市', '3', '533100');
INSERT INTO `dok_district` VALUES ('533103', '潞西市', '3', '533100');
INSERT INTO `dok_district` VALUES ('533122', '梁河县', '3', '533100');
INSERT INTO `dok_district` VALUES ('533123', '盈江县', '3', '533100');
INSERT INTO `dok_district` VALUES ('533124', '陇川县', '3', '533100');
INSERT INTO `dok_district` VALUES ('533321', '泸水县', '3', '533300');
INSERT INTO `dok_district` VALUES ('533323', '福贡县', '3', '533300');
INSERT INTO `dok_district` VALUES ('533324', '贡山独龙族怒族自治县', '3', '533300');
INSERT INTO `dok_district` VALUES ('533325', '兰坪白族普米族自治县', '3', '533300');
INSERT INTO `dok_district` VALUES ('533421', '香格里拉县', '3', '533400');
INSERT INTO `dok_district` VALUES ('533422', '德钦县', '3', '533400');
INSERT INTO `dok_district` VALUES ('533423', '维西傈僳族自治县', '3', '533400');
INSERT INTO `dok_district` VALUES ('540101', '市辖区', '3', '540100');
INSERT INTO `dok_district` VALUES ('540102', '城关区', '3', '540100');
INSERT INTO `dok_district` VALUES ('540121', '林周县', '3', '540100');
INSERT INTO `dok_district` VALUES ('540122', '当雄县', '3', '540100');
INSERT INTO `dok_district` VALUES ('540123', '尼木县', '3', '540100');
INSERT INTO `dok_district` VALUES ('540124', '曲水县', '3', '540100');
INSERT INTO `dok_district` VALUES ('540125', '堆龙德庆县', '3', '540100');
INSERT INTO `dok_district` VALUES ('540126', '达孜县', '3', '540100');
INSERT INTO `dok_district` VALUES ('540127', '墨竹工卡县', '3', '540100');
INSERT INTO `dok_district` VALUES ('542121', '昌都县', '3', '542100');
INSERT INTO `dok_district` VALUES ('542122', '江达县', '3', '542100');
INSERT INTO `dok_district` VALUES ('542123', '贡觉县', '3', '542100');
INSERT INTO `dok_district` VALUES ('542124', '类乌齐县', '3', '542100');
INSERT INTO `dok_district` VALUES ('542125', '丁青县', '3', '542100');
INSERT INTO `dok_district` VALUES ('542126', '察雅县', '3', '542100');
INSERT INTO `dok_district` VALUES ('542127', '八宿县', '3', '542100');
INSERT INTO `dok_district` VALUES ('542128', '左贡县', '3', '542100');
INSERT INTO `dok_district` VALUES ('542129', '芒康县', '3', '542100');
INSERT INTO `dok_district` VALUES ('542132', '洛隆县', '3', '542100');
INSERT INTO `dok_district` VALUES ('542133', '边坝县', '3', '542100');
INSERT INTO `dok_district` VALUES ('542221', '乃东县', '3', '542200');
INSERT INTO `dok_district` VALUES ('542222', '扎囊县', '3', '542200');
INSERT INTO `dok_district` VALUES ('542223', '贡嘎县', '3', '542200');
INSERT INTO `dok_district` VALUES ('542224', '桑日县', '3', '542200');
INSERT INTO `dok_district` VALUES ('542225', '琼结县', '3', '542200');
INSERT INTO `dok_district` VALUES ('542226', '曲松县', '3', '542200');
INSERT INTO `dok_district` VALUES ('542227', '措美县', '3', '542200');
INSERT INTO `dok_district` VALUES ('542228', '洛扎县', '3', '542200');
INSERT INTO `dok_district` VALUES ('542229', '加查县', '3', '542200');
INSERT INTO `dok_district` VALUES ('542231', '隆子县', '3', '542200');
INSERT INTO `dok_district` VALUES ('542232', '错那县', '3', '542200');
INSERT INTO `dok_district` VALUES ('542233', '浪卡子县', '3', '542200');
INSERT INTO `dok_district` VALUES ('542301', '日喀则市', '3', '542300');
INSERT INTO `dok_district` VALUES ('542322', '南木林县', '3', '542300');
INSERT INTO `dok_district` VALUES ('542323', '江孜县', '3', '542300');
INSERT INTO `dok_district` VALUES ('542324', '定日县', '3', '542300');
INSERT INTO `dok_district` VALUES ('542325', '萨迦县', '3', '542300');
INSERT INTO `dok_district` VALUES ('542326', '拉孜县', '3', '542300');
INSERT INTO `dok_district` VALUES ('542327', '昂仁县', '3', '542300');
INSERT INTO `dok_district` VALUES ('542328', '谢通门县', '3', '542300');
INSERT INTO `dok_district` VALUES ('542329', '白朗县', '3', '542300');
INSERT INTO `dok_district` VALUES ('542330', '仁布县', '3', '542300');
INSERT INTO `dok_district` VALUES ('542331', '康马县', '3', '542300');
INSERT INTO `dok_district` VALUES ('542332', '定结县', '3', '542300');
INSERT INTO `dok_district` VALUES ('542333', '仲巴县', '3', '542300');
INSERT INTO `dok_district` VALUES ('542334', '亚东县', '3', '542300');
INSERT INTO `dok_district` VALUES ('542335', '吉隆县', '3', '542300');
INSERT INTO `dok_district` VALUES ('542336', '聂拉木县', '3', '542300');
INSERT INTO `dok_district` VALUES ('542337', '萨嘎县', '3', '542300');
INSERT INTO `dok_district` VALUES ('542338', '岗巴县', '3', '542300');
INSERT INTO `dok_district` VALUES ('542421', '那曲县', '3', '542400');
INSERT INTO `dok_district` VALUES ('542422', '嘉黎县', '3', '542400');
INSERT INTO `dok_district` VALUES ('542423', '比如县', '3', '542400');
INSERT INTO `dok_district` VALUES ('542424', '聂荣县', '3', '542400');
INSERT INTO `dok_district` VALUES ('542425', '安多县', '3', '542400');
INSERT INTO `dok_district` VALUES ('542426', '申扎县', '3', '542400');
INSERT INTO `dok_district` VALUES ('542427', '索　县', '3', '542400');
INSERT INTO `dok_district` VALUES ('542428', '班戈县', '3', '542400');
INSERT INTO `dok_district` VALUES ('542429', '巴青县', '3', '542400');
INSERT INTO `dok_district` VALUES ('542430', '尼玛县', '3', '542400');
INSERT INTO `dok_district` VALUES ('542521', '普兰县', '3', '542500');
INSERT INTO `dok_district` VALUES ('542522', '札达县', '3', '542500');
INSERT INTO `dok_district` VALUES ('542523', '噶尔县', '3', '542500');
INSERT INTO `dok_district` VALUES ('542524', '日土县', '3', '542500');
INSERT INTO `dok_district` VALUES ('542525', '革吉县', '3', '542500');
INSERT INTO `dok_district` VALUES ('542526', '改则县', '3', '542500');
INSERT INTO `dok_district` VALUES ('542527', '措勤县', '3', '542500');
INSERT INTO `dok_district` VALUES ('542621', '林芝县', '3', '542600');
INSERT INTO `dok_district` VALUES ('542622', '工布江达县', '3', '542600');
INSERT INTO `dok_district` VALUES ('542623', '米林县', '3', '542600');
INSERT INTO `dok_district` VALUES ('542624', '墨脱县', '3', '542600');
INSERT INTO `dok_district` VALUES ('542625', '波密县', '3', '542600');
INSERT INTO `dok_district` VALUES ('542626', '察隅县', '3', '542600');
INSERT INTO `dok_district` VALUES ('542627', '朗　县', '3', '542600');
INSERT INTO `dok_district` VALUES ('610101', '市辖区', '3', '610100');
INSERT INTO `dok_district` VALUES ('610102', '新城区', '3', '610100');
INSERT INTO `dok_district` VALUES ('610103', '碑林区', '3', '610100');
INSERT INTO `dok_district` VALUES ('610104', '莲湖区', '3', '610100');
INSERT INTO `dok_district` VALUES ('610111', '灞桥区', '3', '610100');
INSERT INTO `dok_district` VALUES ('610112', '未央区', '3', '610100');
INSERT INTO `dok_district` VALUES ('610113', '雁塔区', '3', '610100');
INSERT INTO `dok_district` VALUES ('610114', '阎良区', '3', '610100');
INSERT INTO `dok_district` VALUES ('610115', '临潼区', '3', '610100');
INSERT INTO `dok_district` VALUES ('610116', '长安区', '3', '610100');
INSERT INTO `dok_district` VALUES ('610122', '蓝田县', '3', '610100');
INSERT INTO `dok_district` VALUES ('610124', '周至县', '3', '610100');
INSERT INTO `dok_district` VALUES ('610125', '户　县', '3', '610100');
INSERT INTO `dok_district` VALUES ('610126', '高陵县', '3', '610100');
INSERT INTO `dok_district` VALUES ('610201', '市辖区', '3', '610200');
INSERT INTO `dok_district` VALUES ('610202', '王益区', '3', '610200');
INSERT INTO `dok_district` VALUES ('610203', '印台区', '3', '610200');
INSERT INTO `dok_district` VALUES ('610204', '耀州区', '3', '610200');
INSERT INTO `dok_district` VALUES ('610222', '宜君县', '3', '610200');
INSERT INTO `dok_district` VALUES ('610301', '市辖区', '3', '610300');
INSERT INTO `dok_district` VALUES ('610302', '渭滨区', '3', '610300');
INSERT INTO `dok_district` VALUES ('610303', '金台区', '3', '610300');
INSERT INTO `dok_district` VALUES ('610304', '陈仓区', '3', '610300');
INSERT INTO `dok_district` VALUES ('610322', '凤翔县', '3', '610300');
INSERT INTO `dok_district` VALUES ('610323', '岐山县', '3', '610300');
INSERT INTO `dok_district` VALUES ('610324', '扶风县', '3', '610300');
INSERT INTO `dok_district` VALUES ('610326', '眉　县', '3', '610300');
INSERT INTO `dok_district` VALUES ('610327', '陇　县', '3', '610300');
INSERT INTO `dok_district` VALUES ('610328', '千阳县', '3', '610300');
INSERT INTO `dok_district` VALUES ('610329', '麟游县', '3', '610300');
INSERT INTO `dok_district` VALUES ('610330', '凤　县', '3', '610300');
INSERT INTO `dok_district` VALUES ('610331', '太白县', '3', '610300');
INSERT INTO `dok_district` VALUES ('610401', '市辖区', '3', '610400');
INSERT INTO `dok_district` VALUES ('610402', '秦都区', '3', '610400');
INSERT INTO `dok_district` VALUES ('610403', '杨凌区', '3', '610400');
INSERT INTO `dok_district` VALUES ('610404', '渭城区', '3', '610400');
INSERT INTO `dok_district` VALUES ('610422', '三原县', '3', '610400');
INSERT INTO `dok_district` VALUES ('610423', '泾阳县', '3', '610400');
INSERT INTO `dok_district` VALUES ('610424', '乾　县', '3', '610400');
INSERT INTO `dok_district` VALUES ('610425', '礼泉县', '3', '610400');
INSERT INTO `dok_district` VALUES ('610426', '永寿县', '3', '610400');
INSERT INTO `dok_district` VALUES ('610427', '彬　县', '3', '610400');
INSERT INTO `dok_district` VALUES ('610428', '长武县', '3', '610400');
INSERT INTO `dok_district` VALUES ('610429', '旬邑县', '3', '610400');
INSERT INTO `dok_district` VALUES ('610430', '淳化县', '3', '610400');
INSERT INTO `dok_district` VALUES ('610431', '武功县', '3', '610400');
INSERT INTO `dok_district` VALUES ('610481', '兴平市', '3', '610400');
INSERT INTO `dok_district` VALUES ('610501', '市辖区', '3', '610500');
INSERT INTO `dok_district` VALUES ('610502', '临渭区', '3', '610500');
INSERT INTO `dok_district` VALUES ('610521', '华　县', '3', '610500');
INSERT INTO `dok_district` VALUES ('610522', '潼关县', '3', '610500');
INSERT INTO `dok_district` VALUES ('610523', '大荔县', '3', '610500');
INSERT INTO `dok_district` VALUES ('610524', '合阳县', '3', '610500');
INSERT INTO `dok_district` VALUES ('610525', '澄城县', '3', '610500');
INSERT INTO `dok_district` VALUES ('610526', '蒲城县', '3', '610500');
INSERT INTO `dok_district` VALUES ('610527', '白水县', '3', '610500');
INSERT INTO `dok_district` VALUES ('610528', '富平县', '3', '610500');
INSERT INTO `dok_district` VALUES ('610581', '韩城市', '3', '610500');
INSERT INTO `dok_district` VALUES ('610582', '华阴市', '3', '610500');
INSERT INTO `dok_district` VALUES ('610601', '市辖区', '3', '610600');
INSERT INTO `dok_district` VALUES ('610602', '宝塔区', '3', '610600');
INSERT INTO `dok_district` VALUES ('610621', '延长县', '3', '610600');
INSERT INTO `dok_district` VALUES ('610622', '延川县', '3', '610600');
INSERT INTO `dok_district` VALUES ('610623', '子长县', '3', '610600');
INSERT INTO `dok_district` VALUES ('610624', '安塞县', '3', '610600');
INSERT INTO `dok_district` VALUES ('610625', '志丹县', '3', '610600');
INSERT INTO `dok_district` VALUES ('610626', '吴旗县', '3', '610600');
INSERT INTO `dok_district` VALUES ('610627', '甘泉县', '3', '610600');
INSERT INTO `dok_district` VALUES ('610628', '富　县', '3', '610600');
INSERT INTO `dok_district` VALUES ('610629', '洛川县', '3', '610600');
INSERT INTO `dok_district` VALUES ('610630', '宜川县', '3', '610600');
INSERT INTO `dok_district` VALUES ('610631', '黄龙县', '3', '610600');
INSERT INTO `dok_district` VALUES ('610632', '黄陵县', '3', '610600');
INSERT INTO `dok_district` VALUES ('610701', '市辖区', '3', '610700');
INSERT INTO `dok_district` VALUES ('610702', '汉台区', '3', '610700');
INSERT INTO `dok_district` VALUES ('610721', '南郑县', '3', '610700');
INSERT INTO `dok_district` VALUES ('610722', '城固县', '3', '610700');
INSERT INTO `dok_district` VALUES ('610723', '洋　县', '3', '610700');
INSERT INTO `dok_district` VALUES ('610724', '西乡县', '3', '610700');
INSERT INTO `dok_district` VALUES ('610725', '勉　县', '3', '610700');
INSERT INTO `dok_district` VALUES ('610726', '宁强县', '3', '610700');
INSERT INTO `dok_district` VALUES ('610727', '略阳县', '3', '610700');
INSERT INTO `dok_district` VALUES ('610728', '镇巴县', '3', '610700');
INSERT INTO `dok_district` VALUES ('610729', '留坝县', '3', '610700');
INSERT INTO `dok_district` VALUES ('610730', '佛坪县', '3', '610700');
INSERT INTO `dok_district` VALUES ('610801', '市辖区', '3', '610800');
INSERT INTO `dok_district` VALUES ('610802', '榆阳区', '3', '610800');
INSERT INTO `dok_district` VALUES ('610821', '神木县', '3', '610800');
INSERT INTO `dok_district` VALUES ('610822', '府谷县', '3', '610800');
INSERT INTO `dok_district` VALUES ('610823', '横山县', '3', '610800');
INSERT INTO `dok_district` VALUES ('610824', '靖边县', '3', '610800');
INSERT INTO `dok_district` VALUES ('610825', '定边县', '3', '610800');
INSERT INTO `dok_district` VALUES ('610826', '绥德县', '3', '610800');
INSERT INTO `dok_district` VALUES ('610827', '米脂县', '3', '610800');
INSERT INTO `dok_district` VALUES ('610828', '佳　县', '3', '610800');
INSERT INTO `dok_district` VALUES ('610829', '吴堡县', '3', '610800');
INSERT INTO `dok_district` VALUES ('610830', '清涧县', '3', '610800');
INSERT INTO `dok_district` VALUES ('610831', '子洲县', '3', '610800');
INSERT INTO `dok_district` VALUES ('610901', '市辖区', '3', '610900');
INSERT INTO `dok_district` VALUES ('610902', '汉滨区', '3', '610900');
INSERT INTO `dok_district` VALUES ('610921', '汉阴县', '3', '610900');
INSERT INTO `dok_district` VALUES ('610922', '石泉县', '3', '610900');
INSERT INTO `dok_district` VALUES ('610923', '宁陕县', '3', '610900');
INSERT INTO `dok_district` VALUES ('610924', '紫阳县', '3', '610900');
INSERT INTO `dok_district` VALUES ('610925', '岚皋县', '3', '610900');
INSERT INTO `dok_district` VALUES ('610926', '平利县', '3', '610900');
INSERT INTO `dok_district` VALUES ('610927', '镇坪县', '3', '610900');
INSERT INTO `dok_district` VALUES ('610928', '旬阳县', '3', '610900');
INSERT INTO `dok_district` VALUES ('610929', '白河县', '3', '610900');
INSERT INTO `dok_district` VALUES ('611001', '市辖区', '3', '611000');
INSERT INTO `dok_district` VALUES ('611002', '商州区', '3', '611000');
INSERT INTO `dok_district` VALUES ('611021', '洛南县', '3', '611000');
INSERT INTO `dok_district` VALUES ('611022', '丹凤县', '3', '611000');
INSERT INTO `dok_district` VALUES ('611023', '商南县', '3', '611000');
INSERT INTO `dok_district` VALUES ('611024', '山阳县', '3', '611000');
INSERT INTO `dok_district` VALUES ('611025', '镇安县', '3', '611000');
INSERT INTO `dok_district` VALUES ('611026', '柞水县', '3', '611000');
INSERT INTO `dok_district` VALUES ('620101', '市辖区', '3', '620100');
INSERT INTO `dok_district` VALUES ('620102', '城关区', '3', '620100');
INSERT INTO `dok_district` VALUES ('620103', '七里河区', '3', '620100');
INSERT INTO `dok_district` VALUES ('620104', '西固区', '3', '620100');
INSERT INTO `dok_district` VALUES ('620105', '安宁区', '3', '620100');
INSERT INTO `dok_district` VALUES ('620111', '红古区', '3', '620100');
INSERT INTO `dok_district` VALUES ('620121', '永登县', '3', '620100');
INSERT INTO `dok_district` VALUES ('620122', '皋兰县', '3', '620100');
INSERT INTO `dok_district` VALUES ('620123', '榆中县', '3', '620100');
INSERT INTO `dok_district` VALUES ('620201', '市辖区', '3', '620200');
INSERT INTO `dok_district` VALUES ('620301', '市辖区', '3', '620300');
INSERT INTO `dok_district` VALUES ('620302', '金川区', '3', '620300');
INSERT INTO `dok_district` VALUES ('620321', '永昌县', '3', '620300');
INSERT INTO `dok_district` VALUES ('620401', '市辖区', '3', '620400');
INSERT INTO `dok_district` VALUES ('620402', '白银区', '3', '620400');
INSERT INTO `dok_district` VALUES ('620403', '平川区', '3', '620400');
INSERT INTO `dok_district` VALUES ('620421', '靖远县', '3', '620400');
INSERT INTO `dok_district` VALUES ('620422', '会宁县', '3', '620400');
INSERT INTO `dok_district` VALUES ('620423', '景泰县', '3', '620400');
INSERT INTO `dok_district` VALUES ('620501', '市辖区', '3', '620500');
INSERT INTO `dok_district` VALUES ('620502', '秦城区', '3', '620500');
INSERT INTO `dok_district` VALUES ('620503', '北道区', '3', '620500');
INSERT INTO `dok_district` VALUES ('620521', '清水县', '3', '620500');
INSERT INTO `dok_district` VALUES ('620522', '秦安县', '3', '620500');
INSERT INTO `dok_district` VALUES ('620523', '甘谷县', '3', '620500');
INSERT INTO `dok_district` VALUES ('620524', '武山县', '3', '620500');
INSERT INTO `dok_district` VALUES ('620525', '张家川回族自治县', '3', '620500');
INSERT INTO `dok_district` VALUES ('620601', '市辖区', '3', '620600');
INSERT INTO `dok_district` VALUES ('620602', '凉州区', '3', '620600');
INSERT INTO `dok_district` VALUES ('620621', '民勤县', '3', '620600');
INSERT INTO `dok_district` VALUES ('620622', '古浪县', '3', '620600');
INSERT INTO `dok_district` VALUES ('620623', '天祝藏族自治县', '3', '620600');
INSERT INTO `dok_district` VALUES ('620701', '市辖区', '3', '620700');
INSERT INTO `dok_district` VALUES ('620702', '甘州区', '3', '620700');
INSERT INTO `dok_district` VALUES ('620721', '肃南裕固族自治县', '3', '620700');
INSERT INTO `dok_district` VALUES ('620722', '民乐县', '3', '620700');
INSERT INTO `dok_district` VALUES ('620723', '临泽县', '3', '620700');
INSERT INTO `dok_district` VALUES ('620724', '高台县', '3', '620700');
INSERT INTO `dok_district` VALUES ('620725', '山丹县', '3', '620700');
INSERT INTO `dok_district` VALUES ('620801', '市辖区', '3', '620800');
INSERT INTO `dok_district` VALUES ('620802', '崆峒区', '3', '620800');
INSERT INTO `dok_district` VALUES ('620821', '泾川县', '3', '620800');
INSERT INTO `dok_district` VALUES ('620822', '灵台县', '3', '620800');
INSERT INTO `dok_district` VALUES ('620823', '崇信县', '3', '620800');
INSERT INTO `dok_district` VALUES ('620824', '华亭县', '3', '620800');
INSERT INTO `dok_district` VALUES ('620825', '庄浪县', '3', '620800');
INSERT INTO `dok_district` VALUES ('620826', '静宁县', '3', '620800');
INSERT INTO `dok_district` VALUES ('620901', '市辖区', '3', '620900');
INSERT INTO `dok_district` VALUES ('620902', '肃州区', '3', '620900');
INSERT INTO `dok_district` VALUES ('620921', '金塔县', '3', '620900');
INSERT INTO `dok_district` VALUES ('620922', '安西县', '3', '620900');
INSERT INTO `dok_district` VALUES ('620923', '肃北蒙古族自治县', '3', '620900');
INSERT INTO `dok_district` VALUES ('620924', '阿克塞哈萨克族自治县', '3', '620900');
INSERT INTO `dok_district` VALUES ('620981', '玉门市', '3', '620900');
INSERT INTO `dok_district` VALUES ('620982', '敦煌市', '3', '620900');
INSERT INTO `dok_district` VALUES ('621001', '市辖区', '3', '621000');
INSERT INTO `dok_district` VALUES ('621002', '西峰区', '3', '621000');
INSERT INTO `dok_district` VALUES ('621021', '庆城县', '3', '621000');
INSERT INTO `dok_district` VALUES ('621022', '环　县', '3', '621000');
INSERT INTO `dok_district` VALUES ('621023', '华池县', '3', '621000');
INSERT INTO `dok_district` VALUES ('621024', '合水县', '3', '621000');
INSERT INTO `dok_district` VALUES ('621025', '正宁县', '3', '621000');
INSERT INTO `dok_district` VALUES ('621026', '宁　县', '3', '621000');
INSERT INTO `dok_district` VALUES ('621027', '镇原县', '3', '621000');
INSERT INTO `dok_district` VALUES ('621101', '市辖区', '3', '621100');
INSERT INTO `dok_district` VALUES ('621102', '安定区', '3', '621100');
INSERT INTO `dok_district` VALUES ('621121', '通渭县', '3', '621100');
INSERT INTO `dok_district` VALUES ('621122', '陇西县', '3', '621100');
INSERT INTO `dok_district` VALUES ('621123', '渭源县', '3', '621100');
INSERT INTO `dok_district` VALUES ('621124', '临洮县', '3', '621100');
INSERT INTO `dok_district` VALUES ('621125', '漳　县', '3', '621100');
INSERT INTO `dok_district` VALUES ('621126', '岷　县', '3', '621100');
INSERT INTO `dok_district` VALUES ('621201', '市辖区', '3', '621200');
INSERT INTO `dok_district` VALUES ('621202', '武都区', '3', '621200');
INSERT INTO `dok_district` VALUES ('621221', '成　县', '3', '621200');
INSERT INTO `dok_district` VALUES ('621222', '文　县', '3', '621200');
INSERT INTO `dok_district` VALUES ('621223', '宕昌县', '3', '621200');
INSERT INTO `dok_district` VALUES ('621224', '康　县', '3', '621200');
INSERT INTO `dok_district` VALUES ('621225', '西和县', '3', '621200');
INSERT INTO `dok_district` VALUES ('621226', '礼　县', '3', '621200');
INSERT INTO `dok_district` VALUES ('621227', '徽　县', '3', '621200');
INSERT INTO `dok_district` VALUES ('621228', '两当县', '3', '621200');
INSERT INTO `dok_district` VALUES ('622901', '临夏市', '3', '622900');
INSERT INTO `dok_district` VALUES ('622921', '临夏县', '3', '622900');
INSERT INTO `dok_district` VALUES ('622922', '康乐县', '3', '622900');
INSERT INTO `dok_district` VALUES ('622923', '永靖县', '3', '622900');
INSERT INTO `dok_district` VALUES ('622924', '广河县', '3', '622900');
INSERT INTO `dok_district` VALUES ('622925', '和政县', '3', '622900');
INSERT INTO `dok_district` VALUES ('622926', '东乡族自治县', '3', '622900');
INSERT INTO `dok_district` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '3', '622900');
INSERT INTO `dok_district` VALUES ('623001', '合作市', '3', '623000');
INSERT INTO `dok_district` VALUES ('623021', '临潭县', '3', '623000');
INSERT INTO `dok_district` VALUES ('623022', '卓尼县', '3', '623000');
INSERT INTO `dok_district` VALUES ('623023', '舟曲县', '3', '623000');
INSERT INTO `dok_district` VALUES ('623024', '迭部县', '3', '623000');
INSERT INTO `dok_district` VALUES ('623025', '玛曲县', '3', '623000');
INSERT INTO `dok_district` VALUES ('623026', '碌曲县', '3', '623000');
INSERT INTO `dok_district` VALUES ('623027', '夏河县', '3', '623000');
INSERT INTO `dok_district` VALUES ('630101', '市辖区', '3', '630100');
INSERT INTO `dok_district` VALUES ('630102', '城东区', '3', '630100');
INSERT INTO `dok_district` VALUES ('630103', '城中区', '3', '630100');
INSERT INTO `dok_district` VALUES ('630104', '城西区', '3', '630100');
INSERT INTO `dok_district` VALUES ('630105', '城北区', '3', '630100');
INSERT INTO `dok_district` VALUES ('630121', '大通回族土族自治县', '3', '630100');
INSERT INTO `dok_district` VALUES ('630122', '湟中县', '3', '630100');
INSERT INTO `dok_district` VALUES ('630123', '湟源县', '3', '630100');
INSERT INTO `dok_district` VALUES ('632121', '平安县', '3', '632100');
INSERT INTO `dok_district` VALUES ('632122', '民和回族土族自治县', '3', '632100');
INSERT INTO `dok_district` VALUES ('632123', '乐都县', '3', '632100');
INSERT INTO `dok_district` VALUES ('632126', '互助土族自治县', '3', '632100');
INSERT INTO `dok_district` VALUES ('632127', '化隆回族自治县', '3', '632100');
INSERT INTO `dok_district` VALUES ('632128', '循化撒拉族自治县', '3', '632100');
INSERT INTO `dok_district` VALUES ('632221', '门源回族自治县', '3', '632200');
INSERT INTO `dok_district` VALUES ('632222', '祁连县', '3', '632200');
INSERT INTO `dok_district` VALUES ('632223', '海晏县', '3', '632200');
INSERT INTO `dok_district` VALUES ('632224', '刚察县', '3', '632200');
INSERT INTO `dok_district` VALUES ('632321', '同仁县', '3', '632300');
INSERT INTO `dok_district` VALUES ('632322', '尖扎县', '3', '632300');
INSERT INTO `dok_district` VALUES ('632323', '泽库县', '3', '632300');
INSERT INTO `dok_district` VALUES ('632324', '河南蒙古族自治县', '3', '632300');
INSERT INTO `dok_district` VALUES ('632521', '共和县', '3', '632500');
INSERT INTO `dok_district` VALUES ('632522', '同德县', '3', '632500');
INSERT INTO `dok_district` VALUES ('632523', '贵德县', '3', '632500');
INSERT INTO `dok_district` VALUES ('632524', '兴海县', '3', '632500');
INSERT INTO `dok_district` VALUES ('632525', '贵南县', '3', '632500');
INSERT INTO `dok_district` VALUES ('632621', '玛沁县', '3', '632600');
INSERT INTO `dok_district` VALUES ('632622', '班玛县', '3', '632600');
INSERT INTO `dok_district` VALUES ('632623', '甘德县', '3', '632600');
INSERT INTO `dok_district` VALUES ('632624', '达日县', '3', '632600');
INSERT INTO `dok_district` VALUES ('632625', '久治县', '3', '632600');
INSERT INTO `dok_district` VALUES ('632626', '玛多县', '3', '632600');
INSERT INTO `dok_district` VALUES ('632721', '玉树县', '3', '632700');
INSERT INTO `dok_district` VALUES ('632722', '杂多县', '3', '632700');
INSERT INTO `dok_district` VALUES ('632723', '称多县', '3', '632700');
INSERT INTO `dok_district` VALUES ('632724', '治多县', '3', '632700');
INSERT INTO `dok_district` VALUES ('632725', '囊谦县', '3', '632700');
INSERT INTO `dok_district` VALUES ('632726', '曲麻莱县', '3', '632700');
INSERT INTO `dok_district` VALUES ('632801', '格尔木市', '3', '632800');
INSERT INTO `dok_district` VALUES ('632802', '德令哈市', '3', '632800');
INSERT INTO `dok_district` VALUES ('632821', '乌兰县', '3', '632800');
INSERT INTO `dok_district` VALUES ('632822', '都兰县', '3', '632800');
INSERT INTO `dok_district` VALUES ('632823', '天峻县', '3', '632800');
INSERT INTO `dok_district` VALUES ('640101', '市辖区', '3', '640100');
INSERT INTO `dok_district` VALUES ('640104', '兴庆区', '3', '640100');
INSERT INTO `dok_district` VALUES ('640105', '西夏区', '3', '640100');
INSERT INTO `dok_district` VALUES ('640106', '金凤区', '3', '640100');
INSERT INTO `dok_district` VALUES ('640121', '永宁县', '3', '640100');
INSERT INTO `dok_district` VALUES ('640122', '贺兰县', '3', '640100');
INSERT INTO `dok_district` VALUES ('640181', '灵武市', '3', '640100');
INSERT INTO `dok_district` VALUES ('640201', '市辖区', '3', '640200');
INSERT INTO `dok_district` VALUES ('640202', '大武口区', '3', '640200');
INSERT INTO `dok_district` VALUES ('640205', '惠农区', '3', '640200');
INSERT INTO `dok_district` VALUES ('640221', '平罗县', '3', '640200');
INSERT INTO `dok_district` VALUES ('640301', '市辖区', '3', '640300');
INSERT INTO `dok_district` VALUES ('640302', '利通区', '3', '640300');
INSERT INTO `dok_district` VALUES ('640323', '盐池县', '3', '640300');
INSERT INTO `dok_district` VALUES ('640324', '同心县', '3', '640300');
INSERT INTO `dok_district` VALUES ('640381', '青铜峡市', '3', '640300');
INSERT INTO `dok_district` VALUES ('640401', '市辖区', '3', '640400');
INSERT INTO `dok_district` VALUES ('640402', '原州区', '3', '640400');
INSERT INTO `dok_district` VALUES ('640422', '西吉县', '3', '640400');
INSERT INTO `dok_district` VALUES ('640423', '隆德县', '3', '640400');
INSERT INTO `dok_district` VALUES ('640424', '泾源县', '3', '640400');
INSERT INTO `dok_district` VALUES ('640425', '彭阳县', '3', '640400');
INSERT INTO `dok_district` VALUES ('640501', '市辖区', '3', '640500');
INSERT INTO `dok_district` VALUES ('640502', '沙坡头区', '3', '640500');
INSERT INTO `dok_district` VALUES ('640521', '中宁县', '3', '640500');
INSERT INTO `dok_district` VALUES ('640522', '海原县', '3', '640500');
INSERT INTO `dok_district` VALUES ('650101', '市辖区', '3', '650100');
INSERT INTO `dok_district` VALUES ('650102', '天山区', '3', '650100');
INSERT INTO `dok_district` VALUES ('650103', '沙依巴克区', '3', '650100');
INSERT INTO `dok_district` VALUES ('650104', '新市区', '3', '650100');
INSERT INTO `dok_district` VALUES ('650105', '水磨沟区', '3', '650100');
INSERT INTO `dok_district` VALUES ('650106', '头屯河区', '3', '650100');
INSERT INTO `dok_district` VALUES ('650107', '达坂城区', '3', '650100');
INSERT INTO `dok_district` VALUES ('650108', '东山区', '3', '650100');
INSERT INTO `dok_district` VALUES ('650121', '乌鲁木齐县', '3', '650100');
INSERT INTO `dok_district` VALUES ('650201', '市辖区', '3', '650200');
INSERT INTO `dok_district` VALUES ('650202', '独山子区', '3', '650200');
INSERT INTO `dok_district` VALUES ('650203', '克拉玛依区', '3', '650200');
INSERT INTO `dok_district` VALUES ('650204', '白碱滩区', '3', '650200');
INSERT INTO `dok_district` VALUES ('650205', '乌尔禾区', '3', '650200');
INSERT INTO `dok_district` VALUES ('652101', '吐鲁番市', '3', '652100');
INSERT INTO `dok_district` VALUES ('652122', '鄯善县', '3', '652100');
INSERT INTO `dok_district` VALUES ('652123', '托克逊县', '3', '652100');
INSERT INTO `dok_district` VALUES ('652201', '哈密市', '3', '652200');
INSERT INTO `dok_district` VALUES ('652222', '巴里坤哈萨克自治县', '3', '652200');
INSERT INTO `dok_district` VALUES ('652223', '伊吾县', '3', '652200');
INSERT INTO `dok_district` VALUES ('652301', '昌吉市', '3', '652300');
INSERT INTO `dok_district` VALUES ('652302', '阜康市', '3', '652300');
INSERT INTO `dok_district` VALUES ('652303', '米泉市', '3', '652300');
INSERT INTO `dok_district` VALUES ('652323', '呼图壁县', '3', '652300');
INSERT INTO `dok_district` VALUES ('652324', '玛纳斯县', '3', '652300');
INSERT INTO `dok_district` VALUES ('652325', '奇台县', '3', '652300');
INSERT INTO `dok_district` VALUES ('652327', '吉木萨尔县', '3', '652300');
INSERT INTO `dok_district` VALUES ('652328', '木垒哈萨克自治县', '3', '652300');
INSERT INTO `dok_district` VALUES ('652701', '博乐市', '3', '652700');
INSERT INTO `dok_district` VALUES ('652722', '精河县', '3', '652700');
INSERT INTO `dok_district` VALUES ('652723', '温泉县', '3', '652700');
INSERT INTO `dok_district` VALUES ('652801', '库尔勒市', '3', '652800');
INSERT INTO `dok_district` VALUES ('652822', '轮台县', '3', '652800');
INSERT INTO `dok_district` VALUES ('652823', '尉犁县', '3', '652800');
INSERT INTO `dok_district` VALUES ('652824', '若羌县', '3', '652800');
INSERT INTO `dok_district` VALUES ('652825', '且末县', '3', '652800');
INSERT INTO `dok_district` VALUES ('652826', '焉耆回族自治县', '3', '652800');
INSERT INTO `dok_district` VALUES ('652827', '和静县', '3', '652800');
INSERT INTO `dok_district` VALUES ('652828', '和硕县', '3', '652800');
INSERT INTO `dok_district` VALUES ('652829', '博湖县', '3', '652800');
INSERT INTO `dok_district` VALUES ('652901', '阿克苏市', '3', '652900');
INSERT INTO `dok_district` VALUES ('652922', '温宿县', '3', '652900');
INSERT INTO `dok_district` VALUES ('652923', '库车县', '3', '652900');
INSERT INTO `dok_district` VALUES ('652924', '沙雅县', '3', '652900');
INSERT INTO `dok_district` VALUES ('652925', '新和县', '3', '652900');
INSERT INTO `dok_district` VALUES ('652926', '拜城县', '3', '652900');
INSERT INTO `dok_district` VALUES ('652927', '乌什县', '3', '652900');
INSERT INTO `dok_district` VALUES ('652928', '阿瓦提县', '3', '652900');
INSERT INTO `dok_district` VALUES ('652929', '柯坪县', '3', '652900');
INSERT INTO `dok_district` VALUES ('653001', '阿图什市', '3', '653000');
INSERT INTO `dok_district` VALUES ('653022', '阿克陶县', '3', '653000');
INSERT INTO `dok_district` VALUES ('653023', '阿合奇县', '3', '653000');
INSERT INTO `dok_district` VALUES ('653024', '乌恰县', '3', '653000');
INSERT INTO `dok_district` VALUES ('653101', '喀什市', '3', '653100');
INSERT INTO `dok_district` VALUES ('653121', '疏附县', '3', '653100');
INSERT INTO `dok_district` VALUES ('653122', '疏勒县', '3', '653100');
INSERT INTO `dok_district` VALUES ('653123', '英吉沙县', '3', '653100');
INSERT INTO `dok_district` VALUES ('653124', '泽普县', '3', '653100');
INSERT INTO `dok_district` VALUES ('653125', '莎车县', '3', '653100');
INSERT INTO `dok_district` VALUES ('653126', '叶城县', '3', '653100');
INSERT INTO `dok_district` VALUES ('653127', '麦盖提县', '3', '653100');
INSERT INTO `dok_district` VALUES ('653128', '岳普湖县', '3', '653100');
INSERT INTO `dok_district` VALUES ('653129', '伽师县', '3', '653100');
INSERT INTO `dok_district` VALUES ('653130', '巴楚县', '3', '653100');
INSERT INTO `dok_district` VALUES ('653131', '塔什库尔干塔吉克自治县', '3', '653100');
INSERT INTO `dok_district` VALUES ('653201', '和田市', '3', '653200');
INSERT INTO `dok_district` VALUES ('653221', '和田县', '3', '653200');
INSERT INTO `dok_district` VALUES ('653222', '墨玉县', '3', '653200');
INSERT INTO `dok_district` VALUES ('653223', '皮山县', '3', '653200');
INSERT INTO `dok_district` VALUES ('653224', '洛浦县', '3', '653200');
INSERT INTO `dok_district` VALUES ('653225', '策勒县', '3', '653200');
INSERT INTO `dok_district` VALUES ('653226', '于田县', '3', '653200');
INSERT INTO `dok_district` VALUES ('653227', '民丰县', '3', '653200');
INSERT INTO `dok_district` VALUES ('654002', '伊宁市', '3', '654000');
INSERT INTO `dok_district` VALUES ('654003', '奎屯市', '3', '654000');
INSERT INTO `dok_district` VALUES ('654021', '伊宁县', '3', '654000');
INSERT INTO `dok_district` VALUES ('654022', '察布查尔锡伯自治县', '3', '654000');
INSERT INTO `dok_district` VALUES ('654023', '霍城县', '3', '654000');
INSERT INTO `dok_district` VALUES ('654024', '巩留县', '3', '654000');
INSERT INTO `dok_district` VALUES ('654025', '新源县', '3', '654000');
INSERT INTO `dok_district` VALUES ('654026', '昭苏县', '3', '654000');
INSERT INTO `dok_district` VALUES ('654027', '特克斯县', '3', '654000');
INSERT INTO `dok_district` VALUES ('654028', '尼勒克县', '3', '654000');
INSERT INTO `dok_district` VALUES ('654201', '塔城市', '3', '654200');
INSERT INTO `dok_district` VALUES ('654202', '乌苏市', '3', '654200');
INSERT INTO `dok_district` VALUES ('654221', '额敏县', '3', '654200');
INSERT INTO `dok_district` VALUES ('654223', '沙湾县', '3', '654200');
INSERT INTO `dok_district` VALUES ('654224', '托里县', '3', '654200');
INSERT INTO `dok_district` VALUES ('654225', '裕民县', '3', '654200');
INSERT INTO `dok_district` VALUES ('654226', '和布克赛尔蒙古自治县', '3', '654200');
INSERT INTO `dok_district` VALUES ('654301', '阿勒泰市', '3', '654300');
INSERT INTO `dok_district` VALUES ('654321', '布尔津县', '3', '654300');
INSERT INTO `dok_district` VALUES ('654322', '富蕴县', '3', '654300');
INSERT INTO `dok_district` VALUES ('654323', '福海县', '3', '654300');
INSERT INTO `dok_district` VALUES ('654324', '哈巴河县', '3', '654300');
INSERT INTO `dok_district` VALUES ('654325', '青河县', '3', '654300');
INSERT INTO `dok_district` VALUES ('654326', '吉木乃县', '3', '654300');
INSERT INTO `dok_district` VALUES ('659001', '石河子市', '3', '659000');
INSERT INTO `dok_district` VALUES ('659002', '阿拉尔市', '3', '659000');
INSERT INTO `dok_district` VALUES ('659003', '图木舒克市', '3', '659000');
INSERT INTO `dok_district` VALUES ('659004', '五家渠市', '3', '659000');
INSERT INTO `dok_district` VALUES ('810001', '香港', '2', '810000');
INSERT INTO `dok_district` VALUES ('810002', '中西区', '3', '810001');
INSERT INTO `dok_district` VALUES ('810003', '九龙城区', '3', '810001');
INSERT INTO `dok_district` VALUES ('810004', '南区', '3', '810001');
INSERT INTO `dok_district` VALUES ('810005', '黄大仙区', '3', '810001');
INSERT INTO `dok_district` VALUES ('810006', '油尖旺区', '3', '810001');
INSERT INTO `dok_district` VALUES ('810007', '葵青区', '3', '810001');
INSERT INTO `dok_district` VALUES ('810008', '西贡区', '3', '810001');
INSERT INTO `dok_district` VALUES ('810009', '屯门区', '3', '810001');
INSERT INTO `dok_district` VALUES ('810010', '荃湾区', '3', '810001');
INSERT INTO `dok_district` VALUES ('810011', '东区', '3', '810001');
INSERT INTO `dok_district` VALUES ('810012', '观塘区', '3', '810001');
INSERT INTO `dok_district` VALUES ('810013', '深水步区', '3', '810001');
INSERT INTO `dok_district` VALUES ('810014', '湾仔区', '3', '810001');
INSERT INTO `dok_district` VALUES ('810015', '离岛区', '3', '810001');
INSERT INTO `dok_district` VALUES ('810016', '北区', '3', '810001');
INSERT INTO `dok_district` VALUES ('810017', '沙田区', '3', '810001');
INSERT INTO `dok_district` VALUES ('810018', '大埔区', '3', '810001');
INSERT INTO `dok_district` VALUES ('810019', '元朗区', '3', '810001');
INSERT INTO `dok_district` VALUES ('820001', '澳门', '2', '820000');
INSERT INTO `dok_district` VALUES ('820002', '澳门', '3', '820001');
INSERT INTO `dok_district` VALUES ('710001', '台北市', '2', '710000');
INSERT INTO `dok_district` VALUES ('710002', '台北县', '3', '710001');
INSERT INTO `dok_district` VALUES ('710003', '基隆市', '2', '710000');
INSERT INTO `dok_district` VALUES ('910005', '中山市', '3', '442000');
INSERT INTO `dok_district` VALUES ('710004', '花莲县', '3', '710003');
INSERT INTO `dok_district` VALUES ('910006', '东莞市', '3', '441900');

-- ----------------------------
-- Table structure for dok_field
-- ----------------------------
DROP TABLE IF EXISTS `dok_field`;
CREATE TABLE `dok_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `field_data` varchar(1000) NOT NULL,
  `createTime` int(11) NOT NULL,
  `changeTime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_field
-- ----------------------------

-- ----------------------------
-- Table structure for dok_field_group
-- ----------------------------
DROP TABLE IF EXISTS `dok_field_group`;
CREATE TABLE `dok_field_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `visiable` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_field_group
-- ----------------------------
INSERT INTO `dok_field_group` VALUES ('1', '个人资料', '1', '1403847366', '0', '1');
INSERT INTO `dok_field_group` VALUES ('2', '开发者资料', '1', '1423537648', '0', '0');
INSERT INTO `dok_field_group` VALUES ('3', '开源中国资料', '1', '1423538446', '0', '0');

-- ----------------------------
-- Table structure for dok_field_setting
-- ----------------------------
DROP TABLE IF EXISTS `dok_field_setting`;
CREATE TABLE `dok_field_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(25) NOT NULL,
  `profile_group_id` int(11) NOT NULL,
  `visiable` tinyint(4) NOT NULL DEFAULT '1',
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL,
  `form_type` varchar(25) NOT NULL,
  `form_default_value` varchar(200) NOT NULL,
  `validation` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL,
  `child_form_type` varchar(25) NOT NULL,
  `input_tips` varchar(100) NOT NULL COMMENT '输入提示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_field_setting
-- ----------------------------
INSERT INTO `dok_field_setting` VALUES ('1', 'qq', '1', '1', '1', '0', 'input', '', '', '1', '1409045825', 'string', '');
INSERT INTO `dok_field_setting` VALUES ('2', '生日', '1', '1', '1', '0', 'time', '', '', '1', '1423537409', '', '');
INSERT INTO `dok_field_setting` VALUES ('3', '擅长语言', '2', '1', '1', '0', 'select', 'Java|C++|Python|php|object c|ruby', '', '1', '1423537693', '', '');
INSERT INTO `dok_field_setting` VALUES ('4', '承接项目', '2', '1', '1', '0', 'radio', '是|否', '', '1', '1423537733', '', '');
INSERT INTO `dok_field_setting` VALUES ('5', '简介', '2', '1', '1', '0', 'textarea', '', '', '1', '1423537770', '', '简单介绍入行以来的工作经验，项目经验');
INSERT INTO `dok_field_setting` VALUES ('6', '其他技能', '2', '1', '1', '0', 'checkbox', 'PhotoShop|Flash', '', '1', '1423537834', '', '');
INSERT INTO `dok_field_setting` VALUES ('7', '昵称', '3', '1', '1', '0', 'input', '', '', '1', '1423704462', 'string', 'OSC账号昵称');

-- ----------------------------
-- Table structure for dok_file
-- ----------------------------
DROP TABLE IF EXISTS `dok_file`;
CREATE TABLE `dok_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` varchar(100) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` varchar(255) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  `driver` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of dok_file
-- ----------------------------

-- ----------------------------
-- Table structure for dok_follow
-- ----------------------------
DROP TABLE IF EXISTS `dok_follow`;
CREATE TABLE `dok_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `follow_who` int(11) NOT NULL COMMENT '关注谁',
  `who_follow` int(11) NOT NULL COMMENT '谁关注',
  `create_time` int(11) NOT NULL,
  `alias` varchar(40) NOT NULL COMMENT '备注',
  `group_id` int(11) NOT NULL COMMENT '分组ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='关注表';

-- ----------------------------
-- Records of dok_follow
-- ----------------------------

-- ----------------------------
-- Table structure for dok_hooks
-- ----------------------------
DROP TABLE IF EXISTS `dok_hooks`;
CREATE TABLE `dok_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_hooks
-- ----------------------------
INSERT INTO `dok_hooks` VALUES ('38', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '');
INSERT INTO `dok_hooks` VALUES ('39', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'SuperLinks');
INSERT INTO `dok_hooks` VALUES ('40', 'adminEditor', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin');
INSERT INTO `dok_hooks` VALUES ('41', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SyncLogin,DevTeam,SystemInfo,LocalComment');
INSERT INTO `dok_hooks` VALUES ('42', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', '');
INSERT INTO `dok_hooks` VALUES ('43', 'app_begin', '应用开始', '2', '1384481614', 'Iswaf');
INSERT INTO `dok_hooks` VALUES ('44', 'checkIn', '签到', '1', '1395371353', 'CheckIn');
INSERT INTO `dok_hooks` VALUES ('45', 'Rank', '签到排名钩子', '1', '1395387442', 'Rank_checkin');
INSERT INTO `dok_hooks` VALUES ('46', 'support', '赞', '1', '1398264759', 'Support');
INSERT INTO `dok_hooks` VALUES ('47', 'localComment', '本地评论插件', '1', '1399440321', 'LocalComment');
INSERT INTO `dok_hooks` VALUES ('48', 'weiboType', '微博类型', '1', '1409121894', '');
INSERT INTO `dok_hooks` VALUES ('49', 'repost', '转发钩子', '1', '1403668286', '');
INSERT INTO `dok_hooks` VALUES ('50', 'syncLogin', '第三方登陆位置', '1', '1403700579', 'SyncLogin');
INSERT INTO `dok_hooks` VALUES ('51', 'syncMeta', '第三方登陆meta接口', '1', '1403700633', 'SyncLogin');
INSERT INTO `dok_hooks` VALUES ('52', 'J_China_City', '每个系统都需要的一个中国省市区三级联动插件。', '1', '1403841931', 'ChinaCity');
INSERT INTO `dok_hooks` VALUES ('54', 'imageSlider', '图片轮播钩子', '1', '1407144022', '');
INSERT INTO `dok_hooks` VALUES ('55', 'friendLink', '友情链接插件', '1', '1407156413', 'SuperLinks');
INSERT INTO `dok_hooks` VALUES ('56', 'beforeSendWeibo', '在发微博之前预处理微博', '2', '1408084504', 'InsertFile');
INSERT INTO `dok_hooks` VALUES ('57', 'beforeSendRepost', '转发微博前的预处理钩子', '2', '1408085689', '');
INSERT INTO `dok_hooks` VALUES ('58', 'parseWeiboContent', '解析微博内容钩子', '2', '1409121261', '');
INSERT INTO `dok_hooks` VALUES ('59', 'userConfig', '用户配置页面钩子', '1', '1417137557', 'SyncLogin');
INSERT INTO `dok_hooks` VALUES ('60', 'weiboSide', '微博侧边钩子', '1', '1417063425', 'Retopic,Recommend');
INSERT INTO `dok_hooks` VALUES ('61', 'personalMenus', '顶部导航栏个人下拉菜单', '1', '1417146501', '');
INSERT INTO `dok_hooks` VALUES ('62', 'dealPicture', '上传图片处理', '2', '1417139975', '');
INSERT INTO `dok_hooks` VALUES ('63', 'ucenterSideMenu', '用户中心左侧菜单', '1', '1417161205', '');
INSERT INTO `dok_hooks` VALUES ('64', 'afterTop', '顶部导航之后的钩子，调用公告等', '1', '1429671392', '');
INSERT INTO `dok_hooks` VALUES ('65', 'report', '举报钩子', '1', '1429511732', 'Report');
INSERT INTO `dok_hooks` VALUES ('66', 'handleAction', '行为的额外操作', '2', '1433300260', 'CheckIn');
INSERT INTO `dok_hooks` VALUES ('67', 'uploadDriver', '附件图片上传引擎', '2', '1435306269', '');
INSERT INTO `dok_hooks` VALUES ('68', 'sms', '短信插件钩子', '2', '1437382105', '');
INSERT INTO `dok_hooks` VALUES ('69', 'filterHtmlContent', '渲染富文本', '2', '1441951420', '');
INSERT INTO `dok_hooks` VALUES ('70', 'parseContent', '解析内容', '2', '1445828128', 'Sensitive');
INSERT INTO `dok_hooks` VALUES ('71', 'tool', '返回顶部，右下角工具栏', '1', '1445828128', '');

-- ----------------------------
-- Table structure for dok_invite
-- ----------------------------
DROP TABLE IF EXISTS `dok_invite`;
CREATE TABLE `dok_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `invite_type` int(11) NOT NULL COMMENT '邀请类型id',
  `code` varchar(25) NOT NULL COMMENT '邀请码',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `can_num` int(10) NOT NULL COMMENT '可以注册用户（含升级）',
  `already_num` int(10) NOT NULL COMMENT '已经注册用户（含升级）',
  `end_time` int(11) NOT NULL COMMENT '有效期至',
  `status` tinyint(2) NOT NULL COMMENT '0：已用完，1：还可注册，2：用户取消邀请，-1：管理员删除',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邀请码表';

-- ----------------------------
-- Records of dok_invite
-- ----------------------------

-- ----------------------------
-- Table structure for dok_invite_buy_log
-- ----------------------------
DROP TABLE IF EXISTS `dok_invite_buy_log`;
CREATE TABLE `dok_invite_buy_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `invite_type` int(11) NOT NULL COMMENT '邀请类型id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` int(10) NOT NULL COMMENT '可邀请名额',
  `content` varchar(200) NOT NULL COMMENT '记录信息',
  `create_time` int(11) NOT NULL COMMENT '创建时间（做频率用）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户购买邀请名额记录';

-- ----------------------------
-- Records of dok_invite_buy_log
-- ----------------------------

-- ----------------------------
-- Table structure for dok_invite_log
-- ----------------------------
DROP TABLE IF EXISTS `dok_invite_log`;
CREATE TABLE `dok_invite_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `inviter_id` int(11) NOT NULL COMMENT '邀请人id',
  `invite_id` int(11) NOT NULL COMMENT '邀请码id',
  `content` varchar(200) NOT NULL COMMENT '记录内容',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邀请注册成功记录表';

-- ----------------------------
-- Records of dok_invite_log
-- ----------------------------

-- ----------------------------
-- Table structure for dok_invite_type
-- ----------------------------
DROP TABLE IF EXISTS `dok_invite_type`;
CREATE TABLE `dok_invite_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `title` varchar(25) NOT NULL COMMENT '标题',
  `length` int(10) NOT NULL DEFAULT '11' COMMENT '验证码长度',
  `time` varchar(50) NOT NULL COMMENT '有效时长，带单位的时间',
  `cycle_num` int(10) NOT NULL COMMENT '周期内可购买个数',
  `cycle_time` varchar(50) NOT NULL COMMENT '周期时长，带单位的时间',
  `roles` varchar(50) NOT NULL COMMENT '绑定角色ids',
  `auth_groups` varchar(50) NOT NULL COMMENT '允许购买的用户组ids',
  `pay_score` int(10) NOT NULL COMMENT '购买消耗积分',
  `pay_score_type` int(11) NOT NULL COMMENT '购买消耗积分类型',
  `income_score` int(10) NOT NULL COMMENT '每邀请成功一个用户，邀请者增加积分',
  `income_score_type` int(11) NOT NULL COMMENT '邀请成功后增加积分类型id',
  `is_follow` tinyint(2) NOT NULL COMMENT '邀请成功后是否互相关注',
  `status` tinyint(2) NOT NULL,
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邀请注册码类型表';

-- ----------------------------
-- Records of dok_invite_type
-- ----------------------------

-- ----------------------------
-- Table structure for dok_invite_user_info
-- ----------------------------
DROP TABLE IF EXISTS `dok_invite_user_info`;
CREATE TABLE `dok_invite_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `invite_type` int(11) NOT NULL COMMENT '邀请类型id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` int(11) NOT NULL COMMENT '可邀请名额',
  `already_num` int(11) NOT NULL COMMENT '已邀请名额',
  `success_num` int(11) NOT NULL COMMENT '成功邀请名额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邀请注册用户信息';

-- ----------------------------
-- Records of dok_invite_user_info
-- ----------------------------

-- ----------------------------
-- Table structure for dok_issue
-- ----------------------------
DROP TABLE IF EXISTS `dok_issue`;
CREATE TABLE `dok_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `allow_post` tinyint(4) NOT NULL,
  `pid` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_issue
-- ----------------------------
INSERT INTO `dok_issue` VALUES ('13', '默认专辑', '1409712474', '1409712467', '1', '0', '0', '0');
INSERT INTO `dok_issue` VALUES ('14', '默认二级', '1409712480', '1409712475', '1', '0', '13', '0');

-- ----------------------------
-- Table structure for dok_issue_content
-- ----------------------------
DROP TABLE IF EXISTS `dok_issue_content`;
CREATE TABLE `dok_issue_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `view_count` int(11) NOT NULL COMMENT '阅读数量',
  `cover_id` int(11) NOT NULL COMMENT '封面图片id',
  `issue_id` int(11) NOT NULL COMMENT '所在专辑',
  `uid` int(11) NOT NULL COMMENT '发布者id',
  `reply_count` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='专辑内容表';

-- ----------------------------
-- Records of dok_issue_content
-- ----------------------------
INSERT INTO `dok_issue_content` VALUES ('29', 'OpenSNS官方订制门店', '<p><span style=\"color: rgb(53, 53, 53); font-family: &#39;Microsoft YaHei&#39;; font-size: 13px; line-height: 20px; background-color: rgb(255, 255, 255);\">嘉兴奕想信息技术有限公司，opensns官方子公司，是嘉兴想天信息科技有限公司为opensns二次开发专门申请的公司。</span></p>', '7', '3', '14', '1', '0', '1430704938', '1452479973', '1', 'http://os.opensns.cn/appstore/index/shop/id/102.html');
INSERT INTO `dok_issue_content` VALUES ('30', 'OpenSNS官方旗舰店', '<p>OpenCenter和OpenSNS开发商-嘉兴想天信息科技有限公司 官方店，提供卓越品质的服务，服务内容包含二次开发。</p><pre class=\"brush:php;toolbar:false\">public&nbsp;function&nbsp;reload(){\r\n&nbsp;&nbsp;$modules&nbsp;=&nbsp;$this-&gt;select();\r\n&nbsp;&nbsp;foreach&nbsp;($modules&nbsp;as&nbsp;$m)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(file_exists(APP_PATH&nbsp;.&nbsp;&#39;/&#39;&nbsp;.&nbsp;$m[&#39;name&#39;]&nbsp;.&nbsp;&#39;/Info/info.php&#39;))&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$info&nbsp;=&nbsp;array_merge($m,&nbsp;$this-&gt;getInfo($m[&#39;name&#39;]));&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$this-&gt;save($info);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;}&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;$this-&gt;cleanModulesCache();\r\n}</pre>', '13', '2', '14', '1', '0', '1430705543', '1452480316', '1', 'http://os.opensns.cn/appstore/index/shop/id/1.html');

-- ----------------------------
-- Table structure for dok_local_comment
-- ----------------------------
DROP TABLE IF EXISTS `dok_local_comment`;
CREATE TABLE `dok_local_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `app` text NOT NULL,
  `mod` text NOT NULL,
  `row_id` int(11) NOT NULL,
  `parse` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `create_time` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `ip` bigint(20) NOT NULL,
  `area` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_local_comment
-- ----------------------------

-- ----------------------------
-- Table structure for dok_member
-- ----------------------------
DROP TABLE IF EXISTS `dok_member`;
CREATE TABLE `dok_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  `last_login_role` int(11) NOT NULL,
  `show_role` int(11) NOT NULL COMMENT '个人主页显示角色',
  `signature` text NOT NULL,
  `pos_province` int(11) NOT NULL,
  `pos_city` int(11) NOT NULL,
  `pos_district` int(11) NOT NULL,
  `pos_community` int(11) NOT NULL,
  `score1` double DEFAULT '0' COMMENT '用户积分',
  `score2` double DEFAULT '0' COMMENT 'score2',
  `score3` double DEFAULT '0' COMMENT 'score3',
  `score4` double DEFAULT '0' COMMENT 'score4',
  `con_check` int(11) NOT NULL DEFAULT '0',
  `total_check` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`),
  KEY `name` (`nickname`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of dok_member
-- ----------------------------
INSERT INTO `dok_member` VALUES ('1', 'admin', '0', '0000-00-00', '', '1', '0', '1474526801', '0', '1474526801', '1', '1', '1', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for dok_member_public
-- ----------------------------
DROP TABLE IF EXISTS `dok_member_public`;
CREATE TABLE `dok_member_public` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mp_id` varchar(50) NOT NULL COMMENT '公众号检索标识',
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `public_name` varchar(50) NOT NULL COMMENT '公众号名称',
  `public_id` varchar(100) NOT NULL COMMENT '公众号原始id',
  `wechat` varchar(100) NOT NULL COMMENT '微信号',
  `interface_url` varchar(255) NOT NULL COMMENT '接口地址',
  `headface_url` varchar(255) NOT NULL COMMENT '公众号头像',
  `area` varchar(50) NOT NULL COMMENT '地区',
  `addon_config` text NOT NULL COMMENT '插件配置',
  `addon_status` text NOT NULL COMMENT '插件状态',
  `token` varchar(100) NOT NULL COMMENT 'Token',
  `mp_type` char(10) NOT NULL DEFAULT '0' COMMENT '公众号类型',
  `appid` varchar(255) NOT NULL COMMENT 'APPID',
  `secret` varchar(255) NOT NULL COMMENT 'AppSecret',
  `status` tinyint(4) NOT NULL COMMENT '2:未审核，1：启用，0：禁用，-1：删除',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号等级',
  `encodingaeskey` varchar(255) NOT NULL COMMENT 'EncodingAESKey',
  `mchid` varchar(50) NOT NULL COMMENT '支付商户号（微信支付必须配置）',
  `mchkey` varchar(50) NOT NULL COMMENT '商户支付密钥（微信支付必须配置）',
  `notify_url` varchar(255) NOT NULL COMMENT '接收微信支付异步通知的回调地址',
  PRIMARY KEY (`id`),
  KEY `mp_id` (`mp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_member_public
-- ----------------------------

-- ----------------------------
-- Table structure for dok_menu
-- ----------------------------
DROP TABLE IF EXISTS `dok_menu`;
CREATE TABLE `dok_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `icon` varchar(20) NOT NULL COMMENT '导航图标',
  `module` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=10071 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_menu
-- ----------------------------
INSERT INTO `dok_menu` VALUES ('1', '首页', '0', '1', 'Index/index', '0', '', '', '0', 'home', '');
INSERT INTO `dok_menu` VALUES ('2', '用户', '0', '2', 'User/index', '0', '', '', '0', 'user', '');
INSERT INTO `dok_menu` VALUES ('3', '用户信息', '2', '2', 'User/index', '0', '', '用户管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('4', '积分规则', '113', '3', 'User/action', '0', '', '行为管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('5', '新增用户行为', '4', '0', 'User/addaction', '0', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('6', '编辑用户行为', '4', '0', 'User/editaction', '0', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('7', '保存用户行为', '4', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('8', '变更行为状态', '4', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('9', '禁用会员', '4', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('10', '启用会员', '4', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('11', '删除会员', '4', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('12', '用户组管理', '2', '5', 'AuthManager/index', '0', '', '权限管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('13', '删除', '12', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('14', '禁用', '12', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('15', '恢复', '12', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('16', '新增', '12', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('17', '编辑', '12', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('18', '保存用户组', '12', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('19', '授权', '12', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('20', '访问授权', '12', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('21', '成员授权', '12', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('22', '解除授权', '12', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('23', '保存成员授权', '12', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('24', '分类授权', '12', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('25', '保存分类授权', '12', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('26', '模型授权', '12', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('27', '保存模型授权', '12', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('28', '新增权限节点', '12', '0', 'AuthManager/addNode', '1', '', '', '1', '', '');
INSERT INTO `dok_menu` VALUES ('29', '前台权限管理', '12', '0', 'AuthManager/accessUser', '1', '', '权限管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('30', '删除权限节点', '12', '0', 'AuthManager/deleteNode', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('31', '行为日志', '113', '4', 'Action/actionlog', '0', '', '行为管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('32', '查看行为日志', '31', '0', 'action/edit', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('33', '修改密码', '2', '3', 'User/updatePassword', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('34', '修改昵称', '2', '4', 'User/updateNickname', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('35', '查看用户', '197', '1', 'Rank/userList', '0', '', '头衔管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('36', '用户头衔列表', '35', '0', 'Rank/userRankList', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('37', '关联新头衔', '35', '0', 'Rank/userAddRank', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('38', '编辑头衔关联', '35', '0', 'Rank/userChangeRank', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('39', '扩展资料', '2', '3', 'User/profile', '0', '', '用户管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('40', '添加、编辑分组', '39', '0', 'Admin/User/editProfile', '0', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('41', '分组排序', '39', '0', 'Admin/User/sortProfile', '0', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('42', '字段列表', '39', '0', 'Admin/User/field', '0', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('43', '添加、编辑字段', '39', '0', 'Admin/User/editFieldSetting', '0', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('44', '字段排序', '39', '0', 'Admin/User/sortField', '0', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('45', '用户扩展资料列表', '2', '7', 'User/expandinfo_select', '0', '', '用户管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('46', '扩展资料详情', '45', '0', 'User/expandinfo_details', '0', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('47', '待审核用户头衔', '197', '2', 'Rank/rankVerify', '0', '', '头衔管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('48', '被驳回的头衔申请', '197', '3', 'Rank/rankVerifyFailure', '0', '', '头衔管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('49', '转移用户组', '2', '7', 'User/changeGroup', '1', '批量转移用户组', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('50', '用户注册配置', '2', '1', 'UserConfig/index', '0', '', '注册配置', '0', '', '');
INSERT INTO `dok_menu` VALUES ('51', '积分类型列表', '113', '1', 'User/scoreList', '0', '', '行为管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('52', '新增/编辑类型', '113', '2', 'User/editScoreType', '1', '', '行为管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('53', '充值积分', '113', '5', 'User/recharge', '1', '', '', '0', '用户管理', '');
INSERT INTO `dok_menu` VALUES ('54', '头衔列表', '197', '6', 'Rank/index', '0', '', '头衔管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('55', '添加头衔', '54', '2', 'Rank/editRank', '1', '', '头衔管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('57', '插件管理', '105', '4', 'Addons/index', '0', '', '本地', '0', '', '');
INSERT INTO `dok_menu` VALUES ('58', '钩子管理', '57', '2', 'Addons/hooks', '0', '', '本地', '0', '', '');
INSERT INTO `dok_menu` VALUES ('59', '创建', '57', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('60', '检测创建', '57', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('61', '预览', '57', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('62', '快速生成插件', '57', '0', 'Addons/build', '0', '开始生成插件结构', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('64', '设置', '57', '0', 'Addons/config', '0', '设置插件配置', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('65', '禁用', '57', '0', 'Addons/disable', '0', '禁用插件', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('66', '启用', '57', '0', 'Addons/enable', '0', '启用插件', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('67', '安装', '57', '0', 'Addons/install', '0', '安装插件', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('68', '卸载', '57', '0', 'Addons/uninstall', '0', '卸载插件', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('69', '更新配置', '57', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('70', '插件后台列表', '57', '0', 'Addons/adminList', '0', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('71', 'URL方式访问插件', '57', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('72', '新增钩子', '58', '0', 'Addons/addHook', '0', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('73', '编辑钩子', '58', '0', 'Addons/edithook', '0', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('74', '系统', '0', '7', 'Config/group', '0', '', '', '0', 'windows', '');
INSERT INTO `dok_menu` VALUES ('75', '网站设置', '74', '1', 'Config/group', '0', '', '系统设置', '0', '', '');
INSERT INTO `dok_menu` VALUES ('76', '配置管理', '74', '7', 'Config/index', '0', '', '系统设置', '0', '', '');
INSERT INTO `dok_menu` VALUES ('77', '编辑', '76', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('78', '删除', '76', '0', 'Config/del', '0', '删除配置', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('79', '新增', '76', '0', 'Config/add', '0', '新增配置', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('80', '保存', '76', '0', 'Config/save', '0', '保存配置', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('81', '排序', '76', '0', 'Config/sort', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('82', '后台菜单管理', '2', '6', 'Menu/index', '0', '', '权限管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('83', '新增', '82', '0', 'Menu/add', '0', '', '系统设置', '0', '', '');
INSERT INTO `dok_menu` VALUES ('84', '编辑', '82', '0', 'Menu/edit', '0', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('85', '导入', '82', '0', 'Menu/import', '0', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('86', '排序', '82', '0', 'Menu/sort', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('87', '顶部导航', '74', '3', 'Channel/index', '0', '', '导航管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('88', '新增', '87', '0', 'Channel/add', '0', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('89', '编辑', '87', '0', 'Channel/edit', '0', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('90', '删除', '87', '0', 'Channel/del', '0', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('91', '排序', '87', '0', 'Channel/sort', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('92', '备份数据库', '113', '8', 'Database/index?type=export', '0', '', '数据备份', '0', '', '');
INSERT INTO `dok_menu` VALUES ('93', '备份', '92', '0', 'Database/export', '0', '备份数据库', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('94', '优化表', '92', '0', 'Database/optimize', '0', '优化数据表', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('95', '修复表', '92', '0', 'Database/repair', '0', '修复数据表', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('96', '还原数据库', '113', '9', 'Database/index?type=import', '0', '', '数据备份', '0', '', '');
INSERT INTO `dok_menu` VALUES ('97', '恢复', '96', '0', 'Database/import', '0', '数据库恢复', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('98', '删除', '96', '0', 'Database/del', '0', '删除备份文件', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('99', 'SEO规则管理', '74', '8', 'SEO/index', '0', '', 'SEO规则', '0', '', '');
INSERT INTO `dok_menu` VALUES ('100', '新增、编辑', '99', '0', 'SEO/editRule', '0', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('101', '排序', '99', '0', 'SEO/sortRule', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('102', 'SEO规则回收站', '74', '9', 'SEO/ruleTrash', '0', '', 'SEO规则', '0', '', '');
INSERT INTO `dok_menu` VALUES ('103', '全部补丁', '74', '16', 'Update/quick', '1', '', '升级补丁', '0', '', '');
INSERT INTO `dok_menu` VALUES ('104', '新增补丁', '74', '15', 'Update/addpack', '1', '', '升级补丁', '0', '', '');
INSERT INTO `dok_menu` VALUES ('105', '扩展', '0', '11', 'Module/lists', '0', '', '', '0', 'cloud', '');
INSERT INTO `dok_menu` VALUES ('106', '模块安装', '105', '3', 'module/install', '1', '', '本地', '0', '', '');
INSERT INTO `dok_menu` VALUES ('107', '模块管理', '105', '5', 'module/lists', '0', '', '本地', '0', '', '');
INSERT INTO `dok_menu` VALUES ('108', '卸载模块', '105', '7', 'module/uninstall', '1', '', '本地', '0', '', '');
INSERT INTO `dok_menu` VALUES ('109', '授权', '0', '6', 'authorize/ssoSetting', '0', '', '', '0', 'lock', '');
INSERT INTO `dok_menu` VALUES ('110', '单点登录配置', '109', '0', 'Authorize/ssoSetting', '0', '', '单点登录', '0', '', '');
INSERT INTO `dok_menu` VALUES ('111', '应用列表', '109', '0', 'Authorize/ssolist', '0', '', '单点登录', '0', '', '');
INSERT INTO `dok_menu` VALUES ('112', '新增/编辑应用', '109', '0', 'authorize/editssoapp', '1', '', '单点登录', '0', '', '');
INSERT INTO `dok_menu` VALUES ('113', '安全', '0', '5', 'ActionLimit/limitList', '0', '', '', '0', 'shield', '');
INSERT INTO `dok_menu` VALUES ('114', '行为限制列表', '113', '6', 'ActionLimit/limitList', '0', '', '行为限制', '0', '', '');
INSERT INTO `dok_menu` VALUES ('115', '新增/编辑行为限制', '113', '7', 'ActionLimit/editLimit', '1', '', '行为限制', '0', '', '');
INSERT INTO `dok_menu` VALUES ('116', '身份', '0', '3', 'Role/index', '0', '', '', '0', 'group', '');
INSERT INTO `dok_menu` VALUES ('117', '身份列表', '116', '1', 'Role/index', '0', '', '身份管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('118', '编辑身份', '116', '2', 'Role/editRole', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('119', '启用、禁用、删除身份', '116', '3', 'Role/setStatus', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('120', '身份排序', '116', '4', 'Role/sort', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('121', '默认积分配置', '117', '0', 'Role/configScore', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('122', '默认权限配置', '117', '0', 'Role/configAuth', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('123', '默认头像配置', '117', '0', 'Role/configAvatar', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('124', '默认头衔配置', '117', '0', 'Role/configRank', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('125', '默认字段管理', '117', '0', 'Role/configField', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('126', '身份分组', '116', '5', 'Role/group', '0', '', '身份管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('127', '编辑分组', '126', '0', 'Role/editGroup', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('128', '删除分组', '126', '0', 'Role/deleteGroup', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('129', '身份基本信息配置', '116', '6', 'Role/config', '1', '', '身份管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('130', '用户列表', '116', '7', 'Role/userList', '0', '', '身份用户管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('131', '设置用户状态', '130', '0', 'Role/setUserStatus', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('132', '审核用户', '130', '0', 'Role/setUserAudit', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('133', '迁移用户', '130', '0', 'Role/changeRole', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('134', '上传默认头像', '123', '0', 'Role/uploadPicture', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('135', '类型管理', '116', '8', 'Invite/index', '0', '', '邀请注册管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('136', '邀请码管理', '116', '9', 'Invite/invite', '0', '', '邀请注册管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('137', '基础配置', '116', '10', 'Invite/config', '0', '', '邀请注册管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('138', '兑换记录', '116', '11', 'Invite/buyLog', '0', '', '邀请注册管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('139', '邀请记录', '116', '12', 'Invite/inviteLog', '0', '', '邀请注册管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('140', '用户信息', '116', '13', 'Invite/userInfo', '0', '', '邀请注册管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('141', '编辑邀请注册类型', '135', '0', 'Invite/edit', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('142', '删除邀请', '135', '0', 'Invite/setStatus', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('143', '删除邀请码', '136', '0', 'Invite/delete', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('144', '生成邀请码', '136', '0', 'Invite/createCode', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('145', '删除无用邀请码', '136', '0', 'Invite/deleteTrue', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('146', '导出cvs', '136', '0', 'Invite/cvs', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('147', '用户信息编辑', '140', '0', 'Invite/editUserInfo', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('148', '删除日志', '31', '0', 'Action/remove', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('149', '清空日志', '31', '0', 'Action/clear', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('150', '设置积分状态', '51', '0', 'User/setTypeStatus', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('151', '删除积分类型', '51', '0', 'User/delType', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('152', '充值积分-获取用户昵称', '53', '0', 'User/getNickname', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('153', '删除菜单', '82', '0', 'Menu/del', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('154', '设置开发者模式可见', '82', '0', 'Menu/toogleDev', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('155', '设置显示隐藏', '82', '0', 'Menu/toogleHide', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('156', '行为限制启用、禁用、删除', '114', '0', 'ActionLimit/setLimitStatus', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('157', '启用、禁用、删除、回收站还原', '99', '0', 'SEO/setRuleStatus', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('158', '回收站彻底删除', '102', '0', 'SEO/doClear', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('159', '初始化无角色用户', '130', '0', 'Role/initUnhaveUser', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('160', '删除钩子', '58', '0', 'Addons/delHook', '0', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('161', '使用补丁', '103', '0', 'Update/usePack', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('162', '查看补丁', '103', '0', 'Update/view', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('163', '删除补丁', '103', '0', 'Update/delPack', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('164', '用户标签列表', '2', '4', 'UserTag/userTag', '0', '', '用户管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('165', '添加分类、标签', '164', '0', 'UserTag/add', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('166', '设置分类、标签状态', '164', '0', 'UserTag/setStatus', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('167', '分类、标签回收站', '164', '0', 'UserTag/tagTrash', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('168', '测底删除回收站内容', '164', '0', 'UserTag/userTagClear', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('169', '可拥有标签配置', '116', '14', 'role/configusertag', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('170', '编辑模块', '107', '0', 'Module/edit', '1', '', '模块管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('171', '网站信息', '74', '2', 'Config/website', '0', '', '系统设置', '0', '', '');
INSERT INTO `dok_menu` VALUES ('172', '主题管理', '105', '6', 'Theme/tpls', '0', '', '本地', '0', '', '');
INSERT INTO `dok_menu` VALUES ('173', '使用主题', '105', '8', 'Theme/setTheme', '1', '', '本地', '0', '', '');
INSERT INTO `dok_menu` VALUES ('174', '查看主题', '105', '9', 'Theme/lookTheme', '1', '', '本地', '0', '', '');
INSERT INTO `dok_menu` VALUES ('175', '主题打包下载', '105', '10', 'Theme/packageDownload', '1', '', '本地', '0', '', '');
INSERT INTO `dok_menu` VALUES ('176', '卸载删除主题', '105', '11', 'Theme/delete', '1', '', '本地', '0', '', '');
INSERT INTO `dok_menu` VALUES ('177', '上传安装主题', '105', '12', 'Theme/add', '1', '', '本地', '0', '', '');
INSERT INTO `dok_menu` VALUES ('197', '运营', '0', '4', 'Operation/index', '0', '', '', '0', 'laptop', '');
INSERT INTO `dok_menu` VALUES ('198', '群发消息用户列表', '197', '4', 'message/userList', '0', '', '群发消息', '0', '', '');
INSERT INTO `dok_menu` VALUES ('199', '群发消息', '197', '5', 'message/sendMessage', '1', '', '群发消息', '0', '', '');
INSERT INTO `dok_menu` VALUES ('201', '重置用户密码', '3', '0', 'User/initpass', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('209', '表情设置', '74', '4', 'Expression/index', '0', '', '表情设置', '0', '', '');
INSERT INTO `dok_menu` VALUES ('210', '添加表情包', '74', '5', 'Expression/add', '1', '', '表情设置', '0', '', '');
INSERT INTO `dok_menu` VALUES ('211', '表情包列表', '74', '6', 'Expression/package', '0', '', '表情设置', '0', '', '');
INSERT INTO `dok_menu` VALUES ('212', '表情列表', '74', '7', 'Expression/expressionList', '1', '', '表情设置', '0', '', '');
INSERT INTO `dok_menu` VALUES ('213', '删除表情包', '74', '8', 'Expression/delPackage', '1', '', '表情设置', '0', '', '');
INSERT INTO `dok_menu` VALUES ('214', '编辑表情包', '74', '9', 'Expression/editPackage', '1', '', '表情设置', '0', '', '');
INSERT INTO `dok_menu` VALUES ('215', '删除表情', '74', '10', 'Expression/delExpression', '1', '', '表情设置', '0', '', '');
INSERT INTO `dok_menu` VALUES ('216', '上传表情包', '74', '11', 'Expression/upload', '1', '', '表情设置', '0', '', '');
INSERT INTO `dok_menu` VALUES ('217', '用户头衔审核', '47', '2', 'Rank/setVerifyStatus', '1', '', '头衔管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('225', '广告位', '197', '0', 'Adv/pos', '0', '', '广告配置', '0', '', '');
INSERT INTO `dok_menu` VALUES ('226', '广告管理', '197', '0', 'Adv/adv', '0', '', '广告配置', '0', '', '');
INSERT INTO `dok_menu` VALUES ('227', '新增广告', '226', '0', 'Adv/editAdv', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('228', '编辑广告位', '225', '0', 'Adv/editPos', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('229', '设置广告位状态', '225', '0', 'Adv/setPosStatus', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('230', '广告排期', '226', '0', 'Adv/schedule', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('231', '用户导航', '74', '0', 'Channel/user', '0', '', '导航管理', '0', '', 'Core');
INSERT INTO `dok_menu` VALUES ('232', '积分日志', '113', '0', 'Action/scoreLog', '0', '', '积分管理', '0', '', '');
INSERT INTO `dok_menu` VALUES ('10000', '网站主页', '0', '0', 'Home/config', '1', '', '', '0', 'home', 'Home');
INSERT INTO `dok_menu` VALUES ('10001', '基本设置', '10000', '0', 'Home/config', '0', '', '设置', '0', '', 'Home');
INSERT INTO `dok_menu` VALUES ('10051', '专辑管理', '10050', '0', 'Issue/issue', '0', '', '专辑', '0', '', 'Issue');
INSERT INTO `dok_menu` VALUES ('10050', '专辑', '0', '22', 'Issue/issue', '1', '', '', '0', '', 'Issue');
INSERT INTO `dok_menu` VALUES ('10052', '设置专辑状态', '10051', '0', 'Issue/setIssueContentStatus', '1', '', '', '0', '', 'Issue');
INSERT INTO `dok_menu` VALUES ('10053', '专辑操作', '10051', '0', 'Issue/operate', '1', '', '专辑', '0', '', 'Issue');
INSERT INTO `dok_menu` VALUES ('10054', '编辑专辑', '10051', '0', 'Issue/add', '1', '', '专辑', '0', '', 'Issue');
INSERT INTO `dok_menu` VALUES ('10055', '合并专辑', '10051', '0', 'Issue/doMerge', '1', '', '', '0', '', 'Issue');
INSERT INTO `dok_menu` VALUES ('10056', '专辑回收站', '10050', '4', 'Issue/issueTrash', '0', '', '专辑', '0', '', 'Issue');
INSERT INTO `dok_menu` VALUES ('10057', '内容管理', '10050', '0', 'Issue/contents', '0', '', '内容管理', '0', '', 'Issue');
INSERT INTO `dok_menu` VALUES ('10058', '内容回收站', '10050', '5', 'Issue/contentTrash', '0', '', '内容管理', '0', '', 'Issue');
INSERT INTO `dok_menu` VALUES ('10059', '内容审核', '10050', '1', 'Issue/verify', '0', '', '内容管理', '0', '', 'Issue');
INSERT INTO `dok_menu` VALUES ('10060', '专辑设置', '10050', '0', 'Issue/config', '0', '', '设置', '0', '', 'Issue');
INSERT INTO `dok_menu` VALUES ('10061', '会员展示', '0', '22', 'People/config', '1', '', '', '0', '', 'People');
INSERT INTO `dok_menu` VALUES ('10062', '基本设置', '10061', '0', 'People/config', '0', '', '配置', '0', '', 'People');
INSERT INTO `dok_menu` VALUES ('10063', '基础设置', '0', '0', 'Mpbase/index', '1', '', '', '0', '', '');
INSERT INTO `dok_menu` VALUES ('10064', '编辑公众号', '10063', '0', 'Mpbase/editMp', '1', '', '公众号', '0', '', '');
INSERT INTO `dok_menu` VALUES ('10065', '公众号管理', '10063', '0', 'Mpbase/index', '0', '', '公众号', '0', '', '');
INSERT INTO `dok_menu` VALUES ('10066', '管理基本设置', '10063', '0', 'Mpbase/config', '0', '', '公众号', '0', '', '');
INSERT INTO `dok_menu` VALUES ('10067', '自动回复管理', '10063', '0', 'Mpbase/replay_messages', '0', '', '公众号', '0', '', '');
INSERT INTO `dok_menu` VALUES ('10068', '编辑自定义菜单', '10063', '0', 'Admin/Custommenu/add', '1', '', '公众号', '0', '', '');
INSERT INTO `dok_menu` VALUES ('10069', '自定义菜单管理', '10063', '0', 'Admin/Custommenu/index', '0', '', '公众号', '0', '', '');
INSERT INTO `dok_menu` VALUES ('10070', '自定义菜单操作', '10063', '0', 'Admin/Custommenu', '1', '', '公众号', '0', '', '');

-- ----------------------------
-- Table structure for dok_message
-- ----------------------------
DROP TABLE IF EXISTS `dok_message`;
CREATE TABLE `dok_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `from_uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `is_read` tinyint(4) NOT NULL,
  `last_toast` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消息表';

-- ----------------------------
-- Records of dok_message
-- ----------------------------

-- ----------------------------
-- Table structure for dok_message_content
-- ----------------------------
DROP TABLE IF EXISTS `dok_message_content`;
CREATE TABLE `dok_message_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `content` text NOT NULL,
  `url` varchar(100) NOT NULL,
  `args` text NOT NULL,
  `type` tinyint(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_message_content
-- ----------------------------

-- ----------------------------
-- Table structure for dok_module
-- ----------------------------
DROP TABLE IF EXISTS `dok_module`;
CREATE TABLE `dok_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '模块名',
  `alias` varchar(30) NOT NULL COMMENT '中文名',
  `version` varchar(20) NOT NULL COMMENT '版本号',
  `is_com` tinyint(4) NOT NULL COMMENT '是否商业版',
  `show_nav` tinyint(4) NOT NULL COMMENT '是否显示在导航栏中',
  `summary` varchar(200) NOT NULL COMMENT '简介',
  `developer` varchar(50) NOT NULL COMMENT '开发者',
  `website` varchar(200) NOT NULL COMMENT '网址',
  `entry` varchar(50) NOT NULL COMMENT '前台入口',
  `is_setup` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否已安装',
  `sort` int(11) NOT NULL COMMENT '模块排序',
  `icon` varchar(20) NOT NULL,
  `can_uninstall` tinyint(4) NOT NULL,
  `admin_entry` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `name_2` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='模块管理表';

-- ----------------------------
-- Records of dok_module
-- ----------------------------
INSERT INTO `dok_module` VALUES ('1', 'Home', '网站主页', '2.0.0', '0', '1', '首页模块，主要用于展示网站内容', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Home/index/index', '1', '0', 'home', '1', 'Admin/Home/config');
INSERT INTO `dok_module` VALUES ('2', 'Ucenter', '用户中心', '2.0.0', '0', '1', '用户中心模块，系统核心模块', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Ucenter/index/index', '1', '0', 'user', '0', 'Admin/User/index');
INSERT INTO `dok_module` VALUES ('3', 'People', '找人', '2.0.0', '0', '1', '会员展示模块，可以用于会员的查找', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'People/index/index', '1', '0', 'group', '1', 'People/config');
INSERT INTO `dok_module` VALUES ('4', 'Core', '系统公共模块', '2.1.0', '0', '0', '系统核心模块，必不可少，负责核心的处理。', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', '', '1', '0', 'globe', '0', '');
INSERT INTO `dok_module` VALUES ('5', 'Issue', '专辑', '2.3.0', '0', '1', '专辑模块，适用于精品内容展示', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Issue/index/index', '1', '0', 'th', '1', 'Admin/Issue/contents');
INSERT INTO `dok_module` VALUES ('6', 'Mpbase', '公众号', '1.0.0', '0', '1', '基础设置模块，用于公众平台基础信息', 's_洋仔', 'www.dok.com', 'Mpbase/index/index', '1', '0', 'cog', '0', 'Admin/Mpbase/index');

-- ----------------------------
-- Table structure for dok_picture
-- ----------------------------
DROP TABLE IF EXISTS `dok_picture`;
CREATE TABLE `dok_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `type` varchar(50) NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_picture
-- ----------------------------
INSERT INTO `dok_picture` VALUES ('1', 'local', '/Uploads/Picture/default/5693110b42b23.png', '', '78339089a068beeac30171fd0571406e', '26774b61df9fa7412d4dd5f32a5f020a6c2693f0', '1', '1452478731');
INSERT INTO `dok_picture` VALUES ('2', 'local', '/Uploads/Picture/default/5693156ceb370.png', '', 'a447783f41a83460179639467b6df0e6', '627b995f0a7643ba66aabc7a42ce7df929b5e0d6', '1', '1452479852');
INSERT INTO `dok_picture` VALUES ('3', 'local', '/Uploads/Picture/default/569315aa902f3.png', '', 'c2e044b18aef6d00dcd6475c2ba78764', '3dfa44d10458d300699a25dc6ef476837e475255', '1', '1452479914');

-- ----------------------------
-- Table structure for dok_picture_messages
-- ----------------------------
DROP TABLE IF EXISTS `dok_picture_messages`;
CREATE TABLE `dok_picture_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title0` varchar(255) DEFAULT NULL COMMENT '标题',
  `detile0` text COMMENT '内容',
  `url0` text COMMENT 'url',
  `title1` varchar(255) DEFAULT NULL COMMENT '标题',
  `detile1` text COMMENT '内容',
  `url1` text COMMENT 'url',
  `title2` varchar(255) DEFAULT NULL COMMENT '标题',
  `detile2` text COMMENT '内容',
  `url2` text COMMENT 'url',
  `title3` varchar(255) DEFAULT NULL COMMENT '标题',
  `detile3` text COMMENT '内容',
  `url3` text COMMENT 'url',
  `title4` varchar(255) DEFAULT NULL COMMENT '标题',
  `detile4` text COMMENT '内容',
  `url4` text COMMENT 'url',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_picture_messages
-- ----------------------------

-- ----------------------------
-- Table structure for dok_rank
-- ----------------------------
DROP TABLE IF EXISTS `dok_rank`;
CREATE TABLE `dok_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '上传者id',
  `title` varchar(50) NOT NULL,
  `logo` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `types` tinyint(2) NOT NULL DEFAULT '1' COMMENT '前台是否可申请',
  `label_content` varchar(10) NOT NULL COMMENT '文字头衔内容',
  `label_color` varchar(10) NOT NULL COMMENT '文字颜色',
  `label_bg` varchar(10) NOT NULL COMMENT 'label背景色',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_rank
-- ----------------------------

-- ----------------------------
-- Table structure for dok_rank_user
-- ----------------------------
DROP TABLE IF EXISTS `dok_rank_user`;
CREATE TABLE `dok_rank_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `is_show` tinyint(4) NOT NULL COMMENT '是否显示在昵称右侧（必须有图片才可）',
  `create_time` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_rank_user
-- ----------------------------

-- ----------------------------
-- Table structure for dok_replay_messages
-- ----------------------------
DROP TABLE IF EXISTS `dok_replay_messages`;
CREATE TABLE `dok_replay_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '名称',
  `statu` int(10) NOT NULL DEFAULT '0',
  `ms_id` int(10) NOT NULL COMMENT '关联id',
  `time` int(15) NOT NULL COMMENT '时间',
  `type` varchar(255) NOT NULL COMMENT '回复类型',
  `mtype` varchar(255) NOT NULL COMMENT '消息类型',
  `mp_id` int(2) NOT NULL COMMENT '公众号mpid',
  `keywork` text COMMENT '关键词',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_replay_messages
-- ----------------------------

-- ----------------------------
-- Table structure for dok_report
-- ----------------------------
DROP TABLE IF EXISTS `dok_report`;
CREATE TABLE `dok_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) NOT NULL,
  `uid` int(11) NOT NULL,
  `reason` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `data` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL,
  `updata_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `handle_status` tinyint(4) NOT NULL,
  `handle_result` text NOT NULL,
  `handle_uid` int(11) NOT NULL,
  `handle_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_report
-- ----------------------------

-- ----------------------------
-- Table structure for dok_role
-- ----------------------------
DROP TABLE IF EXISTS `dok_role`;
CREATE TABLE `dok_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT '角色组id',
  `name` varchar(25) NOT NULL COMMENT '英文标识',
  `title` varchar(25) NOT NULL COMMENT '中文标题',
  `description` varchar(500) NOT NULL COMMENT '描述',
  `user_groups` varchar(200) NOT NULL COMMENT '默认用户组ids',
  `invite` tinyint(4) NOT NULL COMMENT '预留字段(类型：是否需要邀请注册等)',
  `audit` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否需要审核',
  `sort` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of dok_role
-- ----------------------------
INSERT INTO `dok_role` VALUES ('1', '0', 'default', '普通用户', '普通用户', '1', '0', '0', '0', '1', '1474526801', '1474526801');

-- ----------------------------
-- Table structure for dok_role_config
-- ----------------------------
DROP TABLE IF EXISTS `dok_role_config`;
CREATE TABLE `dok_role_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL COMMENT '标识',
  `category` varchar(25) NOT NULL COMMENT '归类标识',
  `value` text NOT NULL COMMENT '配置值',
  `data` text NOT NULL COMMENT '该配置的其它值',
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色配置表';

-- ----------------------------
-- Records of dok_role_config
-- ----------------------------

-- ----------------------------
-- Table structure for dok_role_group
-- ----------------------------
DROP TABLE IF EXISTS `dok_role_group`;
CREATE TABLE `dok_role_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(25) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色分组';

-- ----------------------------
-- Records of dok_role_group
-- ----------------------------

-- ----------------------------
-- Table structure for dok_score_log
-- ----------------------------
DROP TABLE IF EXISTS `dok_score_log`;
CREATE TABLE `dok_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `ip` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `value` double NOT NULL,
  `finally_value` double NOT NULL,
  `create_time` int(11) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `model` varchar(20) NOT NULL,
  `record_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_score_log
-- ----------------------------
INSERT INTO `dok_score_log` VALUES ('1', '1', '0', '1', 'inc', '10', '10', '1452476575', 'admin在2016-01-11 09:42登录了账号【积分：+10分】', 'member', '1');

-- ----------------------------
-- Table structure for dok_seo_rule
-- ----------------------------
DROP TABLE IF EXISTS `dok_seo_rule`;
CREATE TABLE `dok_seo_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `app` varchar(40) NOT NULL,
  `controller` varchar(40) NOT NULL,
  `action` varchar(40) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `seo_keywords` text NOT NULL,
  `seo_description` text NOT NULL,
  `seo_title` text NOT NULL,
  `sort` int(11) NOT NULL,
  `summary` varchar(500) NOT NULL COMMENT 'seo变量介绍',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_seo_rule
-- ----------------------------
INSERT INTO `dok_seo_rule` VALUES ('1000', '整站标题', '', '', '', '1', '', '', '', '7', '-');
INSERT INTO `dok_seo_rule` VALUES ('1001', '用户中心', 'Ucenter', 'index', 'index', '1', '{$user_info.username|text}的个人主页', '{$user_info.username|text}的个人主页', '{$user_info.nickname|op_t}的个人主页', '3', '-');
INSERT INTO `dok_seo_rule` VALUES ('1002', '网站首页', 'Home', 'Index', 'index', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1003', '积分商城首页', 'Shop', 'Index', 'index', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1004', '商品列表', 'Shop', 'Index', 'goods', '1', '', '', '', '0', 'category_name：当前分类名\nchild_category_name：子分类名');
INSERT INTO `dok_seo_rule` VALUES ('1005', '商品详情', 'Shop', 'Index', 'goodsdetail', '1', '', '', '', '0', 'content：商品变量集\n   content.goods_name 商品名\n   content.goods_introduct 商品简介\n   content.goods_detail 商品详情');
INSERT INTO `dok_seo_rule` VALUES ('1006', '活动主页', 'Event', 'Index', 'index', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1007', '活动详情', 'Event', 'Index', 'detail', '1', '', '', '', '0', 'content：活动变量集\n   content.title 活动名称\n   content.type.title 活动分类名\n   content.user.nickname 发起人昵称\n   content.address 活动地点\n   content.limitCount 人数限制');
INSERT INTO `dok_seo_rule` VALUES ('1008', '活动成员', 'Event', 'Index', 'member', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1009', '专辑首页', 'Issue', 'Index', 'index', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1010', '专辑详情', 'Issue', 'Index', 'issuecontentdetail', '1', '', '', '', '0', 'content：专辑内容变量集\n   content.user.nickname 内容发布者昵称\n   content.user.signature 内容发布者签名\n   content.url 内容的Url\n   content.title 内容标题\n   content.create_time|friendlyDate 发布时间\n   content.update_time|friendlyDate 更新时间');
INSERT INTO `dok_seo_rule` VALUES ('1011', '论坛主页', 'Forum', 'Index', 'index', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1012', '某个版块的帖子列表', 'Forum', 'Index', 'forum', '1', '', '', '', '0', 'forum：版块变量集\n   forum.description 版块描述\n   forum.title 版块名称\n   forum.topic_count 主题数\n   forum.total_count 帖子数');
INSERT INTO `dok_seo_rule` VALUES ('1013', '帖子详情', 'Forum', 'Index', 'detail', '1', '', '', '', '0', 'post：帖子变量集\n   post.title 帖子标题\n   post.content 帖子详情\n   post.forum.title 帖子所在版块标题\n   ');
INSERT INTO `dok_seo_rule` VALUES ('1014', '搜索帖子', 'Forum', 'Index', 'search', '1', '', '', '', '0', 'keywords：搜索的关键词，2.4.0以后版本提供');
INSERT INTO `dok_seo_rule` VALUES ('1015', '随便看看', 'Forum', 'Index', 'look', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1016', '全部版块', 'Forum', 'Index', 'lists', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1017', '资讯首页/某个分类下的文章列表', 'News', 'Index', 'index', '1', '', '', '', '0', 'now_category.title 当前分类的名称');
INSERT INTO `dok_seo_rule` VALUES ('1018', '某篇文章的内容页', 'News', 'Index', 'detail', '1', '', '', '', '0', 'now_category.title 当前分类的名称\ninfo：文章变量集\n   info.title 文章标题\n   info.description 文章摘要\n   info.source 文章来源\n   info.detail.content 文章内容\nauthor.nickname 作者昵称\nauthor.signature 作者签名\n   ');
INSERT INTO `dok_seo_rule` VALUES ('1019', '微博首页', 'Weibo', 'Index', 'index', '1', '{$MODULE_ALIAS}', '{$MODULE_ALIAS}首页', '{$MODULE_ALIAS}-{$website_name}', '0', 'title：我关注的、热门微博、全站关注');
INSERT INTO `dok_seo_rule` VALUES ('1020', '某条微博的详情页', 'Weibo', 'Index', 'weibodetail', '1', '{$weibo.title|text},{$website_name},{$MODULE_ALIAS}', '{$weibo.content|text}', '{$weibo.content|text}——{$MODULE_ALIAS}', '0', 'weibo:微博变量集\n   weibo.user.nickname 发布者昵称\n   weibo.content 微博内容');
INSERT INTO `dok_seo_rule` VALUES ('1021', '微博搜索页面', 'Weibo', 'Index', 'search', '1', '', '', '', '0', 'search_keywords：搜索关键词');
INSERT INTO `dok_seo_rule` VALUES ('1022', '热门话题列表', 'Weibo', 'Topic', 'topic', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1023', '某个话题的话题页', 'Weibo', 'Topic', 'index', '1', '', '', '', '0', 'topic：话题变量集\n   topic.name 话题名称\nhost：话题主持人变量集\n   host.nickname 主持人昵称');
INSERT INTO `dok_seo_rule` VALUES ('1024', '自动跳转到我的群组', 'Group', 'Index', 'index', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1025', '全部群组', 'Group', 'Index', 'groups', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1026', '我的群组-帖子列表', 'Group', 'Index', 'my', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1027', '我的群组-全部关注的群组列表', 'Group', 'Index', 'mygroup', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1028', '某个群组的帖子列表页面', 'Group', 'Index', 'group', '1', '', '', '', '0', 'search_key：如果查找帖子，则是关键词\ngroup：群组变量集\n   group.title 群组标题\n   group.user.nickname 创始人昵称\n   group.member_count 群组人数');
INSERT INTO `dok_seo_rule` VALUES ('1029', '某篇帖子的内容页', 'Group', 'Index', 'detail', '1', '', '', '', '0', 'group：群组变量集\n   group.title 群组标题\n   group.user.nickname 创始人昵称\n   group.member_count 群组人数\npost：帖子变量集\n   post.title 帖子标题\n   post.content 帖子内容');
INSERT INTO `dok_seo_rule` VALUES ('1030', '创建群组', 'Group', 'Index', 'create', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1031', '发现', 'Group', 'Index', 'discover', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1032', '精选', 'Group', 'Index', 'select', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1033', '找人首页', 'People', 'Index', 'index', '1', '{$MODULE_ALIAS}', '{$MODULE_ALIAS}', '{$MODULE_ALIAS}', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1034', '微店首页', 'Store', 'Index', 'index', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1035', '某个分类下的商品列表页', 'Store', 'Index', 'li', '1', '', '', '', '0', 'type：当前分类变量集\n   type.title 分类名称');
INSERT INTO `dok_seo_rule` VALUES ('1036', '搜索商品列表页', 'Store', 'Index', 'search', '1', '', '', '', '0', 'searchKey：搜索关键词');
INSERT INTO `dok_seo_rule` VALUES ('1037', '单个商品的详情页', 'Store', 'Index', 'info', '1', '', '', '', '0', 'info：商品变量集\n   info.title 商品标题\n   info.des 商品描述\n   info.shop：店铺变量集\n       info.shop.title 店铺名称\n       info.shop.summary 店铺简介\n       info.shop.position 店铺所在地\n       info.shop.user.nickname 店主昵称');
INSERT INTO `dok_seo_rule` VALUES ('1038', '店铺街', 'Store', 'Index', 'lists', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1039', '某个店铺的首页', 'Store', 'Index', 'detail', '1', '', '', '', '0', 'shop：店铺变量集\n   shop.title 店铺名称\n   shop.summary 店铺简介\n   shop.position 店铺所在地\n   shop.user.nickname 店主昵称');
INSERT INTO `dok_seo_rule` VALUES ('1040', '某个店铺下的商品列表页', 'Store', 'Index', 'goods', '1', '', '', '', '0', 'shop：店铺变量集\n   shop.title 店铺名称\n   shop.summary 店铺简介\n   shop.position 店铺所在地\n   shop.user.nickname 店主昵称');
INSERT INTO `dok_seo_rule` VALUES ('1041', '分类信息首页', 'Cat', 'Index', 'index', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1042', '某个模型下的列表页', 'Cat', 'Index', 'li', '1', '', '', '', '0', 'entity：当前模型变量集\n   entity.alias 模型名');
INSERT INTO `dok_seo_rule` VALUES ('1043', '某条信息的详情页', 'Cat', 'Index', 'info', '1', '', '', '', '0', 'entity：当前模型变量集\n   entity.alias 模型名\ninfo：当前信息\n   info.title 信息名称\nuser.nickname 发布者昵称');
INSERT INTO `dok_seo_rule` VALUES ('1044', '待回答页面', 'Question', 'Index', 'waitanswer', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1045', '热门问题', 'Question', 'Index', 'goodquestion', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1046', '我的回答', 'Question', 'Index', 'myquestion', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1047', '全部问题', 'Question', 'Index', 'questions', '1', '', '', '', '0', '-');
INSERT INTO `dok_seo_rule` VALUES ('1048', '详情', 'Question', 'Index', 'detail', '1', '', '', '', '0', 'question：问题变量集\n   question.title 问题标题\n   question.description 问题描述\n   question.answer_num 回答数\nbest_answer：最佳回答\n   best_answer.content 最佳答案内容');

-- ----------------------------
-- Table structure for dok_sso_app
-- ----------------------------
DROP TABLE IF EXISTS `dok_sso_app`;
CREATE TABLE `dok_sso_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `config` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_sso_app
-- ----------------------------

-- ----------------------------
-- Table structure for dok_super_links
-- ----------------------------
DROP TABLE IF EXISTS `dok_super_links`;
CREATE TABLE `dok_super_links` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '类别（1：图片，2：普通）',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '站点名称',
  `cover_id` int(10) NOT NULL COMMENT '图片ID',
  `link` char(140) NOT NULL DEFAULT '' COMMENT '链接地址',
  `level` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='友情连接表';

-- ----------------------------
-- Records of dok_super_links
-- ----------------------------

-- ----------------------------
-- Table structure for dok_support
-- ----------------------------
DROP TABLE IF EXISTS `dok_support`;
CREATE TABLE `dok_support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appname` varchar(20) NOT NULL COMMENT '应用名',
  `row` int(11) NOT NULL COMMENT '应用标识',
  `uid` int(11) NOT NULL COMMENT '用户',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `table` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='支持的表';

-- ----------------------------
-- Records of dok_support
-- ----------------------------

-- ----------------------------
-- Table structure for dok_sync_login
-- ----------------------------
DROP TABLE IF EXISTS `dok_sync_login`;
CREATE TABLE `dok_sync_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type_uid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `oauth_token` varchar(255) NOT NULL,
  `oauth_token_secret` varchar(255) NOT NULL,
  `is_sync` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_sync_login
-- ----------------------------

-- ----------------------------
-- Table structure for dok_talk
-- ----------------------------
DROP TABLE IF EXISTS `dok_talk`;
CREATE TABLE `dok_talk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `uids` varchar(100) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会话表';

-- ----------------------------
-- Records of dok_talk
-- ----------------------------

-- ----------------------------
-- Table structure for dok_talk_message
-- ----------------------------
DROP TABLE IF EXISTS `dok_talk_message`;
CREATE TABLE `dok_talk_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  `uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `talk_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='聊天消息表';

-- ----------------------------
-- Records of dok_talk_message
-- ----------------------------

-- ----------------------------
-- Table structure for dok_talk_message_push
-- ----------------------------
DROP TABLE IF EXISTS `dok_talk_message_push`;
CREATE TABLE `dok_talk_message_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `source_id` int(11) NOT NULL COMMENT '来源消息id',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `status` tinyint(4) NOT NULL,
  `talk_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='状态，0为未提示，1为未点击，-1为已点击';

-- ----------------------------
-- Records of dok_talk_message_push
-- ----------------------------

-- ----------------------------
-- Table structure for dok_talk_push
-- ----------------------------
DROP TABLE IF EXISTS `dok_talk_push`;
CREATE TABLE `dok_talk_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '接收推送的用户id',
  `source_id` int(11) NOT NULL COMMENT '来源id',
  `create_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '状态，0为未提示，1为未点击，-1为已点击',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='对话推送表';

-- ----------------------------
-- Records of dok_talk_push
-- ----------------------------

-- ----------------------------
-- Table structure for dok_text_messages
-- ----------------------------
DROP TABLE IF EXISTS `dok_text_messages`;
CREATE TABLE `dok_text_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `detile` varchar(255) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_text_messages
-- ----------------------------

-- ----------------------------
-- Table structure for dok_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `dok_ucenter_admin`;
CREATE TABLE `dok_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of dok_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for dok_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `dok_ucenter_member`;
CREATE TABLE `dok_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(32) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  `type` tinyint(4) NOT NULL COMMENT '1为用户名注册，2为邮箱注册，3为手机注册',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of dok_ucenter_member
-- ----------------------------
INSERT INTO `dok_ucenter_member` VALUES ('1', 'admin', '2e2d4ff8ee85dde80cd73e74c3133136', '441222899@qq.com', '', '1474526801', '2130706433', '1474526801', '2130706433', '1474526801', '1', '1');

-- ----------------------------
-- Table structure for dok_ucenter_score_type
-- ----------------------------
DROP TABLE IF EXISTS `dok_ucenter_score_type`;
CREATE TABLE `dok_ucenter_score_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `unit` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_ucenter_score_type
-- ----------------------------
INSERT INTO `dok_ucenter_score_type` VALUES ('1', '积分', '1', '分');
INSERT INTO `dok_ucenter_score_type` VALUES ('2', '威望', '1', '点');
INSERT INTO `dok_ucenter_score_type` VALUES ('3', '贡献', '1', '元');
INSERT INTO `dok_ucenter_score_type` VALUES ('4', '余额', '1', '点');

-- ----------------------------
-- Table structure for dok_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `dok_ucenter_setting`;
CREATE TABLE `dok_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of dok_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for dok_ucenter_user_link
-- ----------------------------
DROP TABLE IF EXISTS `dok_ucenter_user_link`;
CREATE TABLE `dok_ucenter_user_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uc_uid` int(11) NOT NULL,
  `uc_username` varchar(50) NOT NULL,
  `uc_email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_ucenter_user_link
-- ----------------------------

-- ----------------------------
-- Table structure for dok_url
-- ----------------------------
DROP TABLE IF EXISTS `dok_url`;
CREATE TABLE `dok_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of dok_url
-- ----------------------------

-- ----------------------------
-- Table structure for dok_user_config
-- ----------------------------
DROP TABLE IF EXISTS `dok_user_config`;
CREATE TABLE `dok_user_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `model` varchar(30) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户配置信息表';

-- ----------------------------
-- Records of dok_user_config
-- ----------------------------

-- ----------------------------
-- Table structure for dok_user_nav
-- ----------------------------
DROP TABLE IF EXISTS `dok_user_nav`;
CREATE TABLE `dok_user_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  `color` varchar(30) NOT NULL,
  `band_color` varchar(30) NOT NULL,
  `band_text` varchar(30) NOT NULL,
  `icon` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_user_nav
-- ----------------------------
INSERT INTO `dok_user_nav` VALUES ('1', '个人主页', 'ucenter/Index/index', '0', '0', '0', '1', '0', '', '', '', '');
INSERT INTO `dok_user_nav` VALUES ('2', '消息中心', 'ucenter/message/message', '0', '0', '0', '1', '0', '', '', '', '');
INSERT INTO `dok_user_nav` VALUES ('3', '我的收藏', 'ucenter/Collection/index', '0', '0', '0', '1', '0', '', '', '', '');
INSERT INTO `dok_user_nav` VALUES ('4', '我的头衔', 'ucenter/Index/rank', '0', '0', '0', '1', '0', '', '', '', '');

-- ----------------------------
-- Table structure for dok_user_role
-- ----------------------------
DROP TABLE IF EXISTS `dok_user_role`;
CREATE TABLE `dok_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '2：未审核，1:启用，0：禁用，-1：删除',
  `step` varchar(50) NOT NULL COMMENT '记录当前执行步骤',
  `init` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否初始化',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户角色关联';

-- ----------------------------
-- Records of dok_user_role
-- ----------------------------
INSERT INTO `dok_user_role` VALUES ('1', '1', '1', '1', 'finish', '1');

-- ----------------------------
-- Table structure for dok_user_tag
-- ----------------------------
DROP TABLE IF EXISTS `dok_user_tag`;
CREATE TABLE `dok_user_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `pid` int(11) NOT NULL,
  `sort` tinyint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='标签分类表';

-- ----------------------------
-- Records of dok_user_tag
-- ----------------------------
INSERT INTO `dok_user_tag` VALUES ('1', '默认', '1', '0', '0');
INSERT INTO `dok_user_tag` VALUES ('2', '开发者', '1', '1', '0');
INSERT INTO `dok_user_tag` VALUES ('3', '站长', '1', '1', '0');

-- ----------------------------
-- Table structure for dok_user_tag_link
-- ----------------------------
DROP TABLE IF EXISTS `dok_user_tag_link`;
CREATE TABLE `dok_user_tag_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tags` varchar(200) NOT NULL COMMENT '标签ids',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户标签关联表';

-- ----------------------------
-- Records of dok_user_tag_link
-- ----------------------------

-- ----------------------------
-- Table structure for dok_user_token
-- ----------------------------
DROP TABLE IF EXISTS `dok_user_token`;
CREATE TABLE `dok_user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_user_token
-- ----------------------------

-- ----------------------------
-- Table structure for dok_verify
-- ----------------------------
DROP TABLE IF EXISTS `dok_verify`;
CREATE TABLE `dok_verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `account` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `verify` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dok_verify
-- ----------------------------

-- ----------------------------
-- Table structure for dok_version
-- ----------------------------
DROP TABLE IF EXISTS `dok_version`;
CREATE TABLE `dok_version` (
  `title` varchar(50) NOT NULL COMMENT '版本名',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `update_time` int(11) NOT NULL COMMENT '更新的时间',
  `log` text NOT NULL COMMENT '更新日志',
  `url` varchar(150) NOT NULL COMMENT '链接到的远程文章',
  `number` int(11) NOT NULL COMMENT '序列号，一般用日期数字标示',
  `name` varchar(50) NOT NULL COMMENT '版本号',
  `is_current` tinyint(4) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `id` (`number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自动更新表';

-- ----------------------------
-- Records of dok_version
-- ----------------------------
INSERT INTO `dok_version` VALUES ('OpenCenter V2.0.0', '1452484820', '1452484820', '发布OpenCenter V2', '', '20160111', '2.0.0', '0');
