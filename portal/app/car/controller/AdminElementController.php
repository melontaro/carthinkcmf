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

use cmf\controller\AdminBaseController;
use app\car\model\CarElementModel;
use app\car\service\ElementService;
use app\car\model\CarBrandModel;
use think\Db;
use app\admin\model\ThemeModel;

class AdminElementController extends AdminBaseController
{
    /**
     * 车列表
     * @adminMenu(
     *     'name'   => '车管理',
     *     'parent' => 'car/AdminIndex/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车列表',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {

        $content = hook_one('car_admin_element_index_view');

        if (!empty($content)) {
            return $content;
        }

        $param = $this->request->param();

        $brandId = $this->request->param('brand', 0, 'intval');

        $elementService = new ElementService();
        $data        = $elementService->adminElementList($param);

        $data->appends($param);

        $carBrandModel = new CarBrandModel();
        $brandTree        = $carBrandModel->adminBrandTree($brandId);

        $this->assign('start_time', isset($param['start_time']) ? $param['start_time'] : '');
        $this->assign('end_time', isset($param['end_time']) ? $param['end_time'] : '');
        $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');
        $this->assign('elements', $data->items());
        $this->assign('brand_tree', $brandTree);
        $this->assign('brand', $brandId);
        $this->assign('page', $data->render());


        return $this->fetch();
    }

    /**
     * 添加车
     * @adminMenu(
     *     'name'   => '添加车',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加车',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function add()
    {
        $content = hook_one('car_admin_element_add_view');

        if (!empty($content)) {
            return $content;
        }

        $themeModel        = new ThemeModel();
        $elementThemeFiles = $themeModel->getActionThemeFiles('car/Element/index');
        $this->assign('element_theme_files', $elementThemeFiles);
        return $this->fetch();
    }

    /**
     * 添加车提交
     * @adminMenu(
     *     'name'   => '添加车提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加车提交',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {

        if ($this->request->isPost()) {
            $data = $this->request->param();

            //状态只能设置默认值。未发布、未置顶、未推荐
            $data['element']['element_status'] = 0;
            $data['element']['is_top']      = 0;
            $data['element']['recommended'] = 0;

            $element = $data['element'];

            $result = $this->validate($element, 'AdminElement');
            if ($result !== true) {
                $this->error($result);
            }

            $carElementModel = new CarElementModel();

            if (!empty($data['photo_names']) && !empty($data['photo_urls'])) {
                $data['element']['more']['photos'] = [];
                foreach ($data['photo_urls'] as $key => $url) {
                    $photoUrl = cmf_asset_relative_url($url);
                    array_push($data['element']['more']['photos'], ["url" => $photoUrl, "name" => $data['photo_names'][$key]]);
                }
            }

            if (!empty($data['file_names']) && !empty($data['file_urls'])) {
                $data['element']['more']['files'] = [];
                foreach ($data['file_urls'] as $key => $url) {
                    $fileUrl = cmf_asset_relative_url($url);
                    array_push($data['element']['more']['files'], ["url" => $fileUrl, "name" => $data['file_names'][$key]]);
                }
            }


            $carElementModel->adminAddElement($data['element'], $data['element']['brands']);

            $data['element']['id'] = $carElementModel->id;
            $hookParam          = [
                'is_add'  => true,
                'element' => $data['element']
            ];
            hook('car_admin_after_save_element', $hookParam);


            $this->success('添加成功!', url('AdminElement/edit', ['id' => $carElementModel->id]));
        }

    }

    /**
     * 编辑车
     * @adminMenu(
     *     'name'   => '编辑车',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑车',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function edit()
    {
        $content = hook_one('car_admin_element_edit_view');

        if (!empty($content)) {
            return $content;
        }

        $id = $this->request->param('id', 0, 'intval');

        $carElementModel = new CarElementModel();
        $element            = $carElementModel->where('id', $id)->find();

        $elementbrands  = $element->brands()->alias('a')->column('a.name', 'a.id');//数组
        $elementBrandIds = implode(',', array_keys($elementbrands));//把数组元素组合为字符串

        $elementages  = $element->ages()->alias('a')->column('*', 'a.id');
        $elementAgeIds = implode(',', array_keys($elementages));

        $elementareas  = $element->areas()->alias('a')->column('a.name', 'a.id');
        $elementAreaIds = implode(',', array_keys($elementareas));

        $elementcolors  = $element->colors()->alias('a')->column('a.name', 'a.id');
        $elementColorIds = implode(',', array_keys($elementcolors));

        $elementcountrys  = $element->countrys()->alias('a')->column('a.name', 'a.id');
        $elementCountryIds = implode(',', array_keys($elementcountrys));

        $elementdisplacementranges  = $element->displacementRanges()->alias('a')->column('a.min_displacement','a.max_displacement', 'a.id');
        $elementDisplacementRangeIds = implode(',', array_keys($elementdisplacementranges));

        $elementemissionstandards  = $element->emissionStandards()->alias('a')->column('a.name', 'a.id');
        $elementEmissionStandardIds = implode(',', array_keys($elementemissionstandards));

        $elementenergys  = $element->energys()->alias('a')->column('a.name', 'a.id');
        $elementEnergyIds = implode(',', array_keys($elementenergys));

        $elementengine  = $element->engines()->alias('a')->column('a.name', 'a.id');
        $elementEngineIds = implode(',', array_keys($elementengine));

        $elementgearboxs  = $element->gearboxs()->alias('a')->column('a.name', 'a.id');
        $elementGearboxIds = implode(',', array_keys($elementgearboxs));

        $elementlevels  = $element->levels()->alias('a')->column('a.name', 'a.id');
        $elementLevelIds = implode(',', array_keys($elementlevels));

        $elementlightspots  = $element->lightspots()->alias('a')->column('a.name', 'a.id');
        $elementLightspotIds = implode(',', array_keys($elementlightspots));

        $elementmileages  = $element->mileages()->alias('a')->column('a.num', 'a.id');
        $elementMileageIds = implode(',', array_keys($elementmileages));

        $elementpriceranges  = $element->priceRanges()->alias('a')->column('a.min_price', 'a.max_price','a.id');
        $elementPriceRangeIds = implode(',', array_keys($elementpriceranges));

        $elementproductiontypes  = $element->productionTypes()->alias('a')->column('a.name','a.id');
        $elementProductionTypeIds = implode(',', array_keys($elementproductiontypes));

        $elementseats  = $element->seats()->alias('a')->column('a.num','a.id');
        $elementSeatIds = implode(',', array_keys($elementseats));

        $themeModel        = new ThemeModel();
        $elementThemeFiles = $themeModel->getActionThemeFiles('car/Element/index');
        $this->assign('element_theme_files', $elementThemeFiles);
        $this->assign('element', $element);
        $this->assign('element_brands', $elementbrands);
        $this->assign('element_brand_ids', $elementBrandIds);
        $this->assign('element_ages', $elementages);
        $this->assign('element_age_ids', $elementAgeIds);
        $this->assign('element_areas', $elementareas);
        $this->assign('element_area_ids', $elementAreaIds);
        $this->assign('element_colors', $elementcolors);
        $this->assign('element_color_ids', $elementColorIds);
        $this->assign('element_countrys', $elementcountrys);
        $this->assign('element_country_ids', $elementCountryIds);
        $this->assign('element_displacementranges', $elementdisplacementranges);
        $this->assign('element_displacementrange_ids', $elementDisplacementRangeIds);
        $this->assign('element_emissionstandards', $elementemissionstandards);
        $this->assign('element_emissionstandard_ids', $elementEmissionStandardIds);
        $this->assign('element_energys', $elementenergys);
        $this->assign('element_energy_ids', $elementEnergyIds);
        $this->assign('element_engines', $elementengine);
        $this->assign('element_engine_ids', $elementEngineIds);
        $this->assign('element_gearboxs', $elementgearboxs);
        $this->assign('element_gearbox_ids', $elementGearboxIds);
        $this->assign('element_levels', $elementlevels);
        $this->assign('element_level_ids', $elementLevelIds);
        $this->assign('element_lightspots', $elementlightspots);
        $this->assign('element_lightspot_ids', $elementLightspotIds);
        $this->assign('element_mileages', $elementmileages);
        $this->assign('element_mileage_ids', $elementMileageIds);
        $this->assign('element_priceranges', $elementpriceranges);
        $this->assign('element_pricerange_ids', $elementPriceRangeIds);
        $this->assign('element_productiontypes', $elementproductiontypes);
        $this->assign('element_productiontype_ids', $elementProductionTypeIds);
        $this->assign('element_seats', $elementseats);
        $this->assign('element_seat_ids', $elementSeatIds);

        return $this->fetch();
    }

    /**
     * 编辑车提交
     * @adminMenu(
     *     'name'   => '编辑车提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑车提交',
     *     'param'  => ''
     * )
     * @throws \think\Exception
     */
    public function editElement()
    {

        if ($this->request->isPost()) {
            $data = $this->request->param();

            //需要抹除发布、置顶、推荐的修改。
            unset($data['element']['element_status']);
            unset($data['element']['is_top']);
            unset($data['element']['recommended']);

            $element   = $data['element'];
            $result = $this->validate($element, 'AdminElement');
            if ($result !== true) {
                $this->error($result);
            }

            $carElementModel = new CarElementModel();

            if (!empty($data['photo_names']) && !empty($data['photo_urls'])) {
                $data['element']['more']['photos'] = [];
                foreach ($data['photo_urls'] as $key => $url) {
                    $photoUrl = cmf_asset_relative_url($url);
                    array_push($data['element']['more']['photos'], ["url" => $photoUrl, "name" => $data['photo_names'][$key]]);
                }
            }

            if (!empty($data['file_names']) && !empty($data['file_urls'])) {
                $data['element']['more']['files'] = [];
                foreach ($data['file_urls'] as $key => $url) {
                    $fileUrl = cmf_asset_relative_url($url);
                    array_push($data['element']['more']['files'], ["url" => $fileUrl, "name" => $data['file_names'][$key]]);
                }
            }

            $carElementModel->adminEditElement($data['element'], $data['element']['brands']);

            $hookParam = [
                'is_add'  => false,
                'element' => $data['element']
            ];
            hook('car_admin_after_save_element', $hookParam);

            $this->success('保存成功!');

        }
    }

