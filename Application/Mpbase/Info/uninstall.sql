--
--卸载Mpbase模块
--
DROP TABLE IF EXISTS `dok_member_public`;
DROP TABLE IF EXISTS `dok_custom_menu`;
DROP TABLE IF EXISTS `dok_autoreply`;
DROP TABLE IF EXISTS `dok_replay_messages`;
DROP TABLE IF EXISTS `dok_text_messages`;
DROP TABLE IF EXISTS `dok_picture_messages`;

/*删除menu相关数据*/
set @tmp_id=0;
select @tmp_id:=id from `dok_menu` where `title` = '基础设置';
delete from `dok_menu` where `id`=@tmp_id or (`pid` =@tmp_id and `pid` !=0);
delete from `dok_menu` where `title`='基础设置';
/*删除相应的后台菜单*/
delete from `dok_menu` where `url` like 'Mpbase/%';
delete from `dok_menu` where `url` like 'CustomMenu/%';
/*删除相应权限节点*/
delete from `dok_auth_rule` where `module`='Mpbase';