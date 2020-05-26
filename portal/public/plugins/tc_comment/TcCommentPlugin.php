<?php
// +----------------------------------------------------------------------
// | TcComment [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 Tangchao All rights reserved.
// +----------------------------------------------------------------------
// | Author: Tangchao <79300975@qq.com>
// +----------------------------------------------------------------------
namespace plugins\tc_comment;
use cmf\lib\Plugin;
use think\Db;

class TcCommentPlugin extends Plugin
{

    public $info = [
        'name'        => 'TcComment',
        'title'       => '评论管理',
        'description' => '评论管理',
        'status'      => 1,
        'author'      => 'Tangchao',
        'version'     => '1.5',
        'demo_url'    => 'https://qq.ytecn.cn',
        'author_url'  => 'https://qq.ytecn.cn'
    ];

    public $hasAdmin = 1;

    public function install()
    {
        return true;
    }

    public function uninstall()
    {
        return true;
    }
    public function comment($param)
    {
        $join   = [
            ['__USER__ u', 'a.user_id = u.id']
        ];
        $where = [];
        $where['status'] = 1;
        $where['object_id'] = $param['object_id'];
        $where['delete_time'] = 0;
        $comments = Db::name('comment')
            ->field('a.*,u.user_login,u.avatar')
            ->alias('a')->join($join)
            ->where($where)
            ->order("id DESC")
            ->paginate(10);
        $page = $comments->render();
        $this->assign("page", $page);
        $this->assign("comments", $comments);
        if(cmf_get_current_user_id()>0){
            $this->assign($param);
            return $this->fetch('comment');
        }else{
            return $this->fetch('nocomment');
        }
    }
}