    /**
     * 车删除
     * @adminMenu(
     *     'name'   => '车删除',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车删除',
     *     'param'  => ''
     * )
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function delete()
    {
        $param           = $this->request->param();
        $carElementModel = new CarElementModel();

        if (isset($param['id'])) {
            $id           = $this->request->param('id', 0, 'intval');
            $result       = $carElementModel->where('id', $id)->find();
            $data         = [
                'object_id'   => $result['id'],
                'create_time' => time(),
                'table_name'  => 'car_element',
                'name'        => $result['element_title'],
                'user_id'     => cmf_get_current_admin_id()
            ];
            $resultCar = $carElementModel
                ->where('id', $id)
                ->update(['delete_time' => time()]);
            if ($resultCar) {
                Db::name('car_brand_element')->where('element_id', $id)->update(['status' => 0]);
                Db::name('car_tag_element')->where('element_id', $id)->update(['status' => 0]);
//TODO:xuyin 删除其它属性,如颜色,作为数等....
                Db::name('recycleBin')->insert($data);
            }
            $this->success("删除成功！", '');

        }

        if (isset($param['ids'])) {
            $ids     = $this->request->param('ids/a');
            $recycle = $carElementModel->where('id', 'in', $ids)->select();
            $result  = $carElementModel->where('id', 'in', $ids)->update(['delete_time' => time()]);
            if ($result) {
                Db::name('car_brand_element')->where('element_id', 'in', $ids)->update(['status' => 0]);
                Db::name('car_tag_element')->where('element_id', 'in', $ids)->update(['status' => 0]);
                foreach ($recycle as $value) {
                    $data = [
                        'object_id'   => $value['id'],
                        'create_time' => time(),
                        'table_name'  => 'car_element',
                        'name'        => $value['element_title'],
                        'user_id'     => cmf_get_current_admin_id()
                    ];
                    Db::name('recycleBin')->insert($data);
                }
                $this->success("删除成功！", '');
            }
        }
    }

    /**
     * 车发布
     * @adminMenu(
     *     'name'   => '车发布',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车发布',
     *     'param'  => ''
     * )
     */
    public function publish()
    {
        $param           = $this->request->param();
        $carElementModel = new CarElementModel();

        if (isset($param['ids']) && isset($param["yes"])) {
            $ids = $this->request->param('ids/a');
            $carElementModel->where('id', 'in', $ids)->update(['element_status' => 1, 'published_time' => time()]);
            $this->success("发布成功！", '');
        }

        if (isset($param['ids']) && isset($param["no"])) {
            $ids = $this->request->param('ids/a');
            $carElementModel->where('id', 'in', $ids)->update(['element_status' => 0]);
            $this->success("取消发布成功！", '');
        }

    }

