<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: pl125 <xskjs888@163.com>
// +----------------------------------------------------------------------

namespace api\car\controller;

use api\car\service\CarElementService;
use cmf\controller\RestBaseController;
use api\car\model\CarElementModel;

class PagesController extends RestBaseController
{
    /**
     * 页面列表
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $params      = $this->request->get();
        $postService = new CarElementService();
        $data        = $postService->postElements($params, true);

        if (empty($this->apiVersion) || $this->apiVersion == '1.0.0') {
            $response = $data;
        } else {
            $response = ['list' => $data,];
        }
        $this->success('请求成功!', $response);
    }

    /**
     * 获取页面
     * @param $id
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function read($id)
    {

        $params    = $this->request->get();
        $field     = empty($params['field']) ? '*' : $params['field'];
        $elementModel = new CarElementModel();
        $data      = $elementModel
            ->field($field)
            ->where('id', $id)
            ->where('delete_time', 0)
            ->where('post_status', 1)
            ->where('post_type', 2)
            ->find();
        if ($data){
            $this->success('请求成功!', $data);
        }else{
            $this->error('车不存在！');
        }

    }
}
