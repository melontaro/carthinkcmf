<?php


namespace app\car\controller;
use app\car\model\CarEmissionStandardModel;
use cmf\controller\AdminBaseController;

/**
 * Class AdminAttributeController
 * @package app\car\controller
 * @adminMenuRoot(
 *     'name'   =>'排放标准设置',
 *     'action' =>'index',
 *     'parent' =>'car/AdminAttribute/default',
 *     'display'=> true,
 *     'order'  => 1000,
 *     'icon'   =>'age',
 *     'remark' =>'排放标准设置'
 * )
 */
class AdminCarEmissionStandardController extends AdminBaseController
{
    public  function  index(){
        $content = hook_one('car_admin_tag_index_view');

        if (!empty($content)) {
            return $content;
        }

        $emissionStandardModel = new CarEmissionStandardModel();
        $emissionStandards          = $emissionStandardModel->paginate();

        $this->assign("arrStatus", $emissionStandardModel::$STATUS);
        $this->assign("emissionStandards", $emissionStandards);
        $this->assign('page', $emissionStandards->render());
        return $this->fetch();
    }
    /**
     * 添加排放标准
     * @adminMenu(
     *     'name'   => '添加排放标准',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加排放标准',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        $emissionStandardModel = new CarEmissionStandardModel();
        $this->assign("arrStatus", $emissionStandardModel::$STATUS);
        return $this->fetch();
    }

    /**
     * 添加排放标准
     * @adminMenu(
     *     'name'   => '添加排放标准',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加排放标准',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {

        $arrData = $this->request->param();

        $emissionStandardModel = new CarEmissionStandardModel();
        $emissionStandardModel->isUpdate(false)->allowField(true)->save($arrData);

        $this->success(lang("SAVE_SUCCESS"));

    }
    /**
     * 更新排放标准
     * @adminMenu(
     *     'name'   => '更新排放标准',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '更新排放标准',
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

        $emissionStandardModel = new CarEmissionStandardModel();
        $emissionStandardModel->isUpdate(true)->save(["status" => $intStatus], ["id" => $intId]);

        $this->success(lang("SAVE_SUCCESS"));

    }

    /**
     * 删除排放标准
     * @adminMenu(
     *     'name'   => '删除排放标准',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除排放标准',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $intId = $this->request->param("id", 0, 'intval');

        if (empty($intId)) {
            $this->error(lang("NO_ID"));
        }
        $emissionStandardModel = new CarEmissionStandardModel();

        $emissionStandardModel->where('id' , $intId)->delete();
        // Db::name('car_tag_element')->where('tag_id', $intId)->delete();
        $this->success(lang("DELETE_SUCCESS"));
    }

    /**
     * 车排放标准选择对话框
     * @adminMenu(
     *     'name'   => '车排放标准选择对话框',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车排放标准选择对话框',
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
        $carEmissionStandardModel = new CarEmissionStandardModel();
        $emissionStandards = $carEmissionStandardModel->select();

        $this->assign('emissionStandards', $emissionStandards);
        $this->assign('selectedIds', $selectedIds);
        //$this->assign('ages_tree', $agesTree);
        return $this->fetch();
    }
    /**
     * 车排放标准排序
     * @adminMenu(
     *     'name'   => '车排放标准排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车排放标准排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('car_emission_standards'));
        $this->success("排序更新成功！", '');
    }
}