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
use app\car\service\ElementService;
use app\car\model\CarElementModel;
use think\Db;

class ElementController extends HomeBaseController
{
    /**
     * 车详情
     * @return mixed
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {

        $carBrandModel = new CarBrandModel();
        $elementService         = new ElementService();

        $elementId  = $this->request->param('id', 0, 'intval');
        $brandId = $this->request->param('cid', 0, 'intval');
        $element    = $elementService->publishedElement($elementId, $brandId);

        if (empty($element)) {
            abort(404, '车不存在!');
        }


        $prevElement = $elementService->publishedPrevElement($elementId, $brandId);
        $nextElement = $elementService->publishedNextElement($elementId, $brandId);

        $tplName = 'element';

        if (empty($brandId)) {
            $brands = $element['brands'];

            if (count($brands) > 0) {
                $this->assign('brands', $brands[0]);
            } else {
                abort(404, '车未指定品牌!');
            }

        } else {
            $brand = $carBrandModel->where('id', $brandId)->where('status', 1)->find();

            if (empty($brand)) {
                abort(404, '车不存在!');
            }

            $this->assign('brand', $brand);

            $tplName = empty($brand["one_tpl"]) ? $tplName : $brand["one_tpl"];
        }

        Db::name('car_element')->where('id', $elementId)->setInc('element_hits');


        hook('car_before_assign_element', $element);

        $this->assign('element', $element);
        $this->assign('prev_element', $prevElement);
        $this->assign('next_element', $nextElement);

        $tplName = empty($element['more']['template']) ? $tplName : $element['more']['template'];

        return $this->fetch("/$tplName");
    }

    // 车点赞
    public function doLike()
    {
        $this->checkUserLogin();
        $elementId = $this->request->param('id', 0, 'intval');


        $canLike = cmf_check_user_action("elements$elementId", 1);

        if ($canLike) {
            Db::name('car_element')->where('id', $elementId)->setInc('element_like');

            $this->success("赞好啦！");
        } else {
            $this->error("您已赞过啦！");
        }
    }

}
