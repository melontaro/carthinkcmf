<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: wuwu <15093565100@163.com>
// +----------------------------------------------------------------------
namespace api\car\controller;

use api\car\model\CarBrandModel;
use api\car\service\CarElementService;
use cmf\controller\RestBaseController;

class ListsController extends RestBaseController
{

    /**
     * 推荐车列表
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function recommended()
    {
        $param                = $this->request->param();
        $param['recommended'] = true;

        $carPostService = new CarElementService();
        $elements          = $carPostService->postElements($param);
        //是否需要关联模型
        if (!$elements->isEmpty()) {
            if (!empty($param['relation'])) {
                $allowedRelations = allowed_relations(['user', 'categories'], $param['relation']);
                if (!empty($allowedRelations)) {
                    $elements->load($allowedRelations);
                    $elements->append($allowedRelations);
                }
            }
        }
        $this->success('ok', ['list' => $elements]);
    }

    /**
     * 品牌车列表
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getCategoryPostLists()
    {
        $categoryId = $this->request->param('category_id', 0, 'intval');

        $carCategoryModel = new  CarBrandModel();
        $findCategory        = $carCategoryModel->where('id', $categoryId)->find();

        //品牌是否存在
        if (empty($findCategory)) {
            $this->error('品牌不存在！');
        }

        $param = $this->request->param();

        $carPostService = new CarElementService();
        $elements          = $carPostService->postElements($param);
        //是否需要关联模型
        if (!$elements->isEmpty()) {
            if (!empty($param['relation'])) {
                $allowedRelations = allowed_relations(['user', 'categories'], $param['relation']);
                if (!empty($allowedRelations)) {
                    $elements->load($allowedRelations);
                    $elements->append($allowedRelations);
                }
            }
        }
        $this->success('ok', ['list' => $elements]);
    }

}
