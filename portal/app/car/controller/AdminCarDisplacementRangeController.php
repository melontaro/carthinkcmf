<?php


namespace app\car\controller;
use app\car\model\CarDisplacementRangeModel;
use cmf\controller\AdminBaseController;

/**
 * Class AdminAttributeController
 * @package app\car\controller
 * @adminMenuRoot(
 *     'name'   =>'排量范围设置',
 *     'action' =>'index',
 *     'parent' =>'car/AdminAttribute/default',
 *     'display'=> true,
 *     'order'  => 30,
 *     'icon'   =>'age',
 *     'remark' =>'排量范围设置'
 * )
 */
class AdminCarDisplacementRangeController extends AdminBaseController
{
    public  function  index(){
        $content = hook_one('car_admin_tag_index_view');

        if (!empty($content)) {
            return $content;
        }

        $displacementRangeModel = new CarDisplacementRangeModel();
        $displacements           = $displacementRangeModel->paginate();

        $this->assign("arrStatus", $displacementRangeModel::$STATUS);
        $this->assign("displacements", $displacements);
        $this->assign('page', $displacements->render());
        return $this->fetch();
    }
    /**
     * 添加排量
     * @adminMenu(
     *     'name'   => '添加排量',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加排量',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        $displacementRangeModel = new CarDisplacementRangeModel();
        $this->assign("arrStatus", $displacementRangeModel::$STATUS);
        return $this->fetch();
    }

    /**
     * 添加排量
     * @adminMenu(
     *     'name'   => '添加排量',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加排量',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {

        $arrData = $this->request->param();

        $displacementRangeModel = new CarDisplacementRangeModel();
        $displacementRangeModel->isUpdate(false)->allowField(true)->save($arrData);

        $this->success(lang("SAVE_SUCCESS"));

    }
    /**
     * 更新排量
     * @adminMenu(
     *     'name'   => '更新排量',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '更新排量',
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

        $displacementRangeModel = new CarDisplacementRangeModel();
        $displacementRangeModel->isUpdate(true)->save(["status" => $intStatus], ["id" => $intId]);

        $this->success(lang("SAVE_SUCCESS"));

    }

    /**
     * 删除排量
     * @adminMenu(
     *     'name'   => '删除排量',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除排量',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $intId = $this->request->param("id", 0, 'intval');

        if (empty($intId)) {
            $this->error(lang("NO_ID"));
        }
        $displacementRangeModel = new CarDisplacementRangeModel();

        $displacementRangeModel->where('id' , $intId)->delete();
        // Db::name('car_tag_element')->where('tag_id', $intId)->delete();
        $this->success(lang("DELETE_SUCCESS"));
    }

    /**
     * 车排量选择对话框
     * @adminMenu(
     *     'name'   => '车排量选择对话框',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车排量选择对话框',
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
        $carDisplacementRangeModel = new CarDisplacementRangeModel();
        $displacements = $carDisplacementRangeModel->select();

        $this->assign('displacementRanges', $displacements);
        $this->assign('selectedIds', $selectedIds);
        return $this->fetch();
    }
    /**
     * 车排量排序
     * @adminMenu(
     *     'name'   => '车排量排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车排量排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('car_displacement_range'));
        $this->success("排序更新成功！", '');
    }
}