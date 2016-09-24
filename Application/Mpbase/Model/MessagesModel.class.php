<?php
// +----------------------------------------------------------------------
// | Thinking [ 2016 - 09 - 24 17:19]
// +----------------------------------------------------------------------
// | Copyright (c) 2014-2015 http://tqtzx.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: s_洋仔 <liuyang87075853@163.com>
// +----------------------------------------------------------------------


namespace Mpbase\Model;
use Think\Model;

class MessagesModel extends Model
{
    public function get_replay_all($where=null,$r=10,$page=1){
        $model=D('replay_messages');
        $select['data']=$model->where($where)->page($page,$r)->select();
        foreach($select['data'] as &$v){
            switch ($v['type']){
                case 'text':
                    $v['editaction']='<a href="'.U('edit_text_messages',array('id'=>$v['id'])) .'">查看or编辑</a>';
                    break;
                case 'picture':
                    $v['editaction']='<a href="'.U('edit_picture_messages',array('id'=>$v['id'])).'"查看or编辑</a>';
                    break;
            }
            switch ($v['mtype']){
                case 1:
                    $v['mtype']='关注自动回复';
                    !$v['statu'] ? $statu=array('url'=>'Admin/Mpbase/open_mes_uq','text'=>'启用'):$statu=array(
                        'url'=>'Admin/Mpbase/close_mes','text'=>'停用');
                    $v['statu']='<a href="'.U($statu['url'],array('id'=>$v['id'])).'">'.$statu['text'].'</a>';
                    break;
                case 2:
                    $v['mtype']='消息自动回复';
                    !$v['statu'] ? $statu=array('url'=>'Admin/Mpbase/open_mes_uq','text'=>'启用'):$statu=array(
                        'url'=>'Admin/Mpbase/close_mes','text'=>'停用');
                    $v['statu']='<a href="'.U($statu['url'],array('id'=>$v['id'])).'">'.$statu['text'].'</a>';
                    break;
                case 3:
                    $v['mtype']='关键词自动回复';
                    !$v['statu'] ? $statu=array('url'=>'Admin/Mpbase/open_mes_kw','text'=>'启用'):$statu=array(
                        'url'=>'Admin/Mpbase/close_mes','text'=>'停用');
                    $v['statu']='<a href="'.U($statu['url'],array('id'=>$v['id'])).'">'.$statu['text'].'</a>';
                    break;
            }
        }
        $select['count']=$model->where($where)->count();
        return $select;
    }

}