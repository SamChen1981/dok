<?php
// +----------------------------------------------------------------------
// | Thinking [ 2016 - 09 - 23 16:47]
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: s_洋仔 <liuyang87075853@163.com>
// +----------------------------------------------------------------------
/**
微信常用的函数
 **/

/*
 * 系统非常规md5加密方法
 *@param string $str 要加密的字符串
 *@return string
 * */
function mpid_md5($str,$key=null){
    trace($str,'TplMsg2:','DEBUG',true);
    return ''===$str ? '' : md5(sha1($str).$key);
}
//获取上下文公众号的mp_id
function get_mpid($mp_id=null){
    if($mp_id !== null){
        session('mp_id',$mp_id);
    }else if(!empty($_REQUEST['mp_id'])){
        $mp_id=I('mp_id','','/^\{32}$/');
        empty($mp_id) || session('mp_id',$mp_id);
    }
    $mp_id=session('mp_id');
    if(empty($mp_id)){
        $mp_id=session('user_auth.mp_id');
    }
    if(empty($mp_id)){
        $map['uid']=is_login();
        $map['public_id']=get_token();
        $mp=D('Mpbase/MemberPublic')->where($map)->find();//所登陆会员账号当前管理的公众号
        $mp_id=$mp['mp_id'];
    }
    if(empty($mp_id)){
        return -1;
    }
    return $mp_id;
}
//获取当前用户的token
function get_token($token=NULL){
    if($token !==NULL){
        session('token',$token);
    }elseif(!empty($_REQUEST['token'])){
        session('token',$_REQUEST['token']);
    }
    $token=session('token');
    if(empty($token)){
        $token=session('user_auto.token');
    }
    if(empty($token)){
        return -1;
    }
    return $token;
}