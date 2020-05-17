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

use app\admin\model\RouteModel;
use cmf\controller\AdminBaseController;
use app\car\model\CarBrandModel;
use think\Db;
use app\admin\model\ThemeModel;


class AdminCarBrandController extends AdminBaseController
{
    /**
     * 车品牌列表
     * @adminMenu(
     *     'name'   => '品牌管理',
     *     'parent' => 'car/AdminIndex/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车品牌列表',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $content = hook_one('car_admin_brand_index_view');

        if (!empty($content)) {
            return $content;
        }

        $carBrandModel = new CarBrandModel();
        $keyword             = $this->request->param('keyword');

        if (empty($keyword)) {
            $brandTree = $carBrandModel->adminBrandTableTree();
            $this->assign('brand_tree', $brandTree);
        } else {
            $brands = $carBrandModel->where('name', 'like', "%{$keyword}%")
                ->where('delete_time', 0)->select();
            $this->assign('brands', $brands);
        }

        $this->assign('keyword', $keyword);

        return $this->fetch();
    }

    /**
     * 添加车品牌
     * @adminMenu(
     *     'name'   => '添加车品牌',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加车品牌',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function add()
    {
        $content = hook_one('car_admin_brand_add_view');

        if (!empty($content)) {
            return $content;
        }

        $parentId            = $this->request->param('parent', 0, 'intval');
        $carBrandModel = new CarBrandModel();
        $brandsTree      = $carBrandModel->adminBrandTree($parentId);

        $themeModel        = new ThemeModel();
        $listThemeFiles    = $themeModel->getActionThemeFiles('car/List/index');
        $elementThemeFiles = $themeModel->getActionThemeFiles('car/Element/index');

        $this->assign('list_theme_files', $listThemeFiles);
        $this->assign('element_theme_files', $elementThemeFiles);
        $this->assign('brands_tree', $brandsTree);
        return $this->fetch();
    }

    /**
     * 添加车品牌提交
     * @adminMenu(
     *     'name'   => '添加车品牌提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加车品牌提交',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {
        $carBrandModel = new CarBrandModel();

        $data = $this->request->param();

        $result = $this->validate($data, 'CarBrand');

        if ($result !== true) {
            $this->error($result);
        }

        $result = $carBrandModel->addBrand($data);

        if ($result === false) {
            $this->error('添加失败!');
        }

        $this->success('添加成功!', url('AdminCarBrand/index'));
    }

    /**
     * 编辑车品牌
     * @adminMenu(
     *     'name'   => '编辑车品牌',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑车品牌',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function edit()
    {

        $content = hook_one('car_admin_brand_edit_view');

        if (!empty($content)) {
            return $content;
        }

        $id = $this->request->param('id', 0, 'intval');
        if ($id > 0) {
            $carBrandModel = new CarBrandModel();
            $brand            = $carBrandModel->get($id)->toArray();


            $brandsTree = $carBrandModel->adminBrandTree($brand['parent_id'], $id);

            $themeModel        = new ThemeModel();
            $listThemeFiles    = $themeModel->getActionThemeFiles('car/List/index');
            $elementThemeFiles = $themeModel->getActionThemeFiles('car/Element/index');

            $routeModel = new RouteModel();
            $alias      = $routeModel->getUrl('car/List/index', ['id' => $id]);

            $brand['alias'] = $alias;
            $this->assign($brand);
            $this->assign('list_theme_files', $listThemeFiles);
            $this->assign('element_theme_files', $elementThemeFiles);
            $this->assign('brands_tree', $brandsTree);
            return $this->fetch();
        } else {
            $this->error('操作错误!');
        }

    }

    /**
     * 编辑车品牌提交
     * @adminMenu(
     *     'name'   => '编辑车品牌提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑车品牌提交',
     *     'param'  => ''
     * )
     */
    public function editPost()
    {
        $data = $this->request->param();

        $result = $this->validate($data, 'CarBrand');

        if ($result !== true) {
            $this->error($result);
        }

        $carBrandModel = new CarBrandModel();

        $result = $carBrandModel->editBrand($data);

        if ($result === false) {
            $this->error('保存失败!');
        }

        $this->success('保存成功!');
    }

    /**
     * 车品牌选择对话框
     * @adminMenu(
     *     'name'   => '车品牌选择对话框',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车品牌选择对话框',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function select()
    {
        $ids                 = $this->request->param('ids');
        $selectedIds         = explode(',', $ids);
        $carBrandModel = new CarBrandModel();

        $tpl = <<<tpl
<tr class='data-item-tr'>
    <td>
        <input type='checkbox' class='js-check' data-yid='js-check-y' data-xid='js-check-x' name='ids[]'
               value='\$id' data-name='\$name' \$checked>
    </td>
    <td>\$id</td>
    <td>\$spacer <a href='\$url' target='_blank'>\$name</a></td>
</tr>
tpl;

        $brandTree = $carBrandModel->adminBrandTableTree($selectedIds, $tpl);

        $brands = $carBrandModel->where('delete_time', 0)->select();

        $this->assign('brands', $brands);
        $this->assign('selectedIds', $selectedIds);
        $this->assign('brands_tree', $brandTree);
        return $this->fetch();
    }

    /**
     * 车品牌排序
     * @adminMenu(
     *     'name'   => '车品牌排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车品牌排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('car_brand'));
        $this->success("排序更新成功！", '');
    }

    /**
     * 车品牌显示隐藏
     * @adminMenu(
     *     'name'   => '车品牌显示隐藏',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车品牌显示隐藏',
     *     'param'  => ''
     * )
     */
    public function toggle()
    {
        $data                = $this->request->param();
        $carBrandModel = new CarBrandModel();
        $ids                 = $this->request->param('ids/a');

        if (isset($data['ids']) && !empty($data["display"])) {
            $carBrandModel->where('id', 'in', $ids)->update(['status' => 1]);
            $this->success("更新成功！");
        }

        if (isset($data['ids']) && !empty($data["hide"])) {
            $carBrandModel->where('id', 'in', $ids)->update(['status' => 0]);
            $this->success("更新成功！");
        }

    }

    /**
     * 删除车品牌
     * @adminMenu(
     *     'name'   => '删除车品牌',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除车品牌',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $carBrandModel = new CarBrandModel();
        $id                  = $this->request->param('id');
        //获取删除的内容
        $findBrand = $carBrandModel->where('id', $id)->find();

        if (empty($findBrand)) {
            $this->error('品牌不存在!');
        }
        //判断此品牌有无子品牌（不算被删除的子品牌）
        $brandChildrenCount = $carBrandModel->where(['parent_id' => $id, 'delete_time' => 0])->count();

        if ($brandChildrenCount > 0) {
            $this->error('此品牌有子类无法删除!');
        }

        $brandElementCount = Db::name('car_brand_element')->where('brand_id', $id)->count();

        if ($brandElementCount > 0) {
            $this->error('此品牌有车无法删除!');
        }

        $data   = [
            'object_id'   => $findBrand['id'],
            'create_time' => time(),
            'table_name'  => 'car_brand',
            'name'        => $findBrand['name']
        ];
        $result = $carBrandModel
            ->where('id', $id)
            ->update(['delete_time' => time()]);
        if ($result) {
            Db::name('recycleBin')->insert($data);
            $this->success('删除成功!');
        } else {
            $this->error('删除失败');
        }
    }
}
