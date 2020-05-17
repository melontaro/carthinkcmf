<?php


namespace app\car\controller;

use app\admin\model\RouteModel;
use app\admin\model\ThemeModel;
use app\car\model\CarAreaModel;
use cmf\controller\AdminBaseController;
use think\Db;

/**
 * Class AdminAttributeController
 * @package app\car\controller
 * @adminMenuRoot(
 *     'name'   =>'地区设置',
 *     'action' =>'index',
 *     'parent' =>'car/AdminAttribute/default',
 *     'display'=> true,
 *     'order'  => 1000,
 *     'icon'   =>'age',
 *     'remark' =>'地区设置'
 * )
 */
class AdminCarAreaController extends AdminBaseController
{
    public function index()
    {
        $content = hook_one('car_admin_brand_index_view');

        if (!empty($content)) {
            return $content;
        }

        $carAreaModel = new CarAreaModel();
        $keyword             = $this->request->param('keyword');

        if (empty($keyword)) {
            $areaTree = $carAreaModel->adminAreaTableTree();
            $this->assign('area_tree', $areaTree);
        } else {
            $areas = $carAreaModel->where('name', 'like', "%{$keyword}%")
                ->where('delete_time', 0)->select();
            $this->assign('areas', $areas);
        }

        $this->assign('keyword', $keyword);

        return $this->fetch();
    }

    /**
     * 添加车地区
     * @adminMenu(
     *     'name'   => '添加车地区',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加车地区',
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
        $carAreaModel = new CarAreaModel();
        $areasTree      = $carAreaModel->adminAreaTree($parentId);

        $themeModel        = new ThemeModel();
        $listThemeFiles    = $themeModel->getActionThemeFiles('car/List/index');
        $elementThemeFiles = $themeModel->getActionThemeFiles('car/Element/index');

        $this->assign('list_theme_files', $listThemeFiles);
        $this->assign('element_theme_files', $elementThemeFiles);
        $this->assign('categories_tree', $areasTree);
        return $this->fetch();
    }

    /**
     * 添加车地区提交
     * @adminMenu(
     *     'name'   => '添加车地区提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加车地区提交',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {
        $carAreaModel = new CarAreaModel();

        $data = $this->request->param();

        $result = $this->validate($data, 'CarArea');

        if ($result !== true) {
            $this->error($result);
        }

        $result = $carAreaModel->addArea($data);

        if ($result === false) {
            $this->error('添加失败!');
        }

        $this->success('添加成功!', url('AdminCarArea/index'));
    }

    /**
     * 编辑车地区
     * @adminMenu(
     *     'name'   => '编辑车地区',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑车地区',
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
            $carAreaModel = new CarAreaModel();
            $area            = $carAreaModel->get($id)->toArray();


            $areasTree = $carAreaModel->adminAreaTree($area['parent_id'], $id);

            $themeModel        = new ThemeModel();
            $listThemeFiles    = $themeModel->getActionThemeFiles('car/List/index');
            $elementThemeFiles = $themeModel->getActionThemeFiles('car/Element/index');

            $routeModel = new RouteModel();
            $alias      = $routeModel->getUrl('car/List/index', ['id' => $id]);

            $area['alias'] = $alias;
            $this->assign($area);
            $this->assign('list_theme_files', $listThemeFiles);
            $this->assign('element_theme_files', $elementThemeFiles);
            $this->assign('categories_tree', $areasTree);
            return $this->fetch();
        } else {
            $this->error('操作错误!');
        }

    }

    /**
     * 编辑车地区提交
     * @adminMenu(
     *     'name'   => '编辑车地区提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑车地区提交',
     *     'param'  => ''
     * )
     */
    public function editElement()
    {
        $data = $this->request->param();

        $result = $this->validate($data, 'CarArea');

        if ($result !== true) {
            $this->error($result);
        }

        $carAreaModel = new CarAreaModel();

        $result = $carAreaModel->editArea($data);

        if ($result === false) {
            $this->error('保存失败!');
        }

        $this->success('保存成功!');
    }

    /**
     * 车地区选择对话框
     * @adminMenu(
     *     'name'   => '车地区选择对话框',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车地区选择对话框',
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
        $carAreaModel = new CarAreaModel();

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

        $areaTree = $carAreaModel->adminAreaTableTree($selectedIds, $tpl);

        $areas = $carAreaModel->where('delete_time', 0)->select();

        $this->assign('areas', $areas);
        $this->assign('selectedIds', $selectedIds);
        $this->assign('areas_tree', $areaTree);
        return $this->fetch();
    }

    /**
     * 车地区排序
     * @adminMenu(
     *     'name'   => '车地区排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车地区排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('car_area'));
        $this->success("排序更新成功！", '');
    }

    /**
     * 车地区显示隐藏
     * @adminMenu(
     *     'name'   => '车地区显示隐藏',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车地区显示隐藏',
     *     'param'  => ''
     * )
     */
    public function toggle()
    {
        $data                = $this->request->param();
        $carAreaModel = new CarAreaModel();
        $ids                 = $this->request->param('ids/a');

        if (isset($data['ids']) && !empty($data["display"])) {
            $carAreaModel->where('id', 'in', $ids)->update(['status' => 1]);
            $this->success("更新成功！");
        }

        if (isset($data['ids']) && !empty($data["hide"])) {
            $carAreaModel->where('id', 'in', $ids)->update(['status' => 0]);
            $this->success("更新成功！");
        }

    }

    /**
     * 删除车地区
     * @adminMenu(
     *     'name'   => '删除车地区',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除车地区',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $carAreaModel = new CarAreaModel();
        $id                  = $this->request->param('id');

        //获取删除的内容
        $findArea = $carAreaModel->where('id', $id)->find();

        if (empty($findArea)) {
            $this->error('地区不存在!');
        }
        //判断此地区有无子地区（不算被删除的子地区）
        $areaChildrenCount = $carAreaModel->where(['parent_id' => $id, 'delete_time' => 0])->count();

        if ($areaChildrenCount > 0) {
            $this->error('此地区有子类无法删除!');
        }

        $areaElementCount = Db::name('car_area_element')->where('area_id', $id)->count();

        if ($areaElementCount > 0) {
            $this->error('此地区有车无法删除!');
        }

        $data   = [
            'object_id'   => $findArea['id'],
            'create_time' => time(),
            'table_name'  => 'car_area',
            'name'        => $findArea['name']
        ];
        $result = $carAreaModel
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