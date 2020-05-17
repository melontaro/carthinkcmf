<?php


namespace app\car\controller;
use app\car\model\CarProductionTypeModel;
use cmf\controller\AdminBaseController;

/**
 * Class AdminAttributeController
 * @package app\car\controller
 * @adminMenuRoot(
 *     'name'   =>'生产方式设置',
 *     'action' =>'index',
 *     'parent' =>'car/AdminAttribute/default',
 *     'display'=> true,
 *     'order'  => 1000,
 *     'icon'   =>'age',
 *     'remark' =>'生产方式设置'
 * )
 */
class AdminCarProductionTypeController extends AdminBaseController
{
    public  function  index(){
        $content = hook_one('car_admin_tag_index_view');

        if (!empty($content)) {
            return $content;
        }

        $productionTypeModel = new CarProductionTypeModel();
        $productionTypes           = $productionTypeModel->paginate();

        $this->assign("arrStatus", $productionTypeModel::$STATUS);
        $this->assign("productionTypes", $productionTypes);
        $this->assign('page', $productionTypes->render());
        return $this->fetch();
    }
    /**
     * 生产方式设置
     * @adminMenu(
     *     'name'   => '生产方式设置',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加生产方式',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        $productionTypeModel = new CarProductionTypeModel();
        $this->assign("arrStatus", $productionTypeModel::$STATUS);
        return $this->fetch();
    }

    /**
     * 生产方式设置
     * @adminMenu(
     *     'name'   => '生产方式设置',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '生产方式设置',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {

        $arrData = $this->request->param();

        $productionTypeModel = new CarProductionTypeModel();
        $productionTypeModel->isUpdate(false)->allowField(true)->save($arrData);

        $this->success(lang("SAVE_SUCCESS"));

    }
    /**
     * 生产方式设置
     * @adminMenu(
     *     'name'   => '生产方式设置',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '生产方式设置',
     *     'param'  => ''
     * )
     */
    public function upStatus()
    {
        $intId     = $this->request->param("id");
        $intStatus = $this->request->param("status");
        $intStatus = $intStatus ? 1 : 0;
        if (empty($intId)) {
            $this->error(lang("NO_ID"));
        }

        $productionTypeModel = new CarProductionTypeModel();
        $productionTypeModel->isUpdate(true)->save(["status" => $intStatus], ["id" => $intId]);

        $this->success(lang("SAVE_SUCCESS"));

    }

    /**
     * 生产方式设置
     * @adminMenu(
     *     'name'   => '删除生产方式',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除生产方式',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $intId = $this->request->param("id", 0, 'intval');

        if (empty($intId)) {
            $this->error(lang("NO_ID"));
        }
        $productionTypeModel = new CarProductionTypeModel();

        $productionTypeModel->where('id' , $intId)->delete();
        // Db::name('car_tag_element')->where('tag_id', $intId)->delete();
        $this->success(lang("DELETE_SUCCESS"));
    }

    /**
     * 车生产方式选择对话框
     * @adminMenu(
     *     'name'   => '车生产方式选择对话框',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车生产方式选择对话框',
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
        $productionTypeModel = new CarProductionTypeModel();
        $productionTypes = $productionTypeModel->select();

        $this->assign('productionTypes', $productionTypes);
        $this->assign('selectedIds', $selectedIds);
        //$this->assign('ages_tree', $agesTree);
        return $this->fetch();
    }
    /**
     * 车生产方式排序
     * @adminMenu(
     *     'name'   => '车生产方式排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车生产方式排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('car_production_type'));
        $this->success("排序更新成功！", '');
    }
    
}