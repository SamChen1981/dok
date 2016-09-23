<?php
// +----------------------------------------------------------------------
// | Thinking [ 2016 - 09 - 23 14:50]
// +----------------------------------------------------------------------
// | Copyright (c) 2014-2015 http://tqtzx.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: s_洋仔 <liuyang87075853@163.com>
// +----------------------------------------------------------------------


namespace Admin\Controller;

use Think\Controller;
use Admin\Builder\AdminConfigBuilder;
use Admin\Builder\AdminListBuilder;
use Admin\Builder\AdminTreeListBuilder;

/*
 *
 * 公众号后台管理逻辑
 *
 * */

class MpbaseController extends AdminController
{
    public function __construct()
    {
        parent::__construct();
    }

    //公众号配置操作
    public function config()
    {
        $admin_config = new AdminConfigBuilder();
        $data = $admin_config->handleConfig();

        $admin_config->title("基本配置")->keyBool('NEED_VERIFY', '公众号是否需要审核', '默认无需审核')->buttonSubmit('', '保存')->data($data);
        $admin_config->display();
    }

    //默认操作
    public function index($page = 1, $r = 20)
    {
        //读取公众号列表数据
        $model = D('Mpbase/MemberPublic');
        $map['status'] = array('EGT', 0);
        if (!is_administrator()) {//管理员可以查看全部的公众号
            $map['uid'] = UID;
        }
        $list = $model->where($map)->page($page, $r)->order('id desc')->select();
        dump($list);
        int_to_string($list);//设置status为中文状态
        foreach ($list as &$val) {
            $val['u_name'] = D('Common/Member')->where('uid=' . $val['uid'])->getField('nickname');
            $val['type'] = $model->getMpType($val['type']);
        }
        $totalCount = $model->count();
        //显示页面
        $builder = new AdminListBuilder();
        $builder
            ->title('公众号列表')
            ->buttonNew(U('Mpbase/edit'))
            ->setStatusUrl(U('setStatus'))->buttonEnable()->buttonDisable()
            ->button('删除', array('class' => 'btnajax-post tox-confirm', 'data-confirm' => '您确实要删除公众号吗？（删除后对应的公众号配置将会清空，不可恢复，请谨慎操作！）', 'url' => U('del'), 'target-form' => 'ids'))
            ->keyId()->keyUid()->keyText('public_name', '名称')->keyText('wechat', '微信号')->keyText('public_id', '原始ID')
            ->keyText('type', '公众号类型')->keyStatus()->keyDoActionEdit('edit?id=###')->keyDoAction('del?ids=###', '删除')
            ->keyDoAction('change?id=###', '切换为当前公众号')->keyDoAction('Home/Index/help?id=###', '接口配置')
            ->data($list)
            ->pagination($totalCount, $r)->display();

    }

    /*
     *新增公众号和编辑公众号
     * 编辑时必须带上$id参数，没有参数则默认为新增
     */
    public function edit($id = null)
    {
        $model = D('Mpbase/MemberPublic');
        if (IS_POST) {//表单提交处理
            echo "测试";
            $data['uid'] = I('post.uid', '', 'op_t');
            $data['public_name'] = I('post.public_name', '', 'op_t');
            $data['wechat'] = I('post.wechat', 1, 'op_t');
            $data['public_id'] = I('post.public_id', 1, 'op_t');
            $data['mp_type'] = I('post.mp_type', '', 'intval');
            $data['appid'] = I('post.appid', '', 'op_t');
            $data['secret'] = I('post.secret', '', 'op_t');
            $data['encodingaeskey'] = I('post.encodingaeskey', '', 'op_t');
            $data['mchid'] = I('post.mchid', '', 'op_t');
            $data['mchkey'] = I('post.mchkey', '', 'op_t');
            $data['notify_url'] = I('post.notify_url', '', 'op_t');
            $data['status'] = I('post.status', 1, 'intval');
            $data['mp_id'] = mpid_md5($data['appid']);//appid加密生成
            if ($id != 0) {
                $data['id'] = $id;
                $res = $model->editMp($data);
            } else {
                $res = $model->addMp($data);
            }
            $this->success(($id == 0 ? '添加' : '编辑') . '成功', $id == 0 ? U('', array('id' => $res)) : '');
        } else {//显示添加/编辑表单
            //读取公众号
            if ($id != 0) {//编辑
                $mp = $model->where(array('id' => $id))->find();
                if ($mp['uid']) {//公众号有归属账号
                } else {
                    !is_administrator() ?: $mp['uid'] = UID;
                }
            } else {//新增
                $mp = array('uid' => UID, 'status' => 1);
            }
            //显示页面
            $builder = new AdminConfigBuilder();
            if (is_administrator()) {//管理员可以设置公众号的uid
                $builder->title($id != 0 ? '编辑公众号' : '添加公众号')
                    ->keyId()->keyUid('uid', '用户', '公众号管理员')->keyReadOnly('mp_id', '公众号索引ID', '公众号索引ID')
                    ->keyText('public_name', '名称', '公众号名称')->keyText('wechat', '微信号', '微信号')
                    ->keyText('public_id', '原始ID', '公众号原始ID')
                    ->keySelect('mp_type', '类型', '请选择公众号类型', $model->getMpType(null))
                    ->keyText('appid', 'AppID', '应用ID')->keyText('secret', 'AppSecret', '应用密钥')
                    ->keyText('encodingaeskey', '消息加解密密钥', '安全模式下必填')
                    ->keyText('mchid', '支付商户号', '微信支付必须设置')->keyText('mchkey', '微信支付密钥', '微信支付必须设置')
                    ->keyText('notify_url', '微信支付回调地址', '微信支付必须配置，带http://的完整url')
                    ->keyStatus()->data($mp)->buttonSubmit(U('edit'))->buttonBack()->display();
            } else {//非管理员以登陆账号的uid作为公众号的uid
                $builder->title($id != 0 ? '编辑公众号' : '添加公众号')
                    ->keyId()->keyReadOnly('uid', '用户', '公众号管理员')->keyReadOnly('mp_id', '公众号索引ID', '公众号索引ID')
                    ->keyText('public_name', '名称', '公众号名称')->keyText('wechat', '微信号', '微信号')
                    ->keyText('public_id', '原始ID', '公众号原始ID')
                    ->keySelect('mp_type', '类型', '请选择公众号类型', $model->getMpType(null))
                    ->keyText('appid', 'AppID', '应用ID')->keyText('secret', 'AppSecret', '应用密钥')
                    ->keyText('encodingaeskey', '消息加解密密钥', '安全模式下必填')
                    ->keyText('mchid', '支付商户号', '微信支付必须设置')->keyText('mchkey', '微信支付密钥', '微信支付必须设置')
                    ->keyText('notify_url', '微信支付回调地址', '微信支付必须配置，带http://的完整url')
                    ->keyStatus()->data($mp)->buttonSubmit(U('edit'))->buttonBack()->display();
            }

        }

    }

}