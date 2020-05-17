<?php


namespace app\car\controller;
use app\car\model\CarLevelModel;
use cmf\controller\AdminBaseController;

/**
 * Class AdminAttributeController
 * @package app\car\controller
 * @adminMenuRoot(
 *     'name'   =>'车级别设置',
 *     'action' =>'index',
 *     'parent' =>'car/AdminAttribute/default',
 *     'display'=> true,
 *     'order'  => 1000,
 *     'icon'   =>'age',
 *     'remark' =>'车级别设置'
 * )
 */
class AdminCarLevelController extends AdminBaseController
{
    public  function  index(){
        $content = hook_one('car_admin_tag_index_view');

        if (!empty($content)) {
            return $content;
        }

        $levelModel = new CarLevelModel();
        $levels           = $levelModel->paginate();

        $this->assign("arrStatus", $levelModel::$STATUS);
        $this->assign("levels", $levels);
        $this->assign('page', $levels->render());
        return $this->fetch();
    }
    /**
     * 添加车级别
     * @adminMenu(
     *     'name'   => '添加车级别',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加车级别',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        $levelModel = new CarLevelModel();
        $this->assign("arrStatus", $levelModel::$STATUS);
        return $this->fetch();
    }

    /**
     * 添加车级别
     * @adminMenu(
     *     'name'   => '添加车级别',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加车级别',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {

        $arrData = $this->request->param();

        $levelModel = new CarLevelModel();
        $levelModel->isUpdate(false)->allowField(true)->save($arrData);

        $this->success(lang("SAVE_SUCCESS"));

    }
    /**
     * 更新车级别
     * @adminMenu(
     *     'name'   => '更新车级别',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '更新车级别',
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

        $levelModel = new CarLevelModel();
        $levelModel->isUpdate(true)->save(["status" => $intStatus], ["id" => $intId]);

        $this->success(lang("SAVE_SUCCESS"));

    }

    /**
     * 删除车级别
     * @adminMenu(
     *     'name'   => '删除车级别',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除车级别',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $intId = $this->request->param("id", 0, 'intval');

        if (empty($intId)) {
            $this->error(lang("NO_ID"));
        }
        $levelModel = new CarLevelModel();

        $levelModel->where('id' , $intId)->delete();
        // Db::name('car_tag_element')->where('tag_id', $intId)->delete();
        $this->success(lang("DELETE_SUCCESS"));
    }
    /**
     * 车级别选择对话框
     * @adminMenu(
     *     'name'   => '车级别选择对话框',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车级别选择对话框',
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
        $levelModel = new CarLevelModel();
        $levels = $levelModel->select();

        $this->assign('levels', $levels);
        $this->assign('selectedIds', $selectedIds);
        return $this->fetch();
    }
    /**
     * 车级别排序
     * @adminMenu(
     *     'name'   => '车级别排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车级别排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('car_level'));
        $this->success("排序更新成功！", '');
    }
}