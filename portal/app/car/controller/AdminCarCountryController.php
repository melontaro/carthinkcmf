<?php


namespace app\car\controller;

use app\car\model\CarCountryModel;
use cmf\controller\AdminBaseController;

/**
 * Class AdminAttributeController
 * @package app\car\controller
 * @adminMenuRoot(
 *     'name'   =>'国别设置',
 *     'action' =>'index',
 *     'parent' =>'car/AdminAttribute/default',
 *     'display'=> true,
 *     'order'  => 1000,
 *     'icon'   =>'age',
 *     'remark' =>'国别设置'
 * )
 */
class AdminCarCountryController extends AdminBaseController
{
    public  function  index(){
        $content = hook_one('car_admin_tag_index_view');

        if (!empty($content)) {
            return $content;
        }

        $countryModel = new CarCountryModel();
        $countrys           = $countryModel->paginate();

        $this->assign("arrStatus", $countryModel::$STATUS);
        $this->assign("countrys", $countrys);
        $this->assign('page', $countrys->render());
        return $this->fetch();
    }
    /**
     * 国别设置
     * @adminMenu(
     *     'name'   => '国别设置',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加颜色',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        $countryModel = new CarCountryModel();
        $this->assign("arrStatus", $countryModel::$STATUS);
        return $this->fetch();
    }

    /**
     * 国别设置
     * @adminMenu(
     *     'name'   => '国别设置',
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

        $countryModel = new CarCountryModel();
        $countryModel->isUpdate(false)->allowField(true)->save($arrData);

        $this->success(lang("SAVE_SUCCESS"));

    }
    /**
     * 国别设置
     * @adminMenu(
     *     'name'   => '国别设置',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '国别设置',
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

        $countryModel = new CarCountryModel();
        $countryModel->isUpdate(true)->save(["status" => $intStatus], ["id" => $intId]);

        $this->success(lang("SAVE_SUCCESS"));

    }

    /**
     * 国别设置
     * @adminMenu(
     *     'name'   => '删除国别',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除国别',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $intId = $this->request->param("id", 0, 'intval');

        if (empty($intId)) {
            $this->error(lang("NO_ID"));
        }
        $countryModel = new CarCountryModel();

        $countryModel->where('id' , $intId)->delete();
        // Db::name('car_tag_element')->where('tag_id', $intId)->delete();
        $this->success(lang("DELETE_SUCCESS"));
    }

    /**
     * 车国别选择对话框
     * @adminMenu(
     *     'name'   => '车国别选择对话框',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车国别选择对话框',
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
        $carCountryModel = new CarCountryModel();
        $countrys = $carCountryModel->select();

        $this->assign('countrys', $countrys);
        $this->assign('selectedIds', $selectedIds);
        return $this->fetch();
    }
    /**
     * 车国别排序
     * @adminMenu(
     *     'name'   => '车国别排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车国别排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('car_country'));
        $this->success("排序更新成功！", '');
    }
}