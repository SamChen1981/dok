/*
创建dok_member_public表
*/
DROP TABLE IF EXISTS `dok_member_public`;
CREATE TABLE `dok_member_public`(
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
  ) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*创建member_public表结束*/
/*
创建dok_autoreply表
创建息消息表replay_messages

*/
DROP TABLE IF EXISTS  `dok_autoreply`;
CREATE TABLE `dok_autoreply`(
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `mp_id` int(10) NOT NULL COMMENT '公众号ID',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '自定义回复类型',
  `keyword_id` int(10) NOT NULL COMMENT '关键词ID',
  `content` varchar(255) NOT NULL COMMENT '自动回复内容',
  `status` tinyint(4) NOT NULL COMMENT '2:未审核，1：启用，0：禁用，-1：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*创建dok_autoreply表完成*/
DROP TABLE IF EXISTS `dok_replay_messages`;
CREATE TABLE `dok_replay_messages` (
  `id` int(10) unsigned not null auto_increment comment '主键',
  `title` varchar(255) not null comment '名称',
  `statu` int(10) not null default '0',
  `ms_id` int(10) not null comment '关联id',
  `time` int(15) not null  comment '时间',
  `type` varchar(255) not null comment '回复类型',
  `mtype` varchar(255) not null comment '消息类型',
  `mp_id` int(2) not null comment '公众号mpid',
  `keywork` text comment '关键词',
  PRIMARY  KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8;
/*文本类消息*/
DROP TABLE IF EXISTS `dok_text_messages`;
CREATE TABLE `dok_text_messages`(
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `detile` varchar(255) COMMENT '内容',
  PRIMARY  KEY (`id`)
)ENGINE = InnoDB CHARSET=utf8;
/*图片类消息*/
DROP TABLE IF EXISTS `dok_picture_messages`;
CREATE TABLE `dok_picture_messages`(
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title0` varchar(255) COMMENT '标题',
  `detile0` text COMMENT '内容',
  `url0` text COMMENT 'url',
  `title1` varchar(255) COMMENT '标题',
  `detile1` text COMMENT '内容',
  `url1` text COMMENT 'url',
  `title2` varchar(255) COMMENT '标题',
  `detile2` text COMMENT '内容',
  `url2` text COMMENT 'url',
  `title3` varchar(255) COMMENT '标题',
  `detile3` text COMMENT '内容',
  `url3` text COMMENT 'url',
  `title4` varchar(255) COMMENT '标题',
  `detile4` text COMMENT '内容',
  `url4` text COMMENT 'url',
  `pic` varchar(255) COMMENT '图片',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB CHARSET=utf8;


/*添加菜单项*/
insert into `dok_menu` (`title`,`pid`,`sort`,`url`,`hide`,`tip`,`group`,`is_dev`,`icon`) values ('基础设置',0,0,'Mpbase/index',1,'','',0,'');
set @tmp_id=0;
select @tmp_id:=id from `dok_menu` where title='基础设置';

insert into `dok_menu`(`title`,`pid`,`sort`,`url`,`hide`,`tip`,`group`,`is_dev`,`icon`) values
('编辑公众号',@tmp_id,0,'Mpbase/editMp',1,'','公众号',0,''),
('公众号管理',@tmp_id,0,'Mpbase/index',0,'','公众号',0,''),
('管理基本设置',@tmp_id,0,'Mpbase/config',0,'','公众号',0,''),
('自动回复管理',@tmp_id,0,'Mpbase/replay_messages',0,'','公众号',0,''),
('编辑自定义菜单',@tmp_id,0,'Admin/Custommenu/add',1,'','公众号',0,''),
('自定义菜单管理',@tmp_id,0,'Admin/Custommenu/index',0,'','公众号',0,''),
('自定义菜单操作',@tmp_id,0,'Admin/Custommenu',1,'','公众号',0,'');

--
--表的结构我`dok_custom_menu`
--
CREATE TABLE IF NOT EXISTS `dok_custom_menu`(
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort` tinyint(4) NULL DEFAULT 0 COMMENT '排序号',
  `pid` int(10) NULL DEFAULT 0 COMMENT '一级菜单',
  `title` varchar(50) NOT NULL COMMENT '菜单名称',
  `keyword` varchar(100) NULL COMMENT '关联关键词',
  `url` varchar(255) NULL COMMENT '关联url',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `type` varchar(30) NOT NULL DEFAULT 'click' COMMENT '类型',
  `status` tinyint(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;