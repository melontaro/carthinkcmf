<?php


namespace app\car\controller;
use app\car\model\CarEnergyModel;
use cmf\controller\AdminBaseController;

/**
 * Class AdminAttributeController
 * @package app\car\controller
 * @adminMenuRoot(
 *     'name'   =>'能源设置',
 *     'action' =>'index',
 *     'parent' =>'car/AdminAttribute/default',
 *     'display'=> true,
 *     'order'  => 1000,
 *     'icon'   =>'age',
 *     'remark' =>'能源设置'
 * )
 */
class AdminCarEnergyController extends AdminBaseController
{
    public  function  index(){
        $content = hook_one('car_admin_tag_index_view');

        if (!empty($content)) {
            return $content;
        }

        $energyModel = new CarEnergyModel();
        $energys          = $energyModel->paginate();

        $this->assign("arrStatus", $energyModel::$STATUS);
        $this->assign("energys", $energys);
        $this->assign('page', $energys->render());
        return $this->fetch();
    }
    /**
     * 添加能源
     * @adminMenu(
     *     'name'   => '添加能源',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加能源',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        $energyModel = new CarEnergyModel();
        $this->assign("arrStatus", $energyModel::$STATUS);
        return $this->fetch();
    }

    /**
     * 添加能源
     * @adminMenu(
     *     'name'   => '添加能源',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加能源',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {

        $arrData = $this->request->param();

        $energyModel = new CarEnergyModel();
        $energyModel->isUpdate(false)->allowField(true)->save($arrData);

        $this->success(lang("SAVE_SUCCESS"));

    }
    /**
     * 更新能源
     * @adminMenu(
     *     'name'   => '更新能源',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '更新能源',
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

        $energyModel = new CarEnergyModel();
        $energyModel->isUpdate(true)->save(["status" => $intStatus], ["id" => $intId]);

        $this->success(lang("SAVE_SUCCESS"));

    }

    /**
     * 删除车能源
     * @adminMenu(
     *     'name'   => '删除车能源',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除车能源能源',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $intId = $this->request->param("id", 0, 'intval');

        if (empty($intId)) {
            $this->error(lang("NO_ID"));
        }
        $energyModel = new CarEnergyModel();

        $energyModel->where('id' , $intId)->delete();
        // Db::name('car_tag_element')->where('tag_id', $intId)->delete();
        $this->success(lang("DELETE_SUCCESS"));
    }

    /**
     * 车能源选择对话框
     * @adminMenu(
     *     'name'   => '车能源选择对话框',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车能源选择对话框',
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
        $carEnergyModel = new CarEnergyModel();
        $energys = $carEnergyModel->select();

        $this->assign('energys', $energys);
        $this->assign('selectedIds', $selectedIds);
        //$this->assign('ages_tree', $agesTree);
        return $this->fetch();
    }
    /**
     * 车能源排序
     * @adminMenu(
     *     'name'   => '车能源排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车能源排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('car_energy'));
        $this->success("排序更新成功！", '');
    }
    
    
}