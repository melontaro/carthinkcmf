<?php
// +----------------------------------------------------------------------
// | TcComment [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 Tangchao All rights reserved.
// +----------------------------------------------------------------------
// | Author: Tangchao <79300975@qq.com>
// +----------------------------------------------------------------------
namespace plugins\tc_comment\controller;

use think\Db;
use cmf\controller\PluginBaseController;

class AdminIndexController extends PluginBaseController
{

    function _initialize()
    {
        $adminId = cmf_get_current_admin_id();
        if (!empty($adminId)) {
            $this->assign("admin_id", $adminId);
        } else {
            $this->error('未登录');
        }
    }

    function index()
    {
        $where = [];
        $where['delete_time'] = 0;
        $comments = Db::name('comment')
            ->where($where)
            ->order("id DESC")
            ->paginate(10);
        $page = $comments->render();
        $this->assign("page", $page);
        $this->assign("comments", $comments);
        return $this->fetch('/admin_index');
    }

    public function delete()
    {
        $id   = $this->request->param("id", 0, "intval");
        $userQuery           = Db::name("Comment");
        $where['id']         = $id;
        $data['delete_time'] = time();
        $userQuery->where($where)->update($data);
        if ($data) {
            Db::name('portal_post')->where('id', $id)->setDec('comment_count');
            $this->success("删除成功！");
        } else {
            $this->error("删除失败！");
        }
    }

    public function cancelBan()
    {
        $id = input('param.id', 0, 'intval');
        if ($id) {
            $result = Db::name("Comment")->where(["id" => $id, "status" => 0])->setField('status', 1);
            if ($result) {
                Db::name('portal_post')->where('id', $id)->setInc('comment_count');
                $this->success("评论审核成功！", '');
            }else {
                $this->error('评论切换失败,评论不存在！');
            }
        } else {
            $this->error('数据传入失败！');
        }
    }
    
    public function ban()
    {
        $id = input('param.id', 0, 'intval');
        if ($id) {
            $result = Db::name("Comment")->where(["id" => $id, "status" => 1])->setField('status', 0);
            if ($result) {
                Db::name('portal_post')->where('id', $id)->setDec('comment_count');
                $this->success("评论已切换成未审核！", '');
            } else {
                $this->error('评论切换失败,评论不存在！');
            }
        } else {
            $this->error('数据传入失败！');
        }
    }
}
