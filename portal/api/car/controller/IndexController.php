<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: pl125 <xskjs888@163.com>
// +----------------------------------------------------------------------
namespace api\car\controller;

use api\car\model\CarElementModel;
use cmf\controller\RestBaseController;
use api\car\model\CarTagModel;

class IndexController extends RestBaseController
{
    protected $tagModel;

    /**
     * 获取标签列表
     */
    public function index()
    {
        $this->success('请求成功!', "DD");
    }

    /**
     * 获取热门标签列表
     */
    public function hotTags()
    {
        $params                         = $this->request->get();
        $params['where']['recommended'] = 1;
        $data                           = $this->tagModel->getDatas($params);

        if (empty($this->apiVersion) || $this->apiVersion == '1.0.0') {
            $response = $data;
        } else {
            $response = ['list' => $data,];
        }
        $this->success('请求成功!', $response);
    }

    /**
     * 获取标签车列表
     * @param int $id
     */
    public function elements($id)
    {
        if (intval($id) === 0) {
            $this->error('无效的标签id！');
        } else {
            $params    = $this->request->param();
            $elementModel = new CarElementModel();

            unset($params['id']);

            $elements = $elementModel->paramsFilter($params)->alias('post')
                ->join('__CAR_TAG_ELEMENT__ tag_element', 'post.id = tag_post.post_id')
                ->where(['tag_post.tag_id' => $id])->select();

            if (!empty($params['relation'])) {
                $allowedRelations = $elementModel->allowedRelations($params['relation']);
                if (!empty($allowedRelations)) {
                    if (count($elements) > 0) {
                        $elements->load($allowedRelations);
                        $elements->append($allowedRelations);
                    }
                }
            }


            $this->success('请求成功!', ['elements' => $elements]);
        }
    }
}
