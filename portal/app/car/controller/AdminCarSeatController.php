<?php


namespace app\car\controller;
use app\car\model\CarSeatModel;
use cmf\controller\AdminBaseController;

/**
 * Class AdminAttributeController
 * @package app\car\controller
 * @adminMenuRoot(
 *     'name'   =>'座位数设置',
 *     'action' =>'index',
 *     'parent' =>'car/AdminAttribute/default',
 *     'display'=> true,
 *     'order'  => 1000,
 *     'icon'   =>'th',
 *     'remark' =>'座位数设置'
 * )
 */
class AdminCarSeatController extends AdminBaseController
{
    public  function  index(){
        $content = hook_one('car_admin_tag_index_view');

        if (!empty($content)) {
            return $content;
        }

        $seatModel = new CarSeatModel();
        $seats           = $seatModel->paginate();

        $this->assign("arrStatus", $seatModel::$STATUS);
        $this->assign("seats", $seats);
        $this->assign('page', $seats->render());
        return $this->fetch();
    }
    /**
     * 添加车级别
     * @adminMenu(
     *     'name'   => '添加座位数',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加座位数',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        $seatModel = new CarSeatModel();
        $this->assign("arrStatus", $seatModel::$STATUS);
        return $this->fetch();
    }

    /**
     * 添加车座位数
     * @adminMenu(
     *     'name'   => '添加车座位数',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加车座位数',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {

        $arrData = $this->request->param();

        $seatModel = new CarSeatModel();
        $seatModel->isUpdate(false)->allowField(true)->save($arrData);

        $this->success(lang("SAVE_SUCCESS"));

    }
    /**
     * 更新车座位数
     * @adminMenu(
     *     'name'   => '更新车座位数',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '更新车座位数',
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

        $seatModel = new CarSeatModel();
        $seatModel->isUpdate(true)->save(["status" => $intStatus], ["id" => $intId]);

        $this->success(lang("SAVE_SUCCESS"));

    }

    /**
     * 删除车座位数
     * @adminMenu(
     *     'name'   => '删除车座位数',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除车座位数',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $intId = $this->request->param("id", 0, 'intval');

        if (empty($intId)) {
            $this->error(lang("NO_ID"));
        }
        $seatModel = new CarSeatModel();

        $seatModel->where('id' , $intId)->delete();
        // Db::name('car_tag_element')->where('tag_id', $intId)->delete();
        $this->success(lang("DELETE_SUCCESS"));
    }

    /**
     * 车座位数选择对话框
     * @adminMenu(
     *     'name'   => '车座位数选择对话框',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车座位数选择对话框',
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
        $seatModel = new CarSeatModel();
        $seats = $seatModel->select();

        $this->assign('seats', $seats);
        $this->assign('selectedIds', $selectedIds);
        //$this->assign('ages_tree', $agesTree);
        return $this->fetch();
    }
    /**
     * 车座位数排序
     * @adminMenu(
     *     'name'   => '车座位数排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车座位数排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('car_seat'));
        $this->success("排序更新成功！", '');
    }
    
}