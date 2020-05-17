<?php


namespace app\car\controller;
use app\car\model\CarGearboxModel;
use cmf\controller\AdminBaseController;

/**
 * Class AdminAttributeController
 * @package app\car\controller
 * @adminMenuRoot(
 *     'name'   =>'变速箱设置',
 *     'action' =>'index',
 *     'parent' =>'car/AdminAttribute/default',
 *     'display'=> true,
 *     'order'  => 1000,
 *     'icon'   =>'age',
 *     'remark' =>'变速箱设置'
 * )
 */
class AdminCarGearboxController extends AdminBaseController
{
    public  function  index(){
        $content = hook_one('car_admin_tag_index_view');

        if (!empty($content)) {
            return $content;
        }

        $gearboxModel = new CarGearboxModel();
        $gearboxs           = $gearboxModel->paginate();

        $this->assign("arrStatus", $gearboxModel::$STATUS);
        $this->assign("gearboxs", $gearboxs);
        $this->assign('page', $gearboxs->render());
        return $this->fetch();
    }
    /**
     * 变速箱设置
     * @adminMenu(
     *     'name'   => '变速箱设置',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加变速箱',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        $gearboxModel = new CarGearboxModel();
        $this->assign("arrStatus", $gearboxModel::$STATUS);
        return $this->fetch();
    }

    /**
     * 变速箱设置
     * @adminMenu(
     *     'name'   => '变速箱设置',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '国别设置',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {

        $arrData = $this->request->param();

        $gearboxModel = new CarGearboxModel();
        $gearboxModel->isUpdate(false)->allowField(true)->save($arrData);

        $this->success(lang("SAVE_SUCCESS"));

    }
    /**
     * 变速箱设置
     * @adminMenu(
     *     'name'   => '变速箱设置',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '变速箱设置',
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

        $gearboxModel = new CarGearboxModel();
        $gearboxModel->isUpdate(true)->save(["status" => $intStatus], ["id" => $intId]);

        $this->success(lang("SAVE_SUCCESS"));

    }

    /**
     * 变速箱设置
     * @adminMenu(
     *     'name'   => '删除变速箱',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除变速箱',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $intId = $this->request->param("id", 0, 'intval');

        if (empty($intId)) {
            $this->error(lang("NO_ID"));
        }
        $gearboxModel = new CarGearboxModel();

        $gearboxModel->where('id' , $intId)->delete();
        // Db::name('car_tag_element')->where('tag_id', $intId)->delete();
        $this->success(lang("DELETE_SUCCESS"));
    }

    /**
     * 车变速箱选择对话框
     * @adminMenu(
     *     'name'   => '车变速箱选择对话框',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车变速箱选择对话框',
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
        $gearboxModel = new CarGearboxModel();
        $gearboxs = $gearboxModel->select();

        $this->assign('gearboxs', $gearboxs);
        $this->assign('selectedIds', $selectedIds);
        //$this->assign('ages_tree', $agesTree);
        return $this->fetch();
    }
    /**
     * 车变速箱排序
     * @adminMenu(
     *     'name'   => '车变速箱排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车变速箱排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('car_gearbox'));
        $this->success("排序更新成功！", '');
    }
}