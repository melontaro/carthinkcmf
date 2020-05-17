<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: pl125 <xskjs888@163.com>
// +----------------------------------------------------------------------

namespace api\car\controller;

use api\car\service\CarBrandService;
use cmf\controller\RestBaseController;
use api\car\model\CarBrandModel;

class BrandsController extends RestBaseController
{
    /**
     * 获取品牌列表
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {

        $params          = $this->request->get();
        $brandService = new CarBrandService();
        $data            = $brandService->brands($params);
        if (empty($this->apiVersion) || $this->apiVersion == '1.0.0') {
            $response = $data;
        } else {
            $response = ['list' => $data];
        }

        $this->success('请求成功!', $response);
    }

    /**
     * 显示指定的品牌
     * @param $id
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function read($id)
    {
        $brandModel = new CarBrandModel();
        $data          = $brandModel
            ->where('delete_time', 0)
            ->where('status', 1)
            ->where('id', $id)
            ->find();
        if ($data) {
            $this->success('请求成功！', $data);
        } else {
            $this->error('该品牌不存在！');
        }

    }

    /**
     * 获取指定品牌的子品牌列表
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function subBrands()
    {
        $id = $this->request->get('brand_id', 0, 'intval');

        $brandModel = new CarBrandModel();
        $brands    = $brandModel->where(['parent_id' => $id])->select();
        if (!$brands->isEmpty()) {
            $this->success('请求成功', ['brands' => $brands]);
        } else {
            $this->error('该品牌下没有子品牌！');
        }


    }
}
