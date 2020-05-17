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
namespace app\car\api;

use app\car\model\CarBrandModel;
use think\db\Query;

class BrandApi
{
    /**
     * 品牌列表 用于模板设计
     * @param array $param
     * @return false|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index($param = [])
    {
        $carBrandModel = new CarBrandModel();

        $where = ['delete_time' => 0];

        //返回的数据必须是数据集或数组,item里必须包括id,name,如果想表示层级关系请加上 parent_id
        return $carBrandModel->where($where)
            ->where(function (Query $query) use ($param) {
                if (!empty($param['keyword'])) {
                    $query->where('name', 'like', "%{$param['keyword']}%");
                }
            })->select();
    }

    /**
     * 品牌列表 用于导航选择
     * @return array
     */
    public function nav()
    {
        $carBrandModel = new CarBrandModel();

        $where = ['delete_time' => 0];

        $brands = $carBrandModel->where($where)->select();

        $return = [
            //'name'  => '车品牌',
            'rule'  => [
                'action' => 'car/List/index',
                'param'  => [
                    'id' => 'id'
                ]
            ],//url规则
            'items' => $brands //每个子项item里必须包括id,name,如果想表示层级关系请加上 parent_id
        ];

        return $return;
    }

}