    /**
     * 车置顶
     * @adminMenu(
     *     'name'   => '车置顶',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车置顶',
     *     'param'  => ''
     * )
     */
    public function top()
    {
        $param           = $this->request->param();
        $carElementModel = new CarElementModel();

        if (isset($param['ids']) && isset($param["yes"])) {
            $ids = $this->request->param('ids/a');

            $carElementModel->where('id', 'in', $ids)->update(['is_top' => 1]);

            $this->success("置顶成功！", '');

        }

        if (isset($_POST['ids']) && isset($param["no"])) {
            $ids = $this->request->param('ids/a');

            $carElementModel->where('id', 'in', $ids)->update(['is_top' => 0]);

            $this->success("取消置顶成功！", '');
        }
    }

    /**
     * 车推荐
     * @adminMenu(
     *     'name'   => '车推荐',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车推荐',
     *     'param'  => ''
     * )
     */
    public function recommend()
    {
        $param           = $this->request->param();
        $carElementModel = new CarElementModel();

        if (isset($param['ids']) && isset($param["yes"])) {
            $ids = $this->request->param('ids/a');

            $carElementModel->where('id', 'in', $ids)->update(['recommended' => 1]);

            $this->success("推荐成功！", '');

        }
        if (isset($param['ids']) && isset($param["no"])) {
            $ids = $this->request->param('ids/a');

            $carElementModel->where('id', 'in', $ids)->update(['recommended' => 0]);

            $this->success("取消推荐成功！", '');

        }
    }

    /**
     * 车排序
     * @adminMenu(
     *     'name'   => '车排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('car_brand_element'));
        $this->success("排序更新成功！", '');
    }
}
