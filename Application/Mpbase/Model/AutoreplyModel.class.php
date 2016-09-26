<?php
// +----------------------------------------------------------------------
// | Thinking [ 2016 - 09 - 24 16:40]
// +----------------------------------------------------------------------
// | Copyright (c) 2014-2015 http://tqtzx.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: s_洋仔 <liuyang87075853@163.com>
// +----------------------------------------------------------------------


namespace Mpbase\Model;
use Admin\Builder\AdminConfigBuilder;
use Think\Model;
/*
 * 自动回复模型AutoReplyModel
 * @package Mpbase\model
 * */
class AutoreplyModel extends Model
{
    public function __construct($name,$tablePrefix,$connection)
    {
        parent::__construct($name,$tablePrefix,$connection);
    }
    public function getArType($key=null,$type=0){
        //解决关注回复，不能是多图文
        if($type){
            $array=array(2=>'消息自动回复',3=>'关键词自动回复');
        }else{
            $array=array(1=>'关注自动回复',2=>'消息自动回复',3=>'关键词自动回复');
        }
        return !isset($key) ? $array :$array[$key];
    }
    public function getMessagesType(){
        $array=array(
            array('id'=>0,'value'=>'全部'),
            array('id'=>1,'value'=>'关注自动回复'),
            array('id'=>2,'value'=>'消息自动回复'),
            array('id'=>3,'value'=>'关键词自动回复'),
        );
        return $array;
    }
    public function replyMessagesType(){
        $array=array(
            array('id'=>0,'value'=>'全部'),
            array('id'=>1,'value'=>'文本'),
            array('id'=>2,'value'=>'图文'),
            array('id'=>3,'value'=>'待定')
        );
        return $array;
    }
    /*判断类型选择数据库*/
    public function post_messages($data){
        switch ($data['type']){
            case 'picture':
                $picturemodel=M('picture_messages');
                !$data['ms_id']?
                    $res=$picturemodel->field('title0,detile0,url0,title1,detile1,url1,title2,detile2,url2,title3,
                    detile3,url3,title4,detile4,url4,pic')->add($data):
                    $res=$picturemodel->field('title0,detile0,url0,title1,detile1,url1,title2,detile2,url2,title3,
                    detile3,url3,title4,detile4,url4,pic')->save($data);
                break;
            case 'text':
                $textmodel=M('text_messages');
                !$data['ms_id']?
                    $res=$textmodel->field('detile')->add($data):
                    $res=$textmodel->field('id,detile')->save($data);
                break;
            default:
                return false;
        }
        return $res;
    }
    public function get_mes_data($data){
        $res_data=$this->get_type_data($data);
        return array_merge($res_data,$data);
    }
    public function get_type_data($data){
        $id=$data['ms_id'];
        switch($data['type']){
            case 'picture':
                $model=M('picture_messages');
                break;
            case 'text':
                $model=M('text_messages');
                break;
        }
        return $model->find($id);
    }


}