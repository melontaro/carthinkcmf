<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: pl125 <xskjs888@163.com>
// +----------------------------------------------------------------------
namespace api\car\service;

use api\car\model\CarElementModel;
use think\db\Query;

class CarElementService
{
    //模型关联方法
    protected $relationFilter = ['user'];

    /**
     * 车列表
     * @param      $filter
     * @param bool $isPage
     * @return array|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function postElements($filter, $isPage = false)
    {
        $join = [];

        $field = empty($filter['field']) ? 'a.*' : explode(',', $filter['field']);
        //转为查询条件
        if (is_array($field)) {
            foreach ($field as $key => $value) {
                $field[$key] = 'a.' . $value;
            }
            $field = implode(',', $field);
        }
        $page     = empty($filter['page']) ? '' : $filter['page'];
        $limit    = empty($filter['limit']) ? '' : $filter['limit'];
        $order    = empty($filter['order']) ? ['-update_time'] : explode(',', $filter['order']);
        $brand = empty($filter['brand_id']) ? 0 : intval($filter['brand_id']);
        if (!empty($brand)) {
            array_push($join, ['__CAR_BRAND_ELEMENT__ b', 'a.id = b.element_id']);
            $field = $field.',b.id AS element_brand_id,b.list_order,b.brand_id';
        }

        $orderArr = order_shift($order);

        $carElementModel = new CarElementModel();


        if (!empty($page)) {
            $carElementModel = $carElementModel->page($page);
        } elseif (!empty($limit)) {
            $carElementModel = $carElementModel->limit($limit);
        } else {
            $carElementModel = $carElementModel->limit(10);
        }

        $elements = $carElementModel
            ->alias('a')
            ->field($field)
            ->join($join)
            ->where('a.create_time', '>=', 0)
            ->where('a.delete_time', 0)
            ->where('a.post_status', 1)
            ->where(function (Query $query) use ($filter, $isPage) {
                if (!empty($filter['user_id'])) {
                    $query->where('a.user_id', $filter['user_id']);
                }
                $brand = empty($filter['brand_id']) ? 0 : intval($filter['brand_id']);
                if (!empty($brand)) {
                    $query->where('b.brand_id', $brand);
                }
                $startTime = empty($filter['start_time']) ? 0 : strtotime($filter['start_time']);
                $endTime   = empty($filter['end_time']) ? 0 : strtotime($filter['end_time']);
                if (!empty($startTime)) {
                    $query->where('a.published_time', '>=', $startTime);
                }
                if (!empty($endTime)) {
                    $query->where('a.published_time', '<=', $endTime);
                }
                $keyword = empty($filter['keyword']) ? '' : $filter['keyword'];
                if (!empty($keyword)) {
                    $query->where('a.element_title', 'like', "%$keyword%");
                }
                if ($isPage) {
                    $query->where('a.element_type', 2);
                } else {
                    $query->where('a.element_type', 1);
                }
                if (!empty($filter['recommended'])) {
                    $query->where('a.recommended', 1);
                }
                if (!empty($filter['ids'])) {
                    $ids = str_to_arr($filter['ids']);
                    $query->where('a.id', 'in', $ids);
                }
            })
            ->order($orderArr)
            ->select();

        return $elements;
    }

}
