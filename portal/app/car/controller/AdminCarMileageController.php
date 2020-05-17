<?php


namespace app\car\controller;
use app\car\model\CarMileageModel;
use cmf\controller\AdminBaseController;

/**
 * Class AdminAttributeController
 * @package app\car\controller
 * @adminMenuRoot(
 *     'name'   =>'里程设置',
 *     'action' =>'index',
 *     'parent' =>'car/AdminAttribute/default',
 *     'display'=> true,
 *     'order'  => 1000,
 *     'icon'   =>'th',
 *     'remark' =>'里程设置'
 * )
 */
class AdminCarMileageController extends AdminBaseController
{
    public  function  index(){
        $content = hook_one('car_admin_tag_index_view');

        if (!empty($content)) {
            return $content;
        }

        $mileageModel = new CarMileageModel();
        $mileages           = $mileageModel->paginate();

        $this->assign("arrStatus", $mileageModel::$STATUS);
        $this->assign("mileages", $mileages);
        $this->assign('page', $mileages->render());
        return $this->fetch();
    }
    /**
     * 添加车里程
     * @adminMenu(
     *     'name'   => '添加车里程',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加车里程',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        $mileageModel = new CarMileageModel();
        $this->assign("arrStatus", $mileageModel::$STATUS);
        return $this->fetch();
    }

    /**
     * 添加车里程
     * @adminMenu(
     *     'name'   => '添加车里程',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加车里程',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {

        $arrData = $this->request->param();

        $mileageModel = new CarMileageModel();
        $mileageModel->isUpdate(false)->allowField(true)->save($arrData);

        $this->success(lang("SAVE_SUCCESS"));

    }
    /**
     * 更新车里程
     * @adminMenu(
     *     'name'   => '更新车里程',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '更新车里程',
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

        $mileageModel = new CarMileageModel();
        $mileageModel->isUpdate(true)->save(["status" => $intStatus], ["id" => $intId]);

        $this->success(lang("SAVE_SUCCESS"));

    }

    /**
     * 删除车里程
     * @adminMenu(
     *     'name'   => '删除车里程',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除车里程',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $intId = $this->request->param("id", 0, 'intval');

        if (empty($intId)) {
            $this->error(lang("NO_ID"));
        }
        $mileageModel = new CarMileageModel();

        $mileageModel->where('id' , $intId)->delete();
        // Db::name('car_tag_element')->where('tag_id', $intId)->delete();
        $this->success(lang("DELETE_SUCCESS"));
    }
    /**
     * 车里程选择对话框
     * @adminMenu(
     *     'name'   => '车里程选择对话框',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车里程选择对话框',
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
        $mileageModel = new CarMileageModel();
        $mileages = $mileageModel->select();

        $this->assign('mileages', $mileages);
        $this->assign('selectedIds', $selectedIds);
        //$this->assign('ages_tree', $agesTree);
        return $this->fetch();
    }
    /**
     * 车里程排序
     * @adminMenu(
     *     'name'   => '车里程排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车里程排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('car_mileage'));
        $this->success("排序更新成功！", '');
    }
    
}