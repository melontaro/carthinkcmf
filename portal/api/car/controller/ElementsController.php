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
use api\user\model\UserFavoriteModel;
use api\user\model\UserLikeModel;
use cmf\controller\RestBaseController;
use api\car\model\CarElementModel;
use think\Db;

class ElementsController extends RestBaseController
{
    /**
     * 车列表
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $params      = $this->request->get();
        $elementService = new CarElementService();
        $data        = $elementService->elementElements($params);
        //是否需要关联模型
        if (!$data->isEmpty()) {
            if (!empty($params['relation'])) {

                $allowedRelations = allowed_relations(['user', 'brands'], $params['relation']);

                if (!empty($allowedRelations)) {
                    $data->load('user');
                    $data->append($allowedRelations);
                }
            }
        }
        if (empty($this->apiVersion) || $this->apiVersion == '1.0.0') {
            $response = $data;
        } else {
            $response = ['list' => $data];
        }
        $this->success('请求成功!', $response);
    }

    /**
     * 获取指定的车
     * @param $id
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function read($id)
    {
        if (intval($id) === 0) {
            $this->error('无效的车id！');
        } else {
            $elementModel = new CarElementModel();
            $data      = $elementModel->where('id', $id)->find();

            if (empty($data)) {
                $this->error('车不存在！');
            } else {
                $elementModel->where('id', $id)->setInc('element_hits');
                $url         = cmf_url('car/Element/index', ['id' => $id, 'cid' => $data['brands'][0]['id']], true, true);
                $data['url'] = $url;
                $this->success('请求成功!', $data);
            }

        }
    }

    /**
     * 我的车列表
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function my()
    {
        $params            = $this->request->get();
        $params['user_id'] = $this->getUserId();

        $elementService = new CarElementService();
        $data        = $elementService->elementElements($params);

        if (empty($this->apiVersion) || $this->apiVersion == '1.0.0') {
            $response = [$data];
        } else {
            $response = ['list' => $data];
        }

        $this->success('请求成功!', $response);
    }

    /**
     * 添加车
     * @throws \think\Exception
     */
    public function save()
    {
        $data            = $this->request->element();
        $data['user_id'] = $this->getUserId();
        $result          = $this->validate($data, 'Elements.element');
        if ($result !== true) {
            $this->error($result);
        }

        if (empty($data['published_time'])) {
            $data['published_time'] = time();
        }
        $elementModel = new CarElementModel();
        $elementModel->addElement($data);
        $this->success('添加成功！');
    }

    /**
     * 更新车
     * @param $id
     * @throws \think\Exception
     */
    public function update($id)
    {
        $data   = $this->request->put();
        $result = $this->validate($data, 'Elements.element');
        if ($result !== true) {
            $this->error($result);
        }
        $elementModel = new CarElementModel();
        $res       = $elementModel->elementFind(['id' => $id, 'user_id' => $this->getUserId()]);
        if (empty($res)) {
            $this->error('车不存在或者已经删除！');
        }

        $result = $elementModel->editElement($data, $id, $this->getUserId());

        if ($result === false) {
            $this->error('编辑失败！');
        } else {
            $this->success('编辑成功！');
        }
    }

    /**
     * 删除车
     * @param $id
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
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
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function deletes()
    {
        $ids = $this->request->element('ids/a');
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
     * 搜索查询
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function search()
    {
        $params = $this->request->get();

        if (!empty($params['keyword'])) {
            $elementService = new CarElementService();
            $data        = $elementService->elementElements($params);

            if (empty($this->apiVersion) || $this->apiVersion == '1.0.0') {
                $response = $data;
            } else {
                $response = ['list' => $data,];
            }
            $this->success('请求成功!', $response);
        } else {
            $this->error('搜索关键词不能为空！');
        }

    }

    /**
     * 车点赞
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function doLike()
    {
        $userId    = $this->getUserId();
        $elementId = $this->request->param('id', 0, 'intval');

        $userLikeModel = new UserLikeModel();

        $findLikeCount = $userLikeModel->where([
            'user_id'   => $userId,
            'object_id' => $elementId
        ])->where('table_name', 'car_element')->count();

        if (empty($findLikeCount)) {
            $elementModel = new CarElementModel();
            $element   = $elementModel->where('id', $elementId)->field('id,element_title,element_excerpt,more')->find();

            if (empty($element)) {
                $this->error('车不存在！');
            }

            Db::startTrans();
            try {
                $elementModel->where(['id' => $elementId])->setInc('element_like');
                $thumbnail = empty($element['more']['thumbnail']) ? '' : $element['more']['thumbnail'];
                $userLikeModel->insert([
                    'user_id'     => $userId,
                    'object_id'   => $elementId,
                    'table_name'  => 'car_element',
                    'title'       => $element['element_title'],
                    'thumbnail'   => $thumbnail,
                    'description' => $element['element_excerpt'],
                    'url'         => json_encode(['action' => 'car/Element/index', 'param' => ['id' => $elementId, 'cid' => $element['brands'][0]['id']]]),
                    'create_time' => time()
                ]);
                Db::commit();
            } catch (\Exception $e) {
                Db::rollback();
                $this->error('点赞失败！');
            }

            $likeCount = $elementModel->where('id', $elementId)->value('element_like');
            $this->success("赞好啦！", ['element_like' => $likeCount]);
        } else {
            $this->error("您已赞过啦！");
        }
    }

    /**
     * 取消车点赞
     */
    public function cancelLike()
    {
        $userId = $this->getUserId();

        $elementId = $this->request->param('id', 0, 'intval');

        $userLikeModel = new UserLikeModel();

        $findLikeCount = $userLikeModel->where([
            'user_id'   => $userId,
            'object_id' => $elementId
        ])->where('table_name', 'car_element')->count();

        if (!empty($findLikeCount)) {
            $elementModel = new CarElementModel();
            Db::startTrans();
            try {
                $elementModel->where(['id' => $elementId])->setDec('element_like');
                $userLikeModel->where([
                    'user_id'   => $userId,
                    'object_id' => $elementId
                ])->where('table_name', 'car_element')->delete();
                Db::commit();
            } catch (\Exception $e) {
                Db::rollback();
                $this->error('取消点赞失败！');
            }

            $likeCount = $elementModel->where('id', $elementId)->value('element_like');
            $this->success("取消点赞成功！", ['element_like' => $likeCount]);
        } else {
            $this->error("您还没赞过！");
        }
    }

