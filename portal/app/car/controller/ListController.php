<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2021 http://www.xamclub.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: TouchAfflatus <axuyin@163.com>
// +----------------------------------------------------------------------
namespace app\car\controller;

use cmf\controller\HomeBaseController;
use app\car\model\CarBrandModel;

class ListController extends HomeBaseController
{
    /***
     * 车列表
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $id                  = $this->request->param('id', 0, 'intval');
        $carBrandModel = new CarBrandModel();

        $brand = $carBrandModel->where('id', $id)->where('status', 1)->find();
       
        $this->assign('brand', $brand);

        $listTpl = empty($brand['list_tpl']) ? 'list' : $brand['list_tpl'];

        return $this->fetch('/' . $listTpl);
    }

}
