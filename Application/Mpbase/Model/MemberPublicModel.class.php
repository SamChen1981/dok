<?php
// +----------------------------------------------------------------------
// | Thinking [ 2016 - 09 - 23 10:46]
// +----------------------------------------------------------------------
// | Copyright (c) 2014-2015 http://tqtzx.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: s_洋仔 <liuyang87075853@163.com>
// +----------------------------------------------------------------------


namespace Mpbase\Model;
use Think\Model;
/*
 * 公众号管理模型
 *@package Mpbase\Model
 *
 */

class MemberPublicModel extends Model
{
    public function getMpType($key=null){
        $array=array(1=>'普通订阅号',2=>'认证订阅号/普通服务号',3=>'认证服务号',4=>'企业号');
        return !isset($key) ?$array:$array[$key];
    }
    public function addMp($data){
        $res=$this->add($data);
        return $res;
    }
    public function getMp($where){
        $mp=$this->where($where)->find();
        return $mp;
    }
    public function getList($where){
        $list=$this->where($where)->select();
        return $list;
    }
    public function editMp($data){
        $res=$this->save($data);
        return $res;
    }

}