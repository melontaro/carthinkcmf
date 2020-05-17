<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: pl125 <xskjs888@163.com>
// +----------------------------------------------------------------------
namespace api\car\controller;

use cmf\controller\RestUserBaseController;
use api\car\logic\CarElementModel;

class UserElementsController extends RestUserBaseController
{
    /**
     * 显示资源列表
     */
    public function index()
    {
        $params    = $this->request->get();
        $userId    = $this->getUserId();
        $elementModel = new CarElementModel();
        $dates     = $elementModel->getUserElements($userId, $params);
        $this->success('请求成功!', $dates);
    }

    /**
     * 保存新建的资源
     */
    public function save()
    {
        $dates            = $this->request->post();
        $dates['user_id'] = $this->getUserId();
        $result           = $this->validate($dates, 'Elements.element');
        if ($result !== true) {
            $this->error($result);
        }
        if (empty($dates['published_time'])) {
            $dates['published_time'] = time();
        }
        $elementModel = new CarElementModel();
        $elementModel->addElement($dates);
        $this->success('添加成功！');
    }

    /**
     * 显示指定的资源
     * @param $id
     */
    public function read($id)
    {
        if (empty($id)) {
            $this->error('无效的车id');
        }
        $params       = $this->request->get();
        $params['id'] = $id;
        $userId       = $this->getUserId();
        $elementModel    = new CarElementModel();
        $dates        = $elementModel->getUserElements($userId, $params);
        $this->success('请求成功!', $dates);
    }

    /**
     * 保存更新的资源
     * @param $id
     */
    public function update($id)
    {
        $data   = $this->request->put();
        $result = $this->validate($data, 'Elements.element');
        if ($result !== true) {
            $this->error($result);
        }
        if (empty($id)) {
            $this->error('无效的车id');
        }
        $elementModel = new CarElementModel();
        $result    = $elementModel->editElement($data, $id, $this->getUserId());
        if ($result === false) {
            $this->error('编辑失败！');
        } else {
            $this->success('编辑成功！');
        }
    }

    /**
     * 删除指定资源
     * @param $id
     */
    public function delete($id)
    {
        if (empty($id)) {
            $this->error('无效的车id');
        }
        $elementModel = new CarElementModel();
        $result    = $elementModel->deleteElement($id, $this->getUserId());
        if ($result == -1) {
            $this->error('车已删除');
        }
        if ($result) {
            $this->success('删除成功！');
        } else {
            $this->error('删除失败！');
        }
    }

    /**
     * 批量删除车
     */
    public function deletes()
    {
        $ids = $this->request->post('ids/a');
        if (empty($ids)) {
            $this->error('车id不能为空');
        }
        $elementModel = new CarElementModel();
        $result    = $elementModel->deleteElement($ids, $this->getUserId());
        if ($result == -1) {
            $this->error('车已删除');
        }
        if ($result) {
            $this->success('删除成功！');
        } else {
            $this->error('删除失败！');
        }
    }

    /**
     * 我的车列表
     */
    public function my()
    {
        $params    = $this->request->get();
        $userId    = $this->getUserId();
        $elementModel = new CarElementModel();
        $data      = $elementModel->getUserElements($userId, $params);
        $this->success('请求成功!', $data);
    }
}