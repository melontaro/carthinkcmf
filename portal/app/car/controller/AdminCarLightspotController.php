<?php


namespace app\car\controller;
use app\car\model\CarLightspotModel;
use cmf\controller\AdminBaseController;

/**
 * Class AdminAttributeController
 * @package app\car\controller
 * @adminMenuRoot(
 *     'name'   =>'亮点设置',
 *     'action' =>'index',
 *     'parent' =>'car/AdminAttribute/default',
 *     'display'=> true,
 *     'order'  => 1000,
 *     'icon'   =>'th',
 *     'remark' =>'亮点设置'
 * )
 */
class AdminCarLightspotController extends AdminBaseController
{
    public  function  index(){
        $content = hook_one('car_admin_tag_index_view');

        if (!empty($content)) {
            return $content;
        }

        $lightspotModel = new CarLightspotModel();
        $lightspots           = $lightspotModel->paginate();

        $this->assign("arrStatus", $lightspotModel::$STATUS);
        $this->assign("lightspots", $lightspots);
        $this->assign('page', $lightspots->render());
        return $this->fetch();
    }
    /**
     * 添加亮点
     * @adminMenu(
     *     'name'   => '添加亮点',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加亮点',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        $lightspotModel = new CarLightspotModel();
        $this->assign("arrStatus", $lightspotModel::$STATUS);
        return $this->fetch();
    }

    /**
     * 添加亮点
     * @adminMenu(
     *     'name'   => '添加亮点',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加亮点',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {

        $arrData = $this->request->param();

        $lightspotModel = new CarLightspotModel();
        $lightspotModel->isUpdate(false)->allowField(true)->save($arrData);

        $this->success(lang("SAVE_SUCCESS"));

    }
    /**
     * 更新亮点
     * @adminMenu(
     *     'name'   => '更新亮点',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '更新亮点',
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

        $lightspotModel = new CarLightspotModel();
        $lightspotModel->isUpdate(true)->save(["status" => $intStatus], ["id" => $intId]);

        $this->success(lang("SAVE_SUCCESS"));

    }

    /**
     * 删除亮点
     * @adminMenu(
     *     'name'   => '删除亮点',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除亮点',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $intId = $this->request->param("id", 0, 'intval');

        if (empty($intId)) {
            $this->error(lang("NO_ID"));
        }
        $lightspotModel = new CarLightspotModel();

        $lightspotModel->where('id' , $intId)->delete();
        // Db::name('car_tag_element')->where('tag_id', $intId)->delete();
        $this->success(lang("DELETE_SUCCESS"));
    }
    /**
     * 车亮点选择对话框
     * @adminMenu(
     *     'name'   => '车亮点选择对话框',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车亮点选择对话框',
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
        $lightspotModel = new CarLightspotModel();
        $lightspots = $lightspotModel->select();

        $this->assign('lightspots', $lightspots);
        $this->assign('selectedIds', $selectedIds);
        //$this->assign('ages_tree', $agesTree);
        return $this->fetch();
    }
    /**
     * 车亮点排序
     * @adminMenu(
     *     'name'   => '车亮点排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车亮点排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('car_lightspot'));
        $this->success("排序更新成功！", '');
    }
    
}