<?php
// +----------------------------------------------------------------------
// | TcComment [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 Tangchao All rights reserved.
// +----------------------------------------------------------------------
// | Author: Tangchao <79300975@qq.com>
// +----------------------------------------------------------------------
namespace plugins\tc_comment\controller;
use cmf\controller\PluginBaseController;
use think\Db;
use app\user\model\UserModel;

require_once getcwd() .'/plugins/tc_comment/lib/AipImageCensor.php';

class IndexController extends PluginBaseController
{
    function index()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();
            $post   = $data['post'];
            if(empty($post['content'])) $this->error('评论不能为空！');
            $strlen=strlen($post['content']);
            if($strlen < 15) $this->error('评论不等低于5个字！');
            $user = cmf_get_current_user();
            if(empty($user)) $this->error('未登录！');
            $admin = Db::name("comment")->where('user_id', $user['id'])->field("create_time")->order(["create_time" => "DESC"])->find();
            if(time()-$admin['create_time']<60) $this->error('1分钟内只能留言一次！');
            $config = Db::name("Plugin")->where('name',"TcComment")->value('config');
            $config = json_decode($config, true);
            if($config['radio']==1){
                $APP_ID = $config['APP_ID'];
                $API_KEY = $config['API_KEY'];
                $SECRET_KEY = $config['SECRET_KEY'];
                $client = new \AipImageCensor($APP_ID, $API_KEY, $SECRET_KEY);
                $result=$client->antiSpam($post['content']);
                if($result== 1) $this->error('请文明评论！');
            }
            $post ['user_id']=$user['id'];
            $post ['full_name']= $user['user_nickname']?$user['user_nickname']:($user['user_login']?$user['user_login']:$user['mobile']);
            if($post ['full_name'] == $user['mobile']) $post ['full_name']=substr_replace($post ['full_name'], '****', 3, 4);
            $post ['email']=$user['user_email'];
            $post ['create_time']=time();
            $post ['url']=$_SERVER['HTTP_REFERER'];
            $result = Db::name('comment')->insertGetId($post);
            if ($result) {
                Db::name('portal_post')->where('id', $post['object_id'])->setInc('comment_count');
                $this->success('留言成功!', url('portal/Article/index', ['id' => $post['object_id']]));
            }else{
                $this->error('数据传入失败！');
            }
        }
    }
}