    /**
     * 车收藏
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function doFavorite()
    {
        $userId = $this->getUserId();

        $elementId = $this->request->param('id', 0, 'intval');

        $userFavoriteModel = new UserFavoriteModel();

        $findFavoriteCount = $userFavoriteModel->where([
            'user_id'   => $userId,
            'object_id' => $elementId
        ])->where('table_name', 'car_element')->count();

        if (empty($findFavoriteCount)) {
            $elementModel = new CarElementModel();
            $element   = $elementModel->where(['id' => $elementId])->field('id,element_title,element_excerpt,more')->find();
            if (empty($element)) {
                $this->error('车不存在！');
            }

            Db::startTrans();
            try {
                $elementModel->where(['id' => $elementId])->setInc('element_favorites');
                $thumbnail = empty($element['more']['thumbnail']) ? '' : $element['more']['thumbnail'];
                $userFavoriteModel->insert([
                    'user_id'     => $userId,
                    'object_id'   => $elementId,
                    'table_name'  => 'car_element',
                    'thumbnail'   => $thumbnail,
                    'title'       => $element['element_title'],
                    'description' => $element['element_excerpt'],
                    'url'         => json_encode(['action' => 'car/Element/index', 'param' => ['id' => $elementId, 'cid' => $element['brands'][0]['id']]]),
                    'create_time' => time()
                ]);
                Db::commit();
            } catch (\Exception $e) {
                Db::rollback();

                $this->error('收藏失败！');
            }

            $favoriteCount = $elementModel->where('id', $elementId)->value('element_favorites');
            $this->success("收藏好啦！", ['element_favorites' => $favoriteCount]);
        } else {
            $this->error("您已收藏过啦！");
        }
    }

    /**
     * 取消车收藏
     */
    public function cancelFavorite()
    {
        $userId = $this->getUserId();

        $elementId = $this->request->param('id', 0, 'intval');

        $userFavoriteModel = new UserFavoriteModel();

        $findFavoriteCount = $userFavoriteModel->where([
            'user_id'   => $userId,
            'object_id' => $elementId
        ])->where('table_name', 'car_element')->count();

        if (!empty($findFavoriteCount)) {
            $elementModel = new CarElementModel();
            Db::startTrans();
            try {
                $elementModel->where(['id' => $elementId])->setDec('element_favorites');
                $userFavoriteModel->where([
                    'user_id'   => $userId,
                    'object_id' => $elementId
                ])->where('table_name', 'car_element')->delete();
                Db::commit();
            } catch (\Exception $e) {
                Db::rollback();
                $this->error('取消失败！');
            }

            $favoriteCount = $elementModel->where('id', $elementId)->value('element_favorites');
            $this->success("取消成功！", ['element_favorites' => $favoriteCount]);
        } else {
            $this->error("您还没收藏过！");
        }
    }


    /**
     * 相关车列表
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function relatedElements()
    {
        $elementId  = $this->request->param('id', 0, 'intval');
        $brandId = Db::name('car_brand_element')->where('element_id', $elementId)->value('brand_id');

        $elementModel = new CarElementModel();
        $elements  = $elementModel
            ->alias('element')
            ->join('__CAR_BRAND_ELEMENT__ brand_element', 'element.id=brand_element.element_id')
            ->where(['element.delete_time' => 0, 'element.element_status' => 1, 'brand_element.brand_id' => $brandId])
            ->orderRaw('rand()')
            ->limit(5)
            ->select();
        if ($elements->isEmpty()){
            $this->error('没有相关车！');
        }
        $this->success('success', ['list' => $elements]);
    }
}