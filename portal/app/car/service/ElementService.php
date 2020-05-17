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
namespace app\car\service;

use app\car\model\CarElementModel;
use think\db\Query;

class ElementService
{
    /**
     * 车查询
     * @param $filter
     * @return \think\Paginator
     * @throws \think\exception\DbException
     */
    public function adminArticleList($filter)
    {
        return $this->adminElementList($filter);
    }

    /**
     * 页面车列表
     * @param $filter
     * @return \think\Paginator
     * @throws \think\exception\DbException
     */
    public function adminPageList($filter)
    {
        return $this->adminElementList($filter, true);
    }

    /**
     * 车查询
     * @param      $filter
     * @param bool $isPage
     * @return \think\Paginator
     * @throws \think\exception\DbException
     */
    public function adminElementList($filter, $isPage = false)
    {

        $join = [
            ['__USER__ u', 'a.user_id = u.id']
        ];

        $field = 'a.*,u.user_login,u.user_nickname,u.user_email';

        $brand = empty($filter['brand']) ? 0 : intval($filter['brand']);
        if (!empty($brand)) {
            array_push($join, [
                '__CAR_BRAND_ELEMENT__ b', 'a.id = b.element_id'
            ]);
            $field = 'a.*,b.id AS element_brand_id,b.list_order,b.brand_id,u.user_login,u.user_nickname,u.user_email';
        }

        $carElementModel = new CarElementModel();
        $elements        = $carElementModel->alias('a')->field($field)
            ->join($join)
            ->where('a.create_time', '>=', 0)
            ->where('a.delete_time', 0)
            ->where(function (Query $query) use ($filter, $isPage) {

                $brand = empty($filter['brand']) ? 0 : intval($filter['brand']);
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
            })
            ->order('update_time', 'DESC')
            ->paginate(10);

        return $elements;

    }

    /**
     * 已发布车查询
     * @param  int $elementId     车id
     * @param int  $brandId 品牌id
     * @return array|string|\think\Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function publishedElement($elementId, $brandId = 0)
    {
        $carElementModel = new CarElementModel();

        if (empty($brandId)) {

            $where = [
                'element.element_type'   => 1,
                'element.element_status' => 1,
                'element.delete_time' => 0,
                'element.id'          => $elementId
            ];

            $element = $carElementModel->alias('element')->field('element.*')
                ->where($where)
                ->where('element.published_time', ['< time', time()], ['> time', 0], 'and')
                ->find();
        } else {
            $where = [
                'element.element_type'       => 1,
                'element.element_status'     => 1,
                'element.delete_time'     => 0,
                'relation.brand_id' => $brandId,
                'relation.element_id'     => $elementId
            ];

            $join    = [
                ['__CAR_BRAND_ELEMENT__ relation', 'element.id = relation.element_id']
            ];
            $element = $carElementModel->alias('element')->field('element.*')
                ->join($join)
                ->where($where)
                ->where('element.published_time', ['< time', time()], ['> time', 0], 'and')
                ->find();
        }


        return $element;
    }

    /**
     * 上一篇车
     * @param int $elementId     车id
     * @param int $brandId 品牌id
     * @return array|string|\think\Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function publishedPrevElement($elementId, $brandId = 0)
    {
        $carElementModel = new CarElementModel();

        if (empty($brandId)) {

            $where = [
                'element.element_type'   => 1,
                'element.element_status' => 1,
                'element.delete_time' => 0,
            ];

            $element = $carElementModel
                ->alias('element')
                ->field('element.*')
                ->where($where)
                ->where('element.id', '<', $elementId)
                ->where('element.published_time', ['< time', time()], ['> time', 0], 'and')
                ->order('id', 'DESC')
                ->find();

        } else {
            $where = [
                'element.element_type'       => 1,
                'element.element_status'     => 1,
                'element.delete_time'     => 0,
                'relation.brand_id' => $brandId,
            ];

            $join    = [
                ['__CAR_BRAND_ELEMENT__ relation', 'element.id = relation.element_id']
            ];
            $element = $carElementModel
                ->alias('element')
                ->field('element.*')
                ->join($join)
                ->where($where)
                ->where('relation.element_id', '<', $elementId)
                ->where('element.published_time', ['< time', time()], ['> time', 0], 'and')
                ->order('id', 'DESC')
                ->find();
        }


        return $element;
    }

    /**
     * 下一篇车
     * @param int $elementId     车id
     * @param int $brandId 品牌id
     * @return array|string|\think\Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function publishedNextElement($elementId, $brandId = 0)
    {
        $carElementModel = new CarElementModel();

        if (empty($brandId)) {

            $where = [
                'element.element_type'   => 1,
                'element.element_status' => 1,
                'element.delete_time' => 0,
            ];

            $element = $carElementModel->alias('element')->field('element.*')
                ->where($where)
                ->where('element.id', '>', $elementId)
                ->where('element.published_time', ['< time', time()], ['> time', 0], 'and')
                ->order('id', 'ASC')
                ->find();
        } else {
            $where = [
                'element.element_type'       => 1,
                'element.element_status'     => 1,
                'element.delete_time'     => 0,
                'relation.brand_id' => $brandId,

            ];

            $join    = [
                ['__CAR_BRAND_ELEMENT__ relation', 'element.id = relation.element_id']
            ];
            $element = $carElementModel->alias('element')->field('element.*')
                ->join($join)
                ->where($where)
                ->where('relation.element_id', '>', $elementId)
                ->where('element.published_time', ['< time', time()], ['> time', 0], 'and')
                ->order('id', 'ASC')
                ->find();
        }


        return $element;
    }

    /**
     * 页面管理查询
     * @param int $pageId 车id
     * @return array|string|\think\Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function publishedPage($pageId)
    {

        $where = [
            'element_type'   => 2,
            'element_status' => 1,
            'delete_time' => 0,
            'id'          => $pageId
        ];

        $carElementModel = new CarElementModel();
        $page            = $carElementModel
            ->where($where)
            ->where('published_time', ['< time', time()], ['> time', 0], 'and')
            ->find();

        return $page;
    }

}