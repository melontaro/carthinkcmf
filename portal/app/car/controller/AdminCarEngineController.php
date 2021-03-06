<?php


namespace app\car\controller;
use app\car\model\CarEngineModel;
use cmf\controller\AdminBaseController;

/**
 * Class AdminAttributeController
 * @package app\car\controller
 * @adminMenuRoot(
 *     'name'   =>'发动机设置',
 *     'action' =>'index',
 *     'parent' =>'car/AdminAttribute/default',
 *     'display'=> true,
 *     'order'  => 1000,
 *     'icon'   =>'age',
 *     'remark' =>'发动机设置'
 * )
 */
class AdminCarEngineController extends AdminBaseController
{
    public  function  index(){
        $content = hook_one('car_admin_tag_index_view');

        if (!empty($content)) {
            return $content;
        }

        $engineModel = new CarEngineModel();
        $engines          = $engineModel->paginate();

        $this->assign("arrStatus", $engineModel::$STATUS);
        $this->assign("engines", $engines);
        $this->assign('page', $engines->render());
        return $this->fetch();
    }
    /**
     * 添加发动机
     * @adminMenu(
     *     'name'   => '添加发动机',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加发动机',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        $engineModel = new CarEngineModel();
        $this->assign("arrStatus", $engineModel::$STATUS);
        return $this->fetch();
    }

    /**
     * 添加发动机
     * @adminMenu(
     *     'name'   => '添加发动机',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加发动机',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {

        $arrData = $this->request->param();

        $engineModel = new CarEngineModel();
        $engineModel->isUpdate(false)->allowField(true)->save($arrData);

        $this->success(lang("SAVE_SUCCESS"));

    }
    /**
     * 更新发动机
     * @adminMenu(
     *     'name'   => '更新发动机',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '更新发动机',
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

        $engineModel = new CarEngineModel();
        $engineModel->isUpdate(true)->save(["status" => $intStatus], ["id" => $intId]);

        $this->success(lang("SAVE_SUCCESS"));

    }

    /**
     * 删除车发动机
     * @adminMenu(
     *     'name'   => '删除车发动机',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除车发动机',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $intId = $this->request->param("id", 0, 'intval');

        if (empty($intId)) {
            $this->error(lang("NO_ID"));
        }
        $engineModel = new CarEngineModel();

        $engineModel->where('id' , $intId)->delete();
        // Db::name('car_tag_element')->where('tag_id', $intId)->delete();
        $this->success(lang("DELETE_SUCCESS"));
    }

    /**
     * 车发动机选择对话框
     * @adminMenu(
     *     'name'   => '车发动机选择对话框',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车发动机选择对话框',
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
        $carEngineModel = new CarEngineModel();
        $engines = $carEngineModel->select();

        $this->assign('engines', $engines);
        $this->assign('selectedIds', $selectedIds);
        //$this->assign('ages_tree', $agesTree);
        return $this->fetch();
    }
    /**
     * 车发动机排序
     * @adminMenu(
     *     'name'   => '车发动机排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车发动机排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('car_engine'));
        $this->success("排序更新成功！", '');
    }
